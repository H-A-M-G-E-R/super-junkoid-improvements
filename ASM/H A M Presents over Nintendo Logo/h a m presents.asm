lorom

org $8B91B8 : LDA #$03 ; mode 3
org $8B9259 : LDA #$01 ; Main screen layers = BG1

org $8B9293
LDA #$0080 : STA $2115 : STZ $2116
JSL $8091A9
db $01,$01,$18 : dl TilesPart1 : dw $8000
SEP #$20 : LDA #$02 : STA $420B
JSL $8091A9
db $01,$01,$18 : dl TilesPart2 : dw $22C0
LDA #$02 : STA $420B
LDA #$80 : STA $51 ; zero brightness
LDA #$54 : STA $58 ; BG1 tilemap base address = $5400, size = 32x32
STA $2117 : STZ $2116
JSL $8091A9
db $01,$01,$18 : dl Tilemap : dw $0800
LDA #$02 : STA $420B
REP #$30
LDX #$01FE
- : LDA.l Palette,x : STA $7EC000,x : DEX : DEX : BPL -
JSL $80834B ; wait for nmi
TDC : INC : STA $0723 : STA $0725
-
JSR $9100 ; Advance fast screen fade in
BCS + ; If not max brightness:
JSL $808338 : BRA - ; Wait for NMI and loop
+
JSL $808338 ; Wait for NMI
LDA $80845D : STA $00 : LDA $80845E : STA $01 : JSL $808024 ; Upload SPC engine to APU (gets repointed by SMART)
-
JSR $90B8 ; Advance fast screen fade out
BCS + ; If not reached zero brightness:
JSL $808338 : BRA - ; Wait for NMI and loop
+
JSL $808338 ; Wait for NMI
PLB : PLP : RTL

org $808459
BRA +
org $808482
+

org $DF8000
TilesPart1: incbin "tiles part 1"
org $E08000
TilesPart2: incbin "tiles part 2"
Tilemap: incbin "map"
Palette: incbin "palette"