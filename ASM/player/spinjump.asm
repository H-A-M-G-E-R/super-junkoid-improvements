lorom

!ScrewAttack = $0040
!SpaceJump = $0200
!GravitySuit = $0020

org $91F624 ; rewrite initializing spinjump routine
SpinjumpInitialization:
{
LDA $0A23 : AND #$00FF : CMP #$0003 : BEQ + : CMP #$0014 : BNE ++ ; If previously spinjumping or walljumping:
+
TDC : INC : STA $0A9A ; animation frame skip = 1
JSL $9B8000 ; SpriteSomething code
LDA $0A1E : EOR $0A22 : AND #$00FF : BEQ ++ ; if turning around:
LDA $0B44 : CLC : ADC $0B48 : STA $0B48 : LDA $0B42 : ADC $0B46 : STA $0B46 ; add extra run speed to base speed
JSL $91DE53 ; cancel speed boosting
STZ $0B44 : STZ $0B42 ; extra run speed = 0
TDC : INC : STA $0B4A ; set x acceleration mode to turning around
++
LDA $09A2 : BIT #!ScrewAttack : BNE .ScrewAttack
BIT #!SpaceJump : BNE .SpaceJump
LDX #$0019 ; set pose to spinjump
LDY #$0031 : BRA .PlaySound ; spinjump sound
.SpaceJump
LDX #$001B ; set pose to space jump
LDY #$003E : BRA .PlaySound ; space jump sound
.ScrewAttack
LDX #$0081 ; set pose to screw attack
LDY #$0033 ; screw attack sound
.PlaySound
PHX ; preserve X
LDA $0A9A : BNE .CheckIfFacingLeft ; if on first frame:
LDA $1F51 : BNE .CheckIfFacingLeft ; if not in intro:
JSL UnderwaterCheck : BCS .CheckIfFacingLeft ; if not underwater:
TYA : JSL $809049 ; play sound
.CheckIfFacingLeft
PLX ; restore X
LDA $0A1C : LSR : BCS + ; if facing left:
INX ; set left-facing pose
+
STX $0A1C
CLC : RTS
}
; underwater check: carry set if fully submerged underwater, clear otherwise
UnderwaterCheck:
{
LDA $09A2 : BIT #!GravitySuit : BNE .Overwater
JSL $90EC58 ; $14 = Samus top boundary
--
LDA $195E : BMI +
CMP $14 : BPL .Overwater
LDA $197E : BIT #$0004 : BNE .Overwater
-
SEC : RTL
+
LDA $1962 : BMI .Overwater
CMP $14 : BMI -
.Overwater
CLC : RTL
}
; underwater check 2: carry set if touching water, clear otherwise
UnderwaterCheck2:
{
LDA $09A2 : BIT #!GravitySuit : BNE UnderwaterCheck_Overwater
JSL $90EC3E ; $12 = Samus bottom boundary
LDA $12 : STA $14 : BRA -- ; $14 = [$12]
}
UnderwaterWallJumpSound:
{
LDA $0A96 : DEC : BNE + ; if animation frame timer = 1:
LDA $0A94 : DEC : BNE + ; if animation frame = 1:
JSL UnderwaterCheck : BCC + ; if underwater:
LDA #$002F : JSL $809049 ; play sound
+
RTL
}

org $90A46C : BRA $00 ; space jump underwater (WDM crashes in SNES Classic/Canoe)
org $90A4FF : BRA $00 ; pseudo screw attack underwater

; PJ's screw attack wall jump fix (https://metroidconstruction.com/resource.php?id=530)
org $84CE83
Setup_BombBlockCollision:
{
; If contact damage is not speed boosting / shinesparking / screw attack, delete PLM
LDA $0A6E : DEC : CMP #$0003 : BCC .breakBlock
TYX : STZ $1C37,x
SEC : RTS

org $84CEC1
.breakBlock
}

org $90A734
SamusMovementWallJumping:
{
; If screw attack equipped, set screw attack contact damage
LDA $09A2 : BIT #!ScrewAttack : BEQ .notScrewAttack
LDA #$0003 : STA $0A6E
BRA .contactDamageSet

.notScrewAttack
LDA $0CD0 : CMP #$003C : BMI .contactDamageSet
LDA #$0004 : STA $0A6E

.contactDamageSet
JSL UnderwaterWallJumpSound ; my hijack here
JMP $8FB3 ; Samus jumping movement
}

org 2*$83+$91B010 ; change walljump animation delay tables to transition to spinjump pose as soon as the walljump animation ends
dw WalljumpRightAnimationDelayTable
org 2*$84+$91B010
dw WalljumpLeftAnimationDelayTable

org $91B491
WalljumpRightAnimationDelayTable:
db $05, $05, $FD,$19
WalljumpLeftAnimationDelayTable:
db $05, $05, $FD,$1A

org 2*$14+$91E6E1
dw $E732 ; RTS out the routine to update animation frame while unpausing while walljumping

org $90F41E
SamusCommand1C:
{
LDA $0A1F : AND #$00FF : CMP #$0003 : BEQ + : CMP #$0014 : BNE ++ ; if spinjumping or walljumping:
+
JSL UnderwaterCheck : BCS ++ ; If not underwater:
LDA $09A2 : BIT #!ScrewAttack : BNE .ScrewAttack
BIT #!SpaceJump : BNE .SpaceJump
LDA #$0031
-
JSL $80902B
++
CLC : RTS
.SpaceJump
LDA #$003E : BRA -
.ScrewAttack
LDA #$0033 : BRA -
}

org $91E776
UpdateSpinjumpDueToChangeOfEquipment:
{
LDA $0A23 : PHA : AND #$FF00 : STA $0A23 ; push previous movement type then set it to standing
JSL $91F433 ; Initialise Samus pose
PLA : STA $0A23 ; restore previous movement type
JSL $91FB08 ; Set Samus animation frame if pose changed
JSR $E719 ; Update Samus previous pose
RTS
}