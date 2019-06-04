import java.util.*;
import java.io.*;

class Board {
  int[][] grid;
  int gridh, gridw;
  int score, lines, level, speed;
  Piece currentPiece, savedPiece, nextPiece, ghostPiece;
  List<Integer> nextPieces;
  int[] pieceRange;
  Random r = new Random();
  boolean hasSaved;

  Board() {
    grid = new int[26][10];
    gridh = 25;
    gridw = 10;
    score = 0;
    lines = 0;
    level = 1;
    nextPieces = Arrays.asList(new Integer[]{1,2,3,4,5,6,7,1,2,3,4,5,6,7});
    pieceRange = new int[]{1,4};
    Collections.shuffle(nextPieces.subList(0,7));
    currentPiece = newPiece(nextPieces.get(0));
    ghostPiece = newPiece(currentPiece.col);
    ghostPiece.col*=10;
    hasSaved = false;
    for (int i = 0; i < grid[25].length; i++) {
      grid[25][i] = -1;
    }
  }

  int gridHeight() {
    return grid.length - 1;
  }

  void showBoard() {
    translate(100, 40);
    for (int x = 1; x < gridHeight(); x++) {
      for (int y = 0; y < grid[x].length; y++) {
        if (grid[x][y] == 1) {
          fill(255, 255, 102);
        } else if (grid[x][y] == 2) {
          fill(105, 255, 255);
        } else if (grid[x][y] == 3) {
          fill(255, 153, 0);
        } else if (grid[x][y] == 4) {
          fill(51, 102, 204);
        } else if (grid[x][y] == 5) {
          fill(102, 255, 102);
        } else if (grid[x][y] == 6) {
          fill(255, 80, 80);
        } else if (grid[x][y] == 7) {
          fill(204, 51, 255);
        } else if (grid[x][y] == 10) {
          fill(105, 255, 255,85);
        } else if (grid[x][y] == 20) {
          fill(105, 255, 255,85);
        } else if (grid[x][y] == 30) {
          fill(255, 153, 0,85);
        } else if (grid[x][y] == 40) {
          fill(51, 102, 204,85);
        } else if (grid[x][y] == 50) {
          fill(102, 255, 102,85);
        } else if (grid[x][y] == 60) {
          fill(255, 80, 80,85);
        } else if (grid[x][y] == 70) {
          fill(204, 51, 255,85);
        } else {
          fill(110, 110, 110);
        }
        rect(y*20, x*20, 20, 20);
      }
    }
  }

  void randomFill() {
    for (int x = 0; x < gridHeight(); x++) {
      for (int y = 0; y < grid[x].length; y++) {
        if (r.nextInt(3) == 1) {
          grid[x][y] = r.nextInt(7) + 1;
        }
      }
    }
    show2D(grid);
  }

  void show2D(int[][] arr) {
    System.out.println("\n");
    for (int x = 0; x < arr.length; x++) {
      System.out.println("\n");
      for (int y = 0; y < arr[x].length; y++) {
        System.out.print(arr[x][y] + " ");
      }
    }
    System.out.println("\n");
  }

  void clearLine() {
    for (int r = 0; r < grid.length-1; r++) {
      boolean space = true;
      for (int c = 0; c < grid[r].length && space; c++) {
        if (grid[r][c] == 0 || grid[r][c] == ghostPiece.col) space = false;
      }
      if (space) clearLine(r);
    }
  }

  void clearLine(int row) {
    for (int i = row; i > 0; i--) {
      grid[i] = grid[i-1];
    }
    grid[0] = new int[gridw];
    lines++;
  }

  void playPiece(int m, int s) {
    if (currentPiece.isColliding()) {
      currentPiece = newPiece(nextPieces.get(pieceRange[0]));
      ghostPiece = newPiece(currentPiece.col);
      ghostPiece.col*=10;
      pieceRange[0] = (pieceRange[0] + 1) % 14;
      pieceRange[1] = (pieceRange[1] + 1) % 14;
      int end = pieceRange[1];
      if(end == 0 || end == 7) Collections.shuffle(nextPieces.subList(end,end+7));
      hasSaved = false;
      //System.out.println(Arrays.toString(nextPieces.toArray()));
    } else {
      currentPiece.moveDown();
    }
  }

  Piece newPiece() {
    int temp = (int) (Math.random()*7);
    if (temp == 0) {
      return new IPiece(1, 5, this);
    } else if (temp == 1) {
      return new OPiece(0, 4, this);
    } else if (temp == 2) {
      return new LPiece(1, 5, this);
    } else if (temp == 3) {
      return new JPiece(1, 5, this);
    } else if (temp == 4) {
      return new ZPiece(1, 5, this);
    } else if (temp == 5) {
      return new SPiece(1, 5, this);
    } else {
      return new TPiece(1,5,this);
    }
  }
  
  Piece newPiece(int s){
    if (s == 1) {
      return new OPiece(1, 4, this);
    } else if (s == 2) {
      return new IPiece(1, 5, this);
    } else if (s == 3) {
      return new LPiece(2, 4, this);
    } else if (s == 4) {
      return new JPiece(2, 4, this);
    } else if (s == 5) {
      return new SPiece(2, 4, this);
    } else if (s == 6) {
      return new ZPiece(2, 4, this);
    } else {
      return new TPiece(2,4,this);
    }
  }
  
  void keyPressed(){
    //if(key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6'){
    if(key >= '1' && key <= '7'){
      currentPiece.undisplay();
      ghostPiece.undisplay();
      if(key == '1') currentPiece = new IPiece(1,5,this);
      else if (key == '2') currentPiece = new OPiece (1,4,this);
      else if (key == '3') currentPiece = new LPiece (2,4,this);
      else if (key == '4') currentPiece = new JPiece(2,4,this);
      else if (key == '5') currentPiece = new ZPiece(2,4,this);
      else if (key == '6') currentPiece = new SPiece(2,4,this);
      else if (key == '7') currentPiece = new TPiece(2,4,this);
      ghostPiece = newPiece(currentPiece.col);
      ghostPiece.col*=10;
    }
    else if(hasSaved == false && (key == 'c' || keyCode == SHIFT)){
      currentPiece.undisplay();
      ghostPiece.undisplay();
      if(savedPiece == null){
        savedPiece = newPiece(currentPiece.col);
        currentPiece = newPiece(nextPieces.get(pieceRange[0]));
        ghostPiece = newPiece(currentPiece.col);
        ghostPiece.col*=10;
        pieceRange[0] = (pieceRange[0] + 1) % 14;
        pieceRange[1] = (pieceRange[1] + 1) % 14;
        int end = pieceRange[1];
        if(end == 0 || end == 7) Collections.shuffle(nextPieces.subList(end,end+7));
        hasSaved = true;
      }
      else{
        int savedCol = savedPiece.col;
        savedPiece = newPiece(currentPiece.col);
        currentPiece = newPiece(savedCol);
        ghostPiece = newPiece(currentPiece.col);
        ghostPiece.col*=10;
        hasSaved = true;
      }
    }
  }

  void display(int m, int s) {
    if (m >= s) {
      playPiece(m, s);
      //show2D(grid);
      clearLine();
    }
    
    currentPiece.undisplay();
    ghostPiece.undisplay();
    System.arraycopy(currentPiece.cords,0,ghostPiece.cords,0,currentPiece.cords.length);
    ghostPiece.r = currentPiece.r;
    ghostPiece.c = currentPiece.c;
    ghostPiece.orientation = currentPiece.orientation;
    //System.out.println("r: " + ghostPiece.r + " c: "+ ghostPiece.c + " cords: " + Arrays.toString(ghostPiece.cords));
    while(!ghostPiece.isColliding()){
      ghostPiece.moveDown();
    }
    ghostPiece.display();
    currentPiece.display();
    
    //show2D(grid);    
    showBoard();
    fill(255, 0, 0);
    textSize(50);
    text("Orientation: "+currentPiece.orientation, 300, 100);
    text("Lines cleared: "+lines, 300, 200);
    if (savedPiece == null) text("Saved: None",300, 300);
    else if(savedPiece.col == 1) text("Saved: O", 300, 300);
    else if(savedPiece.col == 2) text("Saved: I", 300, 300);
    else if(savedPiece.col == 3) text("Saved: L", 300, 300);
    else if(savedPiece.col == 4) text("Saved: J", 300, 300);
    else if(savedPiece.col == 5) text("Saved: S", 300, 300);
    else if(savedPiece.col == 6) text("Saved: Z", 300, 300);
    else if(savedPiece.col == 7) text("Saved: T", 300, 300);
  }
}
