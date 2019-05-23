class OPiece extends Piece {

  OPiece(int r, int c, Board b) { //center is the top left tile
    super(r, c, b);
  }

  boolean isColliding() { //return if the spaces under are empty
    return b.grid[r+2][c]!=0 || b.grid[r+2][c+1]!=0;
  }

  void rot() {
  }
  
  void display() {
    b.grid[r][c] = 1;
    b.grid[r][c+1] = 1;
    b.grid[r+1][c] = 1;
    b.grid[r+1][c+1] = 1;
  }
  
  
}
