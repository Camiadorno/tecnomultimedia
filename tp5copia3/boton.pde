class Boton {
  PFont fuente;
  int y;
  String tipo; 

  Boton(int y, String tipo) {
    fuente =  createFont("pixelmix.ttf", 16);
    this.y = y;
    this.tipo = tipo;
  }

  void dibujar() {
    fill(0, 111, 128, 200);
    stroke(255);
    rectMode(CENTER);
    rect(width/2, this.y, width/3, 40); 
    textAlign(CENTER);
    textFont(fuente);
    fill(255);
    if (this.tipo.equals("Jugar")) {
      text("Jugar", width/2, 325);
    } else if (this.tipo.equals("Creditos")) {
      text("Ver creditos", width/2, 375);
    } else if (this.tipo.equals("Volver")) 
      text("Volver", width/2, 455);
    }
  }
