// Draw the Vile Souls
class Enemy {
  float enemyX; 
  float enemyY;
  float speed = 4;

// Constructor to initialize the enemy's position
 Enemy(float newEnemyX, float newEnemyY) {
   enemyX = newEnemyX;
   enemyY = newEnemyY;
  }
 Enemy()
 {
 }

  void display() {
   stroke(#FFEE29);
   fill(#FFF6E0);
   ellipse(enemyX, enemyY, 50, 50);

// Triangles relative to the enemy's position
   triangle(enemyX - 15, enemyY - 30, enemyX - 12, enemyY - 21, enemyX - 20, enemyY - 15);
   triangle(enemyX - 6, enemyY - 24, enemyX, enemyY - 47, enemyX + 5, enemyY - 24);
   triangle(enemyX + 11, enemyY - 21, enemyX + 15, enemyY - 31, enemyX + 17, enemyY - 18);

   stroke(#FFE0EB);
   fill(#FA5DD8);

   triangle(enemyX - 13, enemyY, enemyX - 15, enemyY - 6, enemyX - 1, enemyY + 2);
   triangle(enemyX + 1, enemyY + 2, enemyX + 11, enemyY, enemyX + 12, enemyY - 6);
  }
  
  void update() {
    enemyY = enemyY + speed;
  }
  boolean isCollidingWithPlayer(float playerPositionX, float playerPositionY) {
    float distanceFromPlayer = dist(playerPositionX, playerPositionY, enemyX, enemyY);
    if(distanceFromPlayer >= 65) {
      return false;
    }
      else {
        return true;
     }
  }
}
