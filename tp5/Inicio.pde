class Inicio {

  // ------------------- Atributos -------------------

  PImage fondoInicial;
  PFont fuente;
  
  Boton botonJugar, botonCreditos;
  ProgramaPrincipal programaPrincipal;

  // ------------------- Constructor -------------------

  Inicio(ProgramaPrincipal programaPrincipal) {
    fondoInicial = loadImage("fondoinicial.png");
    botonJugar = new Boton(width/3, 320, "Jugar", false);
    botonCreditos = new Boton(width/3, 370, "Creditos", false);
    this.programaPrincipal = programaPrincipal;
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    image(fondoInicial, 0, 0);
    botonJugar.dibujar();
    botonCreditos.dibujar();
  }

  void clickear(int x, int y) {
    if (botonCreditos.clickeado(x, y)) {
      programaPrincipal.cambiarPantallaActual(2);
    } else if (botonJugar.clickeado(x, y)) {
      programaPrincipal.cambiarPantallaActual(1);
    }
  }
}
