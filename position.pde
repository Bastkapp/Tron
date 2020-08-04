class Position {
  float x;
  float y;
  
  Position(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  float[] xy() {
    return new float[]{x, y};
  }
  
  void x(float x) {
    this.x = x;
  }
  
  void y(float y) {
    this.y = y;
  }
}
