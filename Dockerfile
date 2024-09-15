FROM ghcr.io/westsurname/scripts/blackhole:latest

# Install runtime dependencies
RUN apt-get update && apt-get install curl -y