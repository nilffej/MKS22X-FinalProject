class SPiece extends Piece {
  /*
  orientation = 0 --> regular S shape center is the bottom right piece in the "s"
   orientation = 1 --> vertical S center is the middle left piece
   orientation = 2 --> regular S center is the top left
   orientation = 3 --> certical s center is the middle right piece
   */

  SPiece(int r, int c, Board b) {
    super(r, c, b);
    cords = new int[]{r, c-1, r-1, c, r-1, c+1};
    col = 5;
  }

  void rot() {
    if (orientation == 0) {
      if (b.grid[r-1][c] == 0 && b.grid[r][c+1] == 0 && b.grid[r+1][c+1] == 0) {
        undisplay();
        cords = new int[]{r-1, c, r, c+1, r+1, c+1};
        display();
        orientation = 1;
      }
    } else if (orientation == 1) {
      if (b.grid[r+1][c-1] == 0 && b.grid[r+1][c] == 0 && b.grid[r][c+1] == 0) {
        undisplay();
        cords = new int[]{r+1, c-1, r+1, c, r, c+1};
        display();
        orientation = 2;
      }
    } else if (orientation == 2) {
      if (b.grid[r-1][c-1] == 0 && b.grid[r][c-1] == 0 && b.grid[r+1][c] == 0) {
        undisplay();
        cords = new int[]{r-1, c-1, r, c-1, r+1, c};
        display();
        orientation = 3;
      }
    } else { //orientation == 3
      if (b.grid[r][c-1] == 0 && b.grid[r-1][c] == 0 && b.grid[r-1][c+1] == 0) {
        undisplay();
        cords = new int[]{r, c-1, r-1, c, r-1, c+1};
        display();
        orientation = 0;
      }
    }
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
    if (orientation == 0) {
      return checkCords(new int[]{r,c-2,r+1,c-1});
    }
    if (orientation == 1) {
      return checkCords(new int[]{r,c-1,r-1,c-1,r+1,c});
    }
    if (orientation == 2) {
      return checkCords(new int[]{r,c-1,r-1,c-2});
    }
    if (orientation == 3) {
      return checkCords(new int[]{r,c-2,r-1,c-2,r+1,c-1});
    }
    return true;
  }

  boolean checkRight() {
    return true;
  }
}