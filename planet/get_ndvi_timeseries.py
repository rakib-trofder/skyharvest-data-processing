#!/usr/bin/env python3
"""
NDVI Time Series Flask Application

This application provides an API endpoint to retrieve NDVI time series data
for agricultural fields using the Sentinel Hub Statistical API.

API Endpoints:
- GET /field-status: Returns NDVI time series data for predefined field geometry
"""

import warnings
from typing import Optional, Tuple, Any
from flask import Flask, jsonify, request
from flask_cors import CORS
import pandas as pd
import geopandas as gpd
import numpy as np
from sentinelhub import (
    SHConfig,
    DataCollection,
    SentinelHubStatistical,
    CRS,
    Geometry,
    parse_time
)

# Suppress warnings
warnings.filterwarnings('ignore', category=UserWarning)

# Initialize Flask app
app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# Sentinel Hub Configuration (hardcoded as per requirements)
config = SHConfig(
    sh_client_id='943e31e9-a4eb-49cf-b2e1-c0932e8e5e88',
    sh_client_secret='0Dlg7u5xeUcS1luMcSFd4ZVrI2jywAFd'
)

# Hardcoded field geometry (Eswatini fields from the notebook)
fields_geojson = {
    "type": "FeatureCollection",
    "name": "eswatini_fields",
    "crs": {"type": "name", "properties": {"name": "urn:ogc:def:crs:OGC:1.3:CRS84"}},
    "features": [
        {
            "type": "Feature",
            "properties": {"id": 1},
            "geometry": {
                "type": "Polygon",
                "coordinates": [[
                    [16.744666, -19.013074],
                    [16.744623, -19.017335],
                    [16.755781, -19.017335],
                    [16.755781, -19.013399],
                    [16.744666, -19.013074]
                ]]
            }
        },
        {
            "type": "Feature",
            "properties": {"id": 2},
            "geometry": {
                "type": "MultiPolygon",
                "coordinates": [[
                    [[
                        [16.744666, -19.013074],
                        [16.744623, -19.017335],
                        [16.755781, -19.017335],
                        [16.755781, -19.013399],
                        [16.744666, -19.013074]
                    ]],
                    [[
                        [16.734452, -19.004795],
                        [16.732221, -19.00934],
                        [16.737156, -19.012141],
                        [16.742606, -19.004916],
                        [16.734452, -19.004795]
                    ]]
                ]]
            }
        },
        {
            "type": "Feature",
            "properties": {"id": 3},
            "geometry": {
                "type": "MultiPolygon",
                "coordinates": [[
                    [[
                        [16.744666, -19.013074],
                        [16.744623, -19.017335],
                        [16.755781, -19.017335],
                        [16.755781, -19.013399],
                        [16.744666, -19.013074]
                    ]],
                    [[
                        [16.734452, -19.004795],
                        [16.732221, -19.00934],
                        [16.737156, -19.012141],
                        [16.742606, -19.004916],
                        [16.734452, -19.004795]
                    ]],
                    [[
                        [16.727972, -19.023585],
                        [16.725655, -19.030321],
                        [16.74192, -19.029997],
                        [16.743851, -19.024762],
                        [16.735053, -19.023707],
                        [16.731405, -19.025208],
                        [16.727972, -19.023585]
                    ]]
                ]]
            }
        }
    ]
}

# NDVI Evalscript (from the notebook)
evalscript = """
//VERSION=3
function setup() {
  return {
    input: [{
      bands: [
        "B04",
        "B08",
        "dataMask"
      ]
    }],
    output: [
      {
        id: "ndvi",
        bands: 1
      },
      {
        id: "dataMask",
        bands: 1
      }]
  };
}

function evaluatePixel(samples) {
    let index = (samples.B08 - samples.B04) / (samples.B08+ samples.B04);
    return {
        ndvi: [index],
        dataMask: [samples.dataMask],
    };
}
"""

# Helper functions from the notebook
def extract_stats(date, stat_data):
    """Extract statistics for a single acquisition date"""
    d = {}
    for key, value in stat_data['outputs'].items():
        stats = value['bands']['B0']['stats']
        if stats['sampleCount'] == stats['noDataCount']:
            continue
        else:
            d['date'] = [date]
            for stat_name, stat_value in stats.items():
                if stat_name in ['sampleCount', 'noDataCount']:
                    continue
                else:
                    d[f'{key}_{stat_name}'] = [stat_value]
    return pd.DataFrame(d)

def read_acquisitions_stats(stat_data):
    """Convert statistical API response to pandas DataFrame"""
    df_li = []
    for aq in stat_data:
        date = aq['interval']['from'][:10]
        df_li.append(extract_stats(date, aq))
    
    if df_li:
        return pd.concat(df_li, ignore_index=True)
    else:
        return pd.DataFrame()

def get_ndvi_timeseries():
    """Get NDVI time series data using Sentinel Hub Statistical API"""
    try:
        # Load field geometry
        fields_gdf = gpd.read_file(str(fields_geojson))
        geometry = Geometry(geometry=fields_gdf.geometry.iloc[0], crs=CRS.WGS84)
        
        # Create statistical request
        request = SentinelHubStatistical(
            aggregation=SentinelHubStatistical.aggregation(
                evalscript=evalscript,
                time_interval=('2023-01-01T00:00:00Z', '2023-12-31T23:59:59Z'),
                aggregation_interval='P5D',
                resolution=(0.0001, 0.0001),        
            ),
            input_data=[
                SentinelHubStatistical.input_data(
                    DataCollection.SENTINEL2_L2A,
                ),
            ],
            geometry=geometry,
            config=config
        )
        
        # Get data from Sentinel Hub
        response = request.get_data()
        
        # Process response
        if response and len(response) > 0 and 'data' in response[0]:
            result_df = read_acquisitions_stats(response[0]['data'])
            
            if not result_df.empty:
                # Convert to dictionary for JSON response
                result_dict = result_df.to_dict('records')
                return {
                    'status': 'success',
                    'message': 'NDVI time series data retrieved successfully',
                    'data': result_dict,
                    'total_records': len(result_dict)
                }
            else:
                return {
                    'status': 'warning',
                    'message': 'No data available for the specified time period',
                    'data': [],
                    'total_records': 0
                }
        else:
            return {
                'status': 'error',
                'message': 'No response data received from Sentinel Hub',
                'data': [],
                'total_records': 0
            }
            
    except Exception as e:
        return {
            'status': 'error',
            'message': f'Error retrieving NDVI data: {str(e)}',
            'data': [],
            'total_records': 0
        }

@app.route('/field-status', methods=['GET'])
def field_status():
    """
    API endpoint to get NDVI time series data for agricultural fields.
    
    Returns:
        JSON response containing NDVI time series data with statistics:
        - date: Date of the measurement
        - ndvi_min: Minimum NDVI value
        - ndvi_max: Maximum NDVI value  
        - ndvi_mean: Mean NDVI value
        - ndvi_stDev: Standard deviation of NDVI
    """
    try:
        result = get_ndvi_timeseries()
        
        # Set appropriate HTTP status code based on result
        if result['status'] == 'success':
            status_code = 200
        elif result['status'] == 'warning':
            status_code = 204  # No content
        else:
            status_code = 500  # Internal server error
            
        return jsonify(result), status_code
        
    except Exception as e:
        error_response = {
            'status': 'error',
            'message': f'Unexpected error: {str(e)}',
            'data': [],
            'total_records': 0
        }
        return jsonify(error_response), 500

@app.route('/health', methods=['GET'])
def health_check():
    """Health check endpoint"""
    return jsonify({
        'status': 'healthy',
        'message': 'NDVI Time Series API is running',
        'version': '1.0.0'
    }), 200

@app.route('/', methods=['GET'])
def root():
    """Root endpoint with API information"""
    return jsonify({
        'name': 'NDVI Time Series API',
        'description': 'API for retrieving NDVI time series data from agricultural fields',
        'version': '1.0.0',
        'endpoints': {
            '/field-status': 'GET - Returns NDVI time series data',
            '/health': 'GET - Health check endpoint',
            '/': 'GET - This information endpoint'
        },
        'data_source': 'Sentinel-2 L2A via Sentinel Hub Statistical API',
        'field_location': 'Eswatini agricultural fields'
    }), 200

if __name__ == '__main__':
    print("Starting NDVI Time Series API server...")
    print("Available endpoints:")
    print("  - GET /field-status : Get NDVI time series data")
    print("  - GET /health : Health check")
    print("  - GET / : API information")
    print("")
    print("Server will run on http://localhost:4800")
    
    # Run the Flask application on port 4800
    app.run(host='0.0.0.0', port=4800, debug=True)