class Board {
  LinkedList<int[]> grid;
  int score,lines,level,speed;
  
  Board(int w, int h){
    grid = new LinkedList<int[]>();
    for(int i = 0; i < h;i++){
      grid.add(new int[w]);
    }
    score = 0;
    lines = 0;
    level = 1;
  }
  
}