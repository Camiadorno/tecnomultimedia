class JuegoIntro {

  // ------------------- Atributos -------------------

  PImage fondoIntro, mano, pokeball;
  PFont fuente;

  int pokeballX = 122;
  int pokeballY = 136;

  float manoX = 140;
  int manoY = 30;
  int posicion;

  String nombre;
  
  Pokemon charmander;
  Pokemon squirtle;
  Pokemon bulbasaur;

  // ------------------- Constructor -------------------

  JuegoIntro() {
    fondoIntro = loadImage("fondointro.png");
    mano = loadImage("mano.png");
    pokeball= loadImage("pokeball.png");
    fuente = createFont("pixelmix.ttf", 14);
    
    bulbasaur = new Pokemon("BULBASAUR", "aliado");
    charmander = new Pokemon("CHARMANDER", "aliado");
    squirtle = new Pokemon("SQUIRTLE", "aliado");
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    image(fondoIntro, 0, 0);

    for (int i=1; i<4; i++) {                                      // Se dibujan las Pokeballs
      image(pokeball, pokeballX*i*1.2, pokeballY);
    }

    textFont(fuente);                                              // Texto del panel
    textAlign(CORNER);  
    text("Bienvenido entrenador! Estas a punto de tener tu primera \nbatalla. Utiliza las FLECHAS para seleccionar una pokeball. \n\nPara elegir a " + nombre + " presiona ENTER.", 40, 420);

    image(mano, manoX, manoY);                                     // Se dibuja la Mano

    if (posicion == 0) {                                           // Que pokemon es segun la posicion de la mano
      manoX = width/5;
      nombre = "BULBASAUR";
    } else if (posicion == 1) {
      manoX = width/2.4;
      nombre = "CHARMANDER";
    } else if (posicion == 2) {
      manoX = width/1.6;
      nombre = "SQUIRTLE";
    }
  }


  void seleccionarPokemon() {                                     // Mover la Mano 
    if (keyCode == RIGHT) {
      posicion++;
      if (posicion>=3) posicion=0;
    }
    if (keyCode == LEFT) {
      posicion--;
      if (posicion<=-1) posicion=3;
    }
  }
}
