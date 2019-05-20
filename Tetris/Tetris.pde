
import java.util.*;
import java.io.*;

Board TetrisBoard = new Board(300,600);  

class TetrisGame{
  
}

void setup() {
  size(800,600);
  
}

void draw() {
  background(255);
  TetrisBoard.drawBox();
}