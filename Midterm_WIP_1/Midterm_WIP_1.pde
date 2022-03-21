// Shaian Khan, title: Midterm_WIP_1. 

// Added a full movement control for the spaceship using WASD keys.  

// Press W & S keys to move the spaceship up and down. Press A & D keys to move it left and right. 

// Reference for the space background: https://processing.org/examples/doublerandom.html

// Roll over response: Drag the mouse pointer over the moon to activate the wave effects.

// Added two background images: space.jpg & world.jpg

// Added a text: SpaceTour.

// Added a timed event using millis().

// Added an array.

//Font type: MVBoli-48.vlw .


int dots = 2000;
float stars = dots + 100;

float xe=280; 

float ye=260; 

float[] x= {285, 250, 250, 250, 200, 200}; // Created an array. To Move the ship Left-Right Horizontally.

float[] y= {260, 230, 290, 275, 275, 230}; // To Move the ship UP-Down Vertically.


/* 

The old method to define the spaceship movement.

float x1=285;
float x2=250;
float x3=250;

float x4=250;
float x5=200;
float x6=200;

*/

float xr=216;

float yr=240;

float speed=50;

int portalH;
int portalW;


int circleX, circleY; 
int circleSize = 100;


color circleColor;
color baseColor;


boolean circleOver = false;

Snow[] flakes = new Snow[300]; 

PImage background;
PImage img;

PFont font1;
  
void setup() {
  size(840, 720);
  font1 = loadFont("MVBoli-48.vlw");
  
  background = loadImage("space.jpg");
  
  img = loadImage("world.jpg");
  
  
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
  
  update(mouseX, mouseY);
    
    if (circleOver) {                // To create the roll over response.
    background(#FFE3B7);
    
    image(img, 0, 0);
      float rand = 0;
  for  (int i = 1; i < stars; i++) {   
    stroke(0);
    int m = millis();                // A timed event using millis().
    noStroke();
    fill(m % 235);
    ellipse( (width/stars) * i, (height/9), 5, 5 + random(-rand, rand) );
    rand += random(-6, 5);
    
  }
    }
    else {
    image(background, 0, 0);
    
    textFont(font1, 24);
    textSize(100);
    fill(#C9C9C9);
    text("SpaceTour", 170, 470); 

    
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
  stroke(0);
  int m = millis();
  noStroke();
  fill(m % 255);
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
  ellipse(xe, ye, 60, 40);    //spaceship head        
 
  fill   (100);
triangle(x[0], y[0], x[1], y[1], x[2], y[2]); //spaceship wings.


  fill   (100);
triangle(x[3], y[3], x[4], y[4], x[5], y[5]); //spaceship back

  fill    (173);
  rect    (xr, yr, 72, 40); //spaceship body
  

}

void keyPressed() // Used an array to define the spaceship movement
{
  if (key == 'd')
  {
     xe = xe + speed; 
     
     x[0] = x[0] + speed; 
     x[1] = x[1] + speed;
     x[2] = x[2] + speed;
     
     x[3] = x[3] + speed; 
     x[4] = x[4] + speed;
     x[5] = x[5] + speed;
     
     xr = xr + speed; 
}

  else if (key == 'a')
  {
     xe = xe - speed; 
     
     x[0] = x[0] - speed; 
     x[1] = x[1] - speed;
     x[2] = x[2] - speed;
     
     x[3] = x[3] - speed; 
     x[4] = x[4] - speed;
     x[5] = x[5] - speed;
     
     xr = xr - speed; 
    
}


  else if (key == 'w')
  {
     ye = ye - speed; 
     
     y[0] = y[0] - speed; 
     y[1] = y[1] - speed;
     y[2] = y[2] - speed;
     
     y[3] = y[3] - speed; 
     y[4] = y[4] - speed;
     y[5] = y[5] - speed;
     
     yr = yr - speed; 
    
}

  else if (key == 's')
  {
     ye = ye + speed; 
     
     y[0] = y[0] + speed; 
     y[1] = y[1] + speed;
     y[2] = y[2] + speed;
     
     y[3] = y[3] + speed; 
     y[4] = y[4] + speed;
     y[5] = y[5] + speed;
     
     yr = yr + speed; 
    
}

}
