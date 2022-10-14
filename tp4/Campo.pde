class Campo {
  PImage fondo;
  Entrenador entrenador;
  Pokemon charmander;
  Pokemon magikarp;

  Campo() {
    fondo = loadImage("fondo.png");

    magikarp = new Pokemon("MAGIKARP", "Agua");
    charmander = new Pokemon("CHARMANDER", "Fuego");

    entrenador = new Entrenador("Cami", charmander);
  }
  
  void dibujar() {
    image(fondo, 0, 0);
    entrenador.aparecer();
    charmander.aparecer();
    magikarp.aparecer();
  }
}
