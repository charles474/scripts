FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy only the files needed for pip install to maximize cache utilization
COPY requirements.txt ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install runtime dependencies
RUN apt-get update && apt-get install curl -y

# Copy the rest of the application
COPY . .
