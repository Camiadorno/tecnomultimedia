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
  programaPrincipal.clickear(mouseX, mouseY);
}

void keyPressed() {
  programaPrincipal.teclaPresionada();
}
