import processing.video.*;

import gab.opencv.*;
import java.awt.Rectangle;

OpenCV opencv;
Rectangle[] faces;
Movie movie;

void setup() {
  movie = new Movie(this, "Riverdale2.mp4");
  size(640, 360);
  movie.play();
  opencv = new OpenCV(this, 640,360);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  if(movie.height <= 0 || movie.width <= 0)
  {
    System.out.println("Ancho o alto menos o igual a 0");
    return;
  } 
  
  image(movie, 0, 0, movie.width, movie.height);
  
  opencv.loadImage(movie);
  faces = opencv.detect();
  
  
  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  for (int i = 0; i < faces.length; i++) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
}