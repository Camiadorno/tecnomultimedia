class Pokemon {

  // ------------------- Atributos -------------------

  PImage pikachu, bulbasaur, charmander, squirtle, panelHP; 
  PFont fuente;
  String nombre, tipo;
  int posX, posY;
  float vida;

  boolean huir = false;
  boolean dentroDelCampo = true;

  boolean vidaLlena = true;
  
  boolean ganar = false;
 

  // ------------------- Constructor -------------------

  Pokemon(String nombre, String tipo) {
    this.nombre = nombre; 
    this.tipo = tipo;
    vida = 135;

    if (tipo == "aliado") {
      if (nombre == "BULBASAUR") {
        bulbasaur = loadImage("bulbasaur.png");
      } else if (nombre == "CHARMANDER") {
        charmander = loadImage("charmander.png");
      } else if (nombre == "SQUIRTLE") {
        squirtle = loadImage("squirtle.png");
      } 
      posX = 830;                                       
      posY = 190;
    } else if (nombre == "PIKACHU") {
      pikachu = loadImage("pikachu.png");
      posX = 0;                                         
      posY = 50;
    }
    panelHP = loadImage("panel3.png");
    fuente = createFont("pixelmix.ttf", 16);
  }

  // ------------------- Metodos -------------------

  // ----- Get & Set

  float getHP() {
    return vida;
  }

  void setHP(float newHP) {
    vida = newHP;
  }

  // ----- 

  boolean dentroDelCampo() {                  // Esto desactiva las interacciones si se huye
    return dentroDelCampo;
  }

  void fueraDelCampo() {
    dentroDelCampo = false;
  }

  boolean vidaLlena() {                        // No permite el uso de pociones al tener la vida completa
    return vidaLlena;
  }
  
  boolean ganar() {                         
    return ganar;
  }
  

  // ----- Otros metodos

  void dibujar() {
    if (tipo == "aliado") {
      if (nombre.equals("BULBASAUR")) {
        image(bulbasaur, posX, posY);
      } else if (nombre.equals("CHARMANDER")) {
        image(charmander, posX, posY);
      } else if (nombre.equals("SQUIRTLE")) {
        image(squirtle, posX, posY);
      }
      aparecer();
    } else if (tipo == "enemigo") {
      image(pikachu, posX, posY);
      if (posX < 420) {
        posX += 6;
      } else {
        panelHP(nombre, 150, 30);
      }
    }

    if (huir) {                  
      posX -= 8;
    }
  }

  void atacar(Pokemon enemigo) {
    vidaLlena = false;
    if (enemigo.getHP() >= 0) {                            
      enemigo.setHP(enemigo.getHP() - random(40));
      if(enemigo.getHP() < 0) {
       // vida = 0;
        ganar = true;
      }
    }
  }

  void curar() {
    if (getHP() <= 115) {
      setHP(getHP() + 20);
    }
  }

  void huir() {
    huir = true;
    dentroDelCampo = false;
  }

  void restablecerValores() {                                        // Se restablecen los valores iniciales del pokemon para reiniciar el juego
    vida = 135;
    if (tipo == "aliado") {
      posX = 830;
      posY = 190;
    } else if (tipo == "enemigo") {
      posX = 0;
      posY = 50;
    }
    dentroDelCampo = true;
    vidaLlena = true;
    huir = false;
    ganar = false;
  }

  // ------------- Interfaces ------------- 

  // ----- Panel de HP (vida)

  void panelHP(String nombre, int x, int y) {         
    image(panelHP, x, y);

    textFont(fuente);
    fill(0);
    text(nombre, x+20, y+30);

    // Barra de vida

    if (vida > 90) {
      fill(0, 255, 0);
    } else if (getHP() > 30) {
      fill(255, 214, 8);
    } else {
      fill(255, 0, 0);
    }
    rectMode(CORNER);
    noStroke();
    rect(x+100, y+50, vida, 8);
  }

  // ----- Pokemon movimiento

  void aparecer() {
    if (posX > 80) {                                  // Hasta donde se mueve el pokemon
      posX -= 8;                                      // Velocidad
    } else {
      panelHP(nombre, 400, 280);                      // Se dibuja su panel de vida una vez que termina de moverse
    }
  }
}
