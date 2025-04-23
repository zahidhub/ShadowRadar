#The file is used for downloading dependencies and libraries
#during the pipeline proccess

#inspiration: https://medium.com/swlh/how-to-create-an-automated-build-pipeline-for-your-arduino-project-1df9826f2a5e


#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Enable the globstar shell option
shopt -s globstar

# Make sure we are inside the github workspace
cd $GITHUB_WORKSPACE

# Create directories
mkdir $HOME/Arduino
mkdir $HOME/Arduino/libraries

# Install Arduino IDE
export PATH=$PATH:$GITHUB_WORKSPACE/bin
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh
arduino-cli config init
arduino-cli core update-index

# Install Arduino AVR core
arduino-cli core install arduino:avr

# Link Arduino library
ln -s $GITHUB_WORKSPACE $HOME/Arduino/libraries/CI_Test_Library

# Compile *.ino files for the Arduino Uno
mkdir Radar
mv src/Radar.ino Radar/Radar.ino
arduino-cli compile --fqbn arduino:avr:uno Radar

# Compile unit tests
mkdir test_dir
mv tests/test_distance_conversion.ino test_dir/test_distance_conversion.ino
arduino-cli compile --fqbn arduino:avr:uno test_dir
