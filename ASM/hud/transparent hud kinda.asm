lorom

org $80A44E : LDX #$0000
org $80A486 : LDX #$0000
org $80AF8D : BRA $3C
org $80AFF8 : BRA $26
org $80B029 : CPX #$001C

org $82E34C : LDA #$E36E
org $82E3B0 : BRA $00

org $80E110 ; who put room data above there
InterruptCommand4:
SEP #$20
LDA #$5A : STA $2109
LDA $70 : STA $2130
LDA $73 : AND #$FB : STA $2131
LDA $6A : ORA #$04 : STA $212C
REP #$20
LDA #$0006 : LDY #$001F : LDX #$0078 : RTS ; compatibility with tundain's fx-compatible message boxes

org $80D280+4 : dw InterruptCommand4

macro setBG3TilemapPriority(start, end)
	org <start>
	!a = <start>
	while !a < <end>
		dw read2(!a)|$2000 ; set priority bit for bg3
		!a #= !a+2
	endwhile
endmacro

%setBG3TilemapPriority($80988B, $8099CF)
%setBG3TilemapPriority($80D1A3, $80D1AF) ; magic soap
%setBG3TilemapPriority($80FA0F, $80FA1B) ; hyper shot
%setBG3TilemapPriority($80D1AF, $80D1AF+8) ; zahav
%setBG3TilemapPriority($80D1B7, $80D1B7+8) ; dreamer's crown

; make minimap transparent
org $90AAAE : LDA #$000F
org $90AAD5 : LDA #$000F
org $90AB12 : LDA #$000F
