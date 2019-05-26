import java.util.*;
import java.io.*;

class Board {
  int[][] grid;
  int gridh, gridw;
  int score, lines, level, speed;
  Piece currentPiece, savedPiece, nextPiece;
  Random r = new Random();

  Board(int h, int w) {
    grid = new int[h+1][w];
    gridh = h;
    gridw = w;
    score = 0;
    lines = 0;
    level = 1;
    currentPiece = newPiece();
    nextPiece = newPiece();
    for (int i = 0; i < grid[h].length; i++) {
      grid[h][i] = -1;
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

  void clearLine(int row) {
    for (int i = row; i > 0; i--) {
      grid[i] = grid[i-1];
    }
    grid[0] = new int[gridw];
  }

  void playPiece() {
    if (currentPiece.isColliding()) {
      currentPiece = nextPiece;
      nextPiece = newPiece();
    } else {
      currentPiece.undisplay();
      currentPiece.moveDown();
      currentPiece.display();
      if (currentPiece.r == 6){
        currentPiece.rot();
        currentPiece.moveLeft();
      }
      if(currentPiece.r == 8){
        currentPiece.moveRight();
        currentPiece.rot();
        currentPiece.rot();
        currentPiece.rot();
      }
    }
  }

  void setup() {
  }

  Piece newPiece(){
    //Piece p = new IPiece(0,5,this);
    Piece p = new LPiece(1,5,this);
    return p;
  }

  void display(int m, int s) {
    if (m == s) {
      playPiece();
      show2D(grid);
    }
    showBoard();
    fill(255,0,0);
    textSize(50);
    text("Orientation: "+currentPiece.orientation,300,100);
  }
}
