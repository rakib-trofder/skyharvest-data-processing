import os
import subprocess
import psycopg2
from minio import Minio
from minio.error import S3Error
import json 

def run_command(command, description="Executing command"):
    print(f"\n--- {description}: {' '.join(command)} ---")
    try:
        result = subprocess.run(command, capture_output=True, text=True, check=True)
        print("STDOUT:\n", result.stdout)
        if result.stderr:
            print("STDERR:\n", result.stderr)
        print(f"--- Command '{command[0]}' completed successfully ---")
        return result.stdout
    except subprocess.CalledProcessError as e:
        print(f"ERROR: Command '{e.cmd}' failed with exit code {e.returncode}")
        print("STDOUT:\n", e.stdout)
        print("STDERR:\n", e.stderr)
        raise RuntimeError(f"Command failed: {e.cmd}")
    except FileNotFoundError:
        print(f"ERROR: Command not found. Make sure '{command[0]}' is in your PATH.")
        raise

def configure_postgis_database(db_config):
    print("\n--- Configuring PostGIS Database ---")
    conn = None
    try:
        conn = psycopg2.connect(**db_config)
        conn.autocommit = True
        cur = conn.cursor()

        cur.execute("CREATE EXTENSION IF NOT EXISTS postgis;")
        print("Ensured PostGIS extension is present.")
        cur.execute("CREATE EXTENSION IF NOT EXISTS postgis_raster;")
        print("Ensured PostGIS Raster extension is present.")

        cur.execute(f"ALTER DATABASE {db_config['database']} SET postgis.enable_outdb_rasters TO true;")
        print(f"Enabled postgis.enable_outdb_rasters for database '{db_config['database']}'.")

        cur.execute(f"ALTER DATABASE {db_config['database']} SET postgis.gdal_enabled_drivers TO 'GTiff';")
        print(f"Set postgis.gdal_enabled_drivers to 'GTiff' for database '{db_config['database']}'.")

        cur.close()
        print("PostGIS database configuration completed successfully.")
    except psycopg2.Error as e:
        print(f"PostgreSQL connection or configuration error: {e}")
        raise
    finally:
        if conn:
            conn.close()

def convert_to_cog(input_tif_path, output_cog_path):

    print(f"\n--- Converting {input_tif_path} to COG ---")
    command = [
        "gdal_translate",
        input_tif_path,
        output_cog_path,
        "-of", "COG",
        "-co", "COMPRESS=LZW", # Or DEFLATE, ZSTD for compression
        "-co", "BLOCKSIZE=512",
        "-co", "BIGTIFF=YES"
    ]
    run_command(command, f"Converting {input_tif_path} to COG")

def upload_to_minio(minio_client, bucket_name, local_file_path, minio_object_name):
    print(f"\n--- Uploading {local_file_path} to MinIO bucket '{bucket_name}' as '{minio_object_name}' ---")
    try:
        minio_client.fput_object(bucket_name, minio_object_name, local_file_path)
        print(f"Successfully uploaded {local_file_path} to MinIO.")
    except S3Error as e:
        print(f"MinIO upload error: {e}")
        raise

def set_minio_bucket_public_read_policy(minio_client, bucket_name):
    print(f"\n--- Setting public read policy for MinIO bucket '{bucket_name}' ---")
    policy = {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {"AWS": ["*"]},
                "Action": ["s3:GetObject"],
                "Resource": [f"arn:aws:s3:::{bucket_name}/*"]
            }
        ]
    }
    try:
        minio_client.set_bucket_policy(bucket_name, json.dumps(policy))
        print(f"Public read policy set successfully for bucket '{bucket_name}'.")
    except S3Error as e:
        print(f"MinIO policy setting error: {e}")
        raise

def load_raster_reference_to_postgis(db_config, minio_http_path, minio_access_key, minio_secret_key, minio_endpoint_for_gdal, srid, tile_width, tile_height, schema_name, table_name):

    print(f"\n--- Loading raster reference into PostGIS table {schema_name}.{table_name} ---")

    minio_vsicurl_path = f"/vsicurl/{minio_http_path}"

    os.environ['AWS_ACCESS_KEY_ID'] = minio_access_key
    os.environ['AWS_SECRET_ACCESS_KEY'] = minio_secret_key
    os.environ['AWS_S3_ENDPOINT'] = minio_endpoint_for_gdal
    os.environ['AWS_S3_VERIFY'] = 'NO'

    raster2pgsql_command = [
        "raster2pgsql",
        "-s", str(srid),
        "-t", f"{tile_width}x{tile_height}",
        "-I",     
        "-C",    
        "-R",     
        "-Y", "1000", 
        minio_vsicurl_path,
        f"{schema_name}.{table_name}"
    ]

    psql_command = [
        "psql",
        "-d", db_config['database'],
        "-h", db_config['host'],
        "-p", str(db_config['port']),
        "-U", db_config['user']
    ]

    os.environ['PGPASSWORD'] = db_config['password']

    try:
        # Start raster2pgsql as a subprocess, capturing its stdout
        raster2pgsql_process = subprocess.Popen(raster2pgsql_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        # Run psql as another subprocess, piping raster2pgsql's stdout to psql's stdin
        psql_process = subprocess.run(psql_command, stdin=raster2pgsql_process.stdout, capture_output=True, text=True, check=True)
        raster2pgsql_process.stdout.close() # Close the pipe to raster2pgsql, allowing it to exit

        # Wait for raster2pgsql to complete and get its output
        stdout, stderr = raster2pgsql_process.communicate()
        if raster2pgsql_process.returncode != 0:
            print(f"ERROR: raster2pgsql failed with exit code {raster2pgsql_process.returncode}")
            print("raster2pgsql STDOUT:\n", stdout)
            print("raster2pgsql STDERR:\n", stderr)
            raise RuntimeError("raster2pgsql command failed.")

        print("psql STDOUT:\n", psql_process.stdout)
        if psql_process.stderr:
            print("psql STDERR:\n", psql_process.stderr)

        print(f"Successfully loaded reference for {minio_vsicurl_path} into PostGIS.")
    except subprocess.CalledProcessError as e:
        print(f"ERROR: psql failed with exit code {e.returncode}")
        print("psql STDOUT:\n", e.stdout)
        print("psql STDERR:\n", e.stderr)
        raise RuntimeError(f"psql command failed: {e.cmd}")
    except FileNotFoundError:
        print("ERROR: Command not found. Make sure 'raster2pgsql' and 'psql' are in your PATH.")
        raise
    finally:
        # Clean up sensitive environment variables
        if 'PGPASSWORD' in os.environ:
            del os.environ['PGPASSWORD']
        if 'AWS_ACCESS_KEY_ID' in os.environ:
            del os.environ['AWS_ACCESS_KEY_ID']
        if 'AWS_SECRET_ACCESS_KEY' in os.environ:
            del os.environ['AWS_SECRET_ACCESS_KEY']
        if 'AWS_S3_ENDPOINT' in os.environ:
            del os.environ['AWS_S3_ENDPOINT']
        if 'AWS_S3_VERIFY' in os.environ:
            del os.environ['AWS_S3_VERIFY']


MINIO_ENDPOINT = "192.168.52.212:9200"
MINIO_ACCESS_KEY = "L3dlmTg0qKVJB02w4VZx"
MINIO_SECRET_KEY = "SlBBvoj5pPPHNQMFKG12ysAm5Opghx2JeI44ZYmg"
# MINIO_ENDPOINT = "localhost:9100"
# MINIO_ACCESS_KEY = "eP5Avftflz0OH23WjrCm"
# MINIO_SECRET_KEY = "pp0JW0dgd51ooAoqnmSkBFOfHiVbNfgwgoXQ2Gp2"
MINIO_SECURE = False

MINIO_BUCKET_NAME = "wyvern-dragonette-iran"

# PostGIS Database Configuration
POSTGRES_DB_CONFIG = {
    'host': '192.168.52.212',
    'port': 5432,
    'database': 'satellite_data',
    'user': 'postgres',
    'password': '112233'
}

INPUT_RASTER_FILE = "/home/trofder3004/postgis/clusters/wyvern_dragonette_iran.tiff" 
OUTPUT_COG_FILE = "wyvern_dragonette_iran.tiff" 

RASTER_SRID = 4326 
RASTER_TILE_WIDTH = 64
RASTER_TILE_HEIGHT = 64
POSTGIS_SCHEMA = "public"
POSTGIS_TABLE_NAME = "wyvern_dragonette_iran"

# --- Main Execution ---
if __name__ == "__main__":
    if not os.path.exists(INPUT_RASTER_FILE):
        print(f"Error: Input raster file not found at '{INPUT_RASTER_FILE}'")
        exit(1)

    try:
        minio_client = Minio(
            MINIO_ENDPOINT,
            access_key=MINIO_ACCESS_KEY,
            secret_key=MINIO_SECRET_KEY,
            secure=MINIO_SECURE
        )

        configure_postgis_database(POSTGRES_DB_CONFIG)

        convert_to_cog(INPUT_RASTER_FILE, OUTPUT_COG_FILE)

        print(f"\n--- Checking/Creating MinIO Bucket '{MINIO_BUCKET_NAME}' ---")
        found = minio_client.bucket_exists(MINIO_BUCKET_NAME)
        if not found:
            minio_client.make_bucket(MINIO_BUCKET_NAME)
            print(f"Bucket '{MINIO_BUCKET_NAME}' created successfully.")
        else:
            print(f"Bucket '{MINIO_BUCKET_NAME}' already exists.")

        set_minio_bucket_public_read_policy(minio_client, MINIO_BUCKET_NAME)

        minio_object_name = os.path.basename(OUTPUT_COG_FILE)
        upload_to_minio(minio_client, MINIO_BUCKET_NAME, OUTPUT_COG_FILE, minio_object_name)

        minio_http_path = f"http{'s' if MINIO_SECURE else ''}://{MINIO_ENDPOINT}/{MINIO_BUCKET_NAME}/{minio_object_name}"
        
  
        minio_endpoint_for_gdal = f"http{'s' if MINIO_SECURE else ''}://{MINIO_ENDPOINT}"

        load_raster_reference_to_postgis(
            POSTGRES_DB_CONFIG,
            minio_http_path,
            MINIO_ACCESS_KEY,
            MINIO_SECRET_KEY,
            minio_endpoint_for_gdal,
            RASTER_SRID,
            RASTER_TILE_WIDTH,
            RASTER_TILE_HEIGHT,
            POSTGIS_SCHEMA,
            POSTGIS_TABLE_NAME
        )

        print("\n--- Script finished successfully! ---")
        print(f"You can now query your raster data in PostGIS table '{POSTGIS_SCHEMA}.{POSTGIS_TABLE_NAME}'")
        print(f"The raster data is stored out-of-database at: {minio_http_path}")

    except Exception as e:
        print(f"\nScript failed: {e}")
    finally:
        if os.path.exists(OUTPUT_COG_FILE):
            os.remove(OUTPUT_COG_FILE)
            print(f"Removed temporary COG file: {OUTPUT_COG_FILE}")
