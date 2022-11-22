class ProgramaPrincipal {

  // ------------------- Atributos -------------------

  Inicio inicio;
  Juego juego;
  Creditos creditos;
  String pantallaActual;

  // ------------------- Constructor -------------------

  ProgramaPrincipal() {
    this.pantallaActual = "Inicio";
    inicio = new Inicio();
    juego = new Juego();
    creditos = new Creditos();
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    if (pantallaActual == "Inicio") {
      inicio.dibujar();
    } else if (pantallaActual == "Juego") {
      juego.dibujar();
    } else if (pantallaActual == "Creditos") {
      creditos.dibujar();
    }
  }
  
  // ------- Interacciones -------
  
  void cambiarPantallaActual(String pantalla) {
    this.pantallaActual = pantalla;
  }
  
  void clickear() {
    if (pantallaActual == "Inicio"){
      this.cambiarPantallaActual("Juego");
   
    }
    juego.interaccion();       // (Lo incluyo solo para que pueda atacar el pokemon -- falta modificacion)
  }

 /*void click() {
    if ((mouseX > 240 && mouseX < 470 && mouseY > 300 && mouseY < 340) && (pantallaActual == 0)) {                       // Coordenadas del boton Jugar
      pantallaActual = 1;
    } else if ((mouseX > 240 && mouseX < 470 && mouseY > 350 && mouseY < 390) && (pantallaActual == 0)) {                // Coordenadas del boton Creditos
      pantallaActual = 2;
    } else if ((mouseX > 240 && mouseX < 470 && mouseY > 432 && mouseY < 472) && (pantallaActual == 2)) {                // Coordenadas del boton Volver (dentro de Creditos)
      pantallaActual = 0;
    }
    juego.interaccion();
  }*/

  void teclaPresionada() {
    if (pantallaActual == "Juego") {
      juego.interaccion();
    }
  }
}
