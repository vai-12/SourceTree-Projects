// Setup the project
void setup() {
  size(400, 400);
}
// Draw the background and the ground 
void draw() {
  background(#6D69A7);
  rectMode(CORNER);
  fill(#AD8A75);
  rect(0, 376, 400, 400);

// Draw the Demon, start by creating the horns on the head
  fill(#CAC5CB);
  triangle(168, 264, 156, 252, 164, 268);
  triangle(192, 264, 203, 251, 196, 268);
  
// Draw the Demon's head next
  fill(#E51515);
  ellipse(180, 280, 40, 40);

//Draw the Demon's upper body next
  fill(#E51515);
  rect(145, 300, 70, 30);
  rect(165, 330, 30, 20);
  triangle(145, 330, 165, 330, 165, 348);
  triangle(195, 330, 195, 348, 215, 330);
  quad(145, 300, 120, 340, 125, 340, 145, 325);
  rect(120, 340, 10, 10);
  quad(215, 300, 240, 273, 245, 273, 215, 325);
  rect(238, 265, 10, 10);
  triangle(230, 267, 238, 267, 238, 270);
  triangle(233, 259, 238, 265, 241, 265);
  triangle(241, 257, 241, 265, 244, 265);
  triangle(245, 258, 244, 265, 245, 265);
  
//Draw the Demon's lower body next
  fill(0);
  quad(165, 348, 155, 370, 160, 370, 180, 355);
  triangle(165, 348, 180, 355, 195, 348);
  quad(180, 355, 198, 370, 203, 370, 195, 348);
  fill(#715A34);
  quad(155, 370, 150, 376, 161, 376, 160, 370);
  quad(198, 370, 197, 376, 209, 376, 203, 370);
}

  
