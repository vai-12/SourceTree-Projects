class Blast {
  float blastX = 240; 
  float blastY = 250;
  float speed = 7;
  
  void display() {
    stroke(#0CF77C);
    fill(#BF95FA);


triangle(blastX - 5, blastY + 8, blastX - 7, blastY + 7, blastX - 3, blastY + 6);
triangle(blastX, blastY + 5, blastX - 10, blastY - 2, blastX - 8, blastY + 1);
triangle(blastX + 2, blastY + 1, blastX + 1, blastY - 2, blastX + 2, blastY - 3);
triangle(blastX + 2, blastY + 5, blastX + 8, blastY + 1, blastX + 8, blastY + 3);
quad(blastX, blastY + 2, blastX - 5, blastY - 8, blastX - 1, blastY - 13, blastX - 2, blastY - 8);
quad(blastX - 1, blastY - 13, blastX + 8, blastY - 26, blastX - 1, blastY - 36, blastX + 4, blastY - 26);
quad(blastX - 1, blastY - 36, blastX - 6, blastY - 41, blastX + 1, blastY - 51, blastX - 9, blastY - 41);
quad(blastX + 1, blastY - 51, blastX + 3, blastY - 60, blastX + 10, blastY - 54, blastX + 1, blastY - 67);
triangle(blastX + 1, blastY - 67, blastX + 1, blastY - 63, blastX - 7, blastY - 59);

stroke(#BF95FA);
fill(#0CF77C);

triangle(blastX - 2, blastY + 5, blastX - 6, blastY + 4, blastX - 12, blastY + 5);
triangle(blastX, blastY + 6, blastX - 2, blastY + 8, blastX - 2, blastY + 11);
triangle(blastX + 3, blastY + 6, blastX + 7, blastY + 7, blastX + 8, blastY + 9);
quad(blastX, blastY - 3, blastX + 2, blastY - 11, blastX - 3, blastY - 20, blastX, blastY - 11);
quad(blastX - 3, blastY - 20, blastX - 5, blastY - 31, blastX + 4, blastY - 42, blastX - 9, blastY - 31);
quad(blastX + 4, blastY - 42, blastX - 5, blastY - 51, blastX + 3, blastY - 51, blastX - 10, blastY - 53);
quad(blastX + 3, blastY - 51, blastX - 1, blastY - 61, blastX - 5, blastY - 58, blastX - 1, blastY - 59);

 }
   void update() {
     blastY = blastY - speed;
   }
}
