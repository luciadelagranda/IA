import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

float xPelota = 70;
float yPelota = 100;
float xspeed;
float yspeed;
color c = color(0,0,255);
int cont;
int anchoPantalla=200;
int altoPantalla = 200;
float xPala= anchoPantalla/2;
float yPala= altoPantalla-30;
int contFallos;
boolean parar=true;
String text;
boolean primero=true;

int nuevoAnchoPantalla= 200;
int nuevoAltoPantalla = 200;

Minim minim;
AudioPlayer player;

void setup() {
  size(200,200);
  surface.setResizable(true);
  smooth();
  background(255);
  xspeed = random(1,5);
  yspeed = random(1,5);
  cont=0;
  xPelota= random(1,nuevoAnchoPantalla-1);
  yPelota= random(1,nuevoAltoPantalla/2);
  
}

void draw() {
  
  if(!parar){
     noStroke();
     fill(255);
     dibujarPelota();
     dibujarPala();
     dibujarMarcador();
  
  if(xPelota >= xPala && xPelota <= xPala + 50 && yPelota >= yPala && yPelota <= yPala + 10){
    xspeed = -xspeed;
    yspeed = -yspeed;
    cont++;
    noStroke();
    fill(255,255,000);
    float diamHit = random(40,50);
    ellipse(xPala+20,yPala,diamHit,diamHit);
  }
  
  if(yPelota > height+50){
     System.out.println("Has perdido");
     xPelota= random(1,nuevoAnchoPantalla-1);
     yPelota= random(1,nuevoAltoPantalla/2);
     contFallos--;
     if(contFallos==0){
       finalizarPartida();
       minim.stop();
     }
     clear();
     setup();
    
  }
  
  
  if(cont==5){
    xspeed += (xspeed*50)/100;
    yspeed += (yspeed*50)/100;
    cont=0;
  }
  }
  if(parar){
  if(!primero){
  textSize(18);
  fill(255, 0, 0);
  text= "Has perdido todas las vidas - Pulsa J para volver a jugar";
  text(text,10,altoPantalla/3,200,80);
  }
  else{
     textSize(18);
    fill(255, 0, 0);
    text= "PONG-INFORMÁTICA AUDIOVISUAL";
    text(text,10,altoPantalla/3,200,80);
    String text2= "Pulse 'J' para empezar";
    text(text2,5,altoPantalla/1.5,200,80);
  }
  }
  
  
  if(nuevoAnchoPantalla != width ){
    nuevoAnchoPantalla= width;
    xspeed= (xspeed*width)/anchoPantalla;
    xPala= nuevoAnchoPantalla/2;
   
  }
   if(nuevoAltoPantalla != height){
    nuevoAltoPantalla= height;
    yspeed= (yspeed*height)/altoPantalla);
    yPala= nuevoAltoPantalla-30;
  }
  
  
  
}

void comprobarFuera(){
  if(xPelota>nuevoAnchoPantalla || yPelota<nuevoAltoPantalla){
     xPelota= random(1,nuevoAnchoPantalla-1);
     yPelota= random(1,nuevoAltoPantalla/2);
  }
}

void dibujarPelota(){
  rect(0,0,width,height);
  // Add the current speed to the location.
  xPelota = xPelota + xspeed;
  yPelota = yPelota + yspeed;
  stroke(0);
  fill(120);
  // Check for bouncing
  if ((xPelota > width) || (xPelota < 0)) {
    xspeed = xspeed * -1;
    noFill();
    fill(247, 191, 190);
    ellipse(xPelota,yPelota,50,50);
  }
  if ((yPelota < 0)) {
    yspeed = yspeed * -1;
    noFill();
    fill(247, 191, 190);
    ellipse(xPelota,yPelota,50,50);
  }
  // Display at x,y location
  ellipse(xPelota,yPelota,16,16);
}

void dibujarPala(){
  fill(c);
  rect(xPala,yPala,50,10);
}

void keyPressed(){
  if(key =='j'){
    if(parar){
      contFallos=5;
      parar=false;
      primero=false;
      clear();
      setup();
       minim = new Minim (this);
  player = minim.loadFile("cancion.mp3");
  player.play();
    }
  }
}

void mouseMoved(){
  if(mouseX > xPala)
    xPala = pmouseX;
  else 
    xPala = pmouseX;
}
void dibujarMarcador(){
  textSize(32);
  fill(0, 102, 153);
  text(contFallos,nuevoAnchoPantalla-30, 30);
}


void finalizarPartida(){
  parar=true;
}