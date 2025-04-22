# ShadowRadar - Microversion of Military-grade Radar

The ShawdowRadar, helps with object detection at pointed direction. It uses pulse to detect the location of the object and provides you with the specific location of the object.

#### Status:
[![pipeline](https://github.com/zahidhub/ShadowRadar/actions/workflows/.gitlab-ci.yml/badge.svg)](https://github.com/zahidhub/ShadowRadar/actions/workflows/.gitlab-ci.yml)
---

## Features

- **Object Detection**: The sensor picks any ping from the object infront of it, and provides with the location. (Max radius: 366 cm).


---

## Project Structure

The projects is built on a microlevel through arduino.

#### Components
- **`Radar.ino`**: This is the executable file, that holds the radar initialization.

#### CI/CD
- **`.gitlab-ci.yml`**: The file hold jobs to build the project in pipeline.
- **`build-arduino.sh`**: All the neccessary libraris and dependents are structurede here, with the compile command as well.

---

## Installation

 **//TODO**

---

## Usage

 **//TODO**

---

## Tools and Sensors

- **Arduino IDE**
- **Arduino Uno**
- **Ultasonic Sensor (3 pin)**

---

## Materials Used

- **Arduino**: The microcontroller used in the project.
- **C and C++**: Program language
- **LLM**: Some part of the projects holds inspiration sourced from LLM, specifcally in the .github/workflows folder.

---

## Credits

- **Created by**: Hasan Zahid
- **Inspiration**: [**Leonardo S.p.A Radar**](https://electronics.leonardo.com/en/radars-sensors)

---

## License

This project is open-source and available under the [MIT License](LICENSE).
