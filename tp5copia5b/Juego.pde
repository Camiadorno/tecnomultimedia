class Juego {

  // ------------------- Atributos -------------------

  JuegoIntro juegoIntro;
  JuegoBatalla juegoBatalla;

  boolean jugarIntro = true;
  boolean jugarBatalla = false;

  // ------------------- Constructor -------------------

  Juego() {
    juegoIntro = new JuegoIntro();
    juegoBatalla = new JuegoBatalla();
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
}
