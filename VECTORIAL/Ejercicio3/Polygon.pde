// A class to describe a Polygon (with a PShape)

class Polygon {
  // The PShape object
  PShape s;
  // The location where we will draw the shape
  float x, y;
  // Variable for simple motion
  float speedY;
  float speedX;

  Polygon(PShape s_) {
    x = random(width);
    y = random(-500, -100); 
    s = s_;
    speedY = random(2, 6);
    speedX = random(2, 6);
  }
  
  // Simple motion
  void move() {
    x+=speedX;
    y+=speedY;
    if (y > height+100) {
      x = -100;
      y = -100;
    }
  }
  
  // Draw the object
  void display() {
    pushMatrix();
    translate(x, y);
    shape(s);
    popMatrix();
  }
}