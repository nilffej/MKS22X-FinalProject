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
    col = 2;
  }

  void rot() {
    if (orientation == 0) {
      if (b.grid[r-1][c] == 0 && b.grid[r+1][c] == 0 && b.grid[r+2][c] == 0) {
        undisplay();
        r+=1; //0 -> 1
        cords[0]=r-2;
        cords[1]=c;
        cords[2]=r-1;
        cords[3]=c;
        cords[4]=r+1;
        cords[5]=c;
        display();
        orientation = (orientation + 1)%4;
      }
    } else if (orientation == 1) {
      if (c == 0) {
        if (b.grid[r][c+1] == 0 && b.grid[r][c+2] == 0 && b.grid[r][c+3] == 0) {
          undisplay();
          c+=1;
          cords[0]=r;
          cords[1]=c-1;
          cords[2]=r;
          cords[3]=c+1;
          cords[4]=r;
          cords[5]=c+2;
          display();
          orientation = (orientation + 1)%4;
        }
      } else if (c == 1) {
        if (b.grid[r][c-1] == 0 && b.grid[r][c+1] == 0 && b.grid[r][c+2] == 0) {
          undisplay();
          cords[0]=r;
          cords[1]=c-1;
          cords[2]=r;
          cords[3]=c+1;
          cords[4]=r;
          cords[5]=c+2;
          display();
          orientation = (orientation + 1)%4;
        }
      } else if (c == 9) {
        if (b.grid[r][c-1] == 0 && b.grid[r][c-2] == 0 && b.grid[r][c-3] == 0) {
          undisplay();
          c-=2;
          cords[0]=r;
          cords[1]=c-1;
          cords[2]=r;
          cords[3]=c+1;
          cords[4]=r;
          cords[5]=c+2;
          display();
          orientation = (orientation + 1)%4;
        }
      } else if (b.grid[r][c-2] == 0 && b.grid[r][c-1] == 0 && b.grid[r][c+1] == 0) {
        undisplay();
        c-=1; //1 -> 2
        cords[0]=r;
        cords[1]=c-1;
        cords[2]=r;
        cords[3]=c+1;
        cords[4]=r;
        cords[5]=c+2;
        display();
        orientation = (orientation + 1)%4;
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
        orientation = (orientation + 1)%4;
      }
    } else { //orientation == 3
      if (c == 0) {
        if (b.grid[r][c+1] == 0 && b.grid[r][c+2] == 0 && b.grid[r][c+3] == 0) {
          undisplay();
          c+=2;
          cords[0] = r;
          cords[1] = c-2;
          cords[2] = r;
          cords[3] = c-1;
          cords[4] = r;
          cords[5] = c+1;
          display();
          orientation = (orientation + 1)%4;
        }
      } else if (c == 8) {
        if (b.grid[r][c-3] == 0 && b.grid[r][c-2] == 0 && b.grid[r][c-1] == 0) {
          undisplay();
          cords[0] = r;
          cords[1] = c-2;
          cords[2] = r;
          cords[3] = c-1;
          cords[4] = r;
          cords[5] = c+1;
          display();
          orientation = (orientation + 1)%4;
        }
      } else if (c == 9) {
        if (b.grid[r][c-3] == 0 && b.grid[r][c-2] == 0 && b.grid[r][c-1] == 0) {
          undisplay();
          c-=1;
          cords[0] = r;
          cords[1] = c-2;
          cords[2] = r;
          cords[3] = c-1;
          cords[4] = r;
          cords[5] = c+1;
          display();
          orientation = (orientation + 1)%4;
        }
      } else if (b.grid[r][c-1] == 0 && b.grid[r][c+1] == 0 && b.grid[r][c+2] == 0) {
        undisplay();
        c+=1; //3 -> 0
        cords[0] = r;
        cords[1] = c-2;
        cords[2] = r;
        cords[3] = c-1;
        cords[4] = r;
        cords[5] = c+1;
        display();
        orientation = (orientation + 1)%4;
      }
    }
  }

  boolean isColliding() {
    if (orientation == 0) {
      return b.grid[r+1][c-2] != 0 || b.grid[r+1][c-1] != 0 || b.grid[r+1][c] != 0 || b.grid[r+1][c+1] != 0;
    }
    if (orientation == 1) {
      return b.grid[r+2][c] != 0;
    }
    if (orientation == 2) {
      return b.grid[r+1][c-1] != 0 || b.grid[r+1][c] != 0 || b.grid[r+1][c+1] != 0 || b.grid[r+1][c+2] != 0;
    }
    //orientation == 3
    return b.grid[r+3][c] != 0;
  }

  boolean checkLeft() {

    if(orientation == 0) return checkCords(new int[]{r,c-3});
    if(orientation == 1) return checkCords(new int[]{r-2,c-1,r-1,c-1,r,c-1,r+1,c-1});
    if(orientation == 2) return checkCords(new int[]{r,c-2});
    //orientation == 3 
    return checkCords(new int[]{r-1,c-1,r,c-1,r+1,c-1,r+2,c-1});
  }

  boolean checkRight() {
    if (orientation == 0 && (c >= b.grid[0].length-2 || b.grid[r][c+2] != 0)) return false;
    if (orientation == 2 && (c >= b.grid[0].length-3 || b.grid[r][c+3] != 0)) return false;
    if (orientation == 1 || orientation == 3) {
      for (int i =1; i < cords.length; i+=2) {
        if (cords[i] >= b.grid[0].length-1 || b.grid[cords[i-1]][cords[i]+1]!=0 || 
          c >= b.grid[0].length-1 || b.grid[r][c+1] != 0) return false;
      }
    }
    return true;
  }
  
  
}
