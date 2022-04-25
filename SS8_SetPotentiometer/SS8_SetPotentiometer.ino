
const int SENSOR = A0; 
int val = 0;

void setup() {
  pinMode (SENSOR, INPUT);
  Serial.begin(9600); 
}

void loop() {
  val = analogRead(SENSOR); 
  val = val / 4; 

  
 
  Serial.write(val);  



if (Serial.available ( ) > 0 && Serial.available ( ) < 100) {  

char state = Serial.read ( );   
 

}
  
}
