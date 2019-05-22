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
    x -= 1;
  }
  void moveRight() {
    x += 1;
  }
  void moveDown() {
    y += 1;
  }
  abstract boolean isColliding();
  abstract void rot();
}
