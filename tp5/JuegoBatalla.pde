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

  int contador = 0;
  boolean contar = false;

  boolean atacaPikachu = false;

  boolean ganar;
  boolean perder;

  // ------------------- Constructor -------------------

  JuegoBatalla() {
    fondoBatalla = loadImage("fondobatalla.png");
    panelInteraccion = loadImage("panel2.png");
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

    if (atacaPikachu) {                  
      atacaEnemigo();
    }

    if (contar) {                                   // Una vez que ataca/se cura el pokemon aliado, se inicia un contador para que ataque el pokemon enemigo
      contador ++; 
      if (contador == 50) {
        contador = 0;
        atacaEnemigo();
        contar = false;
      }
    }

    if (aliado.ganar()) {
      texto = "Has ganado la batalla!. \n\nVuelve al inicio para volver a jugar.";
    } else if (enemigo.ganar()) {
      texto = "Has perdido. \n\nVuelve al inicio para volver a jugar.";
    }
  }

  void jugar() {                                   // Permite estas interacciones mediante clicks en la clase Juego 
    atacaAliado();
    curar();
    huir();
  }


  void atacaAliado() {
    if (mouseX > 390 && mouseX < 480 && mouseY > 410 && mouseY < 440) {
      if (aliado.dentroDelCampo() && (!aliado.ganar()) && (!enemigo.ganar())) {
        aliado.atacar(enemigo);
        texto = "Has atacado a PIKACHU!";
        contar = true;                                                                           // Contador para que ataque el pokemon enemigo
      } else if (!aliado.dentroDelCampo()) {
        texto = "Has huido. \n\nVuelve al inicio para volver a jugar.";                          // Si el pokemon huyo, no se permite la interaccion
      }
    }
  }

  void atacaEnemigo() {
    if (aliado.dentroDelCampo() && (!enemigo.ganar()) && (!aliado.ganar())) {                                                               // Pikachu ataca solo si el pokemon aliado se encuentra en el campo 
      enemigo.atacar(aliado);
      texto = "PIKACHU te ha atacado!";
    }
  }

  void curar() {
    if (mouseX > 510 && mouseX < 630 && mouseY > 410 && mouseY < 440) {
      if (aliado.dentroDelCampo() && (!enemigo.ganar()) && (!aliado.ganar())) {
        if (pocion >= 0) {                                                                      // El pokemon se cura solo si tiene pociones disponibles 
          if (aliado.vidaLlena()) {                                                             // Si el pokemon tiene la vida llena, no se puede curar
            texto = "Tu vida esta completa. \n\nNo puedes usar pociones.";
          } else {
            aliado.curar();
            texto = "Te has curado. \n\nTe quedan " + pocion + " pociones restantes.";
            pocion--;
          } 
          contar = true;
        } else if (pocion == -1) {
          texto = "No tienes mas pociones";
        }                                                                                       // Contador para que ataque el pokemon enemigo
      } else if (!aliado.dentroDelCampo()) {                                                    // Si el pokemon huyo, no se permite la interaccion
        texto = "Has huido. \n\nVuelve al inicio para volver a jugar.";
      }
    }
  }

  void huir() {
    if (mouseX > 390 && mouseX < 450 && mouseY > 440 && mouseY < 470) {
      if (aliado.dentroDelCampo() && (!enemigo.ganar()) && (!aliado.ganar())) {
        aliado.huir();
        texto = "Has huido de la batalla.";
      }
    }
  }

  void reiniciar() {
    aliado.restablecerValores();
    enemigo.restablecerValores();
    pocion = 3;
    texto = "Un PIKACHU salvaje ha aparecido!";
  }

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
