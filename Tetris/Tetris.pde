<<<<<<< HEAD
import java.util.*;
import java.io.*;

void setup(){
  Board board = new Board(200,300);
  size(800,600);
}

void draw(){
  background(255);
=======

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
>>>>>>> 68b363496ba8b78013c45bb68ae534fdaf601b3a
}