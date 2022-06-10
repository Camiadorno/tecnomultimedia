// https://youtu.be/g1_xwY5Rcbg


boolean play = false;
boolean volver = false;

void setup(){
  size(600, 600);

  fuente = createFont("arcade.ttf", 30);
  botonTexto = "Play";
}

void draw() {
  background(0);
  
  //Dibujo las lineas
  dibujarLineas();
  
  //Dependiendo si se apreto o no el boton
  if (play) {
    cuadradosDinamicos();             //Si se apreto, se dibujan los cuadrados en movimiento
  }else{
    cuadradosEstaticos();             //Sino, se dibujan estaticos y se sigue dibujando el boton
    botonPlay();
  }
  
  //si termino el bucle → volver = true, y entra en el if
  if(volver){
    botonTexto = "Volver";
    botonVolver();
  }
  
}
