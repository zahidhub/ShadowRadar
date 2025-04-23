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
