// A list of objects
ArrayList<Polygon> polygons;

// Three possible shapes
PShape[] shapes = new PShape[5];

void setup() {
  size(640, 360, P2D);
  
  shapes[0] = createShape(ELLIPSE,0,0,100,100);
  shapes[0].setFill(color(255, 127));
  shapes[0].setStroke(false);
  shapes[1] = createShape(RECT,0,0,100,100);
  shapes[1].setFill(color(255, 127));
  shapes[1].setStroke(false);
  shapes[2] = createShape();  
  shapes[2].beginShape();
  shapes[2].fill(random(0,100), 127);
  shapes[2].noStroke();
  shapes[2].vertex(0, -50);
  shapes[2].vertex(14, -20);
  shapes[2].vertex(47, -15);
  shapes[2].vertex(23, 7);
  shapes[2].vertex(29, 40);
  shapes[2].vertex(0, 25);
  shapes[2].vertex(-29, 40);
  shapes[2].vertex(-23, 7);
  shapes[2].vertex(-47, -15);
  shapes[2].vertex(-14, -20);
  shapes[2].endShape(CLOSE);
  
  shapes[3] = createShape();
  shapes[3].beginShape();
  shapes[3].fill(random(0,100), 127);
  shapes[3].noStroke();
  shapes[3].vertex(180, 82);
  shapes[3].vertex(207, 36);
  shapes[3].vertex(214, 63);
  shapes[3]. vertex(407, 11);
  shapes[3].vertex(412, 30);
  shapes[3].vertex(219, 82);
  shapes[3].vertex(226, 109);
  shapes[3].endShape(CLOSE);
  
  shapes[4] = createShape();
  shapes[4].beginShape();
  shapes[4].fill(random(0,100), 127);
  shapes[4].noStroke();
  shapes[4].vertex(38, 23);
  shapes[4].vertex(46, 23);
  shapes[4].vertex(46, 31);
  shapes[4].vertex(54, 31);
  shapes[4].vertex(54, 38);
  shapes[4].vertex(61, 38);
  shapes[4].vertex(61, 46);
  shapes[4].vertex(69, 46);
  shapes[4].vertex(69, 54);
  shapes[4].vertex(61, 54);
  shapes[4].vertex(61, 61);
  shapes[4].vertex(54, 61);
  shapes[4].vertex(54, 69);
  shapes[4].vertex(46, 69);
  shapes[4].vertex(46, 77);
  shapes[4].vertex(38, 77);
  shapes[4].endShape(CLOSE);

  // Make an ArrayList
  polygons = new ArrayList<Polygon>();
  
  for (int i = 0; i < 25; i++) {
    int selection = int(random(shapes.length));        // Pick a random index
    Polygon p = new Polygon(shapes[selection]);        // Use corresponding PShape to create Polygon
    polygons.add(p);
  }
}

void draw() {
  background(102);

  // Display and move them all
  for (Polygon poly : polygons) {
    poly.display();
    poly.move();
  }
}