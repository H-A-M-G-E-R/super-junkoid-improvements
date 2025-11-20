; Charge flare fixes + optimization
; by H A M
; Fixes the charge sparks' color when facing right + correct graphics when moonwalking. Also frees up $90BC7A..BCBD (44h/68 bytes).
lorom

org $90BBE1
DrawFlarePart:
STX $16 ; flare animation index
LDA $0A1C : ASL : ASL : ASL : TAX ; Samus pose
LDA $91B62D,x : AND #$00FF : STA $18 ; Y offset of projectile origin
LDA $91B62C,x : AND #$000F : CMP #$000F : BNE + ; check if flare can be drawn
RTS
+
ASL : TAX
LDA $093F : BPL +
LDA $0AF6 : PHA : LDA $0AFA : PHA : JSL $8B8A52 ; ceres rotating elevator room, backup samus positions and offset her
+
LDA $0A1F : AND #$00FF : DEC : BEQ .Running
LDA $C1A8,x : PHA : CLC : ADC $0AF6 : SEC : SBC $0911 : STA $14 ; calculate X position
LDA $C1C2,x : BRA +
.Running
LDA $C1DC,x : PHA : CLC : ADC $0AF6 : SEC : SBC $0911 : STA $14 ; calculate X position
LDA $C1F0,x
+
CLC : ADC $0AFA : SEC : SBC $18 : SBC $0915 : STA $12 : AND #$FF00 : BNE DontDraw ; calculate Y position, don't draw if offscreen
LDX $16 : PLA : TAY : BPL + ; base flare spritemap index on flare offset instead of Samus's direction
LDA $93A22B,x : BRA ++ ; get flare spritemap
+
LDA $93A225,x
++
CLC : ADC $0CD6,x ; add by flare animation frame
JSL $818A37 ; draw the spritemap
BRA +
DontDraw:
PLA
+
LDA $093F : BPL +
PLA : STA $0AFA ; ceres rotating elevator room, restore samus positions
PLA : STA $0AF6
+
RTS
AfterDrawFlarePart:

; Charge sparks
org $93A6FD
dw $0003
dw $0000 : db $0C : dw $2C5B
dw $0008 : db $EC : dw $2C5B
dw $01F0 : db $F4 : dw $2C5B

org $93A70E
dw $0003
dw $01FD : db $0A : dw $2C5C
dw $0006 : db $EE : dw $2C5C
dw $01F2 : db $F6 : dw $2C5C

org $93A71F
dw $0003
dw $01FC : db $08 : dw $2C5C
dw $0004 : db $F0 : dw $2C5C
dw $01F4 : db $F8 : dw $2C5C

org $93A730
dw $0003
dw $0002 : db $F2 : dw $2C5D
dw $01FB : db $06 : dw $2C5D
dw $01F6 : db $FA : dw $2C5D

org $93A741
dw $0003
dw $01FB : db $04 : dw $2C5D
dw $01F8 : db $FB : dw $2C5D
dw $0000 : db $F4 : dw $2C5D

org $93A752
dw $0003
dw $01FB : db $02 : dw $2C5D
dw $01FA : db $FA : dw $2C5D
dw $0000 : db $F6 : dw $2C5D

org $93A763
dw $0003
dw $0000 : db $EC : dw $AC5B
dw $0008 : db $0C : dw $AC5B
dw $01F0 : db $04 : dw $AC5B

org $93A774
dw $0003
dw $01FE : db $EE : dw $AC5C
dw $0006 : db $0A : dw $AC5C
dw $01F2 : db $02 : dw $AC5C

org $93A785
dw $0003
dw $0004 : db $08 : dw $AC5C
dw $01F4 : db $00 : dw $AC5C
dw $01FD : db $F0 : dw $AC5C

org $93A796
dw $0003
dw $0002 : db $06 : dw $AC5D
dw $01FC : db $F2 : dw $AC5D
dw $01F6 : db $FE : dw $AC5D

org $93A7A7
dw $0003
dw $01FC : db $F4 : dw $AC5D
dw $01F8 : db $FC : dw $AC5D
dw $0000 : db $04 : dw $AC5D

org $93A7B8
dw $0003
dw $01FC : db $F6 : dw $AC5D
dw $01FA : db $FD : dw $AC5D
dw $0000 : db $02 : dw $AC5D
