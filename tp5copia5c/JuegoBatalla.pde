class JuegoBatalla {

  // ------------------- Atributos -------------------

  PImage fondoBatalla, panelInteraccion;
  PFont fuente, fuente2;
  
  Pokemon aliado;
  Pokemon enemigo;

  // ------------------- Constructor -------------------

  JuegoBatalla() {
    fondoBatalla = loadImage("fondobatalla.png");
    panelInteraccion = loadImage("panel2.png");

    fuente =  createFont("pixelmix.ttf", 12);
    fuente2 =  createFont("pixelmix.ttf", 16);

    aliado = new Pokemon("CHARMANDER", "aliado");
    enemigo = new Pokemon("PIKACHU", "enemigo");
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    image(fondoBatalla, 0, 0);

    enemigo.dibujar();
    aliado.dibujar();                              

    panelPrincipal();
    panelInteraccion();
  }

  void atacar() {
    if (mouseX > 400 && mouseX < 475 && mouseY > 410 && mouseY < 430) {
      aliado.atacar(enemigo);
    }
  }

  // ------------- Interfaces ------------- 

  // ----- Panel inferior

  void panelPrincipal() {                                               
    textFont(fuente);
    fill(255);
    text("Un PIKACHU salvaje ha aparecido!", 40, 430);
  }

  // ----- Panel de interacciones
  
  void panelInteraccion() {                                            
    image(panelInteraccion, 355, 390);
    textFont(fuente2);
    fill(0);
    text("ATACAR", 400, 435);
    text("CAPTURAR", 520, 435);
    text("HUIR", 400, 465);
  }
}
