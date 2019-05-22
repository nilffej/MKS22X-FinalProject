class OPiece extends Piece {

  OPiece(int x, int y, Board b) { //center is the top left tile
    super(x, y, b);
  }

  boolean isColliding() { //return if the spaces under are empty
    return b.grid[x][y+2]!=0 && b.grid[x+1][y+2]!=0;
  }

  void rot() {
  }
}
