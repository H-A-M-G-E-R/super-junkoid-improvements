lorom

org $8B91B8 : LDA #$03 ; mode 3
org $8B9259 : LDA #$01 ; Main screen layers = BG1

org $8B9293
; tiles
LDA #CompressedTiles : STA $47 : LDA #CompressedTiles>>8 : STA $48 : JSL $80B0FF : dl $7F0000
LDA #$0080 : STA $2115 : STZ $2116
JSL $8091A9
db $00,$01,$18 : dl $7F0000 : dw $A2C0
SEP #$20 : LDA #$01 : STA $420B

LDA #$80 : STA $51 ; zero brightness

; tilemap
LDA #$54 : STA $58 ; BG1 tilemap base address = $5400, size = 32x32
STA $2117 : STZ $2116
JSL $8091A9
db $00,$01,$18 : dl Tilemap : dw $0800
LDA #$01 : STA $420B

; palette
REP #$30
LDX #$01FE
- : LDA.l Palette,x : STA $7EC000,x : DEX : DEX : BPL -

; SPC engine and music
LDA $80845D : STA $00 : LDA $80845E : STA $01 : JSL $808024 ; Upload SPC engine to APU (gets repointed by SMART)
TDC : - : DEC : BNE - ; wait for spc engine
LDA.w #Song33 : STA $00 : LDA.w #Song33>>8 : STA $01 : JSL $808024 ; upload music
TDC : - : DEC : BNE - ; again
SEP #$20 : LDA #$05 : STA $2140 : REP #$20 ; play music

JSL $80834B ; enable nmi
TDC : INC : STA $0723 : STA $0725 ; Screen fade delay = screen fade counter = 1

-
JSR $9100 ; Advance fast screen fade in
JSL $808338 ; Wait for NMI
BCC - ; If not max brightness: loop

; wait for 6 seconds
LDA.w #60*6
-
JSL $8082C5 ; Wait until the end of a v-blank (A is preserved)
DEC : BNE -

-
JSR $90B8 ; Advance fast screen fade out
JSL $808338 ; Wait for NMI
BCC - ; If not reached zero brightness: loop

PLB : PLP : RTL

assert pc() <= $8B936B

org $808459
BRA +
org $808482
+

org $F38000
Tilemap: incbin "map"
Palette: incbin "palette"

check bankcross off

CompressedTiles: incbin "compressed tiles"
%padSafe($F48A00)

check bankcross full
