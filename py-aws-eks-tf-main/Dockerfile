# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Python script into the container
COPY script/F1QualiResults.py /app/
COPY script/config.ini /app/
COPY script/requirements.txt /app/

# Install any needed dependencies specified in requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# Run the Python script when the container launches
CMD ["python", "F1QualiResults.py"]
