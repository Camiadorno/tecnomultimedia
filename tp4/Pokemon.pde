class Pokemon {
  // ------------------- Atributos -------------------
  String nombre; 
  int nivel;
  float vida;
  String tipo;
  PImage sprite;
  int posX, posY;
  boolean onField = true;

  // ------------------- Constructor -------------------
  Pokemon(String name, String type) {
    nombre = name;
    tipo = type;
    nivel = 5;
    vida = 135;
    if (name == "CHARMANDER") {
      sprite = loadImage("charmander.png");
      posX = 830;
      posY = 200;
    } else {
      sprite = loadImage("magikarp.png");
      posX = 0;
      posY = 50;
    }
  }

  // ------------------- Metodos -------------------
  // ----- Get & Set
  float getHp() {
    return vida;
  }
  
  void setHp(float newHp) {
    vida = newHp;
  }

  boolean onField() {            // Cuando el pokemon esta en el campo (Magikarp)
    return onField;
  }
  
  void offField() {             // Cuando esta fuera del campo
    onField = false; 
  }

  void setSprite(PImage pokeSprite) {
    sprite = pokeSprite;
    posX = 500;
    posY = 200;
  }

  // ----- Otros metodos
  void atacar(Pokemon enemigo) {
    if (dmg) {
      if (enemigo.getHp() > 40.5)
        enemigo.setHp(enemigo.getHp() - 40.5);
      else {
        textoDisplay = "Es momento de usar una Pokeball!";
      }
      dmg = false;
    }
    if (animationCounter < 5) {
      posX += 15; 
      animationCounter++;
    }
  }

  void huir() { 
    if (posX < 700) {                         
      posX += 10;
    } else {
      contar = false;
    }
    if (panelMagY > -100) {
      panelMagY-=6;
      vidaY-=6;
      nombreY-=6;
    } 
    onField = false;
    textoDisplay = "MAGIKARP ha huido.\n\nLa proxima bajale mas vida!";
  }

  void dibujar() {
    if (nombre == "CHARMANDER") {
      if (posX > 150) {                          // Movimiento Charmander
        posX -= 10;
      }
    } else {
      if (posX < 410) {                          // Movimiento Magikarp
        posX += 6;
      }
    }

    image(sprite, posX, posY);
  }

  void dibujarVida(int x, int y) {
    if (nombre == "MAGIKARP") {
      if (magikarp.getHp() > 90) {
        fill(0, 255, 0);
      } else if (magikarp.getHp() > 30) {
        fill(255, 214, 8);
      } else {
        fill(255, 0, 0);
      }
    } else {
      fill(0, 255, 0);
    }
    noStroke();
    rect(x, y, vida, 8);
  }
}
