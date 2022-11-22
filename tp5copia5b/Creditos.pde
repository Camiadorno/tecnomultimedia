class Creditos {

  // ------------------- Atributos -------------------

  PImage fondoCreditos;
  PFont fuente;
  Boton botonVolver;

  // ------------------- Constructor -------------------

  Creditos() {
    fondoCreditos = loadImage("fondocreditos.png");
    fuente = createFont("pixelmix.ttf", 16);
    botonVolver = new Boton(450, "Volver");
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    image(fondoCreditos, 0, 0);
    textAlign(CENTER);
    textFont(fuente);
    fill(0);
    text("MATERIA \nTecnologia multimedial 1 \n\nCOMISION 4 \n\nPROFESOR\nLeonardo Garay \n\nALUMNA \nCamila Adorno \n\nLEGAJO \n91553/1", width/2, height/5);
    botonVolver.dibujar();
  }
}
