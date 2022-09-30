class Entrenador {
  // ------------------- Atributos -------------------
  String nombre; 
  PImage trainer, trainer0, trainer1, trainer2, trainer3;
  int posX, posY;
  Pokemon pokemon;
  Pokeball pokeball;

  // ------------------- Constructor -------------------
  Entrenador(String name, Pokemon poke, Pokeball pokebola) {
    posY = 100;
    posX = 700;
    nombre = name;
    pokemon = poke;
    pokeball = pokebola;
    trainer = loadImage("trainer.png");
    trainer0 = trainer;
    trainer1 = loadImage("trainer1.png");
    trainer2 = loadImage("trainer2.png");
    trainer3 = loadImage("trainer3.png");
  }

  // ------------------- Metodos -------------------
  // --- Get & Set
  int getPosX(){
    return posX;
  }

  // --- Otros Metodos
  void atrapar(int count){                       // Animacion con el contador 
    if (count == 0){
      trainer = trainer1;
    } else if(count == 15){
      trainer = trainer2;
    } else if (count == 30){
      trainer = trainer3;
    } else if (count == 45){
      trainer = trainer0;
    }else if (count > 45){
      pokeball.capturar(magikarp);
    }
  }
  
  void dibujar() {
    if (posX > 20) {                           // Movimiento entrenador
      posX -= 10;
    }
    image(trainer, posX, posY);
  }
}
