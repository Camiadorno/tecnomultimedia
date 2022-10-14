class MainPanel {
  PImage panel;
  PImage panelInteraccion;
  PFont fuente;
  PFont fuente2;

  MainPanel() {
    panel = loadImage("panel.png");
    panelInteraccion = loadImage("panel2.png");
    fuente =  createFont("pixelmix.ttf", 12);
    fuente2 =  createFont("pixelmix.ttf", 16);
  }

  void dibujar() {
    image(panel, 0, 380);
    image(panelInteraccion, 355, 385);

    textFont(fuente);
    fill(255);
    text("Un MAGIKARP salvaje ha aparecido!", 40, 430);

    textFont(fuente2);
    fill(0);
    text("ATACAR", 400, 430);
    text("CAPTURAR", 520, 430);
    text("HUIR", 400, 460);
  }
}
