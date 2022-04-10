const int buttonPin = 2;     // creates variable called buttonPin and assigns value of 2
const int LED =  11;        
const int LED2 =  9;      
const int LED3 =  10;     
const int LED4 =  6; 
const int LED5 = 5;
const int LED6 = 3;
   
// sets up integer variable that will change over time
int buttonState = 0;         // creates variable to track buttonState, assigns initial value of 0


// setup runs once at startup
void setup() {
  pinMode(LED, OUTPUT);         // initialize LED pin as an output.
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(LED5, OUTPUT);
  pinMode(LED6, OUTPUT);   
  pinMode(buttonPin, INPUT);   // initialize pushbutton pin as an input.
}

// loop runs infinitely
void loop() {
  buttonState = digitalRead(buttonPin);    // read the state of the pushbutton value
  delay (20); //small delay for debouncing, to increase accuracy
  
  if (buttonState == HIGH) {      // if button is pressed (voltage received on pin 2)

  analogWrite(LED, 20);   
  analogWrite(LED2, 20);
  analogWrite(LED3, 20);
  analogWrite(LED4, 20);
  analogWrite(LED5, 20);
  analogWrite(LED6, 20);
  delay(100);               
  analogWrite(LED, 50);
  analogWrite(LED2, 50);
  analogWrite(LED3, 50);
  analogWrite(LED4, 50);
  analogWrite(LED5, 50);
  analogWrite(LED6, 50);   
  delay(100);               
  analogWrite(LED, 100);
  analogWrite(LED2, 100);
  analogWrite(LED3, 100);
  analogWrite(LED4, 100);
  analogWrite(LED5, 100);
  analogWrite(LED6, 100);   
  delay(100);               
  analogWrite(LED, 200);
  analogWrite(LED2, 200);
  analogWrite(LED3, 200);
  analogWrite(LED4, 200);
  analogWrite(LED5, 200);
  analogWrite(LED6, 200);    
  delay(100);               
  analogWrite(LED, 255);
  analogWrite(LED2, 255);
  analogWrite(LED3, 255);
  analogWrite(LED4, 255);
  analogWrite(LED5, 255);
  analogWrite(LED6, 255);   
  delay(200); 



  analogWrite(LED, 255);   
  analogWrite(LED2, 255);
  analogWrite(LED3, 255);
  analogWrite(LED4, 255);
  analogWrite(LED5, 255);
  analogWrite(LED6, 255);
  delay(100);               
  analogWrite(LED, 200);
  analogWrite(LED2, 200);
  analogWrite(LED3, 200);
  analogWrite(LED4, 200); 
  analogWrite(LED5, 200);
  analogWrite(LED6, 200);  
  delay(100);               
  analogWrite(LED, 100);
  analogWrite(LED2, 100);
  analogWrite(LED3, 100);
  analogWrite(LED4, 100);
  analogWrite(LED5, 100);
  analogWrite(LED6, 100);   
  delay(100);               
  analogWrite(LED, 50);
  analogWrite(LED2, 50);
  analogWrite(LED3, 50);
  analogWrite(LED4, 50);
  analogWrite(LED5, 50);
  analogWrite(LED6, 50);    
  delay(100);               
  analogWrite(LED, 20);
  analogWrite(LED2, 20);
  analogWrite(LED3, 20);
  analogWrite(LED4, 20); 
  analogWrite(LED5, 20);
  analogWrite(LED6, 20);  
  delay(100); 

  analogWrite(LED, 255);   
  delay(100);               
  analogWrite(LED, 191);    
  delay(100);              
  analogWrite(LED, 127);    
  delay(100);               
  analogWrite(LED, 64);   
  delay(100);               
  analogWrite(LED, 0);    
  delay(100); 

  analogWrite(LED2, 255);   
  delay(100);               
  analogWrite(LED2, 191);    
  delay(500);              
  analogWrite(LED2, 127);    
  delay(500);               
  analogWrite(LED2, 64);   
  delay(500);               
  analogWrite(LED2, 0);    
  delay(500); 

  analogWrite(LED3, 255);  
  delay(200);               
  analogWrite(LED3, 191);    
  delay(300);              
  analogWrite(LED3, 127);    
  delay(400);               
  analogWrite(LED3, 64);   
  delay(500);               
  analogWrite(LED3, 0);    
  delay(500); 

  analogWrite(LED4, 255);   
  delay(500);               
  analogWrite(LED4, 191);    
  delay(600);              
  analogWrite(LED4, 127);   
  delay(700);               
  analogWrite(LED4, 64);   
  delay(800);               
  analogWrite(LED4, 0);    
  delay(900); 
   

  
  }

  else { 
    digitalWrite(LED, LOW);    
    digitalWrite(LED2, LOW);            
    digitalWrite(LED3, LOW);            
    digitalWrite(LED4, LOW);
    digitalWrite(LED5, LOW);            
    digitalWrite(LED6, LOW);  

  }
}
