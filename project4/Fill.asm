// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(LOOP)
@SCREEN
D=A
@pixels
M=D

@KBD
D=M
@RESET
D;JEQ
@SCREENLOOP
D;JGT

(SCREENLOOP)
    @32767
    D=A
    @pixels
    A=M
    M=D


    @pixels
    M=M+1

    //Exit loop
    @KBD
    D=M
    @LOOP
    D;JEQ

    @SCREENLOOP
    0;JMP

(RESET)
    @pixels
    A=M
    M=0
    @pixels
    M=M+1

    @KBD
    D=M
    @LOOP
    D;JGT

    @RESET
    0;JMP

@LOOP
0;JMP