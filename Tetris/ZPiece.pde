class ZPiece extends Piece {
  /*
  orientation = 0 --> regular S shape center is the bottom right piece in the "s"
   orientation = 1 --> vertical S center is the middle left piece
   orientation = 2 --> regular S center is the top left
   orientation = 3 --> certical s center is the middle right piece
   */

  ZPiece(int r, int c, Board b) {
    super(r, c, b);
    cords = new int[]{r-1, c-1, r-1, c, r, c+1};
    col = 6;
  }

  void rot() {
    if (orientation == 0) {
      if (r > 0 && b.grid[r-1][c+1] == 0 && b.grid[r+1][c] == 0) {
        undisplay();
        cords = new int[]{r-1, c+1, r, c+1, r+1, c};
        display();
      }
    } else if (orientation == 1) {
      if (c > 0 && b.grid[r][c-1] == 0 && b.grid[r+1][c+1] == 0) {
        undisplay();
        cords = new int[]{r, c-1, r+1, c, r+1, c+1};
        display();
      }
    } else if (orientation == 2) {
      if (r < b.grid.length-2 && b.grid[r-1][c] == 0 && b.grid[r+1][c-1] == 0) {
        undisplay();
        cords = new int[]{r+1, c-1, r, c-1, r-1, c};
        display();
      }
    } else { //orientation == 3
      if (c < b.grid[0].length-1 && b.grid[r-1][c-1] == 0 && b.grid[r][c+1] == 0) {
        undisplay();
        cords = new int[]{r-1, c-1, r-1, c, r, c+1};
        display();
      }
    }
    orientation = (orientation + 1)%4;
  }

  boolean isColliding() {
    if (orientation == 0) {
      return b.grid[r+1][c-1] != 0 || b.grid[r+1][c] != 0 || b.grid[r][c+1] != 0;
    }
    if (orientation == 1) {
      return b.grid[r+1][c] != 0 || b.grid[r+2][c+1] != 0;
    }
    if (orientation == 2) {
      return b.grid[r+2][c-1] != 0 || b.grid[r+2][c] != 0 || b.grid[r+1][c+1] != 0;
    }
    //orientation == 3
    return b.grid[r+1][c-1] != 0 || b.grid[r+2][c] != 0;
  }

  boolean checkLeft() {
    return true;
  }

  boolean checkRight() {
    return true;
  }
}
