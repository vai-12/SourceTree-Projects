// The player position on the screen
float playerX = 180; 
float playerY = 280; 

// The player's width
int playerWidth;

// List to store the player's eldritch blasts
ArrayList<Blast> blasts = new ArrayList<Blast>();

// List to store enemies objects
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

// Frequency of enemy spawning in
int enemySpawnRate = 60;

// Tracks if the player is alive
boolean isPlayerAlive = true;

// Player's score in the game is known as "Arcane Power"
int arcanePower = 0;


// Setup the game window to a size of 400 by 400 pixels
void setup() {
  size(400, 400);
}

// Main game loop, responsible for drawing all the required elements continuously
void draw() {

  // If the player is dead, set the background to black and show the game end screen
  if(isPlayerAlive == false) {
    background(0);
    displayGameOver();
  }
  // If the player's alive, draw the background and the ground
    else {
      stroke(0);
      background(#6D69A7);
      rectMode(CORNER);
      fill(#AD8A75);
      rect(0, 376, 400, 400);
    
  // Render the player and game elements: the player character, the blasts, the enemies and the score
      drawPlayer();
      handlePlayer();
      handleBlasts();
      handleEnemies();
      displayArcanePower();
  }
}

// Draw the player's character - The Demon - on the screen  
void drawPlayer()  {
   
  // Draw The Demon, start by creating light grey horns on the head
  fill(#CAC5CB);
  stroke(0);
  triangle(playerX - 12, playerY - 16, playerX - 24, playerY - 28, playerX - 16, playerY - 12);
  triangle(playerX + 12, playerY - 16, playerX + 23, playerY - 29, playerX + 16, playerY - 12);

  // Draw The Demon's head next
  fill(#E51515);
  ellipse(playerX, playerY, 40, 40);

  // Draw The Demon's upper body next
  fill(#E51515);
  rect(playerX - 35, playerY + 20, 70, 30);
  rect(playerX - 15, playerY + 50, 30, 20);
  triangle(playerX - 35, playerY + 50, playerX - 15, playerY + 50, playerX - 15, playerY + 68);
  triangle(playerX + 15, playerY + 50, playerX + 15, playerY + 68, playerX + 35, playerY + 50);
  
  // Draw The Demon's arms, with his right arm outstretched with four fingers splayed out
  quad(playerX - 35, playerY + 20, playerX - 60, playerY + 60, playerX - 55, playerY + 60, playerX - 35, playerY + 45);
  rect(playerX - 60, playerY + 60, 10, 10);
  quad(playerX + 35, playerY + 20, playerX + 60, playerY - 7, playerX + 65, playerY - 7, playerX + 35, playerY + 45);
  rect(playerX + 58, playerY - 15, 10, 10);
  triangle(playerX + 50, playerY - 13, playerX + 58, playerY - 13, playerX + 58, playerY - 10);
  triangle(playerX + 53, playerY - 21, playerX + 58, playerY - 15, playerX + 61, playerY - 15);
  triangle(playerX + 61, playerY - 23, playerX + 61, playerY - 15, playerX + 64, playerY - 15);
  triangle(playerX + 65, playerY - 22, playerX + 64, playerY - 15, playerX + 65, playerY - 15);

  // Draw The Demon's lower body next, wearing black pants and brown shoes
  fill(0);
  quad(playerX - 15, playerY + 68, playerX - 25, playerY + 90, playerX - 20, playerY + 90, playerX, playerY + 75);
  triangle(playerX - 15, playerY + 68, playerX, playerY + 75, playerX + 15, playerY + 68);
  quad(playerX, playerY + 75, playerX + 18, playerY + 90, playerX + 23, playerY + 90, playerX + 15, playerY + 68);
  fill(#715A34);
  quad(playerX - 25, playerY + 90, playerX - 30, playerY + 96, playerX - 19, playerY + 96, playerX - 20, playerY + 90);
  quad(playerX + 18, playerY + 90, playerX + 17, playerY + 96, playerX + 29, playerY + 96, playerX + 23, playerY + 90);
}

// Handle the player's movement and constraints
 void handlePlayer() {
 // Player movement, check for a key press. Move left if 'a' is pressed and right if 'd' is pressed
  if (keyPressed) {
    if (key == 'a' || key == 'A') playerX -= 5;
    if (key == 'd' || key == 'D') playerX += 5;
  }

 // Constrain player to screen
  playerX = constrain(playerX, 0, width - playerWidth);  
}

// Handle logic for the eldritch blasts  
void handleBlasts() {
  // Get the current blast, update its position, draw the blast then remove it once it leaves the screen
  for (int i = blasts.size() - 1; i >= 0; i--) {
    Blast b = blasts.get(i);
    b.update();
    b.display();
    
    if (b.blastY < 0) {
      blasts.remove(i);
    }
  }
}  

// Display the arcane power score on the screen in a light blue text on the top left corner
void displayArcanePower() {
  fill(#0AC5F2);
  textSize(20);
  textAlign(CORNER, CORNER);
  text("Arcane Power:" + arcanePower, 10, 20);
}

// Display the game end screen in a red text in the center of the screen
void displayGameOver() {
  background(0);
  fill(#F20A12);
  textSize(25);
  textAlign(CENTER, CENTER);
  text("The Vile Souls have won...", width/ 2, height/ 2);
  textSize(18);
  text("Arcane Power Absorbed:" + arcanePower, width/ 2, height/ 2 + 50);
  text("...Or are you just getting started? Press 'R' to retry", width/ 2, height/ 2 + 100);
}

// Handle the key presses for shooting and restarting the game. Spacebar is to shoot and pressing 'r' restarts the game
void keyPressed() {
  if(key == ' ') {
    blasts.add(new Blast(playerX + 60, playerY - 20));
  }
// Key to press in order to restart the game without closing the program
  if(key == 'r' || key == 'R') {
    resetGame();
  }
}

// Reset the game state for a new game. Revive the player, reset the score, remove all blasts and all enemies
void resetGame() {
  if(isPlayerAlive == false) {
    isPlayerAlive = true;
    arcanePower = 0;
    enemies.clear();
    blasts.clear();
  }
}

// Handle all the elements for enemies: 
// Their spawn, updating their position, displaying them to screen and whether they are colliding with the player or blast
void handleEnemies() {
  if(frameCount % enemySpawnRate == 0) {
    enemies.add(new Enemy(random(width), -20));
  }
// Update and draw enemies
  for(int i = enemies.size() - 1; i >= 0; i--) {
    Enemy e = enemies.get(i);
    e.update();
    e.display();
    e.isCollidingWithPlayer(playerX, playerY);
// Increase the speed of enemies' assualt after attaining '5' arcane power score    
    if(arcanePower >= 5) {
      e.speed = 8;
  }
  
  //If the enemy hits the player, player dies
    if(e.isCollidingWithPlayer(playerX, playerY) == true) {
      isPlayerAlive = false;
  }
   
  // Get the current blast, check for collision, if it does connect, remove the blast, then enemy and increase arcane power  
    for(int j = blasts.size() - 1; j >= 0; j--) {
      Blast b = blasts.get(j);
      e.isCollidingWithBlast(b.blastX, b.blastY);
      
      if(e.isCollidingWithBlast(b.blastX, b.blastY) == true) {
        blasts.remove(j);
        enemies.remove(i);
        arcanePower++;
   }
  } 
 }
}
