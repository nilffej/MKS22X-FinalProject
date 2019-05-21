import java.util.*;
import java.io.*;

class Board {
  int[][] grid;
  int gridh, gridw;
  int score, lines, level, speed;
  Random r = new Random();

  Board(int h, int w) {
    grid = new int[h][w];
    gridh = h;
    gridw = w;
    score = 0;
    lines = 0;
    level = 1;
  }

  void drawBoard() {
    translate(100, 60);
    fill(110, 110, 110);
    rect(0, 0, 20*gridw, 20*gridh);
  }

  void showBoard() {
    for (int x = 0; x < grid.length; x++) {
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
    for (int x = 0; x < grid.length; x++) {
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
    int[][] newGrid = new int[gridh][gridw];
    for (int i = grid.length-1; i > row; i--) {
      newGrid[i] = grid[i];
    }
    for (int i = row-1; i >= 0; i--) {
      newGrid[i+1] = grid[i];
    }
    grid = newGrid;
  }

  void display() {
    drawBoard();
    showBoard();
  }
}
