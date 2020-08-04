class Section {
  Position pos;
  float size = width/70;
  color clr;
 
  Section(Position pos, color clr) {
    this.pos = pos;
    this.clr = clr;
  }
  
  Section() {}
    
  void draw() {
    fill(0);
    stroke(255);
    rect(pos.x, pos.y, size, size);
  }
}
