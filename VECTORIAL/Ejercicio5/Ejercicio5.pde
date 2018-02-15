// Make the parent shape
PShape alien;

// Make two shapes
PShape head;
PShape body;
PShape s;
PShape figure;

float easing = 0.05;
float offset = 0;

void setup(){
size(1082,720);
alien = createShape(GROUP);
head = createShape(ELLIPSE, 0, 0, 50, 50);
head.setFill(color(255,234,120));
body = createShape(RECT, 0, 50, 50, 100);
body.setFill(color(125,125,0));
s = createShape();
  s.beginShape(TRIANGLE_STRIP);
  s.vertex(30, 75);
  s.vertex(40, 20);
  s.vertex(50, 75);
  s.vertex(60, 20);
  s.vertex(70, 75);
  s.vertex(80, 20);
  s.vertex(90, 75);
  s.endShape();

figure = createShape(TRIANGLE, 120, 110, 70, 150, 175, 175);
figure.setFill(color(155,234,120));

alien.addChild(head);
alien.addChild(body);
alien.addChild(s);
alien.addChild(figure);
}

void draw(){
noFill();
// Draw the group
translate(width/2, height/2);

float targetOffset = map(mouseY, 0, width, -80, 40);
offset += (targetOffset - offset) * easing;
  
shape(alien,85+ offset,5);

}