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
      if (r > 2 && checkCords(new int[]{r-1, c, r+1, c, r+2, c})) {
        undisplay();
        r+=1; //0 -> 1
        cords = new int[]{r-2, c, r-1, c, r+1, c};
        display();
        orientation = 1;
      }
    } else if (orientation == 1) {
      if (!checkLeft()) {
        if (checkCords(new int[]{r, c+1, r, c+2, r, c+3})) {
          undisplay();
          c+=1;
          cords = new int[]{r, c-1, r, c+1, r, c+2};
          display();
          orientation = 2;
        }
      } else if (!checkRight()) {
        if (checkCords(new int[]{r, c-1, r, c-2, r, c-3})) {
          undisplay();
          c-=2;
          cords = new int[]{r, c-1, r, c+1, r, c+2};
          display();
          orientation = 2;
        }
      } else if (checkCords(new int[]{r, c-2, r, c-1, r, c+1})) {
        undisplay();
        c-=1; //1 -> 2
        cords = new int[]{r, c-1, r, c+1, r, c+2};
        display();
        orientation = 2;
      } else if (c == 1) {
        if (checkCords(new int[]{r, c-1, r, c+1, r, c+1})) {
          undisplay();
          cords = new int[]{r, c-1, r, c+1, r, c+2};
          display();
          orientation = 2;
        }
      }
    } else if (orientation == 2) {
      if (checkCords(new int[]{r-2, c, r-1, c, r+1, c})) {
        undisplay();
        r-=1; //2 -> 3
        cords = new int[]{r-1, c, r+1, c, r+2, c};
        display();
        orientation = 3;
      }
    } else { //orientation == 3
      if (!checkLeft()) {
        if (checkCords(new int[]{r, c+1, r, c+2, r, c+3})) {
          undisplay();
          c+=2;
          cords = new int[]{r, c-2, r, c-1, r, c+1};
          display();
          orientation = 0;
        }
      } else if (!checkRight()) {
        if (checkCords(new int[]{r, c-3, r, c-2, r, c-1})) {
          undisplay();
          c-=1;
          cords = new int[]{r, c-2, r, c-1, r, c+1};
          display();
          orientation = 0;
        }
      } else if (!checkCords(new int[]{r,c+2})) {
        if (checkCords(new int[]{r, c-3, r, c-2, r, c-1})) {
          undisplay();
          cords = new int[]{r, c-2, r, c-1, r, c+1};
          display();
          orientation = 0;
        }
      } else if (checkCords(new int[]{r, c-1, r, c+1, r, c+2})) {
        undisplay();
        c+=1; //3 -> 0
        cords = new int[]{r, c-2, r, c-1, r, c+1};
        display();
        orientation = 0;
      }
    }
  }

  boolean isColliding() {
    if (orientation == 0) return !checkCords(new int[]{r+1, c-2, r+1, c-1, r+1, c, r+1, c+1});
    if (orientation == 1) return !checkCords(new int[]{r+2, c});
    if (orientation == 2) return !checkCords(new int[]{r+1, c-1, r+1, c, r+1, c+1, r+1, c+2});
    //orientation == 3
    return !checkCords(new int[]{r+3, c});
  }

  boolean checkLeft() {
    if (orientation == 0) return checkCords(new int[]{r, c-3});
    if (orientation == 1) return checkCords(new int[]{r-2, c-1, r-1, c-1, r, c-1, r+1, c-1});
    if (orientation == 2) return checkCords(new int[]{r, c-2});
    //orientation == 3 
    return checkCords(new int[]{r-1, c-1, r, c-1, r+1, c-1, r+2, c-1});
  }

  boolean checkRight() {
    if (orientation == 0) return checkCords(new int[]{r, c+2});
    if (orientation == 1) return checkCords(new int[]{r-2, c+1, r-2, c+1, r, c+1, r+1, c+1});
    if (orientation == 2) return checkCords(new int[]{r, c+3});
    //orientation == 3 
    return checkCords(new int[]{r-1, c+1, r, c+1, r+1, c+1, r+2, c+1});
  }
}
