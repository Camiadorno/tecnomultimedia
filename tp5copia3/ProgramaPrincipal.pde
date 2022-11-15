class ProgramaPrincipal {
  Inicio inicio;
  Juego juego;
  Creditos creditos;
  int pantallaActual;

  ProgramaPrincipal() {
    pantallaActual = 0;
    inicio = new Inicio();
    juego = new Juego();
    creditos = new Creditos();
  }

  void dibujar() {
    if (pantallaActual == 0) {
      inicio.dibujar();
    } else if (pantallaActual == 1) {
      juego.dibujar();
    } else if (pantallaActual == 2) {
      creditos.dibujar();
    }
  }

  void click() {
    if ((mouseX > 240 && mouseX < 470 && mouseY > 300 && mouseY < 340) && (pantallaActual == 0)) {                       // Coordenadas del boton Jugar
      pantallaActual = 1;
    } else if ((mouseX > 240 && mouseX < 470 && mouseY > 350 && mouseY < 390) && (pantallaActual == 0)) {                // Coordenadas del boton Creditos
      pantallaActual = 2;
    } else if ((mouseX > 240 && mouseX < 470 && mouseY > 432 && mouseY < 472) && (pantallaActual == 2)) {                // Coordenadas del boton Volver (dentro de Creditos)
      pantallaActual = 0;
    }
  }

 void teclapresionada() {
    if (pantallaActual == 1) {
      juego.seleccionarPokemon();
    }
  }
}
