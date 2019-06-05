class TPiece extends Piece {
  /* reference to the piece sticking out
   orientation = 0 --> up
   orientation = 1 --> right
   orientation = 2 --> down
   orientation = 3 --> left
   */

  TPiece(int r, int c, Board b) {
    super(r, c, b);
    cords = new int[]{r, c-1, r-1, c, r, c+1};
    col = 7;
  }

  void rot() {
    if (orientation == 0) {
      if (checkCords(new int[]{r+1, c})) {
        undisplay();
        cords = new int[]{r-1, c, r, c+1, r+1, c};
        display();
        orientation = 1;
      }
    } else if (orientation == 1) {
      if (!checkLeft() && checkCords(new int[]{r+1, c+1, r, c+2})) {
        undisplay();
        c++;
        cords = new int[]{r, c-1, r+1, c, r, c+1};
        display();
        orientation = 2;
      } else if (checkCords(new int[]{r, c-1})) {
        undisplay();
        cords = new int[]{r, c-1, r, c+1, r+1, c};
        display();
        orientation = 2;
      }
    } else if (orientation == 2) {
      if (checkCords(new int[]{r-1, c})) {
        undisplay();
        cords = new int[]{r-1, c, r, c-1, r+1, c};
        display();
        orientation = 3;
      }
    } else { //orientation == 3
      if (!checkRight() && checkCords(new int[]{r, c-2, r+1, c-1})) {
        undisplay();
        c--;
        cords = new int[]{r, c-1, r, c+1, r-1, c};
        display();
        orientation = 0;
      } else if (checkCords(new int[]{r, c+1})) {
        undisplay();
        cords = new int[]{r, c-1, r-1, c, r, c+1};
        display();
        orientation = 0;
      }
    }
  }

  boolean isColliding() {
    if (orientation == 0) return !checkCords(new int[]{r+1, c-1, r+1, c, r+1, c+1});
    if (orientation == 1) return !checkCords(new int[]{r+2, c, r+1, c+1});
    if (orientation == 2) return !checkCords(new int[]{r+1, c-1, r+2, c, r+1, c+1});
    //orientation == 3
    return !checkCords(new int[]{r+1, c-1, r+2, c});
  }

  boolean checkLeft() {
    if (orientation == 0) return checkCords(new int[]{r-1, c-1, r, c-2});
    if (orientation == 1) return checkCords(new int[]{r-1, c-1, r, c-1, r+1, c-1});
    if (orientation == 2) return checkCords(new int[]{r, c-2, r+1, c-1});
    //orientation == 3
    return checkCords(new int[]{r-1, c-1, r, c-2, r+1, c-1});
  }

  boolean checkRight() {
    if (orientation == 0) return checkCords(new int[]{r-1, c+1, r, c+2});
    if (orientation == 1) return checkCords(new int[]{r-1, c+1, r, c+2, r+1, c+1});
    if (orientation == 2) return checkCords(new int[]{r, c+2, r+1, c+1});
    //orientation == 3
    return checkCords(new int[]{r-1, c+1, r, c+1, r+1, c+1});
  }
}
