; Bomb damage scales depending on beams equipped, including hyper beam. It's set to half the charged beam damage. Vulnerabilities remain unchanged.

lorom

org $9380CC
JMP SetBombDamage

org $93FF00
SetBombDamage:
LDA $0C19,x : CMP #$0005 : BNE .NotBomb ; If bomb:
LDA $09A6 : AND #$000F : ASL : TAY
LDA $83D9,y : TAY : LDA $0000,y : LSR
LDY $0A76 : BEQ .NoHyper : LDA $83BF : LSR : .NoHyper ; If hyper: bomb damage = half of hyper beam damage
STA $0C2C,x ; Else: bomb damage = half of charged beam damage
.NotBomb : PLB : PLP : RTL