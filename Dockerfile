
FROM python:3.12-slim

# Set working directory
WORKDIR /workspace

ENV PORT=8000

# Copy requirements first to leverage Docker cache
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code and model
COPY app.py .
COPY icons.py .
COPY mambaout_model.onnx .

EXPOSE 8000

# Set command
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]

# CMD ["tail", "-f", "/dev/null"]