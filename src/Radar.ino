// define pin for ultrsonic
#define ULTSNCPIN 2

// attributes for distance calculation
int inches = 0; 
int cm = 0;

void setup() {
  // begin the serial print
  Serial.begin(9600);
}

void loop() {

  // start the ultrsonic sensor
  startUltraSonic();
  
  // store the ping time
  long sensorPulse = pulseIn(ULTSNCPIN, HIGH); 
  
  // store the converted cm and inch value
  cm =convertCm(sensorPulse);
  inches = convertInch(cm);

  // print the inch value
  Serial.print(inches);
  Serial.print("in, ");

  // print the cm value
  Serial.print(cm);
  Serial.println("cm");
  
  // wait for 100 milliseconds
  delay(100);

}

void startUltraSonic() {
  
  // clear the trigger
  pinMode(ULTSNCPIN, OUTPUT);  
  digitalWrite(ULTSNCPIN, LOW); 
  
  // wait for 2 microseconds
  delayMicroseconds(2); 
  
  // turn on the ultrasonic
  digitalWrite(ULTSNCPIN, HIGH);
  // wait for 10 microseconds
  delayMicroseconds(10);
  
  // turn off the ultrasonic
  digitalWrite(ULTSNCPIN, LOW);
  // set the trigger to input
  pinMode(ULTSNCPIN, INPUT);
  
}

// convert to inches by dividing by 2.54
int convertInch(int cm) {
return (cm / 2.54);   
}

// convert to cm by multiplying to 0.01723
int convertCm(long sensorPulse) {
return (0.01723 * sensorPulse);
}