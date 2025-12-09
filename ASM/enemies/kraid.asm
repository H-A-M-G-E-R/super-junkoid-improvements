lorom

org $A7C81B ; fix kraid post-defeat music
LDX $079F
LDA $7ED828,x
BIT #$0001
BNE +
ORA #$0001
STA $7ED828,x
LDA #$C843
STA $0FA8
LDA #$0003
JSL $808FC1
RTL
+
LDA #$C851
STA $0FA8
RTL

org $A7B026 ; makes kraid vulnerable to uncharged shots
BEQ +
org $A7B033
+

org $A7AF5D : LDA #$0300 ; makes kraid transfer all of his mouth tilemap

org $A7ABCA ; no more bottom lint
JSR $A943 ; Set enemy properties to dead
RTL

; in Kraid lint / Samus collision handling
org $A7B973 : BRA $03
org $A7B9E4
LDA $18A8 : BNE +
  JSL $A0A477
  LDA.w #60 : STA $18AA
+
RTS

assert pc() <= $A7B9F5

org $A7ADE1 ; in Set up Kraid gets big - thinking
LDA #$AEA4 ; Kraid function = Kraid main loop

org $A7AEC4 ; formerly Kraid function - Kraid gets big - thinking
LDA #$AEA4 : STA $0FA8 ; Kraid function = Kraid main loop
JMP $AE0D ; Go to set random thinking timer

org $A7AE0D ; thinking timer
JSL $808111 : AND.w #127 : CLC : ADC.w #100 : STA $7E7806 ; Kraid thinking timer = random number 0-127 + 100
RTS

org $A7B7A8 : LDA #$BBEA ; fire when shot

org $A7AEEC ; in Kraid function - Kraid shot - Kraid's mouth is open
JSR $AEC4 : BRA $01

org $A7BC23 ; in Kraid function - Kraid main loop - attacking with mouth open
JSR $AEC4

; fire in the hole
org $A7AF95 : LDA #$0059

; new gfx
org read3($A0E2BF+$36)
incbin "ImmodestJunko.gfx"

; gfx size
org $A0E2BF : dw filesize("ImmodestJunko.gfx")
org $A0E2FF : dw filesize("ImmodestJunko.gfx")
org $A0E33F : dw filesize("ImmodestJunko.gfx")
org $A0E37F : dw filesize("ImmodestJunko.gfx")
org $A0E3BF : dw filesize("ImmodestJunko.gfx")
org $A0E3FF : dw filesize("ImmodestJunko.gfx")
org $A0E43F : dw filesize("ImmodestJunko.gfx")
org $A0E47F : dw filesize("ImmodestJunko.gfx")

; spritemaps
org $A78C6C
ImmodestJunkoLintSpritemap:
dw $0003 : db $F4,$81,$F8,$42,$21, $E4,$81,$F8,$40,$21, $04,$80,$F8,$44,$21

org $8D8268
ImmodestJunkoRockSpritemap_Big:
dw $0001 : db $F8,$81,$F8,$46,$31

ImmodestJunkoRockSpritemap_Small:
dw $0001 : db $FC,$01,$FC,$48,$31

; laser (yes i stole them from mecha ridley bc im not a sprite artist)
%BEGIN_FREESPACE(86)

ImmodestJunkoLaser:
{
  dw ImmodestJunkoLaserInit ; Initialisation AI
  dw ImmodestJunkoLaserMain ; Initial pre-instruction
  dw 0 ; Initial instruction list
  db 8 ; X radius
  db 8 ; Y radius
  dw $4000|$1000|15 ; Properties (don't die on contact, high priority)
  db 0 ; Hit instruction list
  db 0 ; Shot instruction list
}

ImmodestJunkoLaserInit:
{
  ; place it at her wand (just guessing)
  LDA $0F7A : CLC : ADC #$0004 : STA $1A4B,y
  LDA $0F7E : SEC : SBC #$0068 : STA $1A93,y
  LDA $1993 ; init param
  AND #$000E : TAX
  LDA.w .iListTable,x : STA $1B47,y
  LDA.w .xSpeedTable,x : STA $1AB7,y
  LDA.w .ySpeedTable,x : STA $1ADB,y
  LDA #$0017 : JSL $80914D ; Queue sound, sound library 3, max queued sounds allowed = 6 (blue rings)
  RTS

.iListTable
  dw ImmodestJunkoLaserInst_Forward
  dw ImmodestJunkoLaserInst_Forward
  dw ImmodestJunkoLaserInst_Forward
  dw ImmodestJunkoLaserInst_SlightlyDown
  dw ImmodestJunkoLaserInst_SlightlyDown
  dw ImmodestJunkoLaserInst_SlightlyDown
  dw ImmodestJunkoLaserInst_Down
  dw ImmodestJunkoLaserInst_Down

.xSpeedTable
  dw -5*$100
  dw -5*$100
  dw -5*$100
  dw -4*$100
  dw -4*$100
  dw -4*$100
  dw -3.75*$100
  dw -3.75*$100

.ySpeedTable
  dw 0*$100
  dw 0*$100
  dw 0*$100
  dw 1.5*$100
  dw 1.5*$100
  dw 1.5*$100
  dw 3.75*$100
  dw 3.75*$100
}

ImmodestJunkoLaserMain:
{
  JSR $88B6 ; Move enemy projectile horizontally
  BCS .collision
  JSR $897B ; Move enemy projectile vertically
  BCS .collision
  RTS

.collision
  ; spawn small explosion sprite object
  LDA $1A4B,x : STA $12
  LDA $1A93,x : STA $14
  LDA #$0003 : STA $16
  STZ $18
  JSL $B4BC26
  LDA #$0010 : JSL $80914D ; Queue sound, sound library 3, max queued sounds allowed = 6 (shinespark ended)
  STZ $1997,x ; kill enemy projectile
  RTS
}

ImmodestJunkoLaserInst_Forward:
{
  dw 3,ImmodestJunkoLaserOam_Forward0
  dw 3,ImmodestJunkoLaserOam_Forward1
  dw 1,$8000 ; blank spritemap
  dw $81AB,ImmodestJunkoLaserInst_Forward
}

ImmodestJunkoLaserInst_SlightlyDown:
{
  dw 3,ImmodestJunkoLaserOam_SlightlyDown0
  dw 3,ImmodestJunkoLaserOam_SlightlyDown1
  dw 1,$8000 ; blank spritemap
  dw $81AB,ImmodestJunkoLaserInst_SlightlyDown
}

ImmodestJunkoLaserInst_Down:
{
  dw 3,ImmodestJunkoLaserOam_Down0
  dw 3,ImmodestJunkoLaserOam_Down1
  dw 1,$8000 ; blank spritemap
  dw $81AB,ImmodestJunkoLaserInst_Down
}

%END_FREESPACE(86)

%BEGIN_FREESPACE(8D)
ImmodestJunkoLaserOam_Forward0:
dw $0004 : db $E1,$81,$FC,$64,$21, $F1,$81,$FC,$66,$21, $FF,$81,$FC,$66,$61, $0F,$80,$FC,$64,$61

ImmodestJunkoLaserOam_Forward1:
dw $0004 : db $E1,$81,$FC,$60,$21, $F1,$81,$FC,$62,$21, $FF,$81,$FC,$62,$61, $0F,$80,$FC,$60,$61

ImmodestJunkoLaserOam_SlightlyDown0:
dw $0006 : db $EB,$81,$FF,$4C,$21, $E3,$01,$07,$5B,$21, $FB,$01,$FF,$4E,$21, $03,$80,$F1,$4C,$E1, $13,$00,$F1,$5B,$E1, $FB,$01,$F9,$4E,$E1

ImmodestJunkoLaserOam_SlightlyDown1:
dw $0006 : db $E9,$81,$00,$49,$21, $E1,$01,$08,$58,$21, $F9,$01,$00,$4B,$21, $03,$80,$F1,$49,$E1, $13,$00,$F1,$58,$E1, $FB,$01,$F9,$4B,$E1

ImmodestJunkoLaserOam_Down0:
dw $0004 : db $E8,$81,$08,$6C,$21, $F2,$81,$FE,$6E,$21, $08,$80,$E8,$6C,$E1, $FE,$81,$F2,$6E,$E1

ImmodestJunkoLaserOam_Down1:
dw $0004 : db $E8,$81,$08,$68,$21, $F2,$81,$FE,$6A,$21, $08,$80,$E8,$68,$E1, $FE,$81,$F2,$6A,$E1
%END_FREESPACE(8D)

org $A7BC02 ; in Kraid function - Kraid main loop - attacking with mouth open
; make her shoot lasers
LDA $0FAC : AND #$001F : BNE $18
TDC : TAX
JSL $808111 ; random number
LDY.w #ImmodestJunkoLaser
JML $868027
