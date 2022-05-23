/*

// Final Project The MoonNight an interactive showpiece. 

// Added a background image.

// Imported the processing.serial to setup the serial port positions. 

// added three indivisual ports 0, 1 & 2. 

// Change to mouse cursor to the hand cursor for interactions.

// User interactions: 

// Added four different states for the arduino setup that can be triggered by the processing sketch.
 
// State one: Drag the mouse cursor over the moon on the processing sketch to activate the moon and stars (LEDs).
 
// State two: Drag the mouse cursor over the lighthouse on the processing sketch to activate the lighthouse (red LED) along with the moon and stars.
 
// State three: Drag the mouse cursor over the green play button on the sketch and click it to activate the windmill other LEDs.
 
// State four: Drag the cursor over the red power button to trigger the off state.
 
// Added a clickable button icon to activate the windmill (servo motor). 
 
// When the mouse cursor is pointed over the lighthouse, it will trigger the windmill fan to spin on the processing sketch.
 
// Click the green playable button to activate the physical servo motor from the arduino setup and then drag the mouse cursor over the lighthouse area to create a simultaneous effect.
 
// The processing setup will provide the same visual reaction just like the arduino setup. 
  

*/

int val=0; //to send over Serial

//button interface
int buttonWidth=150;
int buttonHeight=150;
boolean button=false;

float angle;
float spin;

PImage background;

import processing.serial.*;  //import Serial library

Serial myPort;  // create object from Serial class

void setup() {

  size(670, 369); 
  cursor(HAND);
  background = loadImage("night.jpg");
  fill(0);
  textSize (22);
  fill(255);
  textAlign (CENTER, CENTER);

  //set up Serial communication
  printArray(Serial.list()); // prints port list to the console
  String portName = Serial.list()[0]; //change to match your port
  myPort = new Serial(this, portName, 9600); //initialize Serial communication at 9600 baud
}

void draw() {
  //text stuff
  
  image(background, 0, 0);

  val= int (map (mouseY, 0, width, 0, 180)); //remaps mouseY to 0-180  
  myPort.write(val); //write to Serial
  println(val);  //print to console

//mouse location controls communication to Serial 
 
  if (mouseY > width/4 && mouseY < height) {  // When the cursor is at the bottom center.  
    
  fill(255);
  rect(330, 130, 20, 100);  
  rect(330, 130, 100, 20); 
    
  myPort.write(0); 
  println ("0");      
    
  } else if (mouseX < width/4 && mouseX > 0) { // When the cursor is over the Moon. 
    myPort.write(1);  //write '1' to Serial port
    println("1"); //also print '1' to console
  
  fill(255);
  rect(330, 130, 20, 100);  
  rect(330, 130, 100, 20); 
  
  fill(255);
  ellipse(410, 40, 15, 15);
  fill(255);
  ellipse(375, 45, 15, 15);
  fill(255);
  ellipse(355, 20, 15, 15);  
    
  } else if (mouseX > width/10 && mouseX < width) { // when the cursor is over the lighthouse.

    myPort.write(2);  //write '2' to Serial port
    println ("2"); //print to '2' to console
  
  fill(#E00B0B);
  ellipse(495, 124, 15, 15); 
 
  
  fill(255);
  ellipse(410, 40, 15, 15);
  fill(255);
  ellipse(375, 45, 15, 15);
  fill(255);
  ellipse(355, 20, 15, 15);   
    
 rectMode(CENTER);
 if (second() % 1 == 0) {  // The digital windmill setup. 
    spin = (-0.07);
  }
  angle = angle + spin;
 
  translate(width/2.03, height/2.9);
  rotate(angle);
  fill(255);
  rect(0, 0, 20, 100);  
  rect(0, 0, 100, 20);     
    
  } else if (mouseX > width/4 && mouseX < width) { 
  
    myPort.write(3);  
    println ("3"); 
    
  }
  
  else {  //otherwise
    myPort.write(0); //send a 0
    println ("0");
  }
}

void mousePressed() {
  //If button is pressed 
  if (mouseX>width/2-buttonWidth/2 && mouseX<width/2+buttonWidth/2 && mouseY> height/2 - buttonHeight/2 && mouseY< height/2 + buttonHeight/2) {
    button=true;
    myPort.write(3); //write to Serial   
  }
  //println (button); 
  button=false; //returns button state to false;
}
