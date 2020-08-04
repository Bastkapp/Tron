Player player1;
Player player2;
Grid grid = new Grid();
color bg = color(12,20,31);
color blue = color(111,195,223);
color orange = color(223,116,12);
color text = color(230,255,255);
int i;
String[] dir1 = {"right"};
String[] dir2 = {"left"};
boolean pause = false;
String status = "unbegun";
PFont font;

void setup() {
  frameRate(15);
  size(600, 600, P2D);
  textSize(40);
  i = 0;
  textAlign(LEFT);
  status = "start";
  background(bg);
}

void draw() {  
  if(status("start")) {
    startGame();
  } else if(status("run")) {
    runGame();
  }
    
}

// ==============================Start==============================
void startGame() {
  player1 = new Player(new float[]{5, 5}, blue, "right");
  player2 = new Player(new float[]{width-5, height-5}, orange, "left");
  dir1("right");
  dir2("left");
  status = "run";
}



//==============================End==============================

void endGame() {
  if(i == 0) {
    background(255, 16, 83);
    
  }
}  

//==============================Running==============================
void runGame() {
  background(bg);
  player1.draw();
  player2.draw();
  player1.move(dir1());
  player2.move(dir2());
  
  
}

//==============================Keypress==============================

void keyPressed() {
  getMovement(dir1, 'w', 'a', 's', 'd');
  
  if(key == CODED) {
    String[] dir = dir2;
    switch(keyCode) {
      case UP:
        dir[0] = "up";
        break;
      case LEFT:
        dir[0] = "left";
        break;
      case DOWN:
        dir[0] = "down";
        break;
      case RIGHT:
        dir[0] = "right";
        break;
    }
  }
  
  if(key==' ' && pause == false) {
    pause = true;
  } else if(key==' ') {
    pause = false;
  }
}

void keyReleased() {
  if(key == CODED) {
    if(keyCode == ENTER) {
      if(status("lost") || status("running")) {
        status = "start";
        i = 0;
      } else if(status("getUsername")) {
        status = "running";
      }
    }
  }
}

void getMovement(String[] dir, char up, char left, char down, char right) {
  if(key == up || key == left || key == down || key == right) {
    if(key == up) dir[0] = "up";
    else if(key == left) dir[0] = "left";
    else if(key == down) dir[0] = "down";
    else if(key == right) dir[0] = "right";
  }
}

void dir1(String s) {
  this.dir1[0] = s;
}
String dir1() {
  return this.dir1[0];
}

void dir2(String s) {
  this.dir2[0] = s;
}
String dir2() {
  return this.dir2[0];
}

//==============================Others==============================

boolean status(String status) {
  return this.status.equals(status);
}
