void setup() {

  size (400, 400); 
  background (240);
}

void draw() {

  fill (255, 236, 129);
  stroke (255, 236, 129);
  circle (200, 150, 150);

  rect (126, 159, 25, 50);
  circle (140, 210, 25);

  rect (165, 210, 25, 40);
  circle (178, 250, 25);

  rect (210, 210, 25, 90);
  circle (223, 300, 25);

  rect (250, 150, 25, 90);
  circle (263, 240, 25);

  triangle (130, 250, 150, 250, 140, 235);
  circle (140, 257, 25);

  triangle (251, 280, 275, 280, 264, 265);
  circle (263, 285, 25);

  fill (0);
  stroke (0);
  strokeWeight (1);

  // Ojo izquierdo 
  circle (170, 140, 25);

  rect (177, 140, 5, 15);
  circle (180, 155, 5);

  rect (170, 150, 5, 10);
  circle (173, 160, 5);

  // Ojo derecho
  circle (230, 140, 25);

  rect (217, 140, 5, 10);
  circle (220, 150, 5);

  rect (233, 150, 5, 10);
  circle (236, 160, 5);

  // Iluminación ojos
  fill (255);
  circle (165, 135, 10);
  circle (225, 135, 10);
  circle (173, 133, 5);
  circle (233, 133, 5);

  // Boca
  fill (0);
  strokeWeight (5);
  line (160, 175, 240, 175);

  strokeWeight (1);
  rect (224, 174, 10, 10);
  circle (229, 183, 10); 

  rect (210, 174, 10, 20);
  circle (215, 193, 10); 

}
