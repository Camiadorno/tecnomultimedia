//Valores de las lineas
int lineaX1 = 237;     // Aca empieza el recuadro del juego
int lineaY = 120;
int lineaX2 = 466;     // Aca termina el recuadro del juego

int distLineas = 40;

//Valores de los circulos
int elliX1 = 260;
int elliY1 = 120;
int elliTam = 30;
int elliXGame = 260;
int r = elliTam/2;
int desplazamiento;

//Valores de la nave
int naveX = 240;        // Posicion inicial de la nave
boolean disparo = false;
int balaX;
int balaY = 315;        // Posicion inicial de la bala

//Valores en el contador
int bigBalaX = 230;
int bigBalaY = 364;
int cantBigBalas = 5;
int puntos = 0;
boolean termino = false;


// ----------------------------------------------------- PANTALLA -------------------------------------------------------------

void pantallaJuego() {
  image(fondoJuego, 0, 0);
  lineasYcirculos();
  nave();
  contadorBalas();

  if (disparo) {
    dibujarBala(balaX, balaY);
    if (balaY == 315) {
      cantBigBalas --;
    }

    // --------------------------------- COLISIONES ---------------------------------
    
    for (int i=0; i<4; i++) {

      if (((balaX > (posX[i]-r))&&(balaX < (posX[i]+r)))&&((balaY > posY[i]-4)&&(balaY < posY[i]+4))) {
        desplaz[i] = 0;           // Se detiene el circulo
        balaY = 319;              // Desaparece la bala
        disparo = false; 
        keyCode = 0;
      }
    }
    for (int i=0; i<4; i++) {
      if (desplaz[i] == 0) {
        puntos++;
      }
    }
    balaY -=4;
  }

  // --------------------------------- INTERACCIONES ---------------------------------

  // Perder
  if ((cantBigBalas == 0)&&(balaY == 315)&&(puntos != 4)) {              // Cuando el contador de balas llega a 0, no permite mas disparos = se pierde
    disparo= false;
    perdiste();
    termino = true;
  }

  // Ganar
  if (puntos == 4) {                                                            
    disparo = false;
    ganaste();
    termino = true;
  } else {
    puntos = 0;
  }

  // Movimiento de la bala
  if (balaY<80) {                  // Se reinicia la bala
    balaY = 315;
    disparo = false;
    keyCode = 0;                   // Salgo del keyCode = 32 para evitar que las balas se disparen solas
  }

  if ((keyCode == 32)&&(balaY == 315)) {          // Se presiona la Barra espaciadora para disparar
    disparo = true;
    balaX = naveX+20;
  }

  // Movimiento de la nave
  if (keyPressed && keyCode == RIGHT && naveX>220 && naveX<420) {
    naveX ++;
  } 
  if (keyPressed && keyCode == LEFT && naveX>240 && naveX<440) {
    naveX --;
  }
}

// ----------------------------------------------------- DIBUJOS -------------------------------------------------------------

void lineasYcirculos() {
  for (int i=0; i<4; i++) {
      linea(lineaX1, posY[i], lineaX2, posY[i]);                // Se dibujan las lineas
    
    if (posX[i] <= 260) {                                       // Se dibujan los circulos en la posicion que indique la casilla "i" del arreglo
      desplaz[i] = 1;
    } else if (posX[i] >= 440) {
      desplaz[i] = -1;
    }

    if (desplaz[i] == 0) {                                      // Las colisiones los pintan de rojo
      circulo(posX[i], posY[i], elliTam, rojo);
    } else {
      circulo(posX[i], posY[i], elliTam, verde);
    }
    posX[i] += desplaz[i];
  }
}

void dibujarBala(int x1, int y1) {
  image(bala, x1, y1);
}

void nave() {
  image(nave, naveX, 315);
}

void balaGrande(int x, int y) {
  image(bala2, x, y);
}

// ----------------------------------------------------- CONTADOR -------------------------------------------------------------

void contadorBalas() {
  for (int i=0; i<cantBigBalas; i++) {
    balaGrande(bigBalaX+(12*i), bigBalaY);
  }
}

// ----------------------------------------------------- PESTAÑAS EMERGENTES -------------------------------------------------------------

void perdiste() {
  rectanguloFondo();
  fill(amarillo[0], amarillo[1], amarillo[2]);
  textFont(fuente18);
  text("Perdiste!", width/2, height/2.3);

  fill(255);
  textFont(fuenteInstrucciones);
  text("Presiona ENTER para \nvolver a intentar", width/2, height/2);
}

void ganaste() {
  rectanguloFondo();
  fill(amarillo[0], amarillo[1], amarillo[2]);
  textFont(fuente18);
  text("Ganaste!", width/2, height/2.3);

  fill(255);
  textFont(fuenteInstrucciones);
  text("Presiona ENTER para \nvolver a jugar", width/2, height/2);
}

void rectanguloFondo() {
  strokeWeight(3);
  stroke(255);
  fill(0);
  rect(width/2, height/2.2, 180, 100);
}
