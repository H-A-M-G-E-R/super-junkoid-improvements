lorom

org $A7C81B ; fix kraid post-defeat music
LDX $079F
LDA $7ED828,x
BIT #$0001
BNE +
ORA #$0001
STA $7ED828,x
LDA #$C843
STA $0FA8
LDA #$0003
JSL $808FC1
RTL
+
LDA #$C851
STA $0FA8
RTL

org $A7B026 ; makes kraid vulnerable to uncharged shots
BEQ +
org $A7B033
+

org $A7AF5D : LDA #$0300 ; makes kraid transfer all of his mouth tilemap
