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
