
import processing.video.*;
import ddf.minim.*;

Movie movie;

String videoAleatorio;
String audioAleatorio;
int numeroVideoAleatorio;
int numeroAudioAleatorio;
String[] videos;
String[] audios;
boolean isVideo;
int cont;
Minim minim;
AudioPlayer player;
boolean contestado=false;


void setup() {
  size(640, 360);
  background(0);
  isVideo=false;
  audios= new String[2];
  audios[0]= "pa.mp3";
  audios[1]= "fa.mp3";
  videos= new String[2];
  videos[0]= "pa.mp4";
  videos[1]= "fa.mp4";
  minim = new Minim (this);
  player = minim.loadFile("pa.mp3");
  movie = new Movie(this,"fa.mp4");
  cont=0;
}

void keyPressed(){
  if(key == 'p'){
    if(movie.duration() == movie.time() || cont==0){
    videoAleatorio=generarVideo();
    audioAleatorio=generarAudio();
    movie = new Movie(this, videoAleatorio);
    player = minim.loadFile(audioAleatorio);
    movie.play();
    player.play();
    cont++;
    contestado=false;
    }
    else{
      System.out.println("No ha finalizado el video");
    }
  }
  
  if(key=='s'){
    if(!contestado){
    if(numeroVideoAleatorio==numeroAudioAleatorio){
      System.out.println("Has acertado");
    }
    else{
      System.out.println("Has fallado");
  }
  contestado=true;
}
  else{
    System.out.println("Ya has contestado, prueba otra vez pulsando (p)");
  }

}
  
  if(key=='n'){
    if(!isContestado()){
    if(numeroVideoAleatorio!=numeroAudioAleatorio){
      System.out.println("Has acertado");
    }
    else{
      System.out.println("Has fallado");
  }
  contestado=true;
    }
    else{
    System.out.println("Ya has contestado, prueba otra vez pulsando (p)");
  }
}
  
}

boolean isContestado(){
  return contestado;

}

void movieEvent(Movie m) {
  m.read();
}

String generarVideo(){
  numeroVideoAleatorio= int(random(2));
  System.out.println("El video es: " + numeroVideoAleatorio);
  return videos[numeroVideoAleatorio];
}

String generarAudio(){
  numeroAudioAleatorio= int(random(2));
  System.out.println("El audio es: " + numeroAudioAleatorio);
  return audios[numeroAudioAleatorio];
}

void draw() {
    image(movie, 0, 0, width, height);
  
}
