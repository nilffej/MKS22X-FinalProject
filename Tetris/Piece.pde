abstract class Piece{
  int x;
  int y;
  int orientation;
  Board b;
  
  Piece(int x, int y, Board b){
    this.x = x;
    this.y = y;
    this.b = b;
    orientation = 0;
  }
  
  void moveLeft(){
    x -= 20;
  }
  void moveRight(){
    x += 20;
  }
  void moveDown(){
    y += 20;
  }
  
  abstract void isColliding();
  abstract void rot();
  
}
