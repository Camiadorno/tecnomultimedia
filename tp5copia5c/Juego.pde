class Juego {

  // ------------------- Atributos -------------------

  JuegoIntro juegoIntro;
  JuegoBatalla juegoBatalla;

  boolean jugarIntro = true;
  boolean jugarBatalla = false;

  ProgramaPrincipal programaPrincipal;
  Boton botonVolver;


  // ------------------- Constructor -------------------

  Juego(ProgramaPrincipal _programaPrincipal) {
    juegoIntro = new JuegoIntro();
    juegoBatalla = new JuegoBatalla();
    programaPrincipal = _programaPrincipal;
    botonVolver = new Boton(450, "Volver");
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    if (jugarIntro) {
      juegoIntro.dibujar();
    }
    if (jugarBatalla) {
      juegoBatalla.dibujar();
    }
  }

  // ------- Interacciones -------

  void interaccion() {
    if (jugarIntro) {
      juegoIntro.seleccionarPokemon();
    }

    if (keyCode == ENTER) {
      jugarIntro = false;
      jugarBatalla = true;
    }

    if (jugarBatalla) {
      juegoBatalla.atacar();
    }
  }

  void clickear(int x, int y) {
    if (botonVolver.clickeado(x, y)) {
      programaPrincipal.cambiarPantallaActual(0);
    }
  }
}
