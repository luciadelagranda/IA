float oldMouseX,oldMouseY;



color paleta[] = {

      color(0),

      color(255),

      color(255,0,0),

      color(0,255,0),

      color(0,0,255)

    };

    

int colorActual=0;    
int grosor;



void setup() {

  //fullScreen();

  size(800,600);

  background(color(128,128,255));

  oldMouseX=mouseX;

  oldMouseY=mouseY;
  
  grosor=5;
  
  
  fill(128,128,255);
  
}



void draw() {
  fill(128,128,255);
  //oldMouseX=(oldMouseX==0)?mouseX:oldMouseX;

  //oldMouseY=(oldMouseY==0)?mouseY:oldMouseY;
  noStroke();
  
  rect(0,0,800,150);
  
  fill(paleta[colorActual]);
  rect(680,50,58,58);
  
  stroke(paleta[0]);
  ellipse(80,75,grosor,grosor);
  
  
  
  
  if (mousePressed && mouseButton==LEFT) {

    strokeWeight(grosor);
    
    stroke(paleta[colorActual]);

    line(oldMouseX,oldMouseY,mouseX,mouseY);

  }

  oldMouseX=mouseX;

  oldMouseY=mouseY;
  
  
}



void keyPressed () {

  if (key=='+') {
    if(grosor>=0 && grosor<20){
      grosor+=5;
      strokeWeight(grosor);
    }
    
  } else if (key=='-') {

    // Disminuir el grosor del trazo
    if(grosor>0 && grosor<=20){
      grosor-=5;
      strokeWeight(grosor);
    }

  } else if (keyCode==RIGHT) {

    // Cambiar al color de la derecha
    if(colorActual>=0 && colorActual<paleta.length-1){
      colorActual+=1;
      stroke(paleta[colorActual]);
    }
    

  } else if (keyCode==LEFT) {
    // Cambiar al color de la izquierda
    if(colorActual>0 && colorActual<paleta.length){
      colorActual-=1;
      stroke(paleta[colorActual]);
    }

  } else if (keyCode==CONTROL) {

    // Salvar la imagen

    saveFrame("dibujo.png");

  }

}
  
  
  