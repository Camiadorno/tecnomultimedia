class Escena {
  Campo campo;
  MainPanel panelPrincipal;

  Escena() {
    campo = new Campo();
    panelPrincipal = new MainPanel();
  }
  
  void dibujar(){
    campo.dibujar();
    panelPrincipal.dibujar();
  }
}
