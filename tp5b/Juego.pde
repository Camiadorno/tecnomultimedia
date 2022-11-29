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
    }
    if (jugarBatalla) {
      juegoBatalla.dibujar();
    }
    botonCerrar.dibujar();
   
    /*if (reiniciar) {
      jugarBatalla = false; 
    }*/
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
      juegoBatalla.jugarPorTurnos();
    }
  }

  void clickear(int x, int y) {
    if (botonCerrar.clickeado(x, y)) {
      programaPrincipal.cambiarPantallaActual(0);
  //    reiniciar = true;
    }
  }
}
