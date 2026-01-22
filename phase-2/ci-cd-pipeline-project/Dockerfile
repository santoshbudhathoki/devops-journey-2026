FROM python:3.11-slim

WORKDIR /app

# Install dependencies first (better caching)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app source
COPY app ./app
COPY tests ./tests
COPY VERSION ./VERSION

EXPOSE 5000

# Run the Flask app
CMD ["python", "app/app.py"]
