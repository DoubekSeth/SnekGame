class SnekTail {
  int count;
  int speed = 5;
  int x;
  int y;
  
  SnekTail(int count) {
    this.count = count;
    if (mySnekTail[0] == null) {
      x = mySnekHead.x;
      y = mySnekHead.y;
    } else {
      SnekTail lastSegment = mySnekTail[mySnekTail.length - 1];
      if (velocity == 1) {
        x = lastSegment.x;
        y = lastSegment.y+25;
      } else if (velocity == -1) {
       x = lastSegment.x;
       y = lastSegment.y-25;
      } else if (velocity == 2) {
       x = lastSegment.x-25;
       y = lastSegment.y;
      } else if (velocity == -2) {
       x = lastSegment.x+25;
       y = lastSegment.y;
      }
    }
  }
  
  void display() {
    fill(#00E824);
    rect(x, y, 25, 25);
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
}