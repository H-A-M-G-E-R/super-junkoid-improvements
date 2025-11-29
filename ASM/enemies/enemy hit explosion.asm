lorom

!Freespace = $B492C6 ; overwrite debug handler
!SpriteObjectPointer = $B4F4B8

org $A0A808
PLX : JSL CreateExplosion : BRA $00

org $A09A3D
LDA $0B64,y : STA $12
LDA $0B78,y : STA $14
LDA #$0006 : STA $16
STZ $18
JSL FixDudShot

org $A0A7C7
JSL FixDudShot

org $A0A8D4
JSL FixDudShot

; disable vanilla super missile earthquake on enemy
org $A09CA6 ; for extended spritemaps
BRA + : org $A09CBD : +

org $A0A1D8 ; for regular spritemaps
BRA + : org $A0A1EF : +

org !Freespace
CreateExplosion:
{
LDA $18A6 : ASL : TAY
LDA $0C04,y : AND #$0010 : BEQ +
LDA #$A117 : STA $0CB8,y ; Blank spritemap if projectile is flagged for deletion
+
LDA $0B64,y : STA $12
LDA $0B78,y : STA $14
STZ $18
LDA $0C18,y : AND #$0F00 : BNE .NotBeam
LDA $0C04,y : AND #$000F : ASL : TAX : JSR (BeamOffsetPointers,x)
LDX #BeamExplosionSpriteObject
LDA #$000C : BRA .PlaySound ; beam explosion sound
.NotBeam
LDX #MissileExplosionSpriteObject
CMP #$0100 : BEQ .Missile
CMP #$0200 : BNE .NotSuperMissile
;LDX #$001D ; super missile explosion
; zahav no earthquake
;LDA #$0014 : STA $183E ; super missile earthquake type
;LDA.w #31 : STA $1840 ; super missile earthquake duration (just 1 frame longer so all creepy crawlies fall)
.Missile
LDA #$0007 ; missile explosion sound
.PlaySound
JSL $8090B7
STX $16
JSL $B4BC26
.NotSuperMissile
LDX $0E54
RTL
}
BeamOffsetPointers:
dw Up,UpRight,Right,DownRight,Down,Down,DownLeft,Left,UpLeft,Up
UpRight:
JSR Right
Up:
LDA $14 : SEC : SBC $0BC8,y : STA $14 : RTS
DownRight:
JSR Down
Right:
LDA $12 : CLC : ADC $0BB4,y : STA $12 : RTS
DownLeft:
JSR Left
Down:
LDA $14 : CLC : ADC $0BC8,y : STA $14 : RTS
UpLeft:
JSR Up
Left:
LDA $12 : SEC : SBC $0BB4,y : STA $12 : RTS

FixDudShot:
PHX : PHY
LDA $18A6 : ASL : TAY
LDA $0C18,y : BIT #$0F00 : BNE +
LDA $0C04,y : AND #$000F : ASL : TAX : JSR (BeamOffsetPointers,x)
+
JSL $B4BC26
PLY : PLX : RTL

BeamExplosionSpriteObject:
dw $0003,$CAC9,
   $0003,$CAD7,
   $0003,.S1,
   $0003,.S2,
   $0003,.S3,
   $0003,.S4,
   $BD07
.S1
dw $0004, $0000 : db $00 : dw $FC60,
          $0000 : db $F8 : dw $7C60,
		  $01F8 : db $00 : dw $BC60,
		  $01F8 : db $F8 : dw $3C60
.S2
dw $0004, $0000 : db $00 : dw $FC61,
          $0000 : db $F8 : dw $7C61,
		  $01F8 : db $00 : dw $BC61,
		  $01F8 : db $F8 : dw $3C61
.S3
dw $0004, $0000 : db $00 : dw $FC62,
          $0000 : db $F8 : dw $7C62,
		  $01F8 : db $00 : dw $BC62,
		  $01F8 : db $F8 : dw $3C62
.S4
dw $0004, $0000 : db $00 : dw $FC63,
          $0000 : db $F8 : dw $7C63,
		  $01F8 : db $00 : dw $BC63,
		  $01F8 : db $F8 : dw $3C63

MissileExplosionSpriteObject:
dw $0003,$CBC0,
   $0003,$CBC7,
   $0003,$CBDD,
   $0003,$CBF3,
   $0003,$CC09,
   $0003,$CC1F,
   $BD07

WaterFootstepSpriteObject:
dw $0003,.S1,
   $0003,.S2,
   $0003,.S3,
   $0003,.S4,
   $BD07
.S1
dw $0001, $01FC : db $FC : dw $2A2C
.S2
dw $0001, $01FC : db $FC : dw $2A2D
.S3
dw $0001, $01FC : db $FC : dw $2A2E
.S4
dw $0001, $01FC : db $FC : dw $2A2F

org $828B4B : BRA + : org $828B54 : + ; skip debug handler

; Allows using an instruction list pointer as sprite object ID

org $B4BC40
TDC : STA $7EF078,x : STA $7EF178,x : STA $7EF278,x : STA $7EF2F8,x
LDA $12 : STA $7EF0F8,x
LDA $14 : STA $7EF1F8,x
LDA $18 : STA $7EF078,x
LDA $16 : BMI +
ASL : TAY : LDA.w !SpriteObjectPointer,y
+
STA $7EEF78,x
