import java.util.Arrays;
Group group;
Grid grid;
color bg = color(#0c141f);
color text = color(230,255,255);
int i;
boolean pause = false;
String status = "unbegun";
PFont font;

// Add new player color here
color blue = color(111, 195, 223);
color orange = color(223, 116, 16);
color pink = color(217, 17, 187);


void setup() {
  size(600, 600);
  surface.setTitle("Tron");
  surface.setResizable(false);
  surface.setLocation(100, 100);
  frameRate(15);
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
  } else if(status("collision")) {
    endGame();
  }
    
}

// ==============================Start==============================
void startGame() {
  group = setPlayers();
  background(bg);
  grid = new Grid();
  grid.draw();
  status = "run";
}



//==============================End==============================

void endGame() {
  if(i == 0) {
    background(255, 16, 83);
    status = "start";
  }
}  

//==============================Running==============================
void runGame() {
  group.draw();
  group.move();
  
  if(group.collisionDetect()) {
    status = "collision";
  }
}

//==============================Keypress==============================

void keyPressed() {
  // Add new player Movement here
  getMovement(group.players.get(0), 'w', 'a', 's', 'd');
  getMovement(group.players.get(2), 'i', 'j', 'k', 'l');
  
  if(key == CODED) {
    Player player = group.players.get(1);
    switch(keyCode) {
      case UP:
        player.dir = "up";
        break;
      case LEFT:
        player.dir = "left";
        break;
      case DOWN:
        player.dir = "down";
        break;
      case RIGHT:
        player.dir = "right";
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

void getMovement(Player player, char up, char left, char down, char right) {
  if(key == up || key == left || key == down || key == right) {
    if(key == up) player.dir = "up";
    else if(key == left) player.dir = "left";
    else if(key == down) player.dir = "down";
    else if(key == right) player.dir = "right";
    System.out.println(player.dir);
  }
}

//==============================Players==============================

Group setPlayers() {
  // Add new Player here
  Player[] pArray = {
    new Player(new Position(group), blue, "right"),
    new Player(new Position(group), orange, "left"),
    new Player(new Position(group), pink, "down")
  };    
  
  ArrayList<Player> players = new ArrayList<Player>(Arrays.asList(pArray));
  ArrayList<String> dir = new ArrayList<String>();
  for(Player player : players) {
    dir.add(player.lastDir);
  }
  
  return new Group(players, dir);
}

//==============================Others==============================

boolean status(String status) {
  return this.status.equals(status);
}
