lorom

org $88DDC7
SpawnHaze:
{
JSL $888435 : dw $2100,CGADDHDMAIList ; HDMA to CGADD
JSL $888435 : dw $2242,CGDATAHDMAIList ; Indirect HDMA to CGDATA
RTL
}
CGADDHDMAIList:
{
dw $8655 : db $88 ; HDMA table bank = $88
dw $0001,CGADDHDMATable,
   $8682 ; Sleep
}
CGDATAHDMAIList:
{
dw $8655 : db $88 ; HDMA table bank = $88
dw $866A : db $7E ; Indirect HDMA data bank = $7E
dw $8570 : dl CGDATAHDMAPreInstructionInit ; Set pre-instruction
dw $0001,CGDATAHDMATable,
   $8682 ; Sleep
}
CGDATAHDMAPreInstructionInit:
{
STZ $1914,x ; HDMA object max color = (0,0,0)
LDA $099C : CMP #$E737 : BEQ + ; If [door transition function] != $E737 (fading in): return
RTL
+
LDA #CGDATAHDMAPreInstructionFadingIn : STA $18F0,x
}
CGDATAHDMAPreInstructionFadingIn:
{
LDA $1914,x : CMP #$4200 : BEQ Done ; If [HDMA object max color] = (0,10h,10h): go to Done
JSR SetHDMAData
LDA $1914,x : CLC : ADC #$0420 : STA $1914,x ; HDMA object max color += (0,1,1)
Common:
TDC : STA $7EC036 ; BG3 palette 6 color 2 = (0,0,0)
LDA #$0018 : STA $1986 ; Layer blending configuration = 18h (BG3 is drawn with the result of drawing BG1/BG2/sprites added on top)
RTL
Done:
LDA #CGDATAHDMAPreInstructionFadedIn : STA $18F0,x
BRA Common
}
CGDATAHDMAPreInstructionFadedIn:
{
LDA $099C : CMP #$E2DB : BEQ + ; If [door transition function] != $E2DB (fading out):
LDA $0998 : CMP #$0013 : BNE Common ; If [game state] != death sequence, start: go to Common
+
LDA #CGDATAHDMAPreInstructionFadingOut : STA $18F0,x
}
CGDATAHDMAPreInstructionFadingOut:
{
LDA $1914,x : BMI Common ; If [HDMA object max color] < (0,0,0): go to Common
JSR SetHDMAData
LDA $1914,x : SEC : SBC #$0420 : STA $1914,x ; HDMA object max color -= (0,1,1)
BRA Common
}
SetHDMAData:
{
PHX
LDX #$1E
SEC
-
STA $7E9D00,x
SBC #$0420 : BPL +
TDC
+
DEX : DEX : BPL -
PLX
RTS
}
CGADDHDMATable:
{
db $40,$1B, ; 0
   $08,$1B, ; 1
   $08,$1B, ; 2
   $08,$1B, ; 3
   $08,$1B, ; 4
   $08,$1B, ; 5
   $08,$1B, ; 6
   $08,$1B, ; 7
   $08,$1B, ; 8
   $08,$1B, ; 9
   $08,$1B, ; A
   $08,$1B, ; B
   $08,$1B, ; C
   $08,$1B, ; D
   $08,$1B, ; E
   $08,$1B, ; F
   $00
}
CGDATAHDMATable:
{
db $40 : dw $9D00
db $08 : dw $9D02
db $08 : dw $9D04
db $08 : dw $9D06
db $08 : dw $9D08
db $08 : dw $9D0A
db $08 : dw $9D0C
db $08 : dw $9D0E
db $08 : dw $9D10
db $08 : dw $9D12
db $08 : dw $9D14
db $08 : dw $9D16
db $08 : dw $9D18
db $08 : dw $9D1A
db $08 : dw $9D1C
db $08 : dw $9D1E
db $00
}