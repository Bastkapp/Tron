class Position {
  float x;
  float y;
  float[] xy;
  
  Position(float x, float y) {
    this.x = x;
    this.y = y;
    this.xy = new float[]{x, y};
  }
  
  Position(Position pos) {
    this.x = pos.x;
    this.y = pos.y;
    this.xy = pos.xy;
  }
  
  Position(Group group) {
    Position pos = pickRand(group);
    this.x = pos.x;
    this.y = pos.y;
    this.xy = new float[]{pos.x, pos.y};
  }
  
  void same() {
    if(this.xy[0] != this.x || this.xy[1] != this.y) {
      this.x = this.xy[0];
      this.y = this.xy[1];
    }
  }
  
  Position pickRand(Group group) {
    Grid grid = new Grid();
    
    return grid.positions.get((int) random(0, grid.positions.size()));
  }
}
