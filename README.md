# Tetris

A recreation of the classic game of Tetris in Processing 3.

## How To Play

The objective of Tetris is to score as many points as possible by clearing horizontal lines of blocks. The player must either move or rotate the falling Tetris pieces within the Tetris board and clear as many lines as possible before it reaches the top. As the game progresses, the speed and difficulty graudally increases.

### Controls

Up arrow key - Rotate
Left arrow key - Left
Right arrow key - Right
Down arrow key - Soft drop
Spacebar - Hard drop
Shift or C - Hold piece
P - Pause
R - Restart

## Development Log

5/20
- Michael:
  - Created constructor for the Board and put in the basic fields it should have
  - Started the abstract Piece class constructor and fields
- Jeff:
  - Created new Tetris class with basic setup and draw
  - Started on display of Board in window

5/21
- Michael:
  - Finished collision detection for the OPiece
  - Started the collision detection based on orientation for the IPiece
- Jeff:
  - Finished display of Board and updated implementation for flexibility
  - Finished line clearing method

5/22
- Michael:
  - Changed the orientation states for IPiece and changed the center every time it rotates
  - Started working on LPiece constructor and rotations
- Jeff:
  - Integrated Board with OPiece to display
  - Fixed bugs in line clearing
  - Started working on movement of pieces in board

5/23
- Michael:
  - Reformatted the coordinates of the pieces to be more clear and match up with the rows and columns
  - Working on display/undisplay every time a piece is moved
- Jeff:
  - Fixed implementation of methods in pieces
  - Started rotation of LPiece

5/24
- Michael:
  - Updated the coordinates for the LPiece every time it rotates
  - Fixed a bug with the rotations in the IPiece
  - Finished display and undisplay for OPiece
- Jeff:
  - Created basic inherited movement for all pieces in abstract Piece
  - Finished block queueing and stopping of pieces upon collision
  - Completed very basic progression of game

5/26
- Michael:
  - Fixed a bug in the left and right movement where the coordinates weren't updating
  - Finished the orientations for LPiece and collision detection for each orientation

5/27
- Michael:
  - Added in left and right movement for the IPiece
- Jeff:
  - Created basic inherited display for all pieces in abstract Piece
  - Added edge cases in rotations for IPiece in relation to walls

5/28
- Michael:
  - Changed the key to instantly drop the pieces
  - Started working on SPiece and finished the rotation and collision detection
  - Fixed some edge cases for LPiece when rotating
- Jeff:
  - Created method for hard dropping
  - Fixed rotation glitches for IPiece
  - Added user input and integrated more pieces with Board

5/29
- Michael:
  - Added in left and right checks for the OPiece
  - Reformatted how the coordinates were updated to look cleaner
- Jeff:
  - Changed implementation for user input
  - Worked on left and right checks of IPiece

5/30
- Michael:
  - Fixed the left and right checks for the LPiece
  - Finished the rotation and collision for the JPiece
  - Finished the rotation, collision, and left and right checks for ZPiece

5/31
- Jeff:
  - Integrated more pieces with Board
  - Finished SPiece and TPiece edge cases

6/1
- Michael:
  - Fixed edge cases for TPiece and SPiece
  - Added in "cheats" - press a number from 1-7 and changes the current piece to that

6/2
- Michael:
  - Fixed edge cases for LPiece and JPiece
  - Reformatted code to use checkCords method

6/3
- Michael:
  - Changed the algorithm for the random block selection
  - Reformatted collision code to use checkCords

6/4
- Michael:
  - Added the ghost piece that appears at the bottom of the board
  - Added in the ability to save a piece
  - Combined the showNext to display the next piece and also shows saved piece now
  - Made the game speed up the further you progress
  - Added the ability to pause the game and restart the game
  - Added the game over screen when the blocks reach the top
- Jeff:
  - Changed implementation for pieces to use checkCords
  - Created display and mini icons for pieces next in queue
  - Added background, logo, and control visuals
  - Changed visuals and UI for fluidity
