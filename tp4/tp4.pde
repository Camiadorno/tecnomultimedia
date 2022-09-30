// https://youtu.be/VN5RAsOXBog 

PImage fondo, panel, panelInteraccion, panelHp;
PFont fuente, fuente2;

int count;                      // Contador para la animacion de lanzar la pokeball 
boolean contar = false;
 
int panelMagY = 30;             // Datos de Magikarp
int vidaY = 80;
int nombreY = 60;

boolean atacar = false;         // Habilita el metodo atacar
boolean dmg = false;            // Habilita la resta HP de Magikarp
int animationCounter = 0;       // Habilita la animacion de ataque de Charmander 

Entrenador entrenador;
Pokemon charmander, magikarp;
Pokeball pokeball;

void setup() {
  size(700, 500);

  // Imagenes
  fondo = loadImage("fondo.png");
  panel = loadImage("panel.png");
  panelInteraccion = loadImage("panel2.png");
  panelHp = loadImage("panel3.png");

  // Fuentes
  fuente =  createFont("pixelmix.ttf", 12);
  fuente2 =  createFont("pixelmix.ttf", 16);

  // Instancia objetos
  charmander = new Pokemon("CHARMANDER", "fuego");
  magikarp = new Pokemon("MAGIKARP", "agua");
  pokeball = new Pokeball("pokeball");
  entrenador = new Entrenador("Cami", charmander, pokeball);
}

void draw() {
  background(255);
  image(fondo, 0, 0);
  
  entrenador.dibujar();
  charmander.dibujar();               
  magikarp.dibujar();
 
  panel();
  panelHp(panelMagY, vidaY, nombreY);
  
  if (contar){
    count++;
    entrenador.atrapar(count);
  }
  
  if(atacar){
     charmander.atacar(magikarp);
  }
}

void mouseClicked() {
  if (mouseX > 400 && mouseX < 475 && mouseY > 410 && mouseY < 430) {   
    if(magikarp.onField()){
      textoDisplay = textoAtacar;
      atacar = true;
      dmg = true;
      animationCounter = 0;
    }
  }
  if (mouseX > 520 && mouseX < 620 && mouseY > 410 && mouseY < 430) {    
    if(magikarp.onField()){
      textoDisplay = textoCapturar;
      contar = true;
    }
  }

  if (mouseX > 400 && mouseX < 450 && mouseY > 440 && mouseY < 460) {  
    if(magikarp.onField()){
      textoDisplay = textoHuir;
    }
  }
}
