// Shaian Khan, title: SS2_SpaceTour. 
// Press A & D keys to move the spaceship left and right.

// Reference for the space background: https://processing.org/examples/doublerandom.html



int dots = 2000;
float stars = dots + 100;

float xe=280; 

float x1=285;
float x2=250;
float x3=250;

float x4=250;
float x5=200;
float x6=200;

float xr=216;

float speed=50;

int portalH;
int portalW;
  
void setup() {
  size(840, 720);
  stroke(255);
  smooth();
  frameRate(60);
  
  
  portalH = 100;
  portalW = 90;

} 

void draw() {
  background(0);

  float rand = 0;
  for  (int i = 1; i < stars; i++) {
    point( (width/stars) * i, (height/1) + random(-rand, rand) );
    rand += random(-40, 60);
  Spaceship();  
  
  fill (3);
  ellipse(mouseX + 50, mouseY -75, portalW / 2, portalH * 3);
  
  }
}
  
void Spaceship() {  
  
  fill   (173);
  ellipse(xe, 260, 60, 40);    //spaceship head        
 
  fill   (100);
triangle(x1, 260, x2, 230, x3, 290); //spaceship wings.


  fill   (100);
triangle(x4, 275, x5, 275, x6, 230); //spaceship back

  fill    (173);
  rect    (xr, 240, 72, 40); //spaceship body
  

}

void keyPressed() //spaceship movement
{
  if (key == 'd')
  {
     xe = xe + speed; 
     
     x1 = x1 + speed; 
     x2 = x2 + speed;
     x3 = x3 + speed;
     
     x4 = x4 + speed; 
     x5 = x5 + speed;
     x6 = x6 + speed;
     
     xr = xr + speed; 
}

  else if (key == 'a')
  {
     xe = xe - speed; 
     
     x1 = x1 - speed; 
     x2 = x2 - speed;
     x3 = x3 - speed;
     
     x4 = x4 - speed; 
     x5 = x5 - speed;
     x6 = x6 - speed;
     
     xr = xr - speed; 
    
}
  else {

}

} //<>//
