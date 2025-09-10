# NDVI Time Series API

This Flask application provides an API endpoint to retrieve NDVI (Normalized Difference Vegetation Index) time series data for agricultural fields using the Sentinel Hub Statistical API.

## Features

- **REST API**: Simple GET endpoint to retrieve NDVI data
- **Hardcoded Configuration**: All parameters are hardcoded as requested
- **Time Series Data**: Returns NDVI statistics over time (2023 data)
- **Agricultural Focus**: Configured for Eswatini agricultural fields
- **CORS Enabled**: Can be consumed by web applications

## Installation

1. Install the required dependencies:
```bash
pip install -r requirements.txt
```

2. Run the application:
```bash
python get_ndvi_timeseries.py
```

The server will start on `http://localhost:4800`

## API Endpoints

### GET /field-status
Returns NDVI time series data for the predefined agricultural field geometry.

**Response Format:**
```json
{
  "status": "success",
  "message": "NDVI time series data retrieved successfully",
  "data": [
    {
      "date": "2023-01-01",
      "ndvi_min": 0.134146,
      "ndvi_max": 0.359257,
      "ndvi_mean": 0.234040,
      "ndvi_stDev": 0.027924
    },
    ...
  ],
  "total_records": 72
}
```

### GET /health
Health check endpoint to verify the API is running.

### GET /
Root endpoint that provides information about the API and available endpoints.

## Data Source

- **Satellite Data**: Sentinel-2 L2A
- **API Provider**: Sentinel Hub Statistical API
- **Time Range**: 2023 (full year)
- **Temporal Resolution**: 5-day intervals
- **Location**: Eswatini agricultural fields

## Configuration

All configuration values are hardcoded in the application as requested:

- Sentinel Hub credentials
- Field geometry (GeoJSON)
- Time intervals
- NDVI calculation parameters

## Usage Example

```bash
# Get NDVI time series data
curl http://localhost:4800/field-status

# Check API health
curl http://localhost:4800/health

# Get API information  
curl http://localhost:4800/
```

## Notes

- The application uses the same NDVI calculation and field geometry from the original Jupyter notebook
- All parameters are hardcoded - no user input is required or accepted
- The API returns JSON responses suitable for web applications
- CORS is enabled for cross-origin requests