import java.util.*;
import java.io.*;

Board TetrisBoard = new Board();
Random r = new Random();
int s = 2;

void showNext() {

  pushMatrix();
  translate(365, 100);
  fill(0, 0, 0);
  textSize(20);
  textAlign(CENTER);
  text("NEXT", 30, -5);
  int start = TetrisBoard.nextPiece;
  fill(110, 110, 110);
  rect(0, 0, 60, 60);
  for (int i = start, counter = 0; i < start + 4; i++, counter++) {
    pushMatrix();
    translate(0, counter*60);
    fill(110, 110, 110);
    rect(0, 0, 60, 60);
    if (TetrisBoard.nextPieces.get(i%14) == 1) {
      fill(255, 255, 102);
      rect(15, 15, 15, 15);
      rect(15, 30, 15, 15);
      rect(30, 15, 15, 15);
      rect(30, 30, 15, 15);
    } else if (TetrisBoard.nextPieces.get(i%14) == 2) {
      fill(105, 255, 255);
      rect(24, 6, 12, 12);
      rect(24, 18, 12, 12);
      rect(24, 30, 12, 12);
      rect(24, 42, 12, 12);
    } else if (TetrisBoard.nextPieces.get(i%14) == 3) {
      fill(255, 153, 0);
      rect(15, 7.5, 15, 15);
      rect(15, 22.5, 15, 15);
      rect(15, 37.5, 15, 15);
      rect(30, 37.5, 15, 15);
    } else if (TetrisBoard.nextPieces.get(i%14) == 4) {
      fill(51, 102, 204);
      rect(30, 7.5, 15, 15);
      rect(30, 22.5, 15, 15);
      rect(30, 37.5, 15, 15);
      rect(15, 37.5, 15, 15);
    } else if (TetrisBoard.nextPieces.get(i%14) == 5) {
      fill(102, 255, 102);
      rect(22.5, 15, 15, 15);
      rect(37.5, 15, 15, 15);
      rect(7.5, 30, 15, 15);
      rect(22.5, 30, 15, 15);
    } else if (TetrisBoard.nextPieces.get(i%14) == 6) {
      fill(255, 80, 80);
      rect(7.5, 15, 15, 15);
      rect(22.5, 15, 15, 15);
      rect(22.5, 30, 15, 15);
      rect(37.5, 30, 15, 15);
    } else {
      fill(204, 51, 255);
      rect(22.5, 15, 15, 15);
      rect(7.5, 30, 15, 15);
      rect(22.5, 30, 15, 15);
      rect(37.5, 30, 15, 15);
    }
    popMatrix();
  }

  popMatrix();
}

void showSaved() {
  pushMatrix();
  translate(55,100);
  fill(0,0,0);
  textSize(20);
  textAlign(CENTER);
  text("HOLD", 30, -5);
  fill(110, 110, 110);
  rect(0, 0, 60, 60);
  if(TetrisBoard.savedPiece == null){
  }
  else if (TetrisBoard.savedPiece.col == 1) {
    fill(255, 255, 102);
    rect(15, 15, 15, 15);
    rect(15, 30, 15, 15);
    rect(30, 15, 15, 15);
    rect(30, 30, 15, 15);
  } else if (TetrisBoard.savedPiece.col == 2) {
    fill(105, 255, 255);
    rect(24, 6, 12, 12);
    rect(24, 18, 12, 12);
    rect(24, 30, 12, 12);
    rect(24, 42, 12, 12);
  } else if (TetrisBoard.savedPiece.col == 3) {
    fill(255, 153, 0);
    rect(15, 7.5, 15, 15);
    rect(15, 22.5, 15, 15);
    rect(15, 37.5, 15, 15);
    rect(30, 37.5, 15, 15);
  } else if (TetrisBoard.savedPiece.col== 4) {
    fill(51, 102, 204);
    rect(30, 7.5, 15, 15);
    rect(30, 22.5, 15, 15);
    rect(30, 37.5, 15, 15);
    rect(15, 37.5, 15, 15);
  } else if (TetrisBoard.savedPiece.col == 5) {
    fill(102, 255, 102);
    rect(22.5, 15, 15, 15);
    rect(37.5, 15, 15, 15);
    rect(7.5, 30, 15, 15);
    rect(22.5, 30, 15, 15);
  } else if (TetrisBoard.savedPiece.col == 6) {
    fill(255, 80, 80);
    rect(7.5, 15, 15, 15);
    rect(22.5, 15, 15, 15);
    rect(22.5, 30, 15, 15);
    rect(37.5, 30, 15, 15);
  } else {
    fill(204, 51, 255);
    rect(22.5, 15, 15, 15);
    rect(7.5, 30, 15, 15);
    rect(22.5, 30, 15, 15);
    rect(37.5, 30, 15, 15);
  }
  popMatrix();
}
void setup() {
  size(800, 600);
}

void draw() {
  int m = millis() / 100;
  background(255);
  TetrisBoard.display(m, s);
  if (m >= s) {
    s+=4;
  }
  showNext();
  showSaved();
}

void keyPressed() {
  TetrisBoard.keyPressed();
  TetrisBoard.currentPiece.keyPressed();
}
