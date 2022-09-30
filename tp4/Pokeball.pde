class Pokeball {
  // ------------------- Atributos -------------------
  String tipo; 
  PImage pokeSprite;

  // ------------------- Constructor -------------------
  Pokeball (String type) {
    tipo = type;
    if (tipo == "masterball") {
      pokeSprite = loadImage("masterball.png");
    } else {    
      pokeSprite = loadImage("pokeball.png");
    }
  }

  // ------------------- Metodos -------------------
  void capturar(Pokemon enemigo) {
    if (tipo == "masterball") {
      contar = false;
      enemigo.setSprite(pokeSprite);
      textoDisplay = "Has capturado a MAGIKARP";
      enemigo.offField();
    } else {
      if (enemigo.getHp() < 20) {
        contar = false;
        enemigo.setSprite(pokeSprite);
        textoDisplay = "Has capturado a MAGIKARP";
        enemigo.offField();
      } else {
        enemigo.huir();
      }
    }
  }
}
