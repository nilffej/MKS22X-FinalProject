class IPiece extends Piece {

   /*
   orientation = 0 --> on its side - center is third from the left
   orientation = 1 --> upright - center is third from the top
   orientation = 2 --> on its side - center is second from the left
   orientation = 3 --> upright - center is second from the top
   */

  IPiece(int x, int y, Board b) { 
    super(x, y, b);
  }
  
  void rot(){
    if(orientation == 0){
      if(b.grid[x][y-1] == 0 && b.grid[x][y] == 0 && b.grid[x][y+1] == 0 && b.grid[x][y+2] == 0){
        y+=1; //0 -> 1
      }
    }
    
    else if(orientation == 1){
      if(b.grid[x-2][y] == 0 && b.grid[x-1][y] == 0 && b.grid[x][y] == 0 && b.grid[x+1][y] == 0){
        x-=1; //1 -> 2
      }
    }
    else if(orientation == 2){
      if(b.grid[x][y-2] == 0 && b.grid[x][y-1] == 0 && b.grid[x][y] == 0 && b.grid[x][y+1] == 0){
        y-=1; //2 -> 3
      }
    }
    
    else if(orientation == 3){ 
      if(b.grid[x-1][y] == 0 && b.grid[x][y] == 0 && b.grid[x+1][y] == 0 && b.grid[x+2][y] == 0){
        x+=1; //3 -> 1
      }
    }
    
    orientation = (orientation + 1)%4;
  }
  
  boolean isColliding(){
    
    if (orientation == 0) {
      return b.grid[x-2][y+1] != 0 && b.grid[x-1][y+1] != 0 &&
             b.grid[x][y+1] != 0 && b.grid[x+1][y+1] != 0;
    }
    if(orientation == 1){
      return b.grid[x][y+2] != 0;
    }
    if (orientation == 2){
    return b.grid[x-1][y+1] != 0 && b.grid[x][y+1] != 0 &&
           b.grid[x+1][y+1] != 0 && b.grid[x][y+1] != 0;
    }
    //orientation == 3
    return b.grid[x][y+3]!=0;
  }
}