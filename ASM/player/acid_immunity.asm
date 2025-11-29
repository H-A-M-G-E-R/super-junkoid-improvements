
org $909E8B
dd 0.3125*$10000 ; lava damage
dd 0.5*$10000 ; acid damage (was 1.3125 per frame)

; acid immunity
org $908222
LDA $09A2 : BIT #$0001 : BNE ++ ; branch if varia
LDA $09DA : BIT #$0007 : BNE +
LDA #$002D : JSL $809139
+ ; $908239
org $90824C : ++

; lava immunity
org $9081DB : BIT #$0001
org $90820F : JMP $824C

org $94BB00 ; damage block
LDA $09A2 : LSR : BCS +
INC $0A50 ; decrement health
+
RTS
