// ----------------------------------------------------- PANTALLA -------------------------------------------------------------

void pantallaInicial() {
  image(fondoInicial, 0, 0);
  botones();
}

// ----------------------------------------------------- BOTONES -------------------------------------------------------------

void botones() {
  stroke(255);
  strokeWeight(2);
  rectMode(CENTER);
  textAlign(CENTER);
  textFont(fuente18);

  botonInicio();
  botonCreditos();
}

void botonInicio() {
  botonFondo(width/2.3, height/2*1.45);
  fill(amarillo[0], amarillo[1], amarillo[2]);
  text("INICIO", width/2.3, height/2*1.48);
}

void botonCreditos() {
  botonFondo(width/1.76, height/2*1.45);
  fill(amarillo[0], amarillo[1], amarillo[2]);
  text("CREDITOS", width/1.76, height/2*1.48);
}

void botonFondo(float x1, float y1) {
  fill(rojo[0], rojo[1], rojo[2]);
  rect(x1, y1, 84, 24);
}
