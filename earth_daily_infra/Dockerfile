# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . .

# Expose port 4114
EXPOSE 4114

# Define environment variable for Flask
ENV FLASK_APP=app.py

# Run the Flask application
# Using 0.0.0.0 allows the app to be accessible from outside the container
CMD ["flask", "run", "--host=0.0.0.0", "--port=4114"]

