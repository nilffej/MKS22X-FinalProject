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
  
  boolean checkLeft(){
    if(c == 0 || b.grid[r][c-1] != 0 || b.grid[r+1][c-1] != 0) return false;
    return true;
  }
  
  boolean checkRight(){
    if(c == b.grid.length-2 || b.grid[r][c+2] != 0 || b.grid[r+1][c+2] != 0) return false;
    return true;
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
}