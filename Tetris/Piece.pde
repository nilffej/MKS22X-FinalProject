abstract class Piece {
  int r;
  int c;
  int orientation;
  Board b;
  int[] cords;

  Piece(int r, int c, Board b) {  
    this.r = r;
    this.c = c;
    this.b = b;
    orientation = 0;
  }

  void moveLeft() {
    undisplay();
    c -= 1;
    for(int i = 1; i<cords.length;i+=2){
      cords[i]--;
    }
    display();
  }
  void moveRight() {
    undisplay();
    c += 1;
    for(int i = 1; i<cords.length;i+=2){
      cords[i]++;
    }
    display();
  }
  void moveDown() {
    undisplay();
    r += 1;
    for(int i = 0; i<cords.length;i+=2){
      cords[i]++;
    }
    display();
  }

  String toString(){
    return "Piece";
  }
  
  abstract boolean isColliding();
  abstract void rot();
  abstract void display();
  void undisplay() {
    for (int i = 0; i < cords.length; i += 2) {
      b.grid[cords[i]][cords[i+1]] = 0;
    }
     b.grid[r][c] = 0;
  }
}
