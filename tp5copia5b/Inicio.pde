class Inicio {

  // ------------------- Atributos -------------------

  PImage fondoInicial;
  PFont fuente;
  Boton botonJugar, botonCreditos;

  // ------------------- Constructor -------------------

  Inicio() {
    fondoInicial = loadImage("fondoinicial.png");
    botonJugar = new Boton(320, "Jugar");
    botonCreditos = new Boton(370, "Creditos");
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    image(fondoInicial, 0, 0);
    botonJugar.dibujar();
    botonCreditos.dibujar();
  }
}
