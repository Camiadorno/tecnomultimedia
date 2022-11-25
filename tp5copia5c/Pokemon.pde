class Pokemon {

  // ------------------- Atributos -------------------

  PImage sprite, panelHP; 
  PFont fuente;
  String nombre, tipo;
  int posX, posY;
  float vida;

  boolean atacar = false;

  // ------------------- Constructor -------------------

  Pokemon(String name, String type) {
    nombre = name; 
    tipo = type;
    vida = 135;

    if (name == "BULBASAUR") {
      sprite = loadImage("bulbasaur.png");
      posX = 830;                                       
      posY = 190;
    }

    if (name == "CHARMANDER") {
      sprite = loadImage("charmander.png");
      posX = 830;                                       
      posY = 190;
    }

    if (name == "SQUIRTLE") {
      sprite = loadImage("squirtle.png");
      posX = 830;                                       
      posY = 190;
    }

    if (nombre == "PIKACHU") {
      sprite = loadImage("pikachu.png");
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

  // ----- Otros metodos

  void dibujar() {
    if (tipo == "aliado") {
      if (posX > 80) {                                  // Hasta donde se mueve el pokemon
        posX -= 8;                                      // Velocidad
      } else {
        panelHP(nombre, 400, 280);                      // Se dibuja su panel de vida una vez que termina de moverse
      }
    }
    if (tipo == "enemigo") {
      if (posX < 420) {
        posX += 6;
      } else {
        panelHP(nombre, 150, 30);
      }
    }
    image(sprite, posX, posY);
  }

  void atacar(Pokemon enemigo) {
    if (enemigo.getHP() > 40.5)                         // Baja la vida de Pikachu
      enemigo.setHP(enemigo.getHP() - 40.5);
  }

  // ------------- Interfaces ------------- 

  // ----- Panel de HP (vida)

  void panelHP(String nombre, int x, int y) {         
    image(panelHP, x, y);

    textFont(fuente);
    fill(0);
    text(nombre, x+20, y+30);

    // Barra de vida
    
    if (nombre == "PIKACHU") {
      if (vida > 90) {
        fill(0, 255, 0);
      } else if (getHP() > 30) {
        fill(255, 214, 8);
      } else {
        fill(255, 0, 0);
      }
    } else {
      fill(0, 255, 0);
    }
    rectMode(CORNER);
    noStroke();
    rect(x+100, y+50, vida, 8);
  }
}
