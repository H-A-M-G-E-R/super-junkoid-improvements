; Enemy Touch AI Rewrite
; By H A M
; Rewrites normal enemy touch AI routine to free up space. Also makes speedboosting/shinesparking/(pseudo) screwing not cancel iframes, and makes odd contact damage work correctly!
; Update 1.1: Enemies with HP greater than 32767=7FFFh now damage properly! And damage is fixed!
; I don't know why P. Yoshi made screw attack useless by setting its damage to 0... Other than that, they didn't alter other contact damages...
lorom

org $A0A4A1
LDA $0A6E : BNE ContactDamage
TXY ; Y = [enemy index]
LDA $0F78,x : TAX : LDA $A00006,x : JSL $A0A45E : JSL $91DF51 ; deal suit-adjusted damage to samus
LDA $A00030,x : CMP #$A953 : BEQ + ; if mochtroid or beetom: do not set iframes nor knockback timer
CMP #$BE2E : BEQ +
LDA.w #96 : STA $18A8 ; iframes = 96
LDA.w #5 : STA $18AA ; knockback timer = 5
TDC : TAX ; knockback direction = left
LDA $0AF6 : CMP $0F7A,y : BMI ++
INX ; knockback direction = right
++
STX $0A54
+
RTS

ContactDamage:
PHX ; push [enemy index] to stack
ASL : TAX
LDA.l ContactDamageTable-2,x : STA $26 ; $26 = contact damage
TXA : LSR : CMP #$0004 : BNE + ; end charge when hitting an enemy with pseudo screw
  JSL $90F084
  LDA #$0005
+
CLC : ADC #$000F : STA $14 ; vulnerability index = Fh + [contact damage index] if not pseudo-screwing, 14h if pseudo screwing
PLX ; pull [enemy index] from stack
LDA $0F78,x : TAX : LDA $A0003C,x
CLC : ADC $14 : TAX : LDA $B40000,x : AND #$007F
STA $28 ; $28 = contact vulnerability
JSL $A0B6FF ; $2A = contact damage * contact vulnerability
; super junkoid dx 2.2 buffed bosses
LDA $99 : BEQ +
  STZ $99
  LSR $2A
+
LSR $2A : BEQ NoDamage ; half calculated damage
LDY $0E54 ; Y = [enemy index]
LDX $0F78,y : LDA $A0000D,x : AND #$00FF : BNE +
  LDA #$0004 ; default is 4
+
STA $0F9C,y ; set flash timer
LDA $0F8A,y : ORA #$0002 : STA $0F8A,y ; set hurt ai
LDA $0F8C,y : SEC : SBC $2A : BCS + ; deal damage to enemy
  TDC
+
STA $0F8C,y
LDA #$000B : JSL $8090C1 ; queue contact damage sound
LDA $0F9E,y : BNE + ; queue enemy cry if not frozen
  LDX $0F78,y : LDA $A0000E,x : BEQ +
JSL $8090B7
+
NoDamage:
RTS

; 2.0 nerfed shinespark damage to 100
ContactDamageTable:
dw 500,300,2000,200 ; speed boosting, shinesparking, screw attacking, pseudo screwing respectively

FrozenCheck: ; Scyzer's Frozen Enemy Speed Boost Vulnerability (https://metroidconstruction.com/resource.php?id=550)
	LDA $0A6E : DEC : BEQ + : DEC : BEQ +
	LDA $0F9E,X
+	RTS

assert pc() <= $A0A597

org $A0A119
	JSR FrozenCheck
org $A0A9DC
	JSR FrozenCheck

; prevents iframes from dropping to 0 when there are enemies present and samus is speedboosting/shinesparking/(pseudo) screwing
org $A09A90 : BRA + : org $A09A9A : + ; for extended spritemap
org $A0A096 : BRA + : org $A0A0B8 : + ; for non-extended spritemap

org $A3A99E ; RTL out resetting iframes and knockback timer for mochtroid
RTL
org $A8BEA2 ; for beetom
RTL
