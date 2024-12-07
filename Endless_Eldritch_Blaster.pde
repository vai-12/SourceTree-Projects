float playerX = 180; 
float playerY = 280; 
int playerWidth;
ArrayList<Blast> blasts = new ArrayList<Blast>();
Enemy e1 = new Enemy();


// Setup the project
void setup() {
  size(400, 400);
}

// Draw the background and the ground 
void draw() {
  stroke(0);
  background(#6D69A7);
  rectMode(CORNER);
  fill(#AD8A75);
  rect(0, 376, 400, 400);
  drawPlayer();
  handlePlayer();
  handleBlasts();
  e1.display();

}

  
void drawPlayer()  {
   // Draw the Demon, start by creating the horns on the head
  fill(#CAC5CB);
  stroke(0);
  triangle(playerX - 12, playerY - 16, playerX - 24, playerY - 28, playerX - 16, playerY - 12);
  triangle(playerX + 12, playerY - 16, playerX + 23, playerY - 29, playerX + 16, playerY - 12);

  // Draw the Demon's head next
  fill(#E51515);
  ellipse(playerX, playerY, 40, 40);

  // Draw the Demon's upper body next
  fill(#E51515);
  rect(playerX - 35, playerY + 20, 70, 30);
  rect(playerX - 15, playerY + 50, 30, 20);
  triangle(playerX - 35, playerY + 50, playerX - 15, playerY + 50, playerX - 15, playerY + 68);
  triangle(playerX + 15, playerY + 50, playerX + 15, playerY + 68, playerX + 35, playerY + 50);
  quad(playerX - 35, playerY + 20, playerX - 60, playerY + 60, playerX - 55, playerY + 60, playerX - 35, playerY + 45);
  rect(playerX - 60, playerY + 60, 10, 10);
  quad(playerX + 35, playerY + 20, playerX + 60, playerY - 7, playerX + 65, playerY - 7, playerX + 35, playerY + 45);
  rect(playerX + 58, playerY - 15, 10, 10);
  triangle(playerX + 50, playerY - 13, playerX + 58, playerY - 13, playerX + 58, playerY - 10);
  triangle(playerX + 53, playerY - 21, playerX + 58, playerY - 15, playerX + 61, playerY - 15);
  triangle(playerX + 61, playerY - 23, playerX + 61, playerY - 15, playerX + 64, playerY - 15);
  triangle(playerX + 65, playerY - 22, playerX + 64, playerY - 15, playerX + 65, playerY - 15);

  // Draw the Demon's lower body next
  fill(0);
  quad(playerX - 15, playerY + 68, playerX - 25, playerY + 90, playerX - 20, playerY + 90, playerX, playerY + 75);
  triangle(playerX - 15, playerY + 68, playerX, playerY + 75, playerX + 15, playerY + 68);
  quad(playerX, playerY + 75, playerX + 18, playerY + 90, playerX + 23, playerY + 90, playerX + 15, playerY + 68);
  fill(#715A34);
  quad(playerX - 25, playerY + 90, playerX - 30, playerY + 96, playerX - 19, playerY + 96, playerX - 20, playerY + 90);
  quad(playerX + 18, playerY + 90, playerX + 17, playerY + 96, playerX + 29, playerY + 96, playerX + 23, playerY + 90);
}
 
 void handlePlayer() {
 // Player movement
  if (keyPressed) {
    if (key == 'a' || key == 'A') playerX -= 5;
    if (key == 'd' || key == 'D') playerX += 5;
  }

  // Constrain player to screen
  playerX = constrain(playerX, 0, width - playerWidth);
  
}
  
void handleBlasts() {
  for (int i = blasts.size() - 1; i >= 0; i--) {
    Blast b = blasts.get(i);
    b.update();
    b.display();
    
    if (b.blastY < 0) {
      blasts.remove(i);
    }
  }
}  

void keyPressed() {
  if(key == ' ') {
    blasts.add(new Blast(playerX + 60, playerY - 20));
  }
}

  
