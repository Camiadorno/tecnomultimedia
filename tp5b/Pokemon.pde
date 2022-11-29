class Pokemon {

  // ------------------- Atributos -------------------

  PImage pikachu, bulbasaur, charmander, squirtle, panelHP; 
  PFont fuente;
  String nombre, tipo;
  int posX, posY;
  float vida;

  int turno = 1;

  //boolean atacar = false;
  boolean huir = false;
  boolean dentroDelCampo = true;

  // ------------------- Constructor -------------------

  Pokemon(String nombre, String tipo) {
    this.nombre = nombre; 
    this.tipo = tipo;
    vida = 135;

    if (nombre == "BULBASAUR") {
      bulbasaur = loadImage("bulbasaur.png");
      posX = 830;                                       
      posY = 190;
    } else if (nombre == "CHARMANDER") {
      charmander = loadImage("charmander.png");
      posX = 830;                                       
      posY = 190;
    } else if (nombre == "SQUIRTLE") {
      squirtle = loadImage("squirtle.png");
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

  boolean dentroDelCampo() {                  // Esto desactiva las interacciones si se huye
    return dentroDelCampo;
  }

  void fueraDelCampo() {
    dentroDelCampo = false;
  }

  // ----- Otros metodos

  void dibujar() {
    if (nombre.equals("BULBASAUR")) {
      image(bulbasaur, posX, posY);
      aparecer();
    } else if (nombre.equals("CHARMANDER")) {
      image(charmander, posX, posY);
      aparecer();
    } else if (nombre.equals("SQUIRTLE")) {
      image(squirtle, posX, posY);
      aparecer();
    }

    if (tipo == "enemigo") {
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
    if (enemigo.getHP() > 1) {                            
      enemigo.setHP(enemigo.getHP() - random(40));
    }
  }
  
  void curar() {
    if (getHP() <= 100) {
      setHP(getHP() + 20);
    }
  }

  void huir() {
    if (posX < 80) {
      huir = true;
    }
    dentroDelCampo = false;
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
