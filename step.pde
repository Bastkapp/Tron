class Step {
  float x;
  float y;
  
  Step() {
    Grid grid = new Grid();
    this.x = grid.gridWidth;
    this.y = grid.gridHeight;
  }
}
