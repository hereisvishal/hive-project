# Start from the solved challenge image
FROM hereisvishal/docker-challenge-solved-vishalmathur:latest

# Install Node Exporter
RUN apt-get update && apt-get install -y wget \
    && wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz \
    && tar xvfz node_exporter-1.0.1.linux-amd64.tar.gz \
    && cp node_exporter-1.0.1.linux-amd64/node_exporter /usr/local/bin/ \
    && rm -rf node_exporter-1.0.1.linux-amd64* \
    && apt-get clean

# Expose the metrics port
EXPOSE 9100

# Update the CMD to run both Node Exporter and your existing services
CMD /usr/local/bin/node_exporter & /entrypoint.sh

