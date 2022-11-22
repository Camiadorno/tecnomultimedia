class Boton {

  // ------------------- Atributos -------------------

  PFont fuente;
  int x, y, alto, ancho;
  String tipo; 
  String pantalla;

  // ------------------- Constructor -------------------

  Boton(int y, String tipo) {
    fuente =  createFont("pixelmix.ttf", 16);
    alto = 40;
    ancho = width/3;
    x = width/3;
    this.y = y;
    this.tipo = tipo;
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    if (this.colisionaMouse()) {
      fill(1, 72, 160, 200);
    } else {
      fill(0, 111, 128, 200);
    }
    stroke(255);
    rect(x, this.y, ancho, alto); 
    textFont(fuente);
    fill(255);
    if (this.tipo.equals("Jugar")) {
      text("Jugar", x+90, y+25);
    } else if (this.tipo.equals("Creditos")) {
      text("Ver creditos", x+50, y+25);
    } else if (this.tipo.equals("Volver")) 
      text("Volver", x+120, y+25);
  }

  // ------- Interacciones -------

  // --- Clickear --- 

  void clickear(ProgramaPrincipal programaPrincipal) {
    if (pantalla == "Inicio") {
      this.mostrarInicio(programaPrincipal);
    } else if (pantalla == "Juego") {
      this.mostrarJuego(programaPrincipal);
    } else if (pantalla == "Creditos") {
      this.mostrarCreditos(programaPrincipal);
    }
  }

  void intentarClick(ProgramaPrincipal programaPrincipal) {
    if (colisionaMouse()) {
      this.clickear(programaPrincipal);
    }
  }

  boolean colisionaMouse() { 
    return mouseX > x && mouseX < x+ancho && mouseY > y && mouseY < y+alto;          // Coordenadas de la posicion de los botones
  }

  // --- Mostrar las pantallas --- 

  void mostrarInicio(ProgramaPrincipal programaPrincipal) {
    programaPrincipal.cambiarPantallaActual("Inicio");
  }

  void mostrarJuego(ProgramaPrincipal programaPrincipal) {
    programaPrincipal.cambiarPantallaActual("Juego");
  }

  void mostrarCreditos(ProgramaPrincipal programaPrincipal) {
    programaPrincipal.cambiarPantallaActual("Creditos");
  }
}
