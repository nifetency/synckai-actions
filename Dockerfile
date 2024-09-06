FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y curl dos2unix

# Download the Synckai-linux binary and make it executable
RUN curl -L -o /usr/local/bin/Synckai-linux https://github.com/nifetency/synckai-release/releases/download/S3/Synckai-linux \
    && chmod +x /usr/local/bin/Synckai-linux

# Copy entrypoint script and convert it to Unix format
COPY entrypoint.sh /entrypoint.sh
RUN dos2unix /entrypoint.sh \
    && chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT [ "/entrypoint.sh" ]