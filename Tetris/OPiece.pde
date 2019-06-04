class OPiece extends Piece {

  OPiece(int r, int c, Board b) { //center is the top left tile
    super(r, c, b);
    cords = new int[]{r, c+1, r+1, c, r+1, c+1};
    col = 1;
  }

  boolean isColliding() { //return if the spaces under are empty
    return !checkCords(new int[]{r+2,c,r+2,c+1});
  }

  void rot() {
  }

  boolean checkLeft(){
    return checkCords(new int[]{r,c-1,r+1,c-1});
  }

  boolean checkRight(){
    return checkCords(new int[]{r,c+2,r+1,c+2});
  }
}
