class IPiece extends Piece {

  /*
   orientation = 0 --> on its side - center is third from the left
   orientation = 1 --> upright - center is third from the top
   orientation = 2 --> on its side - center is second from the left
   orientation = 3 --> upright - center is second from the top
   */

  IPiece(int r, int c, Board b) { 
    super(r, c, b);
    cords = new int[]{r, c-2, r, c-1, r, c+1};
  }

  void rot() {
    if (orientation == 0) {
      if (b.grid[r-2][c] == 0 && b.grid[r-1][c] == 0 && b.grid[r+1][c] == 0) {
        undisplay();
        r+=1; //0 -> 1
        cords[0]=r-2;
        cords[1]=c;
        cords[2]=r-1;
        cords[3]=c;
        cords[4]=r+1;
        cords[5]=c;
        display();
      }
    } else if (orientation == 1) {
      if (b.grid[r][c-2] == 0 && b.grid[r][c-1] == 0 && b.grid[r][c+1] == 0) {
        undisplay();
        c-=1; //1 -> 2
        cords[0]=r;
        cords[1]=c-1;
        cords[2]=r;
        cords[3]=c+1;
        cords[4]=r;
        cords[5]=c+2;
        display();
      }
    } else if (orientation == 2) {
      if (b.grid[r-2][c] == 0 && b.grid[r-1][c] == 0 && b.grid[r+1][c] == 0) {
        undisplay();
        r-=1; //2 -> 3
        cords[0] = r-1;
        cords[1] = c;
        cords[2] = r+1;
        cords[3] = c;
        cords[4] = r+2;
        cords[5] = c;
        display();
      }
    } else { //orientation == 3
      if (b.grid[r][c-1] == 0 && b.grid[r][c+1] == 0 && b.grid[r][c+2] == 0) {
        undisplay();
        c+=1; //3 -> 0
        cords[0] = r;
        cords[1] = c-2;
        cords[2] = r;
        cords[3] = c-1;
        cords[4] = r;
        cords[5] = c+1;
        display();
      }
      orientation = (orientation + 1)%4;
    }
  }

  boolean isColliding() {
    if (r == b.gridHeight()-1) return true;
    return true;
    /*
    if (orientation == 0) {
     return b.grid[x-2][y+1] != 0 && b.grid[x-1][y+1] != 0 &&
     b.grid[x][y+1] != 0 && b.grid[x+1][y+1] != 0;
     }
     if (orientation == 1) {
     return b.grid[x][y+2] != 0;
     }
     if (orientation == 2) {
     return b.grid[x-1][y+1] != 0 && b.grid[x][y+1] != 0 &&
     b.grid[x+1][y+1] != 0 && b.grid[x][y+1] != 0;
     }
     //orientation == 3
     return b.grid[x][y+3]!=0;
     */
  }

  void undisplay() {
    for (int i = 0; i < cords.length; i += 2) {
      b.grid[cords[i]][cords[i+1]] = 0;
    }
     b.grid[r][c] = 0;
  }

  void display() {
    for (int i = 0; i < cords.length; i += 2) {
      b.grid[cords[i]][cords[i+1]] = 2;
    }
    b.grid[r][c] = 2;
  }
}
