# ShadowRadar - Microversion of Military-grade Radar

The ShawdowRadar, helps with object detection at pointed direction. It uses pulse to detect the location of the object and provides you with the specific location of the object.
[**Click here to simulate it remotely**](https://www.tinkercad.com/things/8DvI50LLuXU-shadowradar?sharecode=3s6eIqq0Gd0ZbOP-OjC9WF5cBoZsqcmoRo3DubXEyVY)

#### Status:
[![pipeline](https://github.com/zahidhub/ShadowRadar/actions/workflows/.gitlab-ci.yml/badge.svg)](https://github.com/zahidhub/ShadowRadar/actions/workflows/.gitlab-ci.yml)
---

## Features

**Object Detection**: The sensor picks any ping from the object infront of it, and provides with the location. (Max radius: 366 cm).


---

## Project Structure

The projects is built on a microlevel through arduino.

#### Components
**`Radar.ino`**: This is the executable file, that holds the radar initialization.

#### CI/CD
**`.gitlab-ci.yml`**: The file hold jobs to build the project in pipeline.
**`build-arduino.sh`**: All the neccessary libraris and dependents are structurede here, with the compile command as well.

---

## Installation (Run Locally)

 **Prerequisites:** Arduino IDE, Git

 - **Step1:** Git clone the project
```
git clone git@github.com:zahidhub/ShadowRadar.git
```

- **Step2:** Now open the ShadowRadar folder in your Arduino IDE

- **Step3:** Once inside the folder nevigate to Radar.ino and open the file
```
-- ShawdowRadar
    |--.github
    |
    |--src
    |   |--Radar.ino
    |
    |--.gitignore
    |--LICENSE
    |--README.md
```
- **Step4:** Now connect the arduino board with all the neccessary tools and sensor to your machine and press the arrow (-->) button on the top left of arduino ide. Wait a few seconds, GREAT JOB! your Shadow Radar is Ready.

**Else click the link and simulate it remotely:** [**ShadowRadar on Tinkercard**](https://www.tinkercad.com/things/8DvI50LLuXU-shadowradar?sharecode=3s6eIqq0Gd0ZbOP-OjC9WF5cBoZsqcmoRo3DubXEyVY)


---

## Usage

 **Prototype Development:** Acts as a foundational model for developing more advanced radar systems or integrating object detection capabilities into other projects.

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
