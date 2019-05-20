class Board {
  int[][] grid;
  int score, lines, level, speed;
  Board(int w, int h) {
    grid = new int[w][h];
    score = 0;
    lines = 0;
    level = 1;
  }

  void drawBox() {
    translate(100, 60);
    fill(110, 110, 110);
    rect(0, 0, 200, 480);
  }

  void showBoard() {
    for (int x = 0; x < grid.length; x++) {
      for (int y = 0; y < grid[x].length; y++) {
        if (grid[x][y] == 1);
        
      }
    }
  }

  void display() {
    drawBox();
  }
}