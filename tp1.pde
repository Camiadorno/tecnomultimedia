PImage image; 
PImage logo;
PImage botonNext;
PImage botonNextHover;

float numRandom = 0;

PFont fontTitle;
PFont fontText;

String Texto1;
String Texto2;
String Texto3;
String Texto4;

int pantalla = 1;
float size = 400;
int cantImg = 10;


void setup() {
  size(400, 400);

  // Imagenes

  logo = loadImage("logo.png");
  image = loadImage("background_" + floor(numRandom) + ".jpg");
  botonNext = loadImage("DefaultButton.png");
  botonNextHover = loadImage("HoverButton.png");

  // Fuentes
  fontTitle = createFont("Aetherius.ttf", 20);
  fontText = loadFont("YuGothic12.vlw");

  // Textos
  Texto1 = "Game Design" +
    "\nBethesda Game Studios" +     
    "\n" + 
    "\nGame Director" + 
    "\nTodd Howard" +
    "\n" + 
    "\nLead Programmer" +
    "\nGuy Carver" +   
    "\n" + 
    "\nLead Artist" +
    "\nMatthew Carofano" +
    "\n" + 
    "\nLead Designer" +
    "\nBruce Nesmith";

  Texto2 = "Lead Graphics Programmer" +
    "\nScott Franke" +
    "\n" + 
    "\nGraphics Programming" +
    "\nJonathan Bilodeau" +
    "\nPaul Graber" +
    "\nJeff Sheiman" +
    "\nOrin Tresnjak" +
    "\n" + 
    "\nGameplay Programming" +
    "\nDavid Diangelo" +
    "\nJoseph Diangelo" +
    "\nSteve Meister";

  Texto3 = "Esbern" +
    "\nMax Von Sydow" +
    "\n" +
    "\nArngeir" +
    "\nChristopher Plummer" +
    "\n" +
    "\nDelphine" + 
    "\nJoan Allen" +
    "\n" +
    "\nGeneral Tullius" +
    "\nMichael Hogan" +
    "\n" +
    "\nUlfric Stormcloak" +
    "\nVladimir Kulich";

  Texto4 = "Original Music Composed & Produced By" +
    "\nJeremy Soule" +
    "\nPennywhistle Music" + 
    "\nWendy Morrison";
}

void draw() {
  background(255);
  image(image, 0, 0);

  if (pantalla == 1) {                                  // Pantalla inicial 
    textFont(fontTitle);
    text("Play", 190, 320);

    // Boton 'play'
    if (mouseX > 190 && mouseX < 220 && 
      mouseY > 300 && mouseY < 320) {  
      image(logo, 225, 300, 30, 30);
      fill(255);
    } else {
      fill(150);
    }
  } else if (pantalla == 2) {                           // Pantalla 2
    //Agrandar imagen
    if (size < 500) {
      size = size + 0.35;
    }
    image(image, 0, 0, floor (size), floor(size));

    fill(255);
    textFont(fontText);
    textAlign(CENTER);
    text(Texto1, 200, 80);
    image(botonNext, 200, 300, 20, 20);

    // Boton 'next'
    if (mouseX > 200 && mouseX < 220 && 
      mouseY > 300 && mouseY < 320) {  
      image(botonNextHover, 200, 300, 20, 20);
    }
  } else if (pantalla == 3) {                           // Pantalla 3
    //Agrandar imagen
    if (size < 500) {
      size = size + 0.35;
    }
    image(image, 0, 0, floor (size), floor(size));

    fill(255);
    textFont(fontText);
    textAlign(CENTER);
    text(Texto2, 200, 80);
    image(botonNext, 200, 300, 20, 20);

    // Boton 'next'
    if (mouseX > 200 && mouseX < 220 && 
      mouseY > 300 && mouseY < 320) {  
      image(botonNextHover, 200, 300, 20, 20);
    }
  } else if (pantalla == 4) {                           // Pantalla 4
    //Agrandar imagen
    if (size < 500) {
      size = size + 0.35;
    }
    image(image, 0, 0, floor (size), floor(size));

    fill(255);
    textFont(fontText);
    textAlign(CENTER);
    text(Texto3, 200, 80);
    image(botonNext, 200, 300, 20, 20);

    // Boton 'next'
    if (mouseX > 200 && mouseX < 220 && 
      mouseY > 300 && mouseY < 320) {  
      image(botonNextHover, 200, 300, 20, 20);
    }
  } else if (pantalla == 5) {                           // Pantalla 5
    //Agrandar imagen
    if (size < 500) {
      size = size + 0.35;
    }
    image(image, 0, 0, floor (size), floor(size));

    fill(255);
    textFont(fontText);
    textAlign(CENTER);
    text(Texto4, 200, 150);
    textFont(fontTitle);
    fill(150);

    // Boton 'volver'
    if (mouseX > 130 && mouseX < 250 && 
      mouseY > 300 && mouseY < 320) {  
      fill(255);
      text("Volver al inicio", 190, 320);
    } else {
      fill(150);
      text("Volver al inicio", 190, 320);
    }
  }
}

void mouseClicked() {
  if ((pantalla == 1) && (mouseX > 190 && mouseX < 220 && 
    mouseY > 300 && mouseY < 320)) {
    numRandom = random(cantImg)+1;
    size = 400;
    pantalla++;
  } else if ((pantalla >= 2) && (pantalla < 5) && (mouseX > 200 && mouseX < 220 && 
    mouseY > 300 && mouseY < 320)) {
    numRandom = random(cantImg)+1;
    size = 400;
    pantalla++;
  } else if ((pantalla == 5) && (mouseX > 130 && mouseX < 250 && 
    mouseY > 300 && mouseY < 320)) {
    numRandom = 0;
    size = 400;
    pantalla = 1;
  }
  image = loadImage("background_" + floor(numRandom) + ".jpg");
}

void keyPressed() {
  if ((pantalla >= 2) && (pantalla < 5) && ((keyCode == RIGHT) || (keyCode == 32))) {
    numRandom = random(cantImg)+1;
    size = 400;
    pantalla++;
  }
  image = loadImage("background_" + floor(numRandom) + ".jpg");
}
