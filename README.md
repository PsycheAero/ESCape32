# ESCape32

Firmware for 32-bit BLDC motor electronic speed controllers that aims for simplicity. It is designed to deliver smooth and efficient motor drive, fast transitions from a complete stop to full throttle, robust direction reversals, and maximum hardware support.


## Features

+ Servo PWM, Oneshot125, automatic throttle calibration
+ DSHOT 300/600/1200, bidirectional DSHOT, extended telemetry
+ Analog/serial/iBUS/SBUS/SBUS2/CRSF input mode
+ KISS/iBUS/S.Port/CRSF telemetry
+ DSHOT 3D mode, turtle mode, beacon, LED, programming
+ Sine startup mode (crawler mode), brushed mode
+ Proportional brake, drag brake
+ Temperature/voltage/current protection
+ Variable PWM frequency, active freewheeling
+ Customizable startup music


## Installation

Follow the steps below to set up and compile the project.

### 1. Create the Docker Image

Start by cloning the repository and building the Docker image:

```bash
git clone -b dev https://github.com/PsycheAero/ESCape32.git
cd ESCape32
docker build -t psyche-esc .
```
Next, run the Docker container, linking the cloned volume:

```bash
docker run -it -v $(pwd):/ESCape32 --name escape32 psyche-esc
```

### 2. Build the Libraries

Once you are inside the Docker container, execute the following commands to build the required libraries:

```bash
cd ESCape32
make -C libopencm3 TARGETS='stm32/g0'
cmake -B build -D LIBOPENCM3_DIR=libopencm3
```

### 3. Compile the Project

Compile the project by running:

```bash
make -C build
```

### 4. Flash the Firmware

Open a new terminal window outside the Docker container and ensure that the ST-Link board is properly connected:

```bash
st-info --probe
```

Finally, flash the firmware to your device using the following command:

```bash
st-flash write PSYCHE-rev11.hex 0x8000000
```