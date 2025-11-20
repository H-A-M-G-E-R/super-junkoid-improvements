lorom

org $A899CC ; freespace from unused palettes
Spritemap1:
dw $0004
dw $81F0 : db $00 : dw $7106
dw $8000 : db $00 : dw $7104
dw $81F0 : db $F0 : dw $7102
dw $8000 : db $F0 : dw $7100
Spritemap2:
dw $0004
dw $81F0 : db $00 : dw $710A
dw $8000 : db $00 : dw $7108
dw $81F0 : db $F0 : dw $7102
dw $8000 : db $F0 : dw $7100
Spritemap3:
dw $0004
dw $81F0 : db $00 : dw $710E
dw $8000 : db $00 : dw $710C
dw $81F0 : db $F0 : dw $7102
dw $8000 : db $F0 : dw $7100
InstructionList:
dw $0010,Spritemap1
dw $0010,Spritemap2
dw $0010,Spritemap3
dw $80ED,InstructionList
FaceTowardsSamus:
LDX $0E54
LDA $0F92,x : CMP #$9A8C : BCS FacingRight
SEC : SBC #InstructionList : BRA +
FacingRight:
SEC : SBC #$9A8C
+
STA $12
LDA $0AF6 : CMP $0F7A : BPL SamusIsRightOfEnemy
LDA #InstructionList : BRA +
SamusIsRightOfEnemy:
LDA #$9A8C
+
CLC : ADC $12 : STA $0F92,x
RTS

org $A89B3C
JSR FaceTowardsSamus

; Bonus fixes: see https://patrickjohnston.org/bank/A8#f9D36
org $A89D45 : LDA $0AFA
org $A89DC3 : LDA $0AF6
org $A89DCD : LDA $0AFA
