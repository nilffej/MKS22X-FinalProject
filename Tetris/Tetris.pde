import java.util.*;
import java.io.*;

Board TetrisBoard = new Board(25, 10);
Random r = new Random();
int s = 1;


class TetrisGame {
}

void setup() {
  size(800, 600);
  TetrisBoard.setup();
}

void draw() {
  int m = millis() / 1000;
  background(255);
  TetrisBoard.display(m, s);
  if (m == s) {
    s++;
  }
}

void keyPressed(){
  TetrisBoard.currentPiece.keyPressed();
}
