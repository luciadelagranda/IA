PShape s;

void setup() {
  size(640, 360, P2D);

  // Make a shape
  s = createShape();
  s.beginShape();
  s.fill(0);
  s.stroke(255);
  s.strokeWeight(2);
  // Exterior part of shape
  s.vertex(-100,-100);
  s.vertex(100,-100);
  s.vertex(100,100);
  s.vertex(-100,100);
  
  // Interior part of shape
  s.beginContour();
  s.vertex(-10,-10);
  s.vertex(-10,10);
  s.vertex(10,10);
  s.vertex(10,-10);
  s.endContour();
  
  s.beginContour();
  s.vertex(0, -50);
  s.vertex(14, -20);
  s.vertex(47, -15);
  s.vertex(23, 7);
  s.vertex(29, 40);
  s.vertex(0, 25);
  s.vertex(-29, 40);
  s.vertex(-23, 7);
  s.vertex(-47, -15);
  s.vertex(-14, -20);
  s.endContour();
  
  s.beginContour();
  s.vertex(30, 75);
  s.vertex(40, 20);
  s.vertex(50, 75);
  s.vertex(60, 20);
  s.vertex(70, 75);
  s.vertex(80, 20);
  s.vertex(90, 75);
  s.endContour();
  
  s.beginContour();
  s.vertex(-50, 75);
  s.vertex(-40, 20);
  s.vertex(-67, 75);
  s.endContour();
  
  s.beginContour();
  s.vertex(40, -41);
  s.vertex(55, -19);
  s.vertex(67, -30);
  s.vertex(100, -5);
  s.vertex(100, -15);
  s.vertex(60, -42);
  s.vertex(65, -50);
  s.endContour();
  
  // Finishing off shape
  s.endShape(CLOSE);
}

void draw() {
  background(52);
  // Display shape
  translate(width/2, height/2);
  // Shapes can be rotated
  s.rotate(0.01);
  shape(s);
}