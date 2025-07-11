# SimpleTimeService

A simple microservice that returns the current UTC timestamp and the visitor's IP address as JSON.

## Requirements
- Python 3.8+
- pip

## Setup

1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Run the service:
   ```bash
   python simple_time_service.py
   ```

3. Access the service:
   Open your browser or use curl to visit [http://localhost:5000/](http://localhost:5000/)

## Example Response
```
{
  "timestamp": "2024-06-07T12:34:56.789Z",
  "ip": "127.0.0.1"
}
``` 
