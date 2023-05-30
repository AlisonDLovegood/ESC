// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)

@SCREEN
D=A
@screen_start
M=D

@8192
D=A
@counter
M=D

@KBD
D=M

@WHITE
D; JEQ

@BLACK
0; JMP

(WHITE)

@screen_start
A=M
D=M
M=0

@LOOP
D; JEQ

@screen_start
M=M+1

@counter
M=M-1
D=M

// Se counter alcançou 0, retorna ao início do programa
@LOOP
D; JEQ

// Se não, passa para o próximo preenchimento de tela com branco
@WHITE
0; JMP

(BLACK)

@screen_start
A=M
D=M
M=-1

// Se o local já estiver preenchido com 1, retorna ao início do programa
@LOOP
D; JLT

@screen_start
M=M+1

@counter
M=M-1
D=M

// Se counter alcançou 0, retorna ao início do programa
@LOOP
D; JEQ

// Se não, passa para o próximo preenchimento de tela com preto
@BLACK
0; JMP