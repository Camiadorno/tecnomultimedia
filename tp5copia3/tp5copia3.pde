ProgramaPrincipal programaPrincipal;

void setup() {
  size(700, 500);
  programaPrincipal = new ProgramaPrincipal();
}

void draw() {
  background(255); 
  programaPrincipal.dibujar();
} 

void mouseClicked() {
  programaPrincipal.click();
}

void keyPressed() {
  programaPrincipal.teclapresionada();
}
