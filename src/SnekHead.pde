class SnekHead {
  int x;
  int y;
  int speed;
  
 SnekHead(int x, int y, int speed) {
  this.x = x;
  this.y = y;
  this.speed = speed;
 }
 
 void moveRight() {
   x += speed;
 }
 
 void moveLeft() {
   x -= speed;
 }
 
 void moveUp() {
   y -= speed;
 }
 
 void moveDown() {
   y += speed;
 }
 
 void display() {
   fill(#00E824);
   rect(x, y, 25, 25); 
 }
}