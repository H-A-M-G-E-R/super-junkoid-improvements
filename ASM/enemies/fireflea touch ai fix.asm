lorom

org $A38E6B
JSL $A38023
LDA $0F8C,x : BEQ + ; if enemy is killed by contact damage, go there
TXY : LDA $0F78,x : TAX
LDA $0F9E,y
JMP A3Freespace

org $A38E95 : +
org $A38E9C : CMP #$000C ; fixes fireflea darkness overflow

org A3Freespace ; See "enemies unfreeze faster in heated rooms.asm" for location of freespace
BNE +
LDA $A0000E,x : BEQ +
JSL $8090B7 ; queue enemy cry if not frozen
+
LDA $A00022,x : JSL $A0A3AF ; death explosion
JMP $8E95
