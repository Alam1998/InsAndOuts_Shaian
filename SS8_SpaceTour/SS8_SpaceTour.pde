// Shaian Khan, title: SS8_SpaceTour. 

//  Changed the look for the spaceship.

// Added Laser shooting. Press the Space bar to shoot laser beam.

// The spaceship can interact with the portal & the moon.

// Added a game over and a game win conditions.

// Added one enemy. If the player gets hit by the enemy it triggers the game over state. And if the player shoots the enemy it triggers the game win state.   

// Added a restart function to start the program over without termination. 

// Press the R key to call the restart function.

// Added a full movement control for the spaceship using WASD keys.  

// Press W & S keys to move the spaceship up and down. Press A & D keys to move it left and right. 

// Reference for the space background: https://processing.org/examples/doublerandom.html

// Roll over response: Drag the mouse pointer over the spaceship to activate the different scene.

// Added two background images: space.jpg & world.jpg

// Added a text: SpaceTour.

// Added a timed event using millis().

// Added arrays.

// Font type: MVBoli-48.vlw .

// Added some additional changes.

// Added potentiometer functions.

// Spin the potentiometer at different range to change the size and color of the portal.



import processing.serial.*; //imports Serial library from Processing

Serial myPort;
int val=0; 


int dots = 500;
float stars = dots + 1;

float xe=280; 

float ye=260; 

float[] x= {285, 250, 250, 250, 200, 200}; // Created an array. To Moves the ship Left-Right Horizontally.

float[] y= {260, 230, 290, 275, 275, 230}; // To Move the ship UP-Down Vertically.

float targetX = xe+20;
float targetY = ye+20;

boolean laseron=false;

float laserX = 2;
float laserY = 20;

int h = 500;
int g = 100;
int dy = 5;

int j = 75;
int k = 75;
int l = 28;

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

float gr=28;

float speed=50;

int portalH;
int portalW;


int circleX, circleY; 
float circleSize = 100;


color circleColor;
color baseColor;

boolean wingame = false;
boolean gameover = false;
boolean moon = false;
boolean circleOver = false;



PImage background;
PImage img;

PImage img2;
PImage img3;

PImage img4;

PFont font1;
  
void setup() {
  
  restart();
  size(840, 720);
  font1 = loadFont("MVBoli-48.vlw");
  
  background = loadImage("space.jpg");
  
  img = loadImage("world.jpg");
  img2 = loadImage("explosion.jpg");
  img3 = loadImage("planetwin.jpg");
  img4 = loadImage("moon.jpg");
  stroke(255);
    smooth();
  frameRate(30);
  

  
  portalH = 655;
  portalW = 1300;
   
  circleColor = color(#FCE0C2);
  baseColor = color(0);
  circleX = 74;
  circleY = 75;
  ellipseMode(CENTER);
  
  
    printArray(Serial.list()); // this line prints the port list to the console
  String portName = Serial.list()[0]; //change the number in the [] for the port you need
  myPort = new Serial(this, portName, 9600);
  
} 

void draw() {
  if (gameover)
  {
    image(img2, 0, 0); 
  }
  else if (wingame)
  {
    image(img3, 0, 0); 
  }
  else if (moon)
  {
    image(img4, 0, 0); 
  }
  else  {
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
      textFont(font1, 24);
    textSize(100);
    fill(#C9C9C9);
    text("SpaceTour", 170, 470);
    }
    else if( myPort.available() > 0) {

  enemy();
   val = myPort.read();

    deadstate();
    }

    if (val > 50 && val < 100) {
image(background, 0, 0);
  fill(#7C000A);
  stroke(#F00080);
  ellipse (width/2, height/2, 28, val);
  println (val);
    enemy();
      deadstate();
    }
    
      else if (val > 100 && val < 150) {
image(background, 0, 0);
  fill(#F00080);
  stroke(#7C000A);
  ellipse (width/2, height/2, 28, val);
  println (val);
    enemy();
      deadstate();
    }
    
    
       else if (val > 150 && val < 200) {
image(background, 0, 0);
  fill(#3B00F0);
  stroke(#F00080);
  ellipse (width/2, height/2, 28, val);
  println (val);
    enemy();
      deadstate();
    }
    
          else if (val > 200 && val < 255) {
image(background, 0, 0);
  fill(#5FF000);
  stroke(#3B00F0);
  ellipse (width/2, height/2, 28, val);
  println (val);
    enemy();
      deadstate();
    }
    
          else if (val > 150) {
image(background, 0, 0);
  fill(#F04400);
  stroke(#5FF000);
  ellipse (width/2, height/2, 28, val);
  println (val);
    enemy();
      deadstate();
    }
    
          else if (val < 150) {
image(background, 0, 0);
  fill(#DBF000);
  stroke(#F04400);
  ellipse (width/2, height/2, 28, val);
  println (val);
    enemy();
      deadstate();
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

  
  }
}


class Star {
  float x; 
  float y;
  float alpha;
  float diameter;
  float speed = random(180, 180);
  float descentX;


  
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
  if( overCircle(xe, ye, circleSize) ) {
    circleOver = true;
  }  
 else {
    circleOver = false;
  }
}


boolean overCircle(float x, float y, float diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
  
void Spaceship() {  
 
  stroke(#504F5A);
  fill   (#9F9DAF);
  ellipse(xe, ye, 60, 40);    //spaceship head  
  
targetX = xe+12;
targetY = laserY;
laser();
  
  stroke(#504F5A);
  fill   (#00044D);
triangle(x[0], y[0], x[1], y[1], x[2], y[2]); //spaceship wings.

  stroke(#504F5A);
  fill   (#343655);
triangle(x[3], y[3], x[4], y[4], x[5], y[5]); //spaceship back
  
  stroke(#504F5A);
  fill    (#00022C);
  rect    (xr, yr, 72, 40); //spaceship body
  

}

 void enemy() {
     fill    (255);
   rect(h, g, j, k, l);
  g += dy;
  if(g+25 > height || g-25 < 0) {
    dy *= -1;
  }
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

else if (key == ' ')
{
laseron=true;
laserX = targetX+2;
laserY = ye;
}

else if (key == 'r')
{
 restart(); 
}

}


void laser() {
if (laseron) {
stroke(#F01111);
  rect(laserX, laserY, 1, 2);
  laserX = laserX+1;
}
}

void deadstate()
{
  
  if (xe>=(width-8) || ye>=(height-8) || xe<=0 || ye<=0)
  {
  gameover=true;
  }
  if (dist(xe,ye,h,g) <70)
  {
  gameover=true;
  }
  
  else if (dist(laserX,laserY,h,g) <70)
  {
  wingame=true;
  

  }
    else if (dist(xr,yr,circleX,circleY) <70)
  {
  moon=true;
  

  }
}

void restart()
{ 
  
 dots = 150;
 stars = dots + 1;

 xe=280; 

 ye=260; 

 x[0]= 285;
 x[1]= 250;
 x[2]= 250;
 x[3]= 250;
 x[4]= 200;
 x[5]= 200;
 
 y[0]= 260;
 y[1]= 230;
 y[2]= 290;
 y[3]= 275;
 y[4]= 275;
 y[5]= 230;
 
 xr=216;
 yr=240;

 h = 500;
 g = 100;
 dy = 5;
 
j = 75;
k = 75;



 speed=50;
 
 
 font1 = loadFont("MVBoli-48.vlw");
  
 background = loadImage("space.jpg");
  
 img = loadImage("world.jpg");
  
  
  stroke(255);
  smooth();
  frameRate(30);
  
  
  
  portalH = 55;
  portalW = 90;
   
  circleColor = color(#FCE0C2);
  baseColor = color(0);
  circleX = 74;
  circleY = 75;
  ellipseMode(CENTER);


  gameover=false;
  wingame=false;
  moon=false;

}
