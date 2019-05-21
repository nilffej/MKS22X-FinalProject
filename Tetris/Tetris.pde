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
<<<<<<< HEAD
}  
=======
}
>>>>>>> 2d5e9d3c4c6c51086d428263e0ec1c02905e12d1
