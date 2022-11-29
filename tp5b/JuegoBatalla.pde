class JuegoBatalla {

  // ------------------- Atributos -------------------

  PImage fondoBatalla, panelInteraccion;
  PFont fuente, fuente2;

  int pokemonElegido;
  String nombre;

  String texto;

  int pocion = 3;

  Pokemon aliado;
  Pokemon enemigo;

  int turno = 1;

  // ------------------- Constructor -------------------

  JuegoBatalla(/*String nombre*/) {
    fondoBatalla = loadImage("fondobatalla.png");
    panelInteraccion = loadImage("panel2.png");
    /*this.nombre = nombre;*/
    fuente =  createFont("pixelmix.ttf", 12);
    fuente2 =  createFont("pixelmix.ttf", 16);

    pokemonElegido = 0;
    nombre = "CHARMANDER"; 
    aliado = new Pokemon(nombre, "aliado");
    enemigo = new Pokemon("PIKACHU", "enemigo");

    texto = "Un PIKACHU salvaje ha aparecido!";
  }

  // ------------------- Metodos -------------------

  void dibujar() {
    image(fondoBatalla, 0, 0);

    enemigo.dibujar();
    aliado.dibujar();      

    panelPrincipal();
    panelInteraccion();

    /*if (turno == 2) {
     atacaEnemigo();
     turno--;
     }*/
  }

  void jugarPorTurnos() {
    if (turno == 1) {
      atacaAliado();
      curar();
      huir();
      turno++;
    } else if (turno == 2) {
      atacaEnemigo();
      turno--;
    }
  }


  void atacaAliado() {
    if ((mouseX > 390 && mouseX < 480 && mouseY > 410 && mouseY < 440) && (aliado.dentroDelCampo())) {
      aliado.atacar(enemigo);
      texto = "Has atacado a PIKACHU!";
    }
  }

  void atacaEnemigo() {
    enemigo.atacar(aliado);
    texto = "PIKACHU te ha atacado!";
  }

  void curar() {
    if (mouseX > 510 && mouseX < 630 && mouseY > 410 && mouseY < 440) {
      if (aliado.dentroDelCampo() && pocion >= 0) {
        aliado.curar();
        texto = "Te has curado. \n\nTe quedan " + pocion + " pociones restantes.";
        pocion--;

        if (pocion == -1) texto = "No tienes mas pociones";
      }
    }
  }

  void huir() {
    if (mouseX > 390 && mouseX < 450 && mouseY > 440 && mouseY < 470) {
      if (aliado.dentroDelCampo()) {
        aliado.huir();
        texto = "Has huido de la batalla.";
      }
    }
  }

  /*void elegirPokemon(int eleccion) {
   pokemonElegido = eleccion;
   }
   
   void seleccionar() {
   if (pokemonElegido == 0) {
   nombre = "BULBASAUR";
   } else if (pokemonElegido == 1) {
   nombre = "CHARMANDER";
   } else if (pokemonElegido == 2) {
   nombre = "SQUIRTLE";
   }
   }*/

  // ------------- Interfaces ------------- 

  // ----- Panel inferior

  void panelPrincipal() {                                               
    textFont(fuente);
    fill(255);
    text(texto, 40, 430);
  }

  // ----- Panel de interacciones

  void panelInteraccion() {                                            
    image(panelInteraccion, 355, 390);
    textFont(fuente2);
    fill(0);
    text("ATACAR", 400, 435);
    text("CURAR", 520, 435);
    text("HUIR", 400, 465);
  }
}
