# Get Ubuntu 24.04 image
FROM ubuntu:24.04

# Set environment variables to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set the timezone to America/Sao_Paulo
ENV TZ=America/Sao_Paulo

# Install required dependencies
RUN apt update && apt upgrade -y && apt install -y git nano python3 cmake gcc-arm-none-eabi build-essential stlink-tools

# Set the default command to bash (optional, for debugging or further modifications)
CMD ["/bin/bash"]
