# Dockerfile for the Python web app
FROM python:3.8-slim

# Install netcat (nc) for checking service availability
RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY app/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copy the rest of the app files
COPY app /app

# Set environment variables (optional, but useful for debugging)
ENV DB_HOST=db
ENV DB_NAME=testdb
ENV DB_USER=user
ENV DB_PASSWORD=password

# Expose port for Flask
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]
