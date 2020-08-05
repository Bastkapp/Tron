class Player {
  ArrayList<Section> sections = new ArrayList<Section>();
  Step step;
  String lastDir;
  String dir;
  Position pos;
  color clr;
  int i = 0;
  
  Player(Position pos, color clr, String lastDir) {
    this.pos = pos;
    this.clr = clr;
    this.lastDir = lastDir;
    this.step = new Step();
    sections.add(new Section(pos, clr));
  }
  Player() {
    this.step = new Step();
  }
  
  void setPos(float x) {
    pos.x = x;
  }
  
//==========================Movement==========================

  void move() {
    this.pos = new Position(pos);
    newPos();
    remOverhang();
    sections.add(new Section(pos, clr));
  }
    
  void remOverhang() {
    if(pos.x < 0) {
      pos.x = width - step.x;
    } else if(width < pos.x + step.x) {
      pos.x = 0;
    }
    if(pos.y < 0) {
      pos.y = height - step.y;
    } else if(height < pos.y + step.y) {
      pos.y = 0;
    }
  }
    
  void newPos() {
    if(!(dir != null && dir != "")) {
      dir = lastDir;
    }
    switch (dir) {
      case "up":
        if(!lastDir.equals("down")) {
          posUp();
          lastDir = dir;
        } else {
          dir = lastDir;
          newPos();
        }
        break;
      case "left":
        if(!lastDir.equals("right")) {
          posLeft();
          lastDir = dir;
        } else {
          dir = lastDir;
          newPos();
        }
        break;
      case "down":
        if(!lastDir.equals("up")) {
          posDown();
          lastDir = dir;
        } else {
          dir = lastDir;
          newPos();
        }
        break;
      case "right":
        if(!lastDir.equals("left")) {
          posRight();
          lastDir = dir;
        } else {
          dir = lastDir;
          newPos();
        }
        break;
    }
    remOverhang();
  }
    
  void posUp() {
    pos.y = pos.y - step.y;
  }
  
  void posDown() {
    pos.y = pos.y + step.y;
  }
  
  void posLeft() {
    pos.x = pos.x - step.x;
  }
  
  void posRight() {
    pos.x = pos.x + step.x;
  }
  
//==========================Draw==========================
  
  void draw() {
    sections.get(sections.size()-1).draw();
  }
  
//==========================Others==========================
  
  
  String printPos(Position pos) {
    return "(" + pos.xy[0] + ";" + pos.xy[1] + ")";
  }
  
  ArrayList<Section> getSections() {
    return sections;
  }

  boolean collisionDetect(ArrayList<Player> players) {
    for(Player player : players) {
      for(int i = 0; i < player.sections.size()-1;i++) {
        if(this.pos.x == player.sections.get(i).pos.x && this.pos.y == player.sections.get(i).pos.y) {
          return true;
        }
      }
    }
    return false;
  }
}
