import java.util.*;
import java.io.*;

Board TetrisBoard = new Board(24, 10);  
int nexts = 2;

class TetrisGame {
}

void setup() {
  size(800, 600);
  TetrisBoard.randomFill();
}

void draw() {
  int time = millis() / 1000;
  background(255);
  TetrisBoard.display();
  System.out.println(time + " " + nexts);
  if (time == nexts) {
    TetrisBoard.clearLine(23);
    nexts += 2;
  }
}
