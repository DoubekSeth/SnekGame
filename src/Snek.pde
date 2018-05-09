boolean gameOver;
Cherry cherry;
SnekHead mySnekHead;
SnekTail[] mySnekTail;
int count;
int velocity;
ArrayList nodes = new ArrayList();

void setup() {
 size(1250, 900);
 background(0, 0, 0);
 gameOver = true;
 cherry = new Cherry(int(random(50, width-50)), int(random(50, height-50)));
 mySnekHead = new SnekHead(width/2, height/2, 5);
 noStroke();
 mySnekTail = new SnekTail[1];
 count = 25;
}

void draw() {
  if(gameOver == true) {
    background(0, 0, 0);
    cherry.display();
    mySnekHead.display();
    keyPress();
    edgeDetection();
    hitCherry();
    for(int i = 0; i < mySnekTail.length; i++) {
      if(mySnekTail[0] != null) {
        mySnekTail[i].display();
        mySnekTail[i].move();
      }
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
    nodes.add(mySnekHead.x);
    nodes.add(mySnekHead.y);
    key = ' ';
    velocity = 1;
  } else if (key == 's') {
    nodes.add(mySnekHead.x);
    nodes.add(mySnekHead.y);
    key = ' ';
    velocity = -1;
  } else if (key == 'a') {
    nodes.add(mySnekHead.x);
    nodes.add(mySnekHead.y);
    key = ' ';
    velocity = -2;
  } else if (key == 'd') {
    nodes.add(mySnekHead.x);
    nodes.add(mySnekHead.y);
    key = ' ';
    velocity = 2;
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
     count += 25;
     mySnekTail = (SnekTail[])append(mySnekTail, new SnekTail(count));
     count += 25;
    } else {
     mySnekTail = (SnekTail[])append(mySnekTail, new SnekTail(count));
     count += 25;
     mySnekTail = (SnekTail[])append(mySnekTail, new SnekTail(count));
     count += 25;
   }
   cherry = new Cherry(int(random(50, width-50)), int(random(50, height-50)));
   printArray(mySnekTail);
 }
}