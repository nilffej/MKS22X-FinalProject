class OPiece extends Piece {

  OPiece(int r, int c, Board b) { //center is the top left tile
    super(r, c, b);
    cords = new int[]{r, c+1, r+1, c, r+1, c+1};
    col = 1;
  }

  boolean isColliding() { //return if the spaces under are empty
    return b.grid[r+2][c]!=0 || b.grid[r+2][c+1]!=0;
  }

  void rot() {
  }

  void keyPressed() {
    if (keyCode == LEFT) {
      if (c == 0) return;
      moveLeft();
    } else if (keyCode == RIGHT) {
      if (c + 1 == 9) return;
      moveRight();
    } else if (keyCode == UP) {
      rot();
    } else if (key == ' ') {
      while (!isColliding()) {
        moveDown();
      }
    } else if (keyCode == DOWN) {
      moveDown();
    }
  }

  boolean checkLeft() {
    return true;
  }

  boolean checkRight() {
    return true;
  }
}
