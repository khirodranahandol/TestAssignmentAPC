# Base image with Python and Robot Framework pre-installed
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container
COPY . .

# Install any necessary system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Ensure robot and robot-reports folders exist
RUN mkdir -p /usr/src/app/reports

# Define entrypoint to run tests by default
ENTRYPOINT ["robot"]

# Default command to run when the container starts (robot tests/)
CMD ["--outputdir", "reports", "tests/"]
