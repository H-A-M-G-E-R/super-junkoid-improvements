lorom

!PreviousMapXPosition = $0B1C ; cleared when initializing samus
!PreviousMapYPosition = $0B1D

org $90A7E2 : RTL
CheckMinimapUpdate:
; only update minimap if needed
SEP #$30
LDA $0AF7 : CLC : ADC $07A1 : TAX
CMP !PreviousMapXPosition : BNE .updateMinimap
LDA $0AFB : CLC : ADC $07A3
CMP !PreviousMapYPosition : BEQ .noUpdate
.updateMinimap
STX !PreviousMapXPosition : STA !PreviousMapYPosition
REP #$30
JMP $A925
.noUpdate
; flash center of minimap
LDA $05B5 : AND #$08 : BNE +
LDA $7EC681 : ORA #$1C : STA $7EC681
PLP : RTL
+
LDA $7EC681 : AND #$EB : STA $7EC681
PLP : RTL

org $90A91C
JMP CheckMinimapUpdate

org $90AAF2 : BRA + : org $90AB08 : + ; no more stupid

org $82DF99 ; we don't need door area change flag anymore
LDX $079B : LDA $8F0001,x : AND #$00FF : CMP $079F : BEQ +
PHA
JSL $8085C6 ; Save map of current area explored
PLA : STA $079F
JSL $80858C ; Load map of new area explored
TDC : DEC : STA !PreviousMapXPosition ; force minimap to update (previous X position = FFFFh)
+ : RTS

org $82E37C : BRA $01
