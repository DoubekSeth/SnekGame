boolean gameOver;
Cherry cherry;
SnekHead mySnekHead;
SnekTail[] mySnekTail;
ArrayList follow;

void setup() {
 size(1250, 900);
 background(0, 0, 0);
 gameOver = true;
 cherry = new Cherry(int(random(50, width-50)), int(random(50, height-50)));
 mySnekHead = new SnekHead(width/2, height/2, 25);
 noStroke();
 mySnekTail = new SnekTail[1];
 follow = new ArrayList();
 follow.add("");
 frameRate(15);
}

void draw() {
  if(gameOver == true) {
    background(0, 0, 0);
    fill(#FA2E0A);
    textSize(13);
    text("Your Score is: " + (mySnekTail.length+1), 0, 900);
    fill(#00E824);
    mySnekHead.display();
    edgeDetection();
    hitCherry();
    for(int i = 0; i < mySnekTail.length; i++) {
      if(mySnekTail[0] != null) {
        mySnekTail[i].display();
      }
    }
    cherry.display();
    if (follow.size() != 1) {
       move();
     }
     keyPress();
  } else {
    fill(#FA2E0A);
    textSize(26);
    text("You Died", width/2, height/2);
    text("Your Score is: " + (mySnekTail.length+1), width/2, height/2 + 30);
    fill(#00E824);
  }
}

void keyPress() {
  if (key == 'w') {
    follow.add(0, "Up");
    follow.remove(follow.size()-1);
    mySnekHead.moveUp();
  } else if (key == 's') {
    follow.add(0, "Down");
    follow.remove(follow.size()-1);
    mySnekHead.moveDown();
  } else if (key == 'a') {
    follow.add(0, "Left");
    follow.remove(follow.size()-1);
    mySnekHead.moveLeft();
  } else if (key == 'd') {
    follow.add(0, "Right");
    follow.remove(follow.size()-1);
    mySnekHead.moveRight();
  } else if (key == 'x') {
    printArray(follow);
  }
 }

void edgeDetection() {
 if (mySnekHead.x < 0) {
  gameOver = false; 
 } else if (mySnekHead.x >= 1230) {
  gameOver = false; 
 } else if (mySnekHead.y < 0) {
  gameOver = false; 
 } else if (mySnekHead.y >= 880) {
  gameOver = false;
 }
 for(int i = 0; i < mySnekTail.length; i++) {
   if (mySnekTail[0] != null) {
     if(mySnekHead.x >= mySnekTail[i].x-24 && mySnekHead.x <= mySnekTail[i].x+24 && mySnekHead.y >= mySnekTail[i].y-24 && mySnekHead.y <= mySnekTail[i].y+24) {
      gameOver = false; 
     }
   }
 }
}

void hitCherry() {
 if (mySnekHead.x >= cherry.x-24 && mySnekHead.x <= cherry.x+24 && mySnekHead.y >= cherry.y-24 && mySnekHead.y <= cherry.y+24) {
   if (mySnekTail[0] == null) {
     mySnekTail[0] = new SnekTail();
     follow.add(follow.get(0));
     mySnekTail = (SnekTail[])append(mySnekTail, new SnekTail());
     follow.add(follow.get(1));
    } else {
     mySnekTail = (SnekTail[])append(mySnekTail, new SnekTail());
     follow.add(follow.get(follow.size()-1));
     mySnekTail = (SnekTail[])append(mySnekTail, new SnekTail());
     follow.add(follow.get(follow.size()-1));
   }
   cherry = new Cherry(int(random(50, width-50)), int(random(50, height-50)));
   printArray(mySnekTail);
 }
}

void move() {
 for(int i = 0; i < follow.size()-1; i++) {
  if (follow.get(i) == "Up") {
   mySnekTail[i].moveUp();
  } else if (follow.get(i) == "Down") {
   mySnekTail[i].moveDown();
  } else if (follow.get(i) == "Left") {
   mySnekTail[i].moveLeft(); 
  } else if (follow.get(i) == "Right") {
   mySnekTail[i].moveRight(); 
  }
 }
}
