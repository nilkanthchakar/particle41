FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY simple_time_service.py ./

# Expose port
EXPOSE 5000

# Run the service
CMD ["python", "simple_time_service.py"]

