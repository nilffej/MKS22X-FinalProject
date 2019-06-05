# Tetris
A recreation of the classic game of Tetris in Processing

Controls:

Left arrow key - move Left
Right arrow key - move right
up arrow key - rotate
down arrow key - soft drop
spacebar - hard drop
shift or c - save piece
p - pause

"CHEATS"
changes current piece:
  1 - I
  2 - O
  3 - L
  4 - J
  5 - Z
  6 - S
  7 - T
0 - increases level by 1


5/20
Michael:
  Created constructor for the Board and put in the basic fields it should have
  started the abstract Piece class constructor and fields

5/21
Michael:
  finished collision detection for the OPiece and started the collision detection based on orientation for the IPiece

5/22
Michael:
  Changed the orientation states for IPiece and changed the center every time it rotates
  started working on LPiece constructor and rotations

5/23
Michael:
  reformatted the coordinates of the pieces to be more clear and match up with the rows and columns
  working on display/undisplay every time a piece is moved

5/24
Michael:
  Updated the coordinates for the LPiece every time it rotates
  Fixed a bug with the rotations in the IPiece
  Finished display and undisplay for OPiece

5/26
Michael:
  Fixed a bug in the left and right movement where the coordinates weren't updating
  Finished the orientations for LPiece and collision detection for each orientation

5/27
Michael:
  Added in left and right movement for the IPiece

5/28
Michael:
  changed the key to instantly drop the pieces
  Started working on SPiece and finished the rotation and collision detection
  fixed some edge cases for LPiece when rotating

5/29
Michael:
  Added in left and right checks for the OPiece
  Reformatted how the coordinates were updated to look cleaner

5/30
Michael:
  Fixed the left and right checks for the LPiece
  Finished the rotation and collision for the JPiece
  Finished the rotation, collision, and left and right checks for ZPiece

6/1
Michael:
  Fixed edge cases for TPiece and SPiece
  Added in "cheats" - press a number from 1-7 and changes the current piece to that

6/2
Michael:
  Fixed edge cases for LPiece and JPiece
  Reformatted code to use checkCords method

6/3
Michael:
  Changed the algorithm for the random block selection
  Reformatted collision code to use checkCords

6/4
Michael:
  Added the ghost piece that appears at the bottom of the board
  Added in the ability to save a piece
  Combined the showNext to display the next piece and also shows saved piece now
  Made the game speed up the further you progress
  Added the ability to pause the game and restart the game
  Added the game over screen when the blocks reach the top
