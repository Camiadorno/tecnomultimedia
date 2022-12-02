class Juego {

  // ------------------- Atributos -------------------

  JuegoIntro juegoIntro;
  JuegoBatalla juegoBatalla;

  boolean jugarIntro = true;
  boolean jugarBatalla = false;
  boolean reiniciar = false;

  ProgramaPrincipal programaPrincipal;
  Boton botonCerrar;

  // ------------------- Constructor -------------------

  Juego(ProgramaPrincipal programaPrincipal) {
    juegoIntro = new JuegoIntro();
    juegoBatalla = new JuegoBatalla();
    this.programaPrincipal = programaPrincipal;
    botonCerrar = new Boton(650, 20, "X", true);
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    if (jugarIntro) {
      juegoIntro.dibujar();
      reiniciar = false;
    } else if (jugarBatalla) {
      juegoBatalla.dibujar();
    }
    botonCerrar.dibujar();

    if (reiniciar) {
      juegoBatalla.reiniciar();
      jugarBatalla = false;
      jugarIntro = true;
    }
  }

  // ------- Interacciones -------

  void jugarConTeclas() {
    if (jugarIntro) {
      juegoIntro.seleccionarPokemon();
    } 
    if (keyCode == ENTER) {
      jugarIntro = false;
      jugarBatalla = true;
    }
  }

  void jugarConMouse() {
    if (jugarBatalla) {
      juegoBatalla.jugar();
    }
  }

  void clickear(int x, int y) {
    if (botonCerrar.clickeado(x, y)) {
      programaPrincipal.cambiarPantallaActual(0);
      reiniciar = true;
    }
  }
}
