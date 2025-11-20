lorom

org $82EEB7
LDA $7ED914 : BEQ NoData
STA $0998
CMP #$0022 : BNE +
LDA #$C11B : STA $1F51 ; Ceres exploding cutscene
BRA +
NoData:
LDA #$0005 : STA $0998 : STA $7ED914 ; Game state = loading game state = 5 (file select map)
STZ $079F ; Area = Crateria
STZ $078B ; Load station index = 0
LDA $0952 : JSL $818000 ; Save current save slot to SRAM
+
STZ $099E : RTS