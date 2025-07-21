from flask import Flask, request, jsonify
import requests
import json
import pandas as pd
import numpy as np
from datetime import datetime
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
# --- API Configuration ---
TOKEN_URL = "https://identity.geosys-na.com/v2.1/connect/token"
MAP_DATA_URL = "https://api.geosys-na.net/field-level-maps/v5/map-sets/base-reference-map/NDVI"
NDVI_CATEGORIES = {
    "Poor": (0.0, 0.2),
    "Moderate": (0.2, 0.5),
    "Good": (0.5, 0.8),
    "Excellent": (0.8, 1.0)
}

def fetch_token():
    """Fetches an authentication token from the API."""
    payload = {
        'grant_type': 'password',
        'client_id': 'eu_research_and_development_agency_demo',
        'username': 'EU_RESEARCH_AND_DEVELOPMENT_AGENCY',
        'password': 'da0acec5',
        'scope': 'openid offline_access',
        'client_secret': 'eu_research_and_development_agency_demo.secret'
    }
    try:
        response = requests.post(TOKEN_URL, data=payload)
        response.raise_for_status()
        return response.json().get("access_token")
    except requests.exceptions.RequestException:
        return None

def fetch_map_data(token, map_params):
    """Fetches map data from the API."""
    headers = {
        "Authorization": f"Bearer {token}",
        "Content-Type": "application/json"
    }
    params = {
        "directLinks": "true",
        "legendType": "Dynamic",
        "$epsg-out": "3857",
        "histogram": "true"
    }
    try:
        response = requests.post(MAP_DATA_URL, headers=headers, json=map_params, params=params)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException:
        return None

def fetch_catalog_imagery(token, seasonFieldId, fromDate, toDate):
    """Fetches catalog imagery data from the API."""
    CATALOG_IMAGERY_URL = f"https://api.geosys-na.net/field-level-maps/v5/season-fields/{seasonFieldId}/catalog-imagery?Image.Date=$between:{fromDate}|{toDate}"
    headers = {
        "Authorization": f"Bearer {token}",
    }
    try:
        response = requests.get(CATALOG_IMAGERY_URL, headers=headers)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException:
        return None

def analyze_histogram_data(histogram_items):
    """Analyzes histogram data to get mean, min, max, and std dev."""
    if not histogram_items:
        return None, None, None, None, None
    pixel_counts = np.array([item['numberOfPixel'] for item in histogram_items])
    total_pixels = pixel_counts.sum()
    if total_pixels == 0:
        return 0, 0, 0, 0, {cat: 0 for cat in NDVI_CATEGORIES}
    midpoints = np.array([(item['valueMin'] + item['valueMax']) / 2 for item in histogram_items])
    mean_ndvi = np.average(midpoints, weights=pixel_counts)
    variance = np.average((midpoints - mean_ndvi)**2, weights=pixel_counts)
    std_dev_ndvi = np.sqrt(variance)
    min_ndvi = histogram_items[0]['valueMin']
    max_ndvi = histogram_items[-1]['valueMax']
    category_percentages = {cat: 0 for cat in NDVI_CATEGORIES}
    for item in histogram_items:
        item_min, item_max = item['valueMin'], item['valueMax']
        for category, (cat_min, cat_max) in NDVI_CATEGORIES.items():
            overlap_min = max(item_min, cat_min)
            overlap_max = min(item_max, cat_max)
            if overlap_max > overlap_min:
                overlap_pixels = item['numberOfPixel'] * (overlap_max - overlap_min) / (item_max - item_min)
                category_percentages[category] += overlap_pixels
    total_pixels_in_cat = sum(category_percentages.values())
    if total_pixels_in_cat > 0:
        category_percentages = {cat: (pixels / total_pixels) * 100 for cat, pixels in category_percentages.items()}
    else:
        category_percentages = {cat: 0 for cat in NDVI_CATEGORIES}
    return mean_ndvi, min_ndvi, max_ndvi, std_dev_ndvi, category_percentages

def analyze_ndvi_events(df):
    """Analyzes the NDVI data to infer agricultural events."""
    if df.empty:
        return {
            "cultivation_times": 0, "harvesting_times": 0, "current_status": "No data",
            "idle_periods": 0, "cultivation_timeline": "No data"
        }
    cultivation_starts, harvest_events, cultivation_timeline = [], [], []
    idle_periods_count = 0
    is_cultivating = False
    cultivation_start_date = None
    df = df.sort_values(by='date').reset_index(drop=True)
    df['ndvi_diff'] = df['mean_ndvi'].diff()
    CULTIVATION_THRESHOLD = 0.1
    HARVEST_THRESHOLD = -0.2
    IDLE_THRESHOLD = 0.2
    for i in range(1, len(df)):
        if df['ndvi_diff'][i] > CULTIVATION_THRESHOLD and not is_cultivating:
            cultivation_starts.append(df['date'][i])
            is_cultivating = True
            cultivation_start_date = df['date'][i]
        if df['ndvi_diff'][i] < HARVEST_THRESHOLD and is_cultivating:
            harvest_events.append(df['date'][i])
            is_cultivating = False
            if cultivation_start_date:
                cultivation_timeline.append(f"{cultivation_start_date.strftime('%b')}'{cultivation_start_date.strftime('%y')}-{df['date'][i].strftime('%b')}'{df['date'][i].strftime('%y')}")
                cultivation_start_date = None
    if is_cultivating and cultivation_start_date:
        cultivation_timeline.append(f"{cultivation_start_date.strftime('%b')}'{cultivation_start_date.strftime('%y')}-Present")
    for i in range(len(df) - 1):
        if df['mean_ndvi'][i] < IDLE_THRESHOLD and df['mean_ndvi'][i+1] < IDLE_THRESHOLD:
            idle_periods_count += 1
    last_ndvi = df.iloc[-1]['mean_ndvi']
    current_status = "Unknown"
    if last_ndvi < 0.2: current_status = "Idle or newly cultivated"
    elif 0.2 <= last_ndvi < 0.5: current_status = "Early growth stage"
    elif 0.5 <= last_ndvi < 0.8: current_status = "Mid-growth stage"
    elif last_ndvi >= 0.8: current_status = "Mature crop"
    return {
        "cultivation_times": len(cultivation_starts),
        "harvesting_times": len(harvest_events),
        "current_status": current_status,
        "idle_periods": idle_periods_count,
        "cultivation_timeline": ", ".join(cultivation_timeline)
    }

@app.route("/")
def welcome():
    return "Welcome to Skyharvest Field Status App"

@app.route("/status", methods=['GET'])


def get_field_status():
    fromDate = request.args.get('fromDate')
    toDate = request.args.get('toDate')
    seasonFieldId = request.args.get('seasonFieldId')

    if not all([fromDate, toDate, seasonFieldId]):
        return jsonify({"error": "Missing parameters. Required: fromDate, toDate, seasonFieldId"}), 400

    token = fetch_token()
    if not token:
        return jsonify({"error": "Could not authenticate with the API"}), 500

    fetch_data = fetch_catalog_imagery(token, seasonFieldId, fromDate, toDate)
    if not fetch_data:
        return jsonify({"error": "Could not fetch catalog imagery data"}), 500

    sentinel_2_image_ids = [
        satellites["image"]["id"]
        for satellites in fetch_data
        if "sentinel-2-c1-l2a" in satellites["image"]["id"]
    ]


    ndvi_data = []
    for image_id in sentinel_2_image_ids:
        map_params = {"mapParams": [{"image": {"id": image_id}, "seasonField": {"id": seasonFieldId}}]}
        api_response_data = fetch_map_data(token, map_params)
        if api_response_data and api_response_data[0].get('maps'):
            histogram_items = api_response_data[0]['maps'][0]['histogram']['items']
            mean_ndvi, min_ndvi, max_ndvi, std_dev_ndvi, category_percentages = analyze_histogram_data(histogram_items)
            try:
                date_str = image_id.split('_')[2].split('T')[0]
                date_obj = datetime.strptime(date_str, '%Y%m%d')

                ndvi_data.append({
                    "date": date_obj,
                    "mean_ndvi": mean_ndvi,
                    "min_ndvi": min_ndvi,
                    "max_ndvi": max_ndvi,
                    "std_dev_ndvi": std_dev_ndvi,
                    "category_percentages": category_percentages
                })
            except (IndexError, ValueError) as e:
                print(f"Could not parse date from image ID {image_id}: {e}")



    df = pd.DataFrame(ndvi_data).dropna()
    analysis_results = analyze_ndvi_events(df)

    return jsonify({"status": analysis_results, "line_chart": ndvi_data })

if __name__ == "__main__":
    app.run(debug=True)