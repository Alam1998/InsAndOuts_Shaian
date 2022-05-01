
byte val; 
const int LED1 = 4; 
const int LED2 = 8; 


void setup() {
  pinMode(LED1, OUTPUT); 
  pinMode(LED2, OUTPUT); 
  Serial.begin(9600); 
}

void loop() {
  if (Serial.available()) { 
    val = Serial.read(); 
  }
  if (val == 0) { 
    digitalWrite(LED1, LOW); 
    digitalWrite(LED2, LOW);
  }
  else if (val == 1) { // Added LED effects.
    digitalWrite(LED1, HIGH); 
    delay(50);
    digitalWrite(LED1, LOW); 
    delay(1);
    digitalWrite(LED2, HIGH); 
    delay(75);
    digitalWrite(LED2, LOW);
    delay(1);
  
  }
  
  else if (val == 2) { 
    digitalWrite(LED2, HIGH); 
    digitalWrite(LED1, HIGH); 
  }
  delay(1); 
}
