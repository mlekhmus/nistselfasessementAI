FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy application files
COPY nist_csf_tracker_complete.html .
COPY claude_proxy.py .
COPY nist-csf-manufacturing-csv.txt .
COPY startup.sh .

# Make startup script executable
RUN chmod +x startup.sh

# Expose ports
EXPOSE 8000 8001

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/ || exit 1

# Set default environment variable
ENV CLAUDE_API_KEY=""

# Run the startup script
CMD ["./startup.sh"]
