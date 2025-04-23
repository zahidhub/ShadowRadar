#The file is used for downloading dependencies and libraries
#during the pipeline proccess

#inspiration: https://medium.com/swlh/how-to-create-an-automated-build-pipeline-for-your-arduino-project-1df9826f2a5e

#!/bin/bash
set -e
shopt -s globstar

MODE=$1

if [ "$MODE" == "build-only" ]; then
  cd $GITHUB_WORKSPACE

  mkdir -p $HOME/Arduino
  mkdir -p $HOME/Arduino/libraries

  # Install Arduino CLI and AVR core
  export PATH=$PATH:$GITHUB_WORKSPACE/bin
  curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
  arduino-cli config init || true  # Ignore if config exists
  arduino-cli core update-index
  arduino-cli core install arduino:avr
  arduino-cli lib install AUnit

  # Compile main project
  mkdir Radar
  mv src/Radar.ino Radar/Radar.ino
  arduino-cli compile --fqbn arduino:avr:uno Radar

elif [ "$MODE" == "test-only" ]; then
  # Host-based test only: Skip Arduino CLI setup
  cd $GITHUB_WORKSPACE/tests
  make run

else
  echo "Invalid mode. Use 'build-only' or 'test-only'."
  exit 1
fi



#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Enable the globstar shell option
shopt -s globstar

# Make sure we are inside the github workspace
cd $GITHUB_WORKSPACE

# Create directories
mkdir -p $HOME/Arduino
mkdir -p $HOME/Arduino/libraries

# Install Arduino IDE
export PATH=$PATH:$GITHUB_WORKSPACE/bin
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
arduino-cli config init
arduino-cli core update-index

# Install Arduino AVR core
arduino-cli core install arduino:avr

# Install AUnit library for unit testing
arduino-cli lib install AUnit

# Link Arduino library
ln -s $GITHUB_WORKSPACE $HOME/Arduino/libraries/CI_Test_Library

# Compile *.ino files for the Arduino Uno
mkdir Radar
mv src/Radar.ino Radar/Radar.ino
arduino-cli compile --fqbn arduino:avr:uno Radar

# Compile and run host-based tests
cd tests
make run
