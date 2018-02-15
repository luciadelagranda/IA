
/**
 * PrimitivePShape. 
 * 
 * Using a PShape to display a custom polygon. 
 */

// The PShape object
int[] figuras;
PShape figura;

void setup() {
  size(640, 360, P2D);
  
  figuras = new int[3];
  
  figuras[0]= ELLIPSE;
  figuras[1]= RECT;
  figuras[2]= TRIANGLE;
  
  // First create the shape
  int aux = (int) random(0,3);
  System.out.println("Random elegido:" + aux);
  if(aux==0){
    figura = createShape(RECT, 0, 0, 50, 50);
 
  }
  else if(aux==1){
    figura = createShape(ELLIPSE,50, 50,60,60);

  }
   else if(aux==2){
    figura = createShape(TRIANGLE,0,0,50,50,40,20);

  }
}

void draw() {
  background(51);
  // We can use translate to move the PShape
  translate(mouseX, mouseY);
  // Display the shape
  shape(figura);
  figura.setStroke(color(255));  
  figura.setStrokeWeight(4);
  float R = map(mouseX, 0, width, 0, 0);
  float G = map(mouseX, 0, width, 0, 191);
  float B = map(mouseX, 0, width, 0, 190);
  figura.setFill(color(R,G,B));
}