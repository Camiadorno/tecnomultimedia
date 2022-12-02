//import processing.sound.*;
//SoundFile sonido;

ProgramaPrincipal programaPrincipal;


void setup() {
  size(700, 500);
  programaPrincipal = new ProgramaPrincipal();
 // sonido = new SoundFile(this, "pokemonBatalla.mp3");
 // sonido.play();
}

void draw() {
  background(255); 
  programaPrincipal.dibujar();
  
}

void mouseClicked() {
  programaPrincipal.clickear(mouseX, mouseY);
}

void keyPressed() {
  programaPrincipal.teclaPresionada();
}
