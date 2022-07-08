//https://youtu.be/twD2OprtB1Y

// Imagenes y fuentes
PImage fondoInicial, fondoJuego, nave, bala, bala2;
PFont fuente18, fuente16, fuenteInstrucciones;

// Pantallas
boolean inicio = true;
boolean instrucciones = false; 
boolean juego = false; 
boolean creditos = false;
boolean creditos2 = false;

// Arreglos Colores
int[] azul = new int[3];
int[] verde = new int[3];
int[] rojo = new int[3];
int[] amarillo = new int[3];

// Arreglos Circulos
int[] posX = new int[4];
int[] posY = new int[4];
int[] desplaz = new int[4];

void setup() {
  size(700, 443);

  // Imagenes
  fondoInicial = loadImage("Fondo1.jpg");
  fondoJuego = loadImage("Fondo2.jpg");
  nave = loadImage("nave.png");
  bala = loadImage("bala.png");
  bala2 = loadImage("bala2.png");

  // Fuentes
  fuente18 = createFont("arcade.ttf", 18);
  fuente16 = createFont("arcade.ttf", 16);
  fuenteInstrucciones = createFont("pixelmix.ttf", 10);

  // Colores
  azul[1] = 93;
  azul[2] = 219;

  verde[0] = 35;
  verde[1] = 232;
  verde[2] = 66;

  rojo[0] = 234;

  amarillo[0] = 254;
  amarillo[1] = 255;
  amarillo[2] = 5;

  // Circulos 
  for (int i=0; i<4; i++) {      //inicializo arreglos de posX y desplazmiento para los circulos verdes
    posX[i] = 260+(50*i);
  }
  for (int i=0; i<4; i++) {
    desplaz[i] = 1;
  }
  for (int i=3; i>-1; i--) {    //se carga al reves porque las balas van desde Y mayor a Y menor
    posY[i] = 100+(50*i);
  }
}

void draw() {
  background(255);

  if (inicio) {
    pantallaInicial();
  }
  if (instrucciones) {
    pantallaInstrucciones();
  }
  if (juego) {
    pantallaJuego();
  }
  if (creditos) {
    pantallaCreditos();
  }
  if (creditos2) {
    pantallaCreditos2();
  }
}

void mouseClicked() {

  if ((mouseX > 266 && mouseX < 350 && mouseY > 304 && mouseY < 328) && inicio) {                                    // Interaccion Pantalla Inicio a Instrucciones
    inicio = false;
    instrucciones = true;
  } else if ((mouseX > 355 && mouseX < 439 && mouseY > 304 && mouseY < 328) && inicio) {                             // Interaccion Pantalla Inicio a Creditos
    inicio = false;
    creditos = true;
  } else if ((mouseX > 300 && mouseX < 400 && mouseY > 304 && mouseY < 328) && creditos) {                           // Interaccion Pantalla Creditos a Creditos2
    creditos = false;
    creditos2 = true;
  } else if ((mouseX > 300 && mouseX < 400 && mouseY > 304 && mouseY < 328) && creditos2) {                          // Interaccion Pantalla Creditos2 a Inicio
    inicio = true;
    creditos2 = false;
  }

  if ((mouseX > 662 && mouseX < 688 && mouseY > 5 && mouseY < 31) && !inicio) {                                      // Interaccion Cerrar (click en X) 
    inicio = true;
    instrucciones = false;
    juego = false;
    creditos = false;
    creditos2 = false;
    restart();
  }
}

void keyPressed() {
  if ((keyCode == ENTER) && (termino)) {         // Interaccion volver a jugar 
    juego = true;
    restart();
  }
  if ((keyCode == ENTER) && (instrucciones)) {
    instrucciones = false;
    juego = true;
  }
}

void restart() {
  cantBigBalas = 5;
  puntos = 0;
  for (int i = 0; i <4; i++) {
    desplaz[i] = 1;
  }
  for (int i=0; i<4; i++) {
    posX[i] = 260+(50*i);
  }
}
