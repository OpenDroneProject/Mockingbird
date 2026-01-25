#include <ESP32Servo.h>
    
Servo myServo; // Create a servo object
const int servoPin = 18; // Define the GPIO pin for the servo

void setup() {
  myServo.attach(servoPin); // Attach the servo object to the pin
}

void loop() {
  myServo.write(0); // Move to 0 degrees
  delay(1000);
  myServo.write(90); // Move to 90 degrees
  delay(1000);
  myServo.write(180); // Move to 180 degrees
  delay(1000);
}