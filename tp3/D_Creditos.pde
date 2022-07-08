String textoPantalla1 = "MATERIA" + "\nTecnologia  multimedial 1" +"\n" +"\nComision 4" +  "\n" +"\nPROFESOR" + "\nLeonardo  Garay";
String textoPantalla2 = "ALUMNA" + "\nCamila  Adorno" + "\n" + "\nJUEGO" + "\nBarra  Espacial \nde Club  Penguin";

String botonSiguiente = "SIGUIENTE";
String botonVolver = "VOLVER";

// ----------------------------------------------------- PANTALLAS -------------------------------------------------------------

void pantallaCreditos() {
  image(fondoJuego, 0, 0);
  textos(textoPantalla1);
  botones(botonSiguiente);
}

void pantallaCreditos2() {
  image(fondoJuego, 0, 0);
  textos(textoPantalla2);
  botones(botonVolver);
}

// ----------------------------------------------------- CONTENIDOS -------------------------------------------------------------

void textos(String texto) {
  textAlign(CENTER);
  textFont(fuente16);
  fill(255);
  text(texto, width/2, height/3.2);
}

void botones(String boton) {
  // Boton
  fill(rojo[0], rojo[1], rojo[2]);
  rectMode(CENTER);
  rect(width/2, height/2*1.45, 100, 24);
  stroke(255);
  strokeWeight(2);

  // Texto
  textFont(fuente18);
  fill(amarillo[0], amarillo[1], amarillo[2]);
  text(boton, width/2, height/2*1.48);
}
