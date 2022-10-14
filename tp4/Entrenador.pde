class Entrenador {
  String nombre; 
  PImage trainer; 
  int posX, posY;
  Pokemon pokemon;

  Entrenador(String name, Pokemon poke) {
    posX = 700;
    posY = 100;
    nombre = name;
    pokemon = poke;
    trainer = loadImage("trainer.png");
  }

  void aparecer() {
    if (posX > 20) {
      posX -= 10;
    }
    image(trainer, posX, posY);
  }
}
