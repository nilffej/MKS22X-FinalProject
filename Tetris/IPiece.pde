class IPiece extends Piece {

  /*
  orientation = 0 --> upright - center is second from the top
   orientation = 1 --> on its side - center is third from the left
   orientation = 2 --> upright - center is third from the top
   orientation = 3 --> on its side - center is second from the left
   */

  IPiece(int x, int y, Board b) { 
    super(x, y, b);
  }

  void rot() {
    if (orientation == 0) {
    }

    orientation = (orientation + 1)%4;
  }

  boolean isColliding() {
    if (orientation == 0) { 
      return b.grid[x][y+2]!=0;
    }
    if (orientation == 1) {
      return b.grid[x-2][y+1] != 0 && b.grid[x-1][y+1] != 0 &&
        b.grid[x][y+1] != 0 && b.grid[x+1][y+1] != 0;
    }
    return false; //to compile
  }
}
