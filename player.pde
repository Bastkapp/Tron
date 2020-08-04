class Player {
  ArrayList<Section> sections = new ArrayList<Section>();
  float step;
  String lastDir;
  String dir;
  Position pos;
  color clr;
  
  Player(Position pos, color clr, String lastDir) {
    this.pos = pos;
    this.clr = clr;
    this.lastDir = lastDir;
    this.step = new Section().size;
    sections.add(new Section(pos, clr));
  }
  
  void setPos(float x) {
    pos.x = x;
  }
  
//==========================Movement==========================

  void move(String dir) {
    this.dir = dir;
    printPos(pos);
    newPos();
    printPos(pos);
    remOverhang();
    sections.add(new Section(pos, clr));
  }
    
  void remOverhang() {
    for(int i = 0; i <= 1; i++) {
      float side =(i == 0)? width : height;
      if(pos.xy()[i] < 0) {
        pos.xy()[i] = side - step;
      } else if(side < pos.xy()[i] + step) {
        pos.xy()[i] = 0;
      }
    }
  }
    
  void newPos() {
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
  }
  void newPos(String dir) {
    switch (dir) {
      case "up":
        pos.y = pos.y - step;
        break;
      case "left":
        pos.x = pos.x - step;
        break;
      case "down":
        pos.y = pos.y + step;
        break;
      case "right":
        pos.x = pos.x + step;
        break;
    }
    
    remOverhang(step);
    /*
    if(pos.x == pos.x && pos.y == pos.y) {
      println(printPos(pos) + printPos(pos));
      pos = newPos(pos, dir);
    }*/
  }
  
  float[] remOverhang(float step) {
    if(pos.x < 0) {
      pos.x = width - step;
    } else if(width < pos.x + step) {
      pos.x = 0;
    }
    
    if(pos.y < 0) {
      pos.y = height - step;
    } else if(height < pos.y + step) {
      pos.y = 0;
    }
  }
    
  void posUp() {
    pos.y = pos.y - step;
  }
  
  void posDown() {
    pos.y = pos.y + step;
  }
  
  void posLeft() {
    pos.x = pos.x - step;
  }
  
  void posRight() {
    pos.x = pos.x + step;
  }
  
//==========================Draw==========================
  
  void draw() {
    fill(clr);
    noStroke();
    for(int i = 0; i < sections.size(); i++) {
     sections.get(i).draw();
    }
  }
  
//==========================Others==========================
  
  
  void printPos(Position pos) {
    System.out.println(pos.xy());
  }
  
  ArrayList<Section> getSections() {
    return sections;
  }

  boolean checkHit(ArrayList<Player> players) {
    for(Player player : players) {
      for(int i = 0; i < player.sections.size()-1;i++) {
        if(pos.x == player.sections.get(i).pos.x && pos.y == player.sections.get(i).pos.y) {
          return true;
        }
      }
    }
    return false;
  }
}
