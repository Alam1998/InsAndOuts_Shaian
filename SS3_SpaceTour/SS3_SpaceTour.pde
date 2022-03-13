// Shaian Khan, title: SS3_SpaceTour. 

// Press A & D keys to move the spaceship left and right.

// Reference for the space background: https://processing.org/examples/doublerandom.html

// Roll over response: Drag the mouse pointer over the moon to activate the wave effects.

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


int circleX, circleY; 
int circleSize = 100;


color circleColor;
color baseColor;


boolean circleOver = false;

Snow[] flakes = new Snow[300]; 

PImage img;
  
void setup() {
  size(840, 720);
  
  img = loadImage("Toyokawa.jpg");
  
  stroke(255);
    smooth();
  frameRate(60);
  
   for (int i = 0; i<flakes.length; i++) {  
    flakes[i] = new Snow(random(10, 10));
    flakes[i].spreadY(i);
  }
  
  portalH = 55;
  portalW = 90;
   
  circleColor = color(#FCE0C2);
  baseColor = color(0);
  circleX = 74;
  circleY = 75;
  ellipseMode(CENTER);
  
} 

void draw() {
 
  image(img, 0, 0);
  
  
  
  update(mouseX, mouseY);
    
    if (circleOver) {                // To create the roll over response.
    background(#FFE3B7);
      float rand = 0;
  for  (int i = 1; i < stars; i++) {   
    stroke(0);
    fill(0);
    ellipse( (width/stars) * i, (height/9), 5, 5 + random(-rand, rand) );
    rand += random(-6, 5);
    
  }
    }
    else {
    background(baseColor);
    
      for (int i = 0; i < flakes.length; i++) {
    flakes[i] .display();

  }
}
  
  stroke(0);
  fill(circleColor);
  ellipse(circleX, circleY, circleSize, circleSize);

  float rand = 0;
  for  (int i = 1; i < stars; i++) {
    stroke(255);
    point( (width/stars) * i, (height/1) + random(-rand, rand) );
    rand += random(-40, 60);
  Spaceship();  
  
  stroke(255);
  fill (0);
  ellipse(mouseX + 50, mouseY -75, portalW / 2, portalH * 3);
  
  }
}


class Snow {
  float x; 
  float y;
  float alpha;
  float diameter;
  float speed = random(180, 180);
  float descentX;

  Snow (float tempD) {
    x = random(-50, width+50);
    y = random(0,40);
    diameter = tempD;
  }
  
  void spreadY(int i) {
    y = y - i*3;
  }
  
  void display() {
    alpha = map(y, 0, height, 255, -50);
    noStroke();
    fill(alpha);
    ellipse(x, y, diameter, diameter);
    y = y + speed;
    x = x + descentX;
    
    //checking the boundary
    if (y > height) {
      y = -diameter;
    }
    if (x < 0-50) {
      x = width+diameter;} 
      else if (x > width+50){
      x = 0-diameter;
    }
    
    }

}


void update(int x, int y) {
  if( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
  }  
 else {
    circleOver = false;
  }
}


boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
  
void Spaceship() {  
  stroke(0);
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

}
