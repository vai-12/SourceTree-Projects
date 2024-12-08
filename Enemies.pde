// Class representing the "Vile Souls" enemies
class Enemy {
  // The properties for the enemie's x and y position and their speed moving downwards
  float enemyX; 
  float enemyY;
  float speed = 4;

  // Constructor to initialize the enemy's position
 Enemy(float newEnemyX, float newEnemyY) 
  {
   enemyX = newEnemyX;
   enemyY = newEnemyY;
  }
 
 // Default constructor, didn't use this as well.
 Enemy()
 {
 }

// Method to draw the enemy on the screen
  void display() {
   // Set stroke to a yellow and the fill a light cream colour and draw the main circular body of Vile Soul
   stroke(#FFEE29);
   fill(#FFF6E0);
   ellipse(enemyX, enemyY, 50, 50);

   // Aesthetic details for the Vile Souls
   triangle(enemyX - 15, enemyY - 30, enemyX - 12, enemyY - 21, enemyX - 20, enemyY - 15);
   triangle(enemyX - 6, enemyY - 24, enemyX, enemyY - 47, enemyX + 5, enemyY - 24);
   triangle(enemyX + 11, enemyY - 21, enemyX + 15, enemyY - 31, enemyX + 17, enemyY - 18);
   
   // Details for the enemies eyes, light pink outline and bright pink fill for 2 triangles
   stroke(#FFE0EB);
   fill(#FA5DD8);
   triangle(enemyX - 13, enemyY, enemyX - 15, enemyY - 6, enemyX - 1, enemyY + 2);
   triangle(enemyX + 1, enemyY + 2, enemyX + 11, enemyY, enemyX + 12, enemyY - 6);
  }

// Method to update the enemy's position, move the enemy down by increasing its y coordinate
  void update() {
    enemyY = enemyY + speed;
  }
  
   // Check if the enemy is colliding with the player
  boolean isCollidingWithPlayer(float playerPositionX, float playerPositionY) {
   
   // Calculate the distance between the player and enemy
    float distanceFromPlayer = dist(playerPositionX, playerPositionY, enemyX, enemyY);
    
   // If the enemy's distance is greater than 65, reutrn no collision, if lesser than 65 then collision's detected
    if(distanceFromPlayer >= 65) {
      return false;
    }
      else {
        return true;
     }
  }
  
  // Check if the enemy is colliding with a blast
  boolean isCollidingWithBlast(float blastPositionX, float blastPositionY) {
    
    // Calculate the distance between the blast and enemy
    float distanceFromBlast = dist(blastPositionX, blastPositionY, enemyX, enemyY);
    
    // If the enemy's distance from a blast is greater than 65, return no collision, if lesser than 65 then collision's detected
    if(distanceFromBlast >= 65) {
      return false;
    }
      else {
        return true;
    }
  }
}
