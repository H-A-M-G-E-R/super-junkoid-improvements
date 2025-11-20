lorom

org $80A44E : LDX #$0000
org $80A486 : LDX #$0000
org $80AF8D : BRA $3C
org $80AFF8 : BRA $26
org $80B029 : CPX #$001C

org $82E34C : LDA #$E36E
org $82E3B0 : BRA $00

org $80E000
InterruptCommand4:
SEP #$20
LDA #$5A : STA $2109
LDA $70 : STA $2130
LDA $73 : AND #$FB : STA $2131
LDA $6A : ORA #$04 : STA $212C
REP #$20
LDA #$0006 : LDY #$001F : LDX #$0098 : RTS

org $809616+4 : dw InterruptCommand4

org $80988B
!a = $80988B
while !a < $8099CF
	dw read2(!a)|$2000 ; set priority bit for bg3
	!a #= !a+2
endwhile
