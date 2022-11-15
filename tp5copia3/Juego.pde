class Juego {
  PImage fondoIntro, fondoBatalla, mano, pokeball;

  int pokeballX = 122;
  int pokeballY = 136;

  int manoX = 140;
  int manoY = 30;
  int posicion;

  PFont fuente;
  String nombrePokemon;
  
  boolean batalla = false;

  Juego() {
    fondoIntro = loadImage("fondointro.png");
    fondoBatalla = loadImage("fondobatalla.png");
    mano = loadImage("mano.png");
    pokeball= loadImage("pokeball.png");
    fuente = createFont("pixelmix.ttf", 14);
  }

  void dibujar() {
    image(fondoIntro, 0, 0);

    for (int i=1; i<4; i++) {                                      // Se dibujan las Pokeballs
      image(pokeball, pokeballX*i*1.2, pokeballY);
    }

    textFont(fuente);                                              // Texto del panel
    textAlign(CORNER);  
    text("Bienvenido entrenador! Estas a punto de tener tu primera \nbatalla. Utiliza las FLECHAS para seleccionar una pokeball. \n\nPara elegir a " + nombrePokemon + " presiona ENTER.", 40, 420);
    
    image(mano, manoX, manoY);                                     // Se dibuja la Mano

    if (posicion == 0) {                                           // Que pokemon es segun la posicion de la mano
      manoX = 140;
      nombrePokemon = "BULBASAUR";
    }
    if (posicion == 1) {
      manoX = 292;
      nombrePokemon = "CHARMANDER";
    }
    if (posicion == 2) {
      manoX = 438;
      nombrePokemon = "SQUIRTLE";
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
