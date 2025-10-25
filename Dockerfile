# Use OpenJDK 17 slim image
FROM openjdk:17-slim

# ----------------------------
# Install Python, pip, and utilities
# ----------------------------
RUN apt-get update && \
    apt-get install -y python3 python3-pip curl git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# ----------------------------
# Set working directory
# ----------------------------
WORKDIR /app

# ----------------------------
# Copy requirements first (Docker layer caching)
# ----------------------------
COPY requirements.txt .

# ----------------------------
# Install lightweight packages first to avoid partial failures
# ----------------------------
RUN pip3 install --default-timeout=1000 --no-cache-dir \
    pandas numpy matplotlib seaborn networkx plotly jupyter scipy pyarrow

# ----------------------------
# Install PySpark separately to handle large download
# ----------------------------
RUN pip3 install --default-timeout=1000 --no-cache-dir pyspark

# ----------------------------
# Copy project code
# ----------------------------
COPY . .

# ----------------------------
# Expose Jupyter Notebook port
# ----------------------------
EXPOSE 8888

# ----------------------------
# Start Jupyter Notebook
# ----------------------------
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

