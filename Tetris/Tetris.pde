import java.util.*;
import java.io.*;

Board TetrisBoard = new Board();
Random r = new Random();
int s = 2;


class TetrisGame {
}

void setup() {
  size(800, 600);
}

void draw() {
  int m = millis() / 100;
  background(255);
  TetrisBoard.display(m, s);
  if (m == s) {
    s+=2;
  }
}

void keyPressed(){
  TetrisBoard.currentPiece.keyPressed();
}
