; TODO fix dachora palettes
lorom

; makes the enemy projectile handler run before samus new state handler to fix a bug where
; she doesn't lock into a hurt pose when dying/activating auto reserves to an enemy projectile
org $828B69
JSL $868104 ; Enemy projectile handler
JSL $A09894 ; Enemy projectile / Samus collision handling
;JSL $A0996C ; Enemy projectile / projectile handling ; Covered in "enemy projectile-projectile collision.asm"
JSL $A0A306 ; Process enemy power bomb interaction
JSL $90E722 ; Samus new state handler
JSL $8485B4 ; PLM handler
JSL $878064 ; Animated tiles objects handler
BRA + : org $828B8A : + ; to main scrolling routine

; Enemy health drops to 1 when frozen
org $A0A8AB : JSL $809139 : LDA #$0001 : BRA $03

org $A29BBF : TDC : INC ; fix puyos

org $A2E1E6 : BIT #$0100 ; fix grippers (unused in super junkoid)

org $A5ED6C : NOP ; makes spospo vulnerable to uncharged shots

org $A7DB41 : BEQ + : org $A7DB5B : + ; skip wrecked ship power-on sequence after phantoon's defeat

;;; Snowman ;;;
; Fix snowman facing the wrong direction
org $A8AFB9 : BMI $07
org $A8AFD0 : BEQ $06

; Fix facing right closed hand position
org $A8AF11 : ADC #$FFFC

; Sync snowman's flashing and stun
org $A8B42A : JSR SyncSnowmanFlashingAndStun

org $A8FA7E ; freespace
SyncSnowmanFlashingAndStun:
LDA $0F9C,x : STA $0FDC,x : STA $101C,x ; sync flashing
LDA $0F8A,x : STA $0FCA,x : STA $100A,x ; sync stunned AI handler
LDA $0F9E,x : RTS ; restore from hijack

HyperBeamWeaknessCheck: ; ignore weaknesses for hyper beam so i can murder the pumpkin
LDA $12 : AND #$000F : CMP #$0007 : BNE .merge ; projectile type
.hyper
LDA $0E32 : AND #$007F : ORA #$0002 : STA $0E32
.merge
LDA $187A : LSR : JML $A0A74E

HyperBeamWeaknessCheck2:
LDA $B40000,x : AND #$00FF : CMP #$00FF : BEQ .freezeDontKill
JML $A0A716
.freezeDontKill
LDA $12 : AND #$000F : CMP #$0007 : BEQ .hyper ; projectile type
LDA #$00FF : JML $A0A716
.hyper
LDA #$0002 : JML $A0A716

;;; Metroid ;;;
org $A3EF8C : LDA.w #30 ; metroids get stunned by bombs for longer, making them less annoying

;;; Botwoon ;;;
; botwoon can spit below half health
org $B398BB : BRA + : org $B398C1 : +
; set botwoon speed when spitting
org $B39916 : JSR +
org $B39675 ; overwrite unused data
+
JSR $995D : LDA #$99E4 : RTS

; restore botwoon speedup
org $B3997F : LDA #$0001
org $B39988 : LDA #$0002

; spazer is plasma (for hyper)
org $A09CCB : AND #$000C ; extended spritemap
org $A0A202 : BIT #$000C ; non-extended spritemap
org $84F18E : BIT #$000C ; plasma block

org $A0A74A : JML HyperBeamWeaknessCheck
org $A0A712 : JML HyperBeamWeaknessCheck2
org $A0A745 : BEQ $00
