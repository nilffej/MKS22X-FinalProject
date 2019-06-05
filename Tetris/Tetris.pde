import java.util.*;
import java.io.*;


Board TetrisBoard;
Random r;
int s=2;
int m, lastMillis, diff;


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
  translate(55, 100);
  fill(0, 0, 0);
  textSize(20);
  textAlign(CENTER);
  text("HOLD", 30, -5);
  fill(110, 110, 110);
  rect(0, 0, 60, 60);
  if (TetrisBoard.savedPiece == null) {
  } else if (TetrisBoard.savedPiece.col == 1) {
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
  TetrisBoard = new Board();
  r = new Random();
  lastMillis = 0;
  diff = 0;
}

void draw() {
  int m = (millis()-diff);
  background(255);
  TetrisBoard.display(m, s);
  if (m >= s) {
    s+=TetrisBoard.speed*1000;
  }
  showNext();
  showSaved();
  fill(255, 0, 0);
  textSize(50);
  text("Score: "+TetrisBoard.score, 600, 100);
  for (int i = 0; i < TetrisBoard.grid[0].length; i++) {
    if (TetrisBoard.grid[0][i]!= 0) endGame();
  }

  
}

void endGame() {
  noLoop();
  fill(110, 110, 110, 210);
  rect(-1, -1, 801, 601);
  fill(255, 255, 255);
  textSize(100);
  textAlign(CENTER);
  text("GAME OVER", 400, 300);
  textSize(30);
  text("Press 'r' to restart", 400, 350);
}

void keyPressed() {
  if (looping) {
    TetrisBoard.keyPressed();
    TetrisBoard.currentPiece.keyPressed();
  }
  if (key == 'r') {
      setup();
      loop();
    }
  if (key == 'p') {
    if (looping) {
      noLoop();
      lastMillis = millis();
      fill(110, 110, 110, 200);
      rect(-1, -1, 801, 601);
      fill(255, 255, 255);
      textSize(100);
      textAlign(CENTER);
      text("PAUSED", 400, 300);
      textSize(40);
      text("Press 'p' to unpause", 400, 350);
    } else {
      diff += millis() - lastMillis;
      loop();
    }
  }
}
