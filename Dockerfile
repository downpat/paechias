# Use the official Python 3.12 slim image as the base image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update
RUN apt-get install -y gcc
RUN apt-get install -y libpq-dev
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir django==4.2 
RUN pip install --no-cache-dir gunicorn

# Expose port 8000
EXPOSE 8000

# Command to run the Django app using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "paechias.wsgi:application"]

