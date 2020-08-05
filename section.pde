class Section {
  Position pos;
  float sizeW;
  float sizeH;
  color clr;
 
  Section(Position pos, color clr) {
    this.pos = pos;
    this.sizeW = new Step().x;
    this.sizeH = new Step().y;
    this.clr = clr;
  }
  
  Section() {}
    
  void draw() {
    noStroke();
    fill(clr);
    rect(pos.x, pos.y, sizeW, sizeH);
  }
}
