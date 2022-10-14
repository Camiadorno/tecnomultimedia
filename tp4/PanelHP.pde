class PanelHp {
  PImage panelFondo; 
  PFont fuente;
  int posX, posY;

  PanelHp(int x, int y) {
    panelFondo = loadImage("panel3.png");
    fuente = createFont("pixelmix.ttf", 16);
    posX = x;
    posY = y;
  }

  void dibujar(String nombre) {
    image(panelFondo, posX, posY);
    
    textFont(fuente);
    fill(0);
    text(nombre, posX+20, posY+30);

    //Barra de vida
    fill(0, 255, 0);
    noStroke();
    rect(posX+100, posY+50, 135, 8);
  }
}
