; room names ASM. This patch allows you to give every room in your hack a unique name, displayed at the top of the hud, like super metroid: ascent
;in order to do this, you do lose the top part of the upgrade icons, meaning you wil have to redraw them yourself to something else
;made by Tundain, modified by H A M for Super Junkoid
;don't forget to credit

;make sure to include the roomnamesgrammar.tbl in the ASM folder, and set up the path accordingly (line 135)
lorom

;freespace  pointers
!UniversalbankFreespace = $82FC60 ; place this in any bank, if you have many rooms in your hack, make sure there's a lot of space
!Bank80Freespace = $80E030 ; freespace in $80, doesn't need much
!Bank82Freespace = $82FC30 ; freespace in $82, doesn't need much


;hijacks
org $82E75A
  JSR gofurther : NOP
org $809ADB
  JSR gofurtherHudinit

; these routines jump to the name drawing routine, which is in another bank
org !Bank82Freespace
gofurther:
print "gorfurther: ",pc
  JSL $848270
  LDX $0330 ; reset top row
  LDA #$0040
  STA $D0,x
  LDA #$988B
  STA $D2,x
  LDA #$8098
  STA $D3,x
  LDA #$5800
  STA $D5,x
  TXA
  CLC
  ADC #$0007
  STA $0330
  JSL drawtoprow
  RTS

org !Bank80Freespace
gofurtherHudinit:
  JSL drawtoprow
  LDA $09D0
  RTS
 ; -----------generic room name drawing routine------------
org !UniversalbankFreespace
drawtoprow:
print "draw: ",pc
  PHB : PHK : PLB
  LDA $079F : ASL : TAX ; area index * 2
  LDA #$00DF : STA $14 : LDA $DFD502,X : STA $12 ; get pointer to pointers of room names in an area
  LDA $079D : ASL : TAY ; room index * 2
  LDA [$12],y : STA $12 ; get pointer to room name
  LDA [$12] : AND #$00FF : TAY ; number of characters in the room name
  ASL
  TAX
  STA $16
draw:
  LDA [$12],y
  AND #$00FF
  CLC
  ADC #ASCIIMap
  STA $18
  LDA ($18)
  AND #$00FF
  ORA #$2800
  STA $7EDF5A,x
  DEX : DEX : DEY
  BNE draw
  LDX $0330
  LDA $16
  STA $D0,x
  LDA #$DF5C
  STA $D2,x
  LDA #$7EDF
  STA $D3,x
  LDA #$5800
  STA $D5,x
  TXA
  CLC
  ADC #$0007
  STA $0330
  PLB : RTL
ASCIIMap:
;  0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,
   $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,
   $0F,$CA,$0F,$0F,$0F,$D2,$0F,$FC,$0F,$0F,$0F,$55,$FB,$D0,$CB,$0F,
   $CF,$00,$56,$02,$03,$57,$05,$06,$07,$08,$0F,$0F,$0F,$0F,$0F,$FE,
   $0F,$B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,
   $BF,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$0F,$0F,$0F,$0F,$0F,
   $0F,$B0,$B1,$B2,$B3,$B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB,$BC,$BD,$BE,
   $BF,$C0,$C1,$C2,$C3,$C4,$C5,$C6,$C7,$C8,$C9,$0F,$0F,$0F,$0F,$0F
