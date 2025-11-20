lorom

org $A4BA21 ; change penguinmire weaknesses
PenguinmireWeaknesses:
{
LDA $0C18,x : BIT #$0F00 : BNE .NotBeam
LDX #$0002 ; charged shot damage
BIT #$0010 : BNE +
LDX #$0001 ; uncharged shot damage
BRA +
.NotBeam
AND #$0F00
LDX #$0003 ; baseball damage
CMP #$0100 : BEQ +
LDX #$0003 ; super baseball damage
CMP #$0200 : BEQ +
LDX #$0001 ; rat burst damage
+
TXA : BNE +
LDA #$0008 : STA $0F94 : JMP $BAB4 ; dud
org $A4BA59 : +
}

org $A48A96 ; fix penguinmire commom sprite palettes
LDX #$001E
- : LDA $B8BD,x : STA $7EC340,x : DEX : DEX : BPL -
BRA + : org $A48AAB : +