class LPiece extends Piece {

  /*
  center is second from the top of the "L"
   orientation = 0 --> on its side - long side on the bottom
   orientation = 1 --> upright - regular L
   orientation = 2 --> on its side - short side on bottom
   orientation = 3 --> upright - upsidedown L
   */

  LPiece(int r, int c, Board b) {
    super(r, c, b);
    cords = new int[]{r, c-1, r, c+1, r-1, c+1};
    col = 3;
  }

  void rot() {
    if (orientation == 0) {
      if (b.grid[r-1][c] == 0 && b.grid[r+1][c] == 0 && b.grid[r+1][c+1] == 0) {
        undisplay();
        cords = new int[]{r-1,c,r+1,c,r+1,c+1};
        display();
      }
    } else if (orientation == 1) {
      if (c > 0 && c < b.grid[0].length-1 && b.grid[r+1][c-1] == 0 && b.grid[r][c-1] == 0 && b.grid[r][c+1] == 0) {
        undisplay();
        cords = new int[]{r+1,c-1,r,c-1,r,c+1};
        display();
      }
    } else if (orientation == 2) {
      if (b.grid[r-1][c-1] == 0 && b.grid[r-1][c] == 0 && b.grid[r+1][c] == 0) {
        undisplay();
        cords = new int[]{r-1,c-1,r-1,c,r+1,c};
        display();
      }
    } else { //orientation == 3
      if (c > 0 && c < b.grid[0].length-1 && b.grid[r][c-1] == 0 && b.grid[r][c+1] == 0 && b.grid[r-1][c+1] == 0) {
        undisplay();
        cords = new int[]{r,c-1,r,c+1,r-1,c+1};
        display();
      }
    }
    orientation = (orientation + 1)%4;
  }

  boolean isColliding() {
    if (orientation == 0) {
      return b.grid[r+1][c-1] != 0 || b.grid[r+1][c] != 0 || b.grid[r+1][c+1] != 0;
    }
    if (orientation == 1) {
      return b.grid[r+2][c] != 0 || b.grid[r+2][c+1] != 0;
    }
    if (orientation == 2) {
      return b.grid[r+2][c-1] != 0 || b.grid[r+1][c] != 0 || b.grid[r+1][c+1] != 0;
    }
    //orientation == 3
    return b.grid[r][c-1] != 0 || b.grid[r+2][c] != 0;
  }

  boolean checkLeft() {
    if(orientation == 0){
      return c <= 1 || b.grid[r][c-2] != 0 || b.grid[r-1][c] != 0;
    }
    if(orientation == 1){
      return c <= 0 || b.grid[r-1][c-1] != 0 || b.grid[r][c-1] != 0 || b.grid[r+1][c-1] != 0;
    }
    if(orientation == 2){
      return c <= 1 || b.grid[r][c-2] != 0 || b.grid[r+1][c-2] != 0;
    }
    //orientation = 3
    return c <= 1 || b.grid[r-1][c-2] != 0 || b.grid[r][c-1] != 0 || b.grid [r+1][c-1] !=0;
  }

  boolean checkRight() {
    return true;
  }
}