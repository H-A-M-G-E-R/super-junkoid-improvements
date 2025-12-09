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
JSR $E088 ; Ridley tail / projectile collision handling
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

;;; Optimize spritemaps and shrink GFX size

; new gfx
org read3($A0E17F+$36)
incbin "ProfaneJunko.gfx"
RibAndClawGfx:
incbin "ProfaneJunkoRibAndClaw.gfx"

; gfx size
org $A0E13F : dw filesize("ProfaneJunko.gfx")
org $A0E17F : dw filesize("ProfaneJunko.gfx")

; tail and wing spritemaps

org $A6DC90
ProfaneJunkoTailSpritemap_0_A6DC90:
dw $0001 : db $F8,$81,$F8,$80,$31

ProfaneJunkoTailSpritemap_1_A6DC97:
dw $0001 : db $F8,$81,$F8,$82,$31

ProfaneJunkoTailSpritemap_2_A6DC9E:
dw $0001 : db $F8,$81,$F8,$84,$31

ProfaneJunkoTailSpritemap_3_A6DCA5:
dw $0001 : db $F8,$81,$F8,$80,$71

ProfaneJunkoTailSpritemap_4_A6DCAC:
dw $0001 : db $F8,$81,$F8,$82,$71

ProfaneJunkoTailSpritemap_5_A6DCB3:
dw $0001 : db $F8,$81,$F8,$84,$71

org $A6DCDA
ProfaneJunkoTailTipWingSpritemap_0_A6DCDA:
dw $0001 : db $F0,$81,$F8,$86,$31

ProfaneJunkoTailTipWingSpritemap_1_A6DCE1:
dw $0001 : db $F0,$81,$F4,$88,$31

ProfaneJunkoTailTipWingSpritemap_2_A6DCE8:
dw $0001 : db $F2,$81,$F3,$8A,$31

ProfaneJunkoTailTipWingSpritemap_3_A6DCEF:
dw $0001 : db $F4,$81,$F0,$8C,$31

ProfaneJunkoTailTipWingSpritemap_4_A6DCF6:
dw $0001 : db $F8,$81,$F0,$8E,$31

ProfaneJunkoTailTipWingSpritemap_5_A6DCFD:
dw $0001 : db $FC,$81,$F0,$8C,$71

ProfaneJunkoTailTipWingSpritemap_6_A6DD04:
dw $0001 : db $FE,$81,$F3,$8A,$71

ProfaneJunkoTailTipWingSpritemap_7_A6DD0B:
dw $0001 : db $00,$80,$F4,$88,$71

ProfaneJunkoTailTipWingSpritemap_8_A6DD12:
dw $0001 : db $00,$80,$F8,$86,$71

ProfaneJunkoTailTipWingSpritemap_9_A6DD19:
dw $0001 : db $00,$80,$FC,$88,$F1

ProfaneJunkoTailTipWingSpritemap_10_A6DD20:
dw $0001 : db $FE,$81,$FE,$8A,$F1

ProfaneJunkoTailTipWingSpritemap_11_A6DD27:
dw $0001 : db $FC,$81,$00,$8C,$F1

ProfaneJunkoTailTipWingSpritemap_12_A6DD2E:
dw $0001 : db $F9,$81,$00,$8E,$F1

ProfaneJunkoTailTipWingSpritemap_13_A6DD35:
dw $0001 : db $F4,$81,$FF,$8C,$B1

ProfaneJunkoTailTipWingSpritemap_14_A6DD3C:
dw $0001 : db $F2,$81,$FE,$8A,$B1

ProfaneJunkoTailTipWingSpritemap_15_A6DD43:
dw $0001 : db $F0,$81,$FC,$88,$B1

ProfaneJunkoTailTipWingSpritemap_16_A6DD4A:
dw $0002 : db $14,$80,$DF,$05,$31, $0C,$80,$DF,$04,$31

ProfaneJunkoTailTipWingSpritemap_17_A6DD6A:
dw $0002 : db $14,$80,$E4,$08,$31, $0C,$80,$E4,$07,$31

ProfaneJunkoTailTipWingSpritemap_18_A6DD85:
dw $0002 : db $1C,$00,$F0,$36,$31, $0C,$80,$E8,$24,$31

ProfaneJunkoTailTipWingSpritemap_19_A6DD96:
dw $0002 : db $1C,$00,$E8,$36,$B1, $0C,$80,$E8,$24,$B1

ProfaneJunkoTailTipWingSpritemap_20_A6DDA7:
dw $0002 : db $14,$80,$EA,$08,$B1, $0C,$80,$EA,$07,$B1

ProfaneJunkoTailTipWingSpritemap_21_A6DDC2:
dw $0002 : db $14,$80,$EF,$05,$B1, $0C,$80,$EF,$04,$B1

ProfaneJunkoTailTipWingSpritemap_22_A6DDE2:
dw $0002 : db $DC,$81,$DF,$05,$71, $E4,$81,$DF,$04,$71

ProfaneJunkoTailTipWingSpritemap_23_A6DE02:
dw $0002 : db $DC,$81,$E4,$08,$71, $E4,$81,$E4,$07,$71

ProfaneJunkoTailTipWingSpritemap_24_A6DE1D:
dw $0002 : db $DC,$01,$F0,$36,$71, $E4,$81,$E8,$24,$71

ProfaneJunkoTailTipWingSpritemap_25_A6DE2E:
dw $0002 : db $DC,$01,$E8,$36,$F1, $E4,$81,$E8,$24,$F1

ProfaneJunkoTailTipWingSpritemap_26_A6DE3F:
dw $0002 : db $DC,$81,$EA,$08,$F1, $E4,$81,$EA,$07,$F1

ProfaneJunkoTailTipWingSpritemap_27_A6DE5A:
dw $0002 : db $DC,$81,$EF,$05,$F1, $E4,$81,$EF,$04,$F1

; wing spritemap pointers
org $A6DB02
dw ProfaneJunkoTailTipWingSpritemap_16_A6DD4A
dw ProfaneJunkoTailTipWingSpritemap_17_A6DD6A
dw ProfaneJunkoTailTipWingSpritemap_18_A6DD85
dw ProfaneJunkoTailTipWingSpritemap_19_A6DD96
dw ProfaneJunkoTailTipWingSpritemap_20_A6DDA7
dw ProfaneJunkoTailTipWingSpritemap_21_A6DDC2
dw ProfaneJunkoTailTipWingSpritemap_20_A6DDA7
dw ProfaneJunkoTailTipWingSpritemap_19_A6DD96
dw ProfaneJunkoTailTipWingSpritemap_18_A6DD85
dw ProfaneJunkoTailTipWingSpritemap_17_A6DD6A

dw ProfaneJunkoTailTipWingSpritemap_22_A6DDE2
dw ProfaneJunkoTailTipWingSpritemap_23_A6DE02
dw ProfaneJunkoTailTipWingSpritemap_24_A6DE1D
dw ProfaneJunkoTailTipWingSpritemap_25_A6DE2E
dw ProfaneJunkoTailTipWingSpritemap_26_A6DE3F
dw ProfaneJunkoTailTipWingSpritemap_27_A6DE5A
dw ProfaneJunkoTailTipWingSpritemap_26_A6DE3F
dw ProfaneJunkoTailTipWingSpritemap_25_A6DE2E
dw ProfaneJunkoTailTipWingSpritemap_24_A6DE1D
dw ProfaneJunkoTailTipWingSpritemap_23_A6DE02

; body spritemaps (hitboxes remain unchanged bc my spritemap editor doesn't support editing hitboxes at the time of writing)
org $A6E983
ProfaneJunkoExtSpritemap_0_A6E983:
dw $0004, 15,22,ProfaneJunkoSpritemap_3_A6ED29,ProfaneJunkoHitbox_3_A6EB2F, -8,7,ProfaneJunkoSpritemap_6_A6ED8E,ProfaneJunkoHitbox_6_A6EB59, 16,0,ProfaneJunkoSpritemap_7_A6ED95,ProfaneJunkoHitbox_7_A6EB67, -3,-24,ProfaneJunkoSpritemap_0_A6EC5B,ProfaneJunkoHitbox_0_A6EAE1

ProfaneJunkoExtSpritemap_1_A6E9A5:
dw $0004, -15,22,ProfaneJunkoSpritemap_12_A6EF25,ProfaneJunkoHitbox_14_A6EBF9, 8,7,ProfaneJunkoSpritemap_15_A6EF8A,ProfaneJunkoHitbox_17_A6EC23, -16,0,ProfaneJunkoSpritemap_16_A6EF91,ProfaneJunkoHitbox_18_A6EC31, 3,-24,ProfaneJunkoSpritemap_9_A6EE57,ProfaneJunkoHitbox_11_A6EBAB

ProfaneJunkoExtSpritemap_2_A6E9C7:
dw $0004, 15,22,ProfaneJunkoSpritemap_3_A6ED29,ProfaneJunkoHitbox_3_A6EB2F, -8,7,ProfaneJunkoSpritemap_6_A6ED8E,ProfaneJunkoHitbox_6_A6EB59, 16,0,ProfaneJunkoSpritemap_7_A6ED95,ProfaneJunkoHitbox_7_A6EB67, -3,-24,ProfaneJunkoSpritemap_1_A6EC99,ProfaneJunkoHitbox_1_A6EAFB

ProfaneJunkoExtSpritemap_3_A6E9E9:
dw $0004, 15,22,ProfaneJunkoSpritemap_3_A6ED29,ProfaneJunkoHitbox_3_A6EB2F, -8,7,ProfaneJunkoSpritemap_6_A6ED8E,ProfaneJunkoHitbox_6_A6EB59, 16,0,ProfaneJunkoSpritemap_7_A6ED95,ProfaneJunkoHitbox_7_A6EB67, -3,-24,ProfaneJunkoSpritemap_2_A6ECDC,ProfaneJunkoHitbox_2_A6EB15

ProfaneJunkoExtSpritemap_4_A6EA0B:
dw $0004, -15,22,ProfaneJunkoSpritemap_12_A6EF25,ProfaneJunkoHitbox_14_A6EBF9, 8,7,ProfaneJunkoSpritemap_15_A6EF8A,ProfaneJunkoHitbox_17_A6EC23, -16,0,ProfaneJunkoSpritemap_16_A6EF91,ProfaneJunkoHitbox_18_A6EC31, 3,-24,ProfaneJunkoSpritemap_10_A6EE95,ProfaneJunkoHitbox_12_A6EBC5

ProfaneJunkoExtSpritemap_5_A6EA2D:
dw $0004, -15,22,ProfaneJunkoSpritemap_12_A6EF25,ProfaneJunkoHitbox_14_A6EBF9, 8,7,ProfaneJunkoSpritemap_15_A6EF8A,ProfaneJunkoHitbox_17_A6EC23, -16,0,ProfaneJunkoSpritemap_16_A6EF91,ProfaneJunkoHitbox_18_A6EC31, 3,-24,ProfaneJunkoSpritemap_11_A6EED8,ProfaneJunkoHitbox_13_A6EBDF

ProfaneJunkoExtSpritemap_6_A6EA4F:
dw $0004, 15,22,ProfaneJunkoSpritemap_4_A6ED4E,ProfaneJunkoHitbox_4_A6EB3D, -8,7,ProfaneJunkoSpritemap_6_A6ED8E,ProfaneJunkoHitbox_6_A6EB59, 16,0,ProfaneJunkoSpritemap_7_A6ED95,ProfaneJunkoHitbox_7_A6EB67, -3,-24,ProfaneJunkoSpritemap_0_A6EC5B,ProfaneJunkoHitbox_0_A6EAE1

ProfaneJunkoExtSpritemap_7_A6EA71:
dw $0004, 15,22,ProfaneJunkoSpritemap_5_A6ED6E,ProfaneJunkoHitbox_5_A6EB4B, -8,7,ProfaneJunkoSpritemap_6_A6ED8E,ProfaneJunkoHitbox_6_A6EB59, 16,0,ProfaneJunkoSpritemap_7_A6ED95,ProfaneJunkoHitbox_7_A6EB67, -3,-24,ProfaneJunkoSpritemap_0_A6EC5B,ProfaneJunkoHitbox_0_A6EAE1

ProfaneJunkoExtSpritemap_8_A6EA93:
dw $0004, -15,22,ProfaneJunkoSpritemap_13_A6EF4A,ProfaneJunkoHitbox_15_A6EC07, 8,7,ProfaneJunkoSpritemap_15_A6EF8A,ProfaneJunkoHitbox_17_A6EC23, -16,0,ProfaneJunkoSpritemap_16_A6EF91,ProfaneJunkoHitbox_18_A6EC31, 3,-24,ProfaneJunkoSpritemap_9_A6EE57,ProfaneJunkoHitbox_11_A6EBAB

ProfaneJunkoExtSpritemap_9_A6EAB5:
dw $0004, -15,22,ProfaneJunkoSpritemap_14_A6EF6A,ProfaneJunkoHitbox_16_A6EC15, 8,7,ProfaneJunkoSpritemap_15_A6EF8A,ProfaneJunkoHitbox_17_A6EC23, -16,0,ProfaneJunkoSpritemap_16_A6EF91,ProfaneJunkoHitbox_18_A6EC31, 3,-24,ProfaneJunkoSpritemap_9_A6EE57,ProfaneJunkoHitbox_11_A6EBAB

ProfaneJunkoExtSpritemap_10_A6EAD7:
dw $0001, 0,-6,ProfaneJunkoSpritemap_8_A6EDB5,ProfaneJunkoHitbox_10_A6EB91

ProfaneJunkoHitbox_0_A6EAE1:
dw $0002, -12,-26,11,13,$DF59,$DF8A, -24,3,-13,21,$DF59,$DF8A

ProfaneJunkoHitbox_1_A6EAFB:
dw $0002, -41,-19,-21,-9,$DF59,$DF8A, -20,-29,11,5,$DF59,$DF8A

ProfaneJunkoHitbox_2_A6EB15:
dw $0002, -37,-40,-14,-31,$DF59,$DF8A, -25,-31,9,6,$DF59,$DF8A

ProfaneJunkoHitbox_3_A6EB2F:
dw $0001, -15,-10,7,2,$DF59,$DF8A

ProfaneJunkoHitbox_4_A6EB3D:
dw $0001, -17,-9,6,15,$DF59,$DF8A

ProfaneJunkoHitbox_5_A6EB4B:
dw $0001, -14,-1,10,23,$DF59,$DF8A

ProfaneJunkoHitbox_6_A6EB59:
dw $0001, -15,-2,-1,8,$DF59,$DF8A

ProfaneJunkoHitbox_7_A6EB67:
dw $0001, -16,-20,12,21,$DF59,$DF8A

ProfaneJunkoHitbox_10_A6EB91:
dw $0002, -16,-32,16,34,$DF59,$DF8A, -8,-45,8,-33,$DF59,$DF8A

ProfaneJunkoHitbox_11_A6EBAB:
dw $0002, -12,-25,11,13,$DF59,$DF8A, 12,5,24,20,$DF59,$DF8A

ProfaneJunkoHitbox_12_A6EBC5:
dw $0002, -13,-29,20,5,$DF59,$DF8A, 21,-18,39,-8,$DF59,$DF8A

ProfaneJunkoHitbox_13_A6EBDF:
dw $0002, -10,-31,25,8,$DF59,$DF8A, 13,-42,35,-32,$DF59,$DF8A

ProfaneJunkoHitbox_14_A6EBF9:
dw $0001, -10,-10,17,2,$DF59,$DF8A

ProfaneJunkoHitbox_15_A6EC07:
dw $0001, -9,-8,17,15,$DF59,$DF8A

ProfaneJunkoHitbox_16_A6EC15:
dw $0001, -11,-8,14,23,$DF59,$DF8A

ProfaneJunkoHitbox_17_A6EC23:
dw $0001, 1,-2,14,9,$DF59,$DF8A

ProfaneJunkoHitbox_18_A6EC31:
dw $0001, -13,-22,14,21,$DF59,$DF8A

ProfaneJunkoSpritemap_0_A6EC5B:
dw $0006 : db $F4,$81,$02,$2E,$31, $EC,$81,$02,$2D,$31, $FC,$81,$F2,$2B,$31, $EC,$81,$F2,$29,$31, $FC,$01,$EA,$03,$31, $F4,$01,$EA,$02,$31

ProfaneJunkoSpritemap_1_A6EC99:
dw $0006 : db $06,$00,$F8,$56,$31, $FE,$81,$00,$49,$31, $F6,$81,$F0,$44,$31, $EE,$81,$00,$47,$31, $E6,$81,$F0,$42,$31, $F6,$81,$E0,$40,$31

ProfaneJunkoSpritemap_2_A6ECDC:
dw $0007 : db $00,$00,$DD,$5B,$31, $F8,$01,$05,$77,$31, $00,$80,$F5,$65,$31, $00,$80,$E5,$62,$31, $F0,$81,$E5,$60,$31, $F8,$01,$DD,$4B,$31, $F8,$81,$F5,$64,$31

ProfaneJunkoSpritemap_3_A6ED29:
dw $0002 : db $FA,$81,$FF,$4E,$31, $EA,$81,$FF,$4C,$31

ProfaneJunkoSpritemap_4_A6ED4E:
dw $0002 : db $F9,$81,$0B,$4E,$31, $E9,$81,$0B,$4C,$31

ProfaneJunkoSpritemap_5_A6ED6E:
dw $0002 : db $FD,$81,$13,$4E,$31, $ED,$81,$13,$4C,$31

ProfaneJunkoSpritemap_6_A6ED8E:
dw $0000

ProfaneJunkoSpritemap_7_A6ED95:
dw $0005 : db $F0,$81,$F8,$20,$31, $00,$80,$F8,$22,$31, $FE,$81,$06,$22,$31, $00,$00,$F0,$12,$31, $F0,$81,$E8,$00,$31

ProfaneJunkoSpritemap_8_A6EDB5:
dw $0008 : db $00,$80,$10,$6E,$71, $00,$80,$00,$6C,$71, $00,$80,$F0,$6A,$71, $00,$80,$E0,$68,$71, $F0,$81,$10,$6E,$31, $F0,$81,$00,$6C,$31, $F0,$81,$F0,$6A,$31, $F0,$81,$E0,$68,$31

ProfaneJunkoSpritemap_9_A6EE57:
dw $0006 : db $FC,$81,$02,$2E,$71, $04,$80,$02,$2D,$71, $F4,$81,$F2,$2B,$71, $04,$80,$F2,$29,$71, $FC,$01,$EA,$03,$71, $04,$00,$EA,$02,$71

ProfaneJunkoSpritemap_10_A6EE95:
dw $0006 : db $F2,$01,$F8,$56,$71, $F2,$81,$00,$49,$71, $FA,$81,$F0,$44,$71, $02,$80,$00,$47,$71, $0A,$80,$F0,$42,$71, $FA,$81,$E0,$40,$71

ProfaneJunkoSpritemap_11_A6EED8:
dw $0007 : db $F8,$01,$DD,$5B,$71, $00,$00,$05,$77,$71, $F0,$81,$F5,$65,$71, $F0,$81,$E5,$62,$71, $00,$80,$E5,$60,$71, $00,$00,$DD,$4B,$71, $F8,$81,$F5,$64,$71

ProfaneJunkoSpritemap_12_A6EF25:
dw $0002 : db $F6,$81,$FF,$4E,$71, $06,$80,$FF,$4C,$71

ProfaneJunkoSpritemap_13_A6EF4A:
dw $0002 : db $F7,$81,$0B,$4E,$71, $07,$80,$0B,$4C,$71

ProfaneJunkoSpritemap_14_A6EF6A:
dw $0002 : db $F3,$81,$13,$4E,$71, $03,$80,$13,$4C,$71

ProfaneJunkoSpritemap_15_A6EF8A:
dw $0000

ProfaneJunkoSpritemap_16_A6EF91:
dw $0005 : db $00,$80,$F8,$20,$71, $F0,$81,$F8,$22,$71, $F2,$81,$06,$22,$71, $F8,$01,$F0,$12,$71, $00,$80,$E8,$00,$71

; fireball spritemaps
org $8D80CA
ProfaneJunkoFireballSpritemap_0_8D80CA:
dw $0001 : db $F8,$81,$F8,$0A,$31

ProfaneJunkoFireballSpritemap_1_8D80D1:
dw $0001 : db $F8,$81,$F8,$0C,$F1

ProfaneJunkoFireballSpritemap_2_8D80D8:
dw $0001 : db $F8,$81,$F8,$0A,$F1

ProfaneJunkoFireballSpritemap_3_8D80DF:
dw $0001 : db $F8,$81,$F8,$0C,$31

; rib anim
org $A6DA71
RibAnim:
;   _____________ Timer
;  |   ________ Top tiles (bank $B0)
;  |  |                     ___ Bottom tiles (bank $B0)
;  |  |                    |
dw 20,RibAndClawGfx+$0*$20,RibAndClawGfx+$0*$20+$E*$20
dw 20,RibAndClawGfx+$2*$20,RibAndClawGfx+$2*$20+$E*$20
dw 20,RibAndClawGfx+$4*$20,RibAndClawGfx+$4*$20+$E*$20
dw 20,RibAndClawGfx+$2*$20,RibAndClawGfx+$2*$20+$E*$20
dw RibAnim ; Terminator / pointer to start of table

; dest
org $A6DA43 : LDA #$7220
org $A6DA49 : LDA #$7320

; claw anim
org $A6DAD0
ClawAnim:
;   ________ Top tiles (bank $B0)
;  |                    ___ Bottom tiles (bank $B0)
;  |                     |
dw RibAndClawGfx+$6*$20,RibAndClawGfx+$6*$20+$E*$20 ; Unclenched
dw RibAndClawGfx+$A*$20,RibAndClawGfx+$A*$20+$E*$20 ; Clenched

; dest
org $A6DAAB : LDA #$74C0
org $A6DAB1 : LDA #$75C0

; explosion
org $A6CA59
ProfaneJunkoExplosionIList_WingLeft:
dw 1,ProfaneJunkoTailTipWingSpritemap_16_A6DD4A
dw $812F ; Sleep

ProfaneJunkoExplosionIList_WingRight:
dw 1,ProfaneJunkoTailTipWingSpritemap_22_A6DDE2
dw $812F ; Sleep

ProfaneJunkoExplosionIList_LegLeft:
dw 1,ProfaneJunkoSpritemap_3_A6ED29
dw $812F ; Sleep

ProfaneJunkoExplosionIList_LegRight:
dw 1,ProfaneJunkoSpritemap_12_A6EF25
dw $812F ; Sleep

ProfaneJunkoExplosionIList_HeadLeft:
dw 1,ProfaneJunkoSpritemap_2_A6ECDC
dw $812F ; Sleep

ProfaneJunkoExplosionIList_HeadRight:
dw 1,ProfaneJunkoSpritemap_11_A6EED8
dw $812F ; Sleep

ProfaneJunkoExplosionIList_TorsoLeft:
dw 1,ProfaneJunkoSpritemap_7_A6ED95
dw $812F ; Sleep

ProfaneJunkoExplosionIList_TorsoRight:
dw 1,ProfaneJunkoSpritemap_16_A6EF91
dw $812F ; Sleep

ProfaneJunkoExplosionIList_HandLeft:
dw 1,ProfaneJunkoSpritemap_6_A6ED8E
dw $812F ; Sleep

ProfaneJunkoExplosionIList_HandRight:
dw 1,ProfaneJunkoSpritemap_15_A6EF8A
dw $812F ; Sleep

; gawr gura
org $A6A122
LDA #$FF06 : JSL $808FC1
BRA + : org $A6A12C : +

org $A6E4BE : LDA #$0059
