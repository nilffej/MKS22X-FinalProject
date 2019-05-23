abstract class Piece {
  int x;
  int y;
  int orientation;
  Board b;

  Piece(int x, int y, Board b) {  
    this.x = x;
    this.y = y;
    this.b = b;
    orientation = 0;
  }

  void moveLeft() {
    y -= 1;
  }
  void moveRight() {
    y += 1;
  }
  void moveDown() {
    x += 1;
    System.out.println("Shifted down.");
  }
  String toString(){
    return "Piece";
  }
  
  abstract boolean isColliding();
  abstract void rot();
  abstract void display();
}
