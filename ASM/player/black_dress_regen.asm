lorom

org $90E9CE ; Handle periodic damage to Samus
HandlePeriodicDamage:
{
PHP : REP #$30
LDA $0A78 : BNE .timeFrozen
LDA $09A2 : LSR : BCC .noVaria
LSR $0A50 : ROR $0A4E
.noVaria
BIT.w #$0080>>1 ; black dress bit
BEQ +
; no regen if periodic damage
LDA $0A50 : ORA $0A4E : BNE +
; regen 2 hp/s
LDA $0A4C : CLC : ADC.w #$10000*2/60 : STA $0A4C
LDA $09C2 : ADC #$0000 : STA $09C2
CMP $09C4 : BCC +
; cap at max health
STA $09C4 : STZ $0A4C
+
LDA $0A4C : SEC : SBC $0A4E : STA $0A4C
LDA $09C2 : SBC $0A50 : STA $09C2
BPL .timeFrozen
STZ $0A4C : STZ $09C2
.timeFrozen
STZ $0A4E : STZ $0A50
PLP : RTS
}
assert pc() <= $90EA45
