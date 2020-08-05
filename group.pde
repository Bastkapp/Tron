class Group {
  ArrayList<Player> players = new ArrayList<Player>();
  ArrayList<String> dir = new ArrayList<String>();
  
  Group(Player player, String dir) {
    this.players.add(player);
    this.dir.add(dir);
  }
  
  Group(ArrayList<Player> players, ArrayList<String> dir) {
    this.players = players;
    this.dir = dir;
  }
  
  Group() {}
  
//==============================Draw==============================
  
  void draw() {
    for(Player player : players) {
      player.draw();
    }
  }
  
//==============================Movement==============================
  
  void move() {
    for(int i = 0; i < players.size(); i++) {
      players.get(i).move();
    }
  }
  
//==============================Check==============================

  boolean collisionDetect() {
    for(Player player : players) {
     if(player.collisionDetect(players)) {
       return true;
     }
    }
    return false;
  }

}
