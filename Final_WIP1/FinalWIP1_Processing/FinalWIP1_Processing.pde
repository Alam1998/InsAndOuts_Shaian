/*

// Final Project WIP1. 

// Added a background image.

// Imported the processing.serial to setup the serial port positions. 

// added three indivisual ports 0, 1 & 2. 

// Change to mouse cursor to the hand cursor for interactions.

*/



PImage background;

import processing.serial.*;  //import Serial library

Serial myPort;  // create object from Serial class

void setup() {

  size(696, 391); 
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



//mouse location controls communication to Serial 
 
  if (mouseY > width/4 && mouseY < height) {  // When the cursor is at the bottom center.
    myPort.write(0); 
    println ("0");
  } else if (mouseX < width/4 && mouseX > 0) { // When the cursor is over the Moon. 
    myPort.write(1);  //write '1' to Serial port
    println("1"); //also print '1' to console
  } else if (mouseX > width/4 && mouseX < width) { // when the cursor is over the lighthouse.
    myPort.write(2);  //write '2' to Serial port
    println ("2"); //print to '2' to console
  } else {  //otherwise
    myPort.write(0); //send a 0
    println ("0");
  }
}
