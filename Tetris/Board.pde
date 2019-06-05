import java.util.*;
import java.io.*;

class Board {
  int[][] grid;
  int gridh, gridw;
  int score, lines, level;
  double speed;
  Piece currentPiece, savedPiece, ghostPiece;
  List<Integer> nextPieces;
  int nextPiece;
  boolean hasSaved;

  Board() {
    grid = new int[27][10];
    gridh = 25;
    gridw = 10;
    score = 0;
    lines = 0;
    score = 0;
    level = 1;
    speed = .8;
    nextPieces = Arrays.asList(new Integer[]{1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7});
    nextPiece = 1;
    Collections.shuffle(nextPieces.subList(0, 7)); //randomizes the next pieces
    currentPiece = newPiece(nextPieces.get(0)); //set up the current piece and the ghost piece
    currentPiece.moveDown();
    currentPiece.moveDown();
    ghostPiece = newPiece(currentPiece.col);
    ghostPiece.col*=10;
    hasSaved = false;
    for (int i = 0; i < grid[26].length; i++) {
      grid[26][i] = -1;
    }
  }


  void showBoard() {
    fill(255,255,255);
    rect(0,40,200,480);
    for (int x = 2; x < gridh+1; x++) {
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
          fill(105, 255, 255, 85);
        } else if (grid[x][y] == 20) {
          fill(105, 255, 255, 85);
        } else if (grid[x][y] == 30) {
          fill(255, 153, 0, 85);
        } else if (grid[x][y] == 40) {
          fill(51, 102, 204, 85);
        } else if (grid[x][y] == 50) {
          fill(102, 255, 102, 85);
        } else if (grid[x][y] == 60) {
          fill(255, 80, 80, 85);
        } else if (grid[x][y] == 70) {
          fill(204, 51, 255, 85);
        } else {
          fill(110, 110, 110);
        }
        rect(y*20, x*20, 20, 20);
      }
    }
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
    int count = 0;
    for (int r = 0; r < grid.length-1; r++) {
      boolean space = true;
      for (int c = 0; c < grid[r].length && space; c++) {
        if (grid[r][c] == 0 || grid[r][c] == ghostPiece.col) space = false;
      }
      if (space) {
        clearLine(r);
        if (lines%10 == 0) {
          level++;
          if (level == 2) speed = .72;
          else if (level == 3) speed = .63;
          else if (level == 4) speed = .55;
          else if (level == 5) speed = .47;
          else if (level == 6) speed = .38;
          else if (level == 7) speed = .3;
          else if (level == 8) speed = .22;
          else if (level == 9) speed = .13;
          else if (level == 10) speed = .1;
          else if (level == 11) speed = .08;
          else if (level == 14) speed = .07;
          else if (level == 17) speed = .05;
          else if (level == 20) speed = .03;
          else if (level == 30) speed = .02;
        }
        count++;
      }
    }
    if (count == 1) score += 40*level;
    else if (count == 2) score += 100*level;
    else if (count == 3) score += 300*level;
    else if (count == 4) score += 1200*level;
  }

  void clearLine(int row) {
    for (int i = row; i > 0; i--) {
      grid[i] = grid[i-1];
    }
    grid[0] = new int[gridw];
    lines++;
  }

  void playPiece() {
    if (currentPiece.isColliding()) {
      currentPiece = newPiece(nextPieces.get(nextPiece));
      currentPiece.moveDown();
      currentPiece.moveDown();
      ghostPiece = newPiece(currentPiece.col);
      ghostPiece.col*=10;
      nextPiece = (nextPiece + 1) % 14;
      int end = (nextPiece + 3) % 14;
      if (end == 0 || end == 7) Collections.shuffle(nextPieces.subList(end, end+7));
      hasSaved = false;
      //System.out.println(Arrays.toString(nextPieces.toArray()));
    } else {
      currentPiece.moveDown();
    }
  }

  Piece newPiece(int s) {
    if (s == 1) {
      return new OPiece(0,4,this);
    } else if (s == 2) {
      return new IPiece(0, 5, this);
    } else if (s == 3) {
      return new LPiece(1, 4, this);
    } else if (s == 4) {
      return new JPiece(1, 4, this);
    } else if (s == 5) {
      return new SPiece(1, 4, this);
    } else if (s == 6) {
      return new ZPiece(1, 4, this);
    } else {
      return new TPiece(1, 4, this);
    }
  }
  
  void endGame(){
  
  }

  void keyPressed() {
    if (key >= '1' && key <= '7') {
      currentPiece.undisplay();
      ghostPiece.undisplay();
      if (key == '1') currentPiece = new IPiece(0, 5, this);
      else if (key == '2') currentPiece = new OPiece (0, 4, this);
      else if (key == '3') currentPiece = new LPiece (1, 4, this);
      else if (key == '4') currentPiece = new JPiece(1, 4, this);
      else if (key == '5') currentPiece = new ZPiece(1, 4, this);
      else if (key == '6') currentPiece = new SPiece(1, 4, this);
      else if (key == '7') currentPiece = new TPiece(1, 4, this);
      currentPiece.moveDown();
      currentPiece.moveDown();

      ghostPiece = newPiece(currentPiece.col);
      ghostPiece.col*=10;
    } else if (hasSaved == false && (key == 'c' || keyCode == SHIFT)) {
      currentPiece.undisplay();
      ghostPiece.undisplay();
      if (savedPiece == null) {
        savedPiece = newPiece(currentPiece.col);
        currentPiece = newPiece(nextPieces.get(nextPiece));
        ghostPiece = newPiece(currentPiece.col);
        ghostPiece.col*=10;
        nextPiece = (nextPiece + 1) % 14;
        int end = (nextPiece+3)%14;
        if (end == 0 || end == 7) Collections.shuffle(nextPieces.subList(end, end+7));
      } else {
        int savedCol = savedPiece.col;
        savedPiece = newPiece(currentPiece.col);
        currentPiece = newPiece(savedCol);
        ghostPiece = newPiece(currentPiece.col);
        ghostPiece.col*=10;
      }
      hasSaved = true;
      currentPiece.moveDown();
      currentPiece.moveDown();
    } else if (key == '0') {
      level++;
      if (level == 2) speed = .72;
      else if (level == 3) speed = .63;
      else if (level == 4) speed = .55;
      else if (level == 5) speed = .47;
      else if (level == 6) speed = .38;
      else if (level == 7) speed = .3;
      else if (level == 8) speed = .22;
      else if (level == 9) speed = .13;
      else if (level == 10) speed = .1;
      else if (level == 11) speed = .08;
      else if (level == 14) speed = .07;
      else if (level == 17) speed = .05;
      else if (level == 20) speed = .03;
      else if (level == 30) speed = .02;
    }
  }

  void display(int m, int s) {
    if (m >= s) {
      clearLine();
      playPiece();
      //show2D(grid);
    }
    //System.out.println("r: " + currentPiece.r + " c: "+ currentPiece.c + " cords: " + Arrays.toString(currentPiece.cords));
    currentPiece.undisplay();
    ghostPiece.undisplay();
    System.arraycopy(currentPiece.cords, 0, ghostPiece.cords, 0, currentPiece.cords.length);
    ghostPiece.r = currentPiece.r;
    ghostPiece.c = currentPiece.c;
    ghostPiece.orientation = currentPiece.orientation;
    //System.out.println("r: " + ghostPiece.r + " c: "+ ghostPiece.c + " cords: " + Arrays.toString(ghostPiece.cords));
    while (!ghostPiece.isColliding()) {
      ghostPiece.moveDown();
    }
    ghostPiece.display();
    currentPiece.display();
    textSize(50);
    text("Lines: "+lines, 600, 200);
    text("Level: "+level, 600, 300);
    //text("Speed: "+speed, 600, 400);
    pushMatrix();
    translate(140, 20);
    showBoard();
    popMatrix();
  }
}
