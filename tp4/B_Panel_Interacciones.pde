String textoDisplay = "Un MAGIKARP salvaje ha aparecido!";
String textoAtacar = "CHARMANDER ataco a MAGIKARP.";
String textoCapturar = "Lanzaste una POKEBALL.";
String textoHuir = "No podes huir."; 

void panel() {
  image(panel, 0, 380);
  image(panelInteraccion, 355, 385);
  textFont(fuente);
  fill(255);
  text(textoDisplay, 40, 430);
  textFont(fuente2);
  fill(0);
  text("ATACAR", 400, 430);
  text("CAPTURAR", 520, 430);
  text("HUIR", 400, 460);
}

void panelHp(int panelY, int vidaY, int nombreY) {
  panelMagikarp(panelY, vidaY, nombreY);
  panelCharmander();
}

void panelMagikarp(int panelY, int vidaY, int nombreY) {
  if (entrenador.getPosX() == 20) {
    image(panelHp, 150, panelY);
    text("MAGIKARP", 170, nombreY);
    magikarp.dibujarVida(250, vidaY);
  }
}

void panelCharmander() {
  if (entrenador.getPosX() == 20) {
    image(panelHp, 400, 280);
    fill(0);
    text("CHARMANDER", 420, 310);
    charmander.dibujarVida(500, 330);
  }
}
