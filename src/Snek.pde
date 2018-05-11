boolean gameOver;
Cherry cherry;
SnekHead mySnekHead;
SnekTail[] mySnekTail;
int count;
int velocity;
ArrayList follow;
int followCount;

void setup() {
 size(1250, 900);
 background(0, 0, 0);
 gameOver = true;
 cherry = new Cherry(int(random(50, width-50)), int(random(50, height-50)));
 mySnekHead = new SnekHead(width/2, height/2, 5);
 noStroke();
 mySnekTail = new SnekTail[1];
 count = 25;
 follow = new ArrayList();
 follow.add("");
}

void draw() {
  if(gameOver == true) {
    background(0, 0, 0);
    cherry.display();
    mySnekHead.display();
    edgeDetection();
    hitCherry();
    for(int i = 0; i < mySnekTail.length; i++) {
      if(mySnekTail[0] != null) {
        mySnekTail[i].display();
      }
    }
     update();
     keyPress();
     if (follow.size() != 1) {
       move();
     }
  } else {
    textSize(26);
    text("You Died", height/2, width/2);
  }
}

void keyPress() {
  if (key == 'w') {
    mySnekHead.moveUp();
  } else if (key == 's') {
    mySnekHead.moveDown();
  } else if (key == 'a') {
    mySnekHead.moveLeft(); 
  } else if (key == 'd') {
    mySnekHead.moveRight();
  }
}

void keyPressed() {
  if (key == 'w') {
    key = ' ';
    follow.set(0, "Up");
    velocity = 1;
    loop();
  } else if (key == 's') {
    key = ' ';
    follow.set(0, "Down");
    velocity = -1;
  } else if (key == 'a') {;
    key = ' ';
    follow.set(0, "Left");
    velocity = -2;
  } else if (key == 'd') {
    key = ' ';
    follow.set(0, "Right");
    velocity = 2;
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
}

void hitCherry() {
 if (mySnekHead.x >= cherry.x-24 && mySnekHead.x <= cherry.x+24 && mySnekHead.y >= cherry.y-24 && mySnekHead.y <= cherry.y+24) {
   if (mySnekTail[0] == null) {
     mySnekTail[0] = new SnekTail(count);
     followCount = 1;
     follow.add(follow.get(0));
     count += 25;
     followCount++;
     mySnekTail = (SnekTail[])append(mySnekTail, new SnekTail(count));
     follow.add(follow.get(1));
     count += 25;
    } else {
     mySnekTail = (SnekTail[])append(mySnekTail, new SnekTail(count));
     followCount++;
     follow.add(follow.get(follow.size()-1));
     count += 25;
     mySnekTail = (SnekTail[])append(mySnekTail, new SnekTail(count));
     followCount++;
     follow.add(follow.get(follow.size()-1));
     count += 25;
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

void update() {
    String compareTo;
    for(int i = follow.size()-1; i > 0; i--) {
      compareTo = (String)follow.get(i-1);
      if (compareTo == "Up") {
        follow.set(i, "Up");
      } else if (compareTo == "Down") {
        follow.set(i, "Down");
      } else if (compareTo == "Left") {
         follow.set(i, "Left");
      } else if (compareTo == "Right") {
        follow.set(i, "Right");
      }
    }
   }