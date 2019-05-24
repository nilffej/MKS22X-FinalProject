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
    c -= 1;
    cords = new int[]{r, c-2, r, c-1, r, c+1};
  }
  void moveRight() {
    c += 1;
    cords = new int[]{r, c-2, r, c-1, r, c+1};
  }
  void moveDown() {
    r += 1;
    cords = new int[]{r, c-2, r, c-1, r, c+1};
  }
  String toString(){
    return "Piece";
  }
  
  abstract boolean isColliding();
  abstract void rot();
  abstract void display();
  abstract void undisplay();
}
