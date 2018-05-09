class SnekTail {
  int count;
  int speed = 5;
  int x;
  int y;
  int moveX = (int)nodes.get(nodes.size() - 2);
  int moveY = (int)nodes.get(nodes.size() - 1);
  
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
  
  void move() {
    if (y == mySnekHead.y && velocity == 2) {
     x += speed;
    } else if (y == mySnekHead.y && velocity == -2) {
     x -= speed;
    } else if (x == mySnekHead.x && velocity == 1) {
     y -= speed; 
    } else if (x == mySnekHead.x && velocity == -1) {
     y += speed; 
    } else if(x > moveX) {
     x -= speed;
    } else if (x < moveX) {
     x += speed;
    } else if (y < moveY) {
     y += speed;
    } else if (y > moveY) {
     y -= speed;
    } else if (y == moveY && x == moveX) {
     setNode();
    }
   }
   
   void setNode() {
      moveX = (int)nodes.get(moveX+2);
      moveY = (int)nodes.get(moveY+2);
   }
}