# Use a lightweight Python image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Copy application code
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000
EXPOSE 5000

# Run the microservice
CMD ["python", "src/main.py"]
