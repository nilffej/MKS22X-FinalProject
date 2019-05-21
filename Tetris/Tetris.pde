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
  background(255);
  TetrisBoard.display();
}  