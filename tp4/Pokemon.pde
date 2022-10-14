class Pokemon {
  PImage sprite; 
  String nombre;
  String tipo;
  int posX, posY;
  PanelHp panelHp;

  Pokemon(String name, String type) {
    nombre = name; 
    tipo = type;
    if (name == "CHARMANDER") {
      sprite = loadImage("charmander.png");
      posX = 830;
      posY = 200;
      panelHp = new PanelHp(400, 280);
    } else {
      sprite = loadImage("magikarp.png");
      posX = 0;
      posY = 50;
      panelHp = new PanelHp(150, 30);
    }
  }

  void aparecer() {
    if (nombre == "CHARMANDER") {
      if (posX > 150) {
        posX -= 10;
      } else {
        panelHp.dibujar(nombre);
      }
    } else {
      if (posX < 410) {
        posX += 6;
      } else {
        panelHp.dibujar(nombre);
      }
    }
    image(sprite, posX, posY);
  }
}
