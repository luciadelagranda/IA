// Robot 4: Media from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010


PShape bot1;PShape bot2;
PShape bot3;
PImage landscape;

float easing = 0.05;
float offset = 0;

void setup() {
  size(720, 480);
  bot1 = loadShape("robot1.svg");
  bot2 = loadShape("robot2.svg");
  bot3 = loadShape("robot3.svg");
  landscape = loadImage("galaxia.jpg");
  smooth();
}

void draw() {
  // Set the background to the "landscape" image, this image
  // must be the same width and height as the program
  background(landscape);
  
  // Set the left/right offset and apply easing to make
  // the transition smooth
  float targetOffset = map(mouseX, 0, width, -80, 40);
  offset += (targetOffset - offset) * easing;
  
  // Draw the left robot
  float smallerOffset = offset * 0.3;
  shape(bot1, 85 + smallerOffset, 5+offset);
  
  shape(bot2, 510 - offset, 40);
  
  // Draw the smallest robot, give it a smaller offset
  smallerOffset *= -0.25;
  shape(bot3, 410 - smallerOffset, 225, 39, 124);
}