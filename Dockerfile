# Get Ubuntu 24.04 image
FROM ubuntu:24.04

# Set environment variables to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Set the timezone to America/Sao_Paulo
ENV TZ=America/Sao_Paulo

# Install required dependencies
RUN apt update && apt upgrade -y && apt install -y git nano python3 gcc-arm-none-eabi build-essential stlink-tools

# Clone the branch dev of the ESCape32 repository
RUN git clone -b dev https://github.com/lucasgmx/ESCape32.git

# Set the working directory to the project folder
WORKDIR /ESCape32

# Build libopencm3 for the stm32/g0 target
RUN make -C libopencm3 TARGETS='stm32/g0'

# Configure the project using CMake, setting the LIBOPENCM3_DIR path
RUN cmake -B build -D LIBOPENCM3_DIR=libopencm3

# Build the project
RUN make -C build

# Set the default command to bash (optional, for debugging or further modifications)
CMD ["/bin/bash"]
