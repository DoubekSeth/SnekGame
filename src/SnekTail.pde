class SnekTail {
  int speed = 25;
  int x;
  int y;
  
  SnekTail() {
    if(follow.get(follow.size()-1) == "Up") {
     if(mySnekTail[0] != null) {
       x = mySnekTail[mySnekTail.length-1].x;
       y = mySnekTail[mySnekTail.length-1].y+25;
     } else {
       x = mySnekHead.x; 
       y = mySnekHead.y+25;
     }
    } else if(follow.get(follow.size()-1) == "Down") {
     if(mySnekTail[0] != null) {
       x = mySnekTail[mySnekTail.length-1].x;
       y = mySnekTail[mySnekTail.length-1].y-25;
     } else {
       x = mySnekHead.x; 
       y = mySnekHead.y-25;
     }
    } else if(follow.get(follow.size()-1) == "Right") {
     if(mySnekTail[0] != null) {
       x = mySnekTail[mySnekTail.length-1].x-25;
       y = mySnekTail[mySnekTail.length-1].y;
     } else {
       x = mySnekHead.x-25; 
       y = mySnekHead.y;
     }
    } else if(follow.get(follow.size()-1) == "Left") {
     if(mySnekTail[0] != null) {
       x = mySnekTail[mySnekTail.length-1].x+25;
       y = mySnekTail[mySnekTail.length-1].y;
     } else {
       x = mySnekHead.x+25; 
       y = mySnekHead.y;
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
