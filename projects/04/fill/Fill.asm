// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
// first put the starting address of the screen in R0


(START)
// store the screen start address in R0
@SCREEN
D=A
@R0
M=D

// get the keyboard input
@KBD
D=M
// if D!=0 jump to black screen part
@BLACK
D;JGT

// else jump to white screen part
@WHITE
D;JEQ

(BLACK)
// store the black color in R1
@R1
M=-1 // fill the screen with all 1 (1111111111111111)

@UPDATE
0;JMP

(WHITE)
// store the white color in R1
@R1
M=0
@UPDATE
0;JMP

(UPDATE)
//fill the whole screen with R1 color
@R1
D=M

// first get the address which want to color
@R0
A=M
//color it
M=D

// move to the next chunk of 16-bit pixel
@R0
D=M+1

@KBD
D=A-D

@R0
M=M+1

//if D>0 still need to fill 
@UPDATE
D;JGT

@START
0;JMP