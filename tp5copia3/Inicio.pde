class Inicio {
  PImage fondoInicial;
  PFont fuente;
  Boton botonJugar, botonCreditos;

  Inicio() {
    fondoInicial = loadImage("fondoinicial.png");
    botonJugar = new Boton(320, "Jugar");
    botonCreditos = new Boton(370, "Creditos");
  }

  void dibujar() {
    image(fondoInicial, 0, 0);
    botonJugar.dibujar();
    botonCreditos.dibujar();
  }
}
