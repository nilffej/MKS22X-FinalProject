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
    for(int i = 1; i<cords.length;i+=2){
      cords[i]--;
    }
  }
  void moveRight() {
    c += 1;
    for(int i = 1; i<cords.length;i+=2){
      cords[i]++;
    }
  }
  void moveDown() {
    r += 1;
    for(int i = 0; i<cords.length;i+=2){
      cords[i]++;
    }
  }
  String toString(){
    return "Piece";
  }
  
  abstract boolean isColliding();
  abstract void rot();
  abstract void display();
  abstract void undisplay();
}
