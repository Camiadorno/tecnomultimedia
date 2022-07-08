String textoInstrucciones = "Tenes que disparar a todos los" + "\n objetivos en movimiento." + "\n" + "\n" + "\n" + "\n" +"\n" + "\n" +
  "Para mover tu nave usa las" + "\n flechas DERECHA e" + " IZQUIERDA." + "\n" + "\n" +
  "Para disparar presiona" + "\n la BARRA ESPACIADORA." + "\n(Tenes tiros limitados!)" +"\n" +"\n" + "\n" +
  "Pulsa ENTER para continuar.";

// ----------------------------------------------------- PANTALLA -------------------------------------------------------------

void pantallaInstrucciones() {
  image(fondoJuego, 0, 0);
  textFont(fuenteInstrucciones);
  fill(255);
  text(textoInstrucciones, width/2, 120);

  dibujarEjemplo(elliX1,160);
}

// ----------------------------------------------------- DIBUJOS -------------------------------------------------------------

void dibujarEjemplo(int posX, int posY) {
  linea(lineaX1, posY, lineaX2, posY);
  circulo(posX, posY, elliTam, verde);
  reboteElli();                
}

void linea(int x1, int y1, int x2, int y2) {
  stroke(azul[0], azul[1], azul[2]);
  strokeWeight(3);
  line(x1, y1, x2, y2);
}

void circulo(int x1, int y1, int tam, int clr[]) {
  fill(clr[0], clr[1], clr[2]);
  noStroke();
  ellipse(x1, y1, tam, tam);
}
 
void reboteElli() {                      // Rebote del circulo de ejemplo
  if (elliX1 <= 260) {
    desplazamiento = 1;
  }
  if (elliX1 >= 440) {
    desplazamiento = -1;
  }
  elliX1 += desplazamiento;
}
