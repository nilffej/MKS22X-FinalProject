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
      if (checkCords(new int[]{r-1,c+1,r+1,c})){
        undisplay();
        cords = new int[]{r-1, c+1, r, c+1, r+1, c};
        display();
        orientation = 1;
      }
    } else if (orientation == 1) {
      if(!checkLeft() && checkCords(new int[]{r+1,c+1,r+1,c+2})){
        undisplay();
        c++;
        cords = new int[]{r, c-1, r+1, c, r+1, c+1};
        display();
        orientation = 2;
      }
      else if (checkCords(new int[]{r,c-1,r+1,c+1})){
        undisplay();
        cords = new int[]{r, c-1, r+1, c, r+1, c+1};
        display();
        orientation = 2;
      }
    } else if (orientation == 2) {
      if (checkCords(new int[]{r-1,c,r+1,c-1})) {
        undisplay();
        cords = new int[]{r+1, c-1, r, c-1, r-1, c};
        display();
        orientation = 3;
      }
    } else { //orientation == 3
      if(!checkRight() && checkCords(new int[]{r-1,c-2,r-1,c-1})){
        undisplay();
        c--;
        cords = new int[]{r-1, c-1, r-1, c, r, c+1};
        display();
        orientation = 0;
      }
      else if (checkCords(new int[]{r-1,c-1,r,c+1})){
        undisplay();
        cords = new int[]{r-1, c-1, r-1, c, r, c+1};
        display();
        orientation = 0;
      }
    }
  }

  boolean isColliding() {
    if (orientation == 0) return !checkCords(new int[]{r,c-1,r+1,c,r+1,c+1});
    if (orientation == 1) return !checkCords(new int[]{r+2,c,r+1,c+1});
    if (orientation == 2) return !checkCords(new int[]{r+1,c-1,r+2,c,r+2,c+1});
    //orientation == 3
    return !checkCords(new int[]{r+2,c-1,r+1,c});
  }

  boolean checkLeft() {
    if (orientation == 0) return checkCords(new int[]{r-1,c-2,r,c-1});
    if (orientation == 1) return checkCords(new int[]{r-1,c,r,c-1,r+1,c-1});
    if (orientation == 2) return checkCords(new int[]{r,c-2,r+1,c-1});
    //orientation == 3
    return checkCords(new int[]{r-1,c-1,r,c-2,r+1,c-2});
  }

  boolean checkRight() {
    if (orientation == 0) return checkCords(new int[]{r-1,c+1,r,c+2});
    if (orientation == 1) return checkCords(new int[]{r-1,c+2,r,c+2,r+1,c+1});
    if (orientation == 2) return checkCords(new int[]{r,c+1,r+1,c+2});
    //orientation == 3
    return checkCords(new int[]{r-1,c+1,r,c+1,r+1,c});
  }
}
