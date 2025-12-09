; ceiling sister is enemy fa53 and is in slot 1
; i'm gonna turn her into a bullet hell :)

;        $0F78/$00: ID
;        $0F7A/$02: X position
;        $0F7C/$04: X subposition
;        $0F7E/$06: Y position
;        $0F80/$08: Y subposition
;        $0F82/$0A: X radius
;        $0F84/$0C: Y radius
;        $0F86/$0E: Properties (Special in SMILE)
;        $0F88/$10: Extra properties (special GFX bitflag in SMILE)
;        $0F8A/$12: AI handler
;        $0F8C/$14: Health
;        $0F8E/$16: Spritemap pointer
;        $0F90/$18: Timer
;        $0F92/$1A: Initialisation parameter (Orientation in SMILE, Tilemaps in RF) / instruction list pointer
;        $0F94/$1C: Instruction timer
;        $0F96/$1E: Palette index
;        $0F98/$20: VRAM tiles index
;        $0F9A/$22: Layer
;        $0F9C/$24: Flash timer
;        $0F9E/$26: Frozen timer
;        $0FA0/$28: Invincibility timer
;        $0FA2/$2A: Shake timer
;        $0FA4/$2C: Frame counter
;        $0FA6/$2E: Bank
;        $0FA8/$30: AI variable, frequently function pointer
;        $0FAA/$32: AI variable
;        $0FAC/$34: AI variable
;        $0FAE/$36: AI variable
;        $0FB0/$38: AI variable
;        $0FB2/$3A: AI variable
;        $0FB4/$3C: Parameter 1 (Speed in SMILE)
;        $0FB6/$3E: Parameter 2 (Speed2 in SMILE)

org $A28B80 ; overwrite turtle ai
SlasherSisterCeilInit:
{
  LDX $0E54
  LDA.w #SlasherSisterCeilIList_Idle : STA $0F92,x
  LDA.w #SlasherSisterCeilIdleInit : STA $0F90,x
  RTL
}

SlasherSisterCeilMain:
{
  LDX $0E58 ; so i can access enemy ram from dp :)
  JSR ($0018,x)
  ; make it face samus
  LDA $0AF6 : CMP $02,x : BCS .right
  LDA $10,x : AND.w #~!EnemyProperty2_XFlip : STA $10,x
  RTL

.right
  LDA $10,x : ORA.w #!EnemyProperty2_XFlip : STA $10,x
  RTL
}

SlasherSisterCeilIdleInit:
{
  LDA.w #SlasherSisterCeilIList_Idle : JSR SlasherSisterCeilSetInstList
  LDA.w #SlasherSisterCeilIdle : STA $18,x
  LDA $0F78 : BEQ .enraged ; enrage if floor sister is dead
  JSL $808111 : AND.w #127 : CLC : ADC.w #30 : STA $30,x ; 30 + random number 0-127
  RTS

.enraged
  JSL $808111 : AND.w #31 : CLC : ADC.w #15 : STA $30,x ; 15 + random number 0-31
.rts
  RTS
}

SlasherSisterCeilIdle:
{
  DEC $30,x : BPL SlasherSisterCeilIdleInit_rts
  LDA.w #SlasherSisterCeilShooting : STA $18,x
  LDA $0F78 : BEQ .enraged
  LDA.w #SlasherSisterCeilIList_ShootingSlow : JMP SlasherSisterCeilSetInstList

.enraged
  JSL $808111 : XBA : AND #$0006 : TAY
  LDA.w .table,y : JMP SlasherSisterCeilSetInstList

.table
  dw SlasherSisterCeilIList_ShootingArcFast
  dw SlasherSisterCeilIList_ShootingArcFast
  dw SlasherSisterCeilIList_ShootingSpiralCW
  dw SlasherSisterCeilIList_ShootingSpiralCCW
}

SlasherSisterCeilShooting:
{
  RTS
}

SlasherSisterCeilSetInstList:
{
  STA $1A,x
  TDC : INC : STA $1C,x
  RTS
}

SlasherSisterCeilIList_Idle:
{
  dw 8,SlasherSisterCeilingSpritemap_Idle0
  dw 8,SlasherSisterCeilingSpritemap_Idle1
  dw 8,SlasherSisterCeilingSpritemap_Idle2
  dw 8,SlasherSisterCeilingSpritemap_Idle3
  dw 8,SlasherSisterCeilingSpritemap_Idle4
  dw 8,SlasherSisterCeilingSpritemap_Idle5
  dw 8,SlasherSisterCeilingSpritemap_Idle6
  dw 8,SlasherSisterCeilingSpritemap_Idle7
  dw $80ED,SlasherSisterCeilIList_Idle
}

SlasherSisterCeilIList_ShootingSlow:
{
  dw 21,SlasherSisterCeilingSpritemap_Idle0
  dw 5,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_RandomBulletAngleOffset,$000F
  dw SlasherSisterCeilInst_ShootArc,$0280
  dw 21,SlasherSisterCeilingSpritemap_Shooting1
  dw 5,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_FinishShooting
  dw $80ED,SlasherSisterCeilIList_Idle
}

SlasherSisterCeilIList_ShootingArcFast:
{
  dw 21,SlasherSisterCeilingSpritemap_Idle0
  dw 5,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_RandomBulletAngleOffset,$000F
  dw SlasherSisterCeilInst_ShootArc,$0380
  dw 31,SlasherSisterCeilingSpritemap_Shooting1
  dw 5,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_RandomBulletAngleOffset,$000F
  dw SlasherSisterCeilInst_ShootArc,$0380
  dw 21,SlasherSisterCeilingSpritemap_Shooting1
  dw 5,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_FinishShooting
  dw $80ED,SlasherSisterCeilIList_Idle
}

SlasherSisterCeilIList_ShootingSpiralCW:
{
  dw SlasherSisterCeilInst_RandomBulletAngleOffset,$003F
  dw 21,SlasherSisterCeilingSpritemap_Idle0
  dw 5,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$0300
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$03F8
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$03F0
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$03E8
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$03D0
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$03C8
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$03C0
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$03B8
  dw 21,SlasherSisterCeilingSpritemap_Shooting1
  dw 5,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_FinishShooting
  dw $80ED,SlasherSisterCeilIList_Idle
}

SlasherSisterCeilIList_ShootingSpiralCCW:
{
  dw SlasherSisterCeilInst_RandomBulletAngleOffset,$003F
  dw 21,SlasherSisterCeilingSpritemap_Idle0
  dw 5,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$0300
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$0308
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$0310
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$0318
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$0330
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$0338
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$0340
  dw 4,SlasherSisterCeilingSpritemap_Shooting1
  dw 3,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_ShootFour,$0348
  dw 21,SlasherSisterCeilingSpritemap_Shooting1
  dw 5,SlasherSisterCeilingSpritemap_Shooting0
  dw SlasherSisterCeilInst_FinishShooting
  dw $80ED,SlasherSisterCeilIList_Idle
}

SlasherSisterCeilInst_RandomBulletAngleOffset:
{
  JSL $808111 : AND $0000,y : STA $0FA8,x ; angle offset
  INY : INY : RTL
}

SlasherSisterCeilInst_ShootArc:
{
  LDA #$0034 : JSL $8090CB ; Queue sound 34h, sound library 2, max queued sounds allowed = 6 (cacatac spikes)
  LDA $0F7A,x : STA $00 : LDA $0F7E,x : CLC : ADC.w #15 : STA $02 ; position
  LDA $0001,y : AND #$00FF : STA $14 ; speed
  LDA.w #8 : STA $04 ; number of bullets
  PHY
  LDA $0000,y : AND #$00FF : CLC : ADC $0FA8,x : STA $12 ; angle
  .loop
    LDY.w #SlasherSisterCeilingBullet : JSL $868027
    LDA $12 : CLC : ADC #$0010 : AND #$00FF : STA $12 ; angle += 10h
    DEC $04 : BNE .loop
  PLY
  INY : INY : RTL
}

SlasherSisterCeilInst_ShootFour:
{
  LDA #$0034 : JSL $8090CB ; Queue sound 34h, sound library 2, max queued sounds allowed = 6 (cacatac spikes)
  LDA $0F7A,x : STA $00 : LDA $0F7E,x : CLC : ADC.w #15 : STA $02
  LDA $0001,y : AND #$00FF : STA $14
  LDA.w #4 : STA $04
  PHY
  LDA $0000,y : AND #$00FF : CLC : ADC $0FA8,x : STA $12
  .loop
    CMP #$0080 : BCC +
      LDY.w #SlasherSisterCeilingBullet : JSL $868027
    +
    LDA $12 : CLC : ADC #$0040 : AND #$00FF : STA $12
    DEC $04 : BNE .loop
  PLY
  INY : INY : RTL
}

SlasherSisterCeilInst_FinishShooting:
{
  LDA.w #SlasherSisterCeilIdleInit : STA $0F90,x
  RTL
}

SlasherSisterCeilingSpritemap_Idle0:
dw $0005 : db $F8,$01,$F4,$0C,$A1, $F4,$01,$F4,$0B,$A1, $00,$00,$F4,$0C,$E1, $04,$00,$F4,$0B,$E1, $F8,$81,$F9,$00,$E1

SlasherSisterCeilingSpritemap_Idle1:
dw $0005 : db $00,$00,$F4,$0C,$E1, $04,$00,$F3,$0C,$E1, $F8,$01,$F4,$0C,$A1, $F4,$01,$F4,$0B,$A1, $F8,$81,$F8,$00,$E1

SlasherSisterCeilingSpritemap_Idle2:
dw $0005 : db $FE,$01,$F3,$0D,$E1, $04,$00,$F4,$0C,$E1, $F8,$01,$F4,$0C,$A1, $F4,$01,$F4,$0B,$A1, $F8,$81,$F8,$00,$E1

SlasherSisterCeilingSpritemap_Idle3:
dw $0005 : db $F8,$01,$F3,$0B,$A1, $FE,$01,$F4,$0D,$E1, $04,$00,$F4,$0C,$E1, $F4,$01,$F4,$0B,$A1, $F8,$81,$F7,$00,$E1

SlasherSisterCeilingSpritemap_Idle4:
dw $0005 : db $F8,$01,$F4,$0B,$A1, $F4,$01,$F3,$0C,$A1, $FE,$01,$F4,$0D,$E1, $04,$00,$F4,$0C,$E1, $F8,$81,$F7,$00,$E1

SlasherSisterCeilingSpritemap_Idle5:
dw $0005 : db $F8,$01,$F3,$0C,$A1, $F4,$01,$F4,$0C,$A1, $FE,$01,$F4,$0D,$E1, $04,$00,$F4,$0C,$E1, $F8,$81,$F8,$00,$E1

SlasherSisterCeilingSpritemap_Idle6:
dw $0005 : db $F8,$01,$F4,$0C,$A1, $F4,$01,$F4,$0C,$A1, $00,$00,$F3,$0C,$E1, $04,$00,$F4,$0C,$E1, $F8,$81,$F8,$00,$E1

SlasherSisterCeilingSpritemap_Idle7:
dw $0005 : db $F8,$01,$F4,$0C,$A1, $F4,$01,$F4,$0C,$A1, $00,$00,$F4,$0C,$E1, $04,$00,$F3,$0B,$E1, $F8,$81,$F9,$00,$E1

SlasherSisterCeilingSpritemap_Shooting0:
dw $0009 : db $F8,$01,$F4,$0C,$A1, $F4,$01,$F4,$0B,$A1, $00,$00,$F4,$0C,$E1, $04,$00,$F4,$0B,$E1, $F4,$01,$F6,$0A,$E1, $FC,$01,$F6,$09,$E1, $04,$00,$F6,$08,$E1, $F4,$81,$FE,$03,$E1, $FC,$81,$FE,$02,$E1

SlasherSisterCeilingSpritemap_Shooting1:
dw $0009 : db $F8,$01,$F4,$0C,$A1, $F4,$01,$F4,$0B,$A1, $00,$00,$F4,$0C,$E1, $04,$00,$F4,$0B,$E1, $F4,$01,$F8,$1A,$E1, $FC,$01,$F8,$19,$E1, $04,$00,$F8,$18,$E1, $F4,$81,$00,$06,$E1, $FC,$81,$00,$05,$E1

assert pc() <= $A2998D


; change enemy header
org $A0FA53
EnemyHeader_FA53:
{
  dw $0400 ; Tile data size
  skip 2 ; Palette
  dw 966 ; Health
  dw 10 ; Damage
  dw 8 ; Width
  dw 8 ; Height
  db $A2 ; Bank
  db 0 ; Hurt AI time
  dw $0000 ; Cry
  dw $0000 ; Boss ID
  dw SlasherSisterCeilInit ; Initialisation AI
  dw 1 ; Number of parts
  dw $0000 ; Unknown 1
  dw SlasherSisterCeilMain ; Main AI
  dw $800A ; Grapple AI
  dw SlasherSisterCeilMain ; Hurt AI
  dw $8041 ; Frozen AI
  dw $0000 ; Time is frozen AI
  dw $0004 ; Death animation
  dw $0000 ; Unknown 2
  dw $0000 ; Unknown 3
  dw $0000 ; Power bomb reaction
  dw $0000 ; Unknown 4
  dw $0000 ; Unknown 5
  dw $0000 ; Unknown 6
  dw $8023 ; Enemy touch
  dw $802D ; Enemy shot
  dw $0000 ; Unknown 7
  skip 3 ; Tile data
  db $0005 ; Layer
  dw $0000 ; Drop chances
  skip 2 ; Vulnerabilities
  skip 2 ; Name
}


%BEGIN_FREESPACE(86)
SlasherSisterCeilingBullet:
{
  dw SlasherSisterCeilingBulletInit ; Initialisation AI
  dw SlasherSisterCeilingBulletMain ; Initial pre-instruction
  dw SlasherSisterCeilingBulletIList ; Initial instruction list
  db 2 ; X radius
  db 2 ; Y radius
  dw 10 ; Properties
  db 0 ; Hit instruction list
  db 0 ; Shot instruction list
}

; Parameters: $00 = X, $02 = Y, $12 = angle (standard maths convention), $14 = speed (unit = 1/2 pixel)
SlasherSisterCeilingBulletInit:
{
  LDA $00 : STA $1A4B,y : LDA $02 : STA $1A93,y ; position
  LDA $12 : PHX : TYX : STA $7E97DC,x : PLX ; angle
  ; calculate speeds
  JSL $A0B643 ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
  LDA $16 : LSR : STA $1AB7,y
  LDA $18 : ROR : STA $1AFF,y
  LDA $1A : LSR : STA $1ADB,y
  LDA $1C : ROR : STA $1B23,y
  RTS
}

SlasherSisterCeilingBulletMain:
{
  JSR $E73E ; Move enemy projectile according to enemy projectile angle and speed
  ; delete if offscreen
  JSR $BD2A : BEQ +
    STZ $1997,x
  +
  RTS
}

SlasherSisterCeilingBulletIList:
{
  dw 3,SlasherSisterCeilingBulletSpritemap_0
  dw 3,SlasherSisterCeilingBulletSpritemap_1
  dw 3,SlasherSisterCeilingBulletSpritemap_2
  dw 3,SlasherSisterCeilingBulletSpritemap_1
  dw $81AB,SlasherSisterCeilingBulletIList
}
%END_FREESPACE(86)

%BEGIN_FREESPACE(8D)
SlasherSisterCeilingBulletSpritemap_0:
dw $0001 : db $FD,$01,$FD,$0E,$31

SlasherSisterCeilingBulletSpritemap_1:
dw $0001 : db $FC,$01,$FC,$0F,$31

SlasherSisterCeilingBulletSpritemap_2:
dw $0001 : db $FC,$01,$FC,$1B,$31
%END_FREESPACE(8D)
