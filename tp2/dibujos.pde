int cantRect = 10;
int lineas = 10;

float tamRect = 40;
float tamAux = tamRect;
float tamRectIni = 40;

float vel = 0.1;

float b = 1;     // borde
float n = 1;     // borde inicial
float brillo;


//---------------------------LINEAS---------------------------------------------

void dibujarLineas() {
  brillo = map(mouseY, height, 0, 0, 150);
  strokeWeight(4);
  stroke(0,255,0, brillo);
  lineas();
  
  strokeWeight(2);
  stroke(0,255,0);
  lineas();
}

//----------------------------

void lineas(){
  for (int i=0; i<=lineas; i++) {  
    line(width/2, height/2, i*(width/lineas), height);
    line(width/2, height/2, width, i*(width/lineas));
    line(width/2, height/2, i*(width/lineas), 0);
    line(width/2, height/2, 0, i*(width/lineas));
  }  
}

//----------------------------CUADRADOS--------------------------------------------

void cuadradosEstaticos() {
  //Dibujo el cuadrado central
  fill(0);
  cuadrado(tamRect, 1);
  
  //Dibujo los cuadrados verdes
  for (int i = 0; i < cantRect; i++) {        
    tamRect *= 1.4;
    noFill();
    cuadrado(tamRect, b);
    b+=0.5;
  }
  b = 1;
  tamRect = tamRectIni;
}

//------------------------------------

void cuadradosDinamicos() {
  
  //Reservo el tamaño previo en tamAux
  tamAux = tamRect;
  
  //Dibujo el cuadrado central
  fill(0);
  cuadrado(tamRect, 1);
  
  //Dibujo los cuadrados en bucle
  for (int i = 0; i < cantRect; i++) {     
    noFill();
    cuadrado(tamRect, b);
    tamRect*=1.4;
    b+=0.5;
  }
  tamRect = tamAux+vel;              //"tam" toma el valor del cuadrado mas pequeño, aumentado en "vel" unidades
  vel*=1.01;                         //Acelero la velocidad para que sea mas fluido

  if (tamAux >= width) {
    volver = true;                   //Muestra el boton volver
    n = 1;                           //Reinicia el valor de n y b 
    b = n;
  }
  n+= 0.01;                          //Aumenta el valor del borde mas delgado
  b = n;
}

//------------------------------------

void cuadrado (float lado, float borde) {
  strokeWeight(borde);
  stroke(0, 255, 0);
  rectMode(CENTER);
  rect(width/2, height/2, lado, lado);
}
