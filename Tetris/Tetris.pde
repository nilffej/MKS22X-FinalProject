import java.util.*;
import java.io.*;

Board TetrisBoard = new Board(24,10);  

class TetrisGame{
  
}

void setup() {
  size(800,600);
  TetrisBoard.randomFill();
}

void draw() {
  int s = second();
  background(255);
  TetrisBoard.display();
  System.out.println(s);
}
