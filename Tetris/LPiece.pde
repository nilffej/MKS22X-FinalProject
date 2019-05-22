class LPiece extends Piece{
  
  /*
  center is second from the top of the "L"
  orientation = 0 --> on its side - long side on the bottom
  orientation = 1 --> upright - regular L
  orientation = 2 --> on its side - short side on bottom
  orientation = 3 --> upright - upsidedown L
  */
  
  LPiece(int x, int y, Board b){
    super(x,y,b);
  }
  
  void rot(){
    if(orientation == 0){
      if(b.grid[x][y-1]
    }
    
    else if(orientation == 1){
    
    }
    
    else if(orientation == 2){
    
    }
    
    else{ //orientation == 3
    
    }
    
  }
}