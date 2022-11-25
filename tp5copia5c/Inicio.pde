class Inicio {

  // ------------------- Atributos -------------------

  PImage fondoInicial;
  PFont fuente;
  Boton botonJugar, botonCreditos;
  ProgramaPrincipal programaPrincipal;

  // ------------------- Constructor -------------------

  Inicio(ProgramaPrincipal _programaPrincipal) {
    fondoInicial = loadImage("fondoinicial.png");
    botonJugar = new Boton(320, "Jugar");
    botonCreditos = new Boton(370, "Creditos");
    programaPrincipal = _programaPrincipal; 
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    image(fondoInicial, 0, 0);
    botonJugar.dibujar();
    botonCreditos.dibujar();
  }
  
  void clickear(int x, int y){
    if (botonCreditos.clickeado(x,y)) {
      programaPrincipal.cambiarPantallaActual(2);
    }
  }
}
