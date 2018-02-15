File dir;  //<>//
File [] files;
int x=0;
int y=0;
int indicePrincipal=0;
int imagenMostrar= 0;

PImage imagenCentral;

PImage[] fotos;

boolean ready=false;
boolean avance=false;
boolean retroceso=false;
boolean modoPresentacion= false;
 
void setup() {
  size(800,600);
  background(color(0,0,0));
  selectFolder("Select a folder to process:", "folderSelected");
}

void folderSelected(File selection) {
  
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    // Aquí tendrías que procesar el directorio para hacer con el listado de ficheros
    procesarFicheros(selection.getAbsolutePath());
  }
}

void procesarFicheros(String absolutePath) {
  dir= new File(dataPath(absolutePath));
  files= dir.listFiles();

  int count=0;
  for (int i = 0; i <= files.length - 1; i++) {
      String path = files[i].getAbsolutePath();
      if (path.toLowerCase().endsWith("jpg")) 
        count++;
  }

  fotos=new PImage[count];
  
  for (int i = 0; i <= files.length - 1; i++) {
      String path = files[i].getAbsolutePath();
      if (path.toLowerCase().endsWith("jpg")) {
        println(path);
        fotos[i]=loadImage(path);
      }
    } 
  ready=true;
}

void draw() {
  imageMode(CORNER);
  
  if(ready){
    pintar();
    pintarBorde(10);
    showImagenCentral();
  }
    if(avance){
      moverDerecha();
      showImagenCentral();
      pintarBorde(10);
      avance=false;
    }
    if(retroceso){
      moverIzquierda();
      showImagenCentral();
      pintarBorde(10);
      retroceso=false;
    }
    
   if(modoPresentacion){
     next();
   }
  }
  
  
void showImagenCentral(){
  if(indicePrincipal== fotos.length - 1)
    imagenMostrar=0;
  else 
    imagenMostrar= indicePrincipal +1;
   
   imagenCentral = fotos[imagenMostrar];
   image(fotos[imagenMostrar],800/5.8,600/2.5, width/1.5, height/2);
}


void pintarBorde(int frameSize){
  noFill();
  int colorBorde = color(255,0,0);
  
  strokeWeight(frameSize);
  stroke(colorBorde);
  x=0;
  rect(800/3,0,width/3,height/3);

}
  
void pintar(){
   int cont=0;
   for (int i = indicePrincipal; cont < 3 ; i++) {
      image(fotos[i],x,y, width/3 ,height/3 );
      x= x + width/3;
      cont++;
   }
   ready=false;
   x=0;
}

void moverDerecha(){
  int cont=0;
  x=0;
  for (int i = indicePrincipal; cont < 3 ; i++) {
      if(i > fotos.length -1){
          i=0;
      }
      image(fotos[i],x,y, width/3 ,height/3 );
      x= x + width/3;
      cont++;
   }
}

void moverIzquierda(){
  int cont=0;
  x=800-width/3;
  int aux=-1;
  
  for (int i = indicePrincipal; cont <= 2 ; i--) {
    if(i<0){
      i= fotos.length -1;
      indicePrincipal= i-1;
    }
    else if(i==fotos.length){
      i=0;
      indicePrincipal= fotos.length -1;
    }
      image(fotos[i],x,y, width/3 ,height/3 );
      x= x - width/3;
      cont++;
      aux=i;
   }
   indicePrincipal=aux;
   ready=false;
  
}
  
void keyPressed()
  {
      
    if(keyCode == RIGHT)
    {
        indicePrincipal++;
        //System.out.println("Indice pasará a la derch: " + indicePrincipal);
        indicePrincipal=(indicePrincipal > fotos.length -1)? 0: indicePrincipal;
        avance=true;
    }
    
    if(keyCode == LEFT)
    {
        indicePrincipal++;
        //System.out.println("Indice pasará a la izq: " + indicePrincipal);
        indicePrincipal=(indicePrincipal-1 >= 0) ? indicePrincipal : fotos.length -1;
        retroceso=true;
    }
    
    if(key == 'b'){
      
      blueFiltro();
      image(imagenCentral,800/5.8,600/2.5, width/1.5, height/2);
    }
    
    if(key== 'n'){
      noFiltro();
      image(imagenCentral,800/5.8,600/2.5, width/1.5, height/2);
    }
    
    if(key == 'p'){
      
      pinkFiltro();
      image(imagenCentral,800/5.8,600/2.5, width/1.5, height/2);
    }
    
    if(key=='c'){
      System.out.println("Modo presentacion activado");
      modoPresentacion= true;
    }
    
    if(key=='s'){
      System.out.println("Modo presentacion desactivado");
      modoPresentacion= false;
    }
    

}
    
void blueFiltro() {
  tint(0,153,204);
}

void noFiltro() {
  tint(255,255,255);
}

void pinkFiltro() {
  tint(247, 191, 190);
}

void next(){
  indicePrincipal++;
  indicePrincipal=(indicePrincipal > fotos.length -1)? 0: indicePrincipal;
  moverDerecha();
  showImagenCentral();
  pintarBorde(10);
  avance=false;
  delay(3000);

}