#include <AUnit.h>

// Declare the functions to test (from Radar.ino)
int convertCm(long sensorPulse);
int convertInch(int cm);

// Test convertCm function
test(convertCmTests) {
  assertEqual(convertCm(0), 0);                    // No pulse
  assertEqual(convertCm(1000), 17);                // 1000 * 0.01723 = 17.23 -> 17
  assertEqual(convertCm(5800), 99);                // 5800 * 0.01723 = 99.934 -> 99
  assertEqual(convertCm(1450), 25);                // 1450 * 0.01723 = 25.974 -> 25
}

// Test convertInch function
test(convertInchTests) {
  assertEqual(convertInch(0), 0);                  // 0 cm = 0 inch
  assertEqual(convertInch(2), 0);                  // 2 / 2.54 = 0.78 -> 0
  assertEqual(convertInch(25), 9);                 // 25 / 2.54 = 9.84 -> 9
  assertEqual(convertInch(100), 39);               // 100 / 2.54 = 39.37 -> 39
}

void setup() {
  // Run tests
  aunit::TestRunner::run();
}

void loop() {
  // Not used
}
