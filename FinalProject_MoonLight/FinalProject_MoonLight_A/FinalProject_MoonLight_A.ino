
#include <Servo.h>  //include Arduino Servo library

Servo servo;  //creates new Servo object called servo


const int SERVOPIN = 9;
int angle = 0;   // Tracks servo position in degrees
int val = 0; // Tracks incoming value from Serial port


const int LED1 = 4; 
const int LED2 = 3; 
const int LED3 = 6; 
const int LED4 = 11; 
const int LED5 = 7; 


void setup() {
  servo.attach(SERVOPIN); //Specifies pin as output for servo
  Serial.begin(9600); // Start serial communication at 9600 bps

 pinMode(LED1, OUTPUT); 
  pinMode(LED2, OUTPUT); 
  pinMode(LED3, OUTPUT); 
  pinMode(LED4, OUTPUT); 
  pinMode(LED5, OUTPUT); 

  Serial.begin(9600); 

}


void loop() {
  if (Serial.available()) { // If data is available to read
    val = Serial.read(); // read it and store it in val
  }

  if (val == 0) { 
    digitalWrite(LED1, LOW); 
    analogWrite(LED2, LOW);
    analogWrite(LED3, LOW);
    analogWrite(LED4, LOW);
    digitalWrite(LED5, LOW);
    
  }
  else if (val == 1) { // Added LED effects.

    digitalWrite(LED1, HIGH);  
    delay(1);
    analogWrite(LED2, 255); 
    delay(5);
    analogWrite(LED2, 50);
    delay(5);
    analogWrite(LED3, 75); 
    delay(5);
    analogWrite(LED3, 0);
    delay(5);
    analogWrite(LED4, 255); 
    delay(5);
    analogWrite(LED4, 50);
    delay(5);
   digitalWrite(LED5, LOW);

   
  }
  
  else if (val == 2) { 

    digitalWrite(LED1, HIGH);  
    analogWrite(LED2, 255); 
    delay(5);
    analogWrite(LED2, 50);
    delay(5);
    analogWrite(LED3, 255); 
    delay(5);
    analogWrite(LED3, 50);
    delay(5);
    analogWrite(LED4, 255); 
    delay(5);
    analogWrite(LED4, 50);
    delay(5);


    
    digitalWrite(LED5, HIGH); 
    delay(5);
 

  }


    if (val == 3) { //else if val is 255 do a motor sweep
      
   digitalWrite(LED1, HIGH);  
    analogWrite(LED2, 255); 
    delay(5);
    analogWrite(LED2, 50);
    delay(5);
    analogWrite(LED3, 255); 
    delay(5);
    analogWrite(LED3, 50);
    delay(5);
    analogWrite(LED4, 255); 
    delay(5);
    analogWrite(LED4, 50);
    delay(5);
 
    digitalWrite(LED5, HIGH); 
    delay(5);

    for (angle = 0; angle < 180; angle++)
    {
      servo.write(angle);
      delay(5);
    }
    for (angle = 180; angle > 0; angle--)
    {
      servo.write(angle);
      delay(5);
    }
    val = 0; //reset val;
  }

}
