lorom

org $A6A1D4 ; fix ridley's room palette
RTL
org $A6A4DF
CLC : RTS
org $A6C55F ; fix room shaking when ridley dies
BRA +
org $A6C571
+

;org $A6E2AA : incbin "ridley palettes new.pal" ; ridley now has storms wand

org $A6D4B5 ; Ceres Ridley health-based palette handling
LDA $7E7802 : BEQ .rts ; If [Ridley fight mode] = fight intro / retreat: return
LDY $0F8C ; health (max 9000)
CPY.w #9000*0.5 : BCS .rts
TDC ; palette index
CPY.w #9000*0.3 : BCS +
INC
+
CPY.w #9000*0.1 : BCS +
INC
+
STA $12
JMP $D495 ; Go to load Ridley health-based palette
.rts
RTS

assert pc() <= $A6D4DA

org $A6DF8A : BRA + : org $A6DFAC : + ; ceres ridley uses normal shot ai

org $A0E13F+$1C : dw $A288 ; ceres ridley hurt ai = main ai (if you're using smart remove this line and edit the enemy dna)

org $A6A6E8 ; flee after zero health
LDA $0F8C : BEQ ++
LDA $09C2 : CMP.w #70 : BMI ++
BRA + : org $A6A719 : +
org $A6A6F9 : ++

org $A6A216 : LDA.w #25 ; nerf ceres ridley tail damage
org $A6E003 : LDA.w #15 ; buff tail knockback

org $A6E4DD : CMP.w #70
