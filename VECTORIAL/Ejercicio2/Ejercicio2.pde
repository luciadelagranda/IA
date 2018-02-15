PShape o;
PShape v;
PShape i;
PShape e;
PShape d;
PShape o2;

void setup() {
  size(640, 360, P2D);

  // First create the shape
  o = createShape();
  v = createShape();
  i = createShape();
  e = createShape();
  d = createShape();
  o2 = createShape();
  o.beginShape();
  v.beginShape();
  i.beginShape();
  e.beginShape();
  d.beginShape();
  o2.beginShape();
  
  // You can set fill and stroke
  o.fill(102);
  o.stroke(255);
  o.strokeWeight(2);
  // Here, we are hardcoding a series of vertices
  o.vertex(0, 0);
  o.vertex(20, 0);
  o.vertex(20, 20);
  o.vertex(0, 20);
  
  v.fill(0);
  v.stroke(255);
  v.strokeWeight(2);
  v.vertex(30,0);
  v.vertex(50,0);
  v.vertex(40,20);
  
  i.fill(0);
  i.stroke(255);
  i.strokeWeight(2);
  i.vertex(65,0);
  i.vertex(60,0);
  i.vertex(60,20);
  i.vertex(65,20);
  
  e.fill(0);
  e.stroke(255);
  e.strokeWeight(2);
  e.vertex(75,0);
  e.vertex(70,0);
  e.vertex(70,20);
  e.vertex(75,20);
  
  e.vertex(75,0);
  e.vertex(85,0);
  e.vertex(85,3);
  e.vertex(75,3);
  
  e.vertex(75,7);
  e.vertex(85,7);
  e.vertex(85,10);
  e.vertex(75,10);
  
  e.vertex(75,15);
  e.vertex(85,15);
  e.vertex(85,20);
  e.vertex(75,20);
  
  d.fill(0);
  d.stroke(255);
  d.strokeWeight(2);
  d.vertex(90,0);
  d.vertex(110,10);
  d.vertex(90,20);
  
 // You can set fill and stroke
  o2.fill(102);
  o2.stroke(255);
  o2.strokeWeight(2);
  // Here, we are hardcoding a series of vertices
  o2.vertex(120, 0);
  o2.vertex(140, 0);
  o2.vertex(140, 20);
  o2.vertex(120, 20);
  
  
  
  o.endShape(CLOSE);
  v.endShape(CLOSE);
  i.endShape(CLOSE);
  e.endShape(CLOSE);
  d.endShape(CLOSE);
  o2.endShape(CLOSE);
}

void draw() {
  background(51);
  // We can use translate to move the PShape
  translate(mouseX, mouseY);
  // Display the shape
  shape(o);
  shape(v);
  shape(i);
  shape(e);
  shape(d);
  shape(o2);
}