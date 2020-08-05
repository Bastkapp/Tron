/**
*
*  Add Pos[][] function move(oldPos, dir) return next pos
*
*/

class Grid {
  color clr = color(#00065c);
  Position pos;
  float gridWidth;
  float gridHeight;
  int count = 100;
  ArrayList<Position> positions;
  
  Grid() { 
    this.count = 100;
    this.gridWidth = width / count;
    while(this.gridWidth > 10) {
      count += 1; 
      this.gridWidth = width / count;
    }
    this.count = 100;
    this.gridHeight = height / count;
    while(this.gridHeight > 10) {
      count += 1;
    }
    this.positions = new ArrayList<Position>();
    getPositions();
  }
  
  void getPositions() {
    for(float x = 0; x < width; x += gridWidth) {
      for(float y = 0; y < height; y += gridHeight) {
        positions.add(new Position(x, y));
      }
    }
  }
  
  void draw() {
    stroke(clr);
    for(float x = gridWidth; x < width; x += gridWidth) {
      line(x, 0, x, height);
    }
    for(float y = gridHeight; y < height; y += gridHeight) {
      line(0, y, width, y);
    }
  }
}
