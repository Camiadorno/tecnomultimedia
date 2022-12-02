class Boton {

  // ------------------- Atributos -------------------

  PFont fuente;
  int x, y, alto, ancho;
  String tipo; 
  int pantalla;
  boolean botonCerrar;

  // ------------------- Constructor -------------------

  Boton(int x, int y, String tipo, boolean botonCerrar) {
    fuente =  createFont("pixelmix.ttf", 16);

    if (botonCerrar) {
      alto = 30;
      ancho = 30;
    } else {
      alto = 40;
      ancho = width/3;
    }

    this.x = x;
    this.y = y;
    this.tipo = tipo;
    this.botonCerrar = botonCerrar;
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    if (colisionaMouse()) {
      fill(1, 72, 160, 200);
    } else {
      fill(0, 111, 128, 200);
    }
    stroke(255);
    rect(x, y, ancho, alto);
    textAlign(CORNER);
    textFont(fuente);
    fill(255);

    if (tipo.equals("Jugar")) {
      text("Jugar", x+90, y+25);
    } else if (tipo.equals("Creditos")) {
      text("Ver creditos", x+50, y+25);
    } else if (tipo.equals("Volver")) {
      text("Volver", x+90, y+25);
    } else if (tipo.equals("X"))
      text ("x", x+10, y+20);
  }


  // ------- Interacciones -------

  // --- Clickear --- 

  boolean colisionaMouse() {
    return (mouseX > x && mouseX < x+ancho && mouseY > y && mouseY < y+alto);
  }

  boolean clickeado(int cursorX, int cursorY) { 
    if (cursorX > x && cursorX < x+ancho) {    
      if (cursorY > y && cursorY < y+alto) {                            // Coordenadas de la posicion de los botones
        return true;
      }
    }
    return false;
  }
}