class Cherry {
  int x;
  int y;
  
  Cherry(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
   fill(#FA2E0A);
   rect(x, y, 25, 25);
   fill(#00E824);
  }
}
