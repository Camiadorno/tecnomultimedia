PFont fuente;
String botonTexto;

//------------------------------------------BOTONES----------------------------------------------------
void botonPlay() {
  textFont(fuente);
  textAlign(CENTER);
  if (mouseX > 200 && mouseX < 400 && mouseY > 480 && mouseY < 540) {
    botonHover((height/2)*1.7);
  } else {
    botonOn((height/2)*1.7);
  }
}

//------------------------------------------

void botonVolver() {
  textFont(fuente);
  textAlign(CENTER);
  
  if (mouseX > 200 && mouseX < 400 && mouseY > 275 && mouseY < 335) {
    botonHover(height/2);
  } else {
    botonOn(height/2);
  }
}

//------------------------------------------INTERACCIONES----------------------------------------------------

void mouseClicked() {
   textAlign(CENTER);
  if ((mouseX > 200 && mouseX < 400 && mouseY > 450 && mouseY < 550) && play == false) {
      play = true;
  }
  
  if((mouseX > 200 && mouseX < 400 && mouseY > 250 && mouseY < 350) && volver == true) {
      play = false;
      volver = false;
      botonTexto = "Play";
      tamAux = tamRectIni;
      vel = .1;
  }
}

//------------------------------------------ESTILOS----------------------------------------------------

void botonOn(float posH) {
  fill(255, 200);
  rect(width/2, posH, 200, 60);
  fill(50);
  text(botonTexto, width/2, posH+10);
}

void botonHover(float posH) {
  fill(255);
  rect(width/2, posH, 200, 60);
  fill(0);
  text(botonTexto, width/2, posH+10);
}
