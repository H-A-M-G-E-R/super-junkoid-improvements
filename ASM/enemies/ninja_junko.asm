
org $86A189+8 : dw $1000|10 ; nerf claw projectiles

org $86A098
PirateClawInit:
LDA $14 : CLC : ADC $18 : STA $1A93,y ; y
LDA $12 : CLC : ADC $16 : STA $1A4B,y ; x
LDA $1993 : AND #$0001 : ASL : TAX ; direction
LDA.w .instLists,x : STA $1B47,y ; instruction list
LDA.w .speeds,x : STA $1AB7,y ; x speed
LDA.w #0.15*$100 : STA $1ADB,y ; y speed
RTS

.instLists
dw $9FB9,$9FE1
.speeds
dw -10*$100,10*$100

PirateClawThrownLeft:
JSR $88B6 ; Move enemy projectile horizontally
BCS .collision
LDA $1AB7,x : CLC : ADC #$0040 : STA $1AB7,x
JSR $897B ; Move enemy projectile vertically
BCS .collision
LDA $1A4B,x : SEC : SBC $0911 : CMP #$0100 : BMI .rts ; check if hit right edge of screen
.collision
STZ $1997,x ; delete
.rts
RTS

PirateClawThrownRight:
JSR $88B6 ; Move enemy projectile horizontally
BCS .collision
LDA $1AB7,x : SEC : SBC #$0040 : STA $1AB7,x
JSR $897B ; Move enemy projectile vertically
BCS .collision
LDA $1A4B,x : SEC : SBC $0911 : BPL .rts ; check if hit left edge of screen
.collision
STZ $1997,x ; delete
.rts
RTS

assert pc() < $86A17B

; repoint
org $869FB9
dw $8161,PirateClawThrownLeft
org $869FE1
dw $8161,PirateClawThrownRight

org $86A189
PirateClawHeader:
dw $A098,$A05B,$0000,$0808,$1000|10,$0000,$84FB


org $B2F536 : INY : INY : RTL ; don't change palette (RTS out Instruction - enemy palette index = [[Y]])

; flip enemy parameter 1 bit 0
org $B2F5EA : BNE $03
org $B2F5FC : BNE $0F
org $B2F671 : BEQ $03

org $B2F687 ; setup fight intro
STZ $0F7E,x ; zero y pos
LDA $0F86,x : ORA #$0400 : STA $0F86,x ; intangible
RTL

org $B2F6A9 ; Ninja space pirate function - initial
NinjaPirateFunc_Initial:
LDA #$0080 : JSL $A0BB9B ; Check if X distance between enemy and Samus is at least
BCS .rts
LDY #$F206 ; spin jump left
; set instruction list
LDA $0AF6 : CMP $0F7A,x : BMI .left
  LDY #$F3F4 ; spin jump right
.left
TYA : STA $0F92,x
TDC : INC : STA $0F94,x ; Enemy instruction list timer = 1
LDA.w #NinjaPirateFunc_IntroDropDown : STA $0FA8,x ; set function
LDA $0F86,x : AND.w #~$0400 : STA $0F86,x ; no intangible
.rts
RTS

org $B2F6F7 ; Ninja space pirate projectile claw attack trigger
NinjaPirateClawAttackTrigger:
LDA $0FA4,x : AND #$007F : BNE .rts
; set instruction list
LDY #$F15C
LDA $0AF6 : CMP $0F7A,x : BMI .left
  LDY #$F34A
.left
TYA : STA $0F92,x
TDC : INC : STA $0F94,x
.rts
RTS

org $B2F909 ; Ninja space pirate function - ready to divekick
NinjaPirateFunc_ReadyToDivekick:
JSR $F72E : BNE + ; Ninja space pirate flinch trigger
JSR $F7C6 : BNE + ; Ninja space pirate standing kick trigger
JSR NinjaPirateDivekickTrigger : BCS + ; Ninja space pirate divekick trigger
JMP NinjaPirateClawAttackTrigger
+
RTS

NinjaPirateDivekickTrigger:
LDA $0FAE,x : SEC : SBC $0AF6 : BPL +
  EOR #$FFFF : INC
+
CMP #$0020 : BMI +
CLC : RTS

+
LDY #$F27C ; divekick left - jump
LDA $0F7A,x : CMP $0FB0,x : BNE +
  LDY #$F46E ; divekick right - jump
+
TYA : STA $0F92,x
TDC : INC : STA $0F94,x
SEC : RTS

; change footstep to water splash
org $B2FB23 : LDA.w #WaterFootstepSpriteObject
org $B2FB40 : LDA.w #WaterFootstepSpriteObject

org $B2FEEA ; freespace
NinjaPirateFunc_IntroDropDown:
LDA $0F7E,x : INC : INC : STA $0F7E,x
CMP $7E7810,x : BMI +
  ; hit the ground
  LDA $7E7810,x : STA $0F7E,x
  ; set instruction list
  LDY #$F2F8 ; land left
  LDA $0F92,x : CMP #$F3F4 : BCC .left
    LDY #$F4EA ; land right
  .left
  TYA : STA $0F92,x
  TDC : INC : STA $0F94,x
  JMP $FB11 ; footstep
+
RTS
