lorom

org $82F3C2 : LDA #$0010
ScrollCursor:
SEC : SBC $B3 : STA $1ABD,x : RTS
CheckForScrollDown:
LDA $0DE2 : SEC : SBC #$0009 : BEQ +
INC : BEQ +
TDC : INC : JMP $F2B4
+ : JMP $F2BE
org $82F2B1 : JMP CheckForScrollDown
org $82F2DC : JSR ScrollCursor
org 2*9+$82F2ED : dw $F31B,$F31B
org 4*7+$82F31B : dw $0028,$00D8 : dw $0028,$00F0