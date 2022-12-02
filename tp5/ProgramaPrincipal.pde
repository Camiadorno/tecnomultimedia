class ProgramaPrincipal {

  // ------------------- Atributos -------------------

  Inicio inicio;
  Juego juego;
  Creditos creditos;
  int pantallaActual;

  // ------------------- Constructor -------------------

  ProgramaPrincipal() {
    pantallaActual = 0;
    inicio = new Inicio(this);
    juego = new Juego(this);
    creditos = new Creditos(this);
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    if (pantallaActual == 0) {
      inicio.dibujar();
    } else if (pantallaActual == 1) {
      juego.dibujar();
    } else if (pantallaActual == 2) {
      creditos.dibujar();
    }
  }

  // ------- Interacciones -------

  void cambiarPantallaActual(int pantalla) {
    pantallaActual = pantalla;
  }

  void clickear(int cursorX, int cursorY) {
    if (pantallaActual == 0) {
      inicio.clickear(cursorX, cursorY);
    } else if (pantallaActual == 2) {
      creditos.clickear(cursorX, cursorY);
    } else if (pantallaActual == 1) {
      juego.clickear(cursorX, cursorY);
      juego.jugarConMouse();
    }
  }

  void teclaPresionada() {
    if (pantallaActual == 1) {
      juego.jugarConTeclas();
    }
  }
}
