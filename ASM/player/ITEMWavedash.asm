lorom

;-----------------------------------------------------------------------------------------------MOAR ITEMS----------------------------------------------------------------------------------------------|
;MOAR ITEMS adds 3 new, unique upgrades to Super Metroid without overwriting or disabling any of the vanilla items, as well as PLMs to unlock them. The equipment bits are loaded to $7ED8AE.		
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
;WAVE DASH: While spinjumping, tap dash to become temporarily invulerable and dash through enemies.									
;																											
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
;Credits: Written by MCCAD00 aka Tedicles, and modified by P. Yoshi and H A M
;H A M: I requested P. Yoshi via a Discord DM and they sent me this code before being modified by me.
;mccad: I cannot overstate my thanks to Smiley and PJboy, they've been a huge help to me as far as understanding how to get all of these items working. Without	
;PJ's bank log, I would have absolutely 0 chance of being able to program any of this.																
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

!FreespaceCustomCode = $859643 ;All of the custom code has been placed into the freespace of bank $85. You can change this to whatever freespace you need if you dont have enough space there.
!FreeSpaceB4 = $B4F4B8	;Used for custom sprite instructions and spritemaps
!WaveDashMovementHandler = $90FB00 ;Pointer for custom movement handler. Must be in bank $90.

;;Main hijacks, runs the custom code before processing samus's movement
ORG $918076 : JSL CheckWavedashInput : JSR $81A9 : RTS		;Hijack the normal Samus pose input handler (spinjump) to process the custom code to check wavedash input (to make it work in demos)
ORG 2*$14+$918014 : DW $8076								;same for walljump (to make it SpriteSomething-compatible)
ORG !WaveDashMovementHandler : JSL WaveDashMovementHandler : LDA $0A1F : AND #$00FF : JMP $A342	;run wave dash movement handler first then run normal movement handler

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------Variables---------------------------------------------------------| Uses ram freed up by "enemy tile loading rewrite.asm"
;Define				 ; Description
;-------------------------------------------------------------------------------		
!VarMirXspd = $0E5A ; Mirror of samus's X extra run speed		
!VarMirSspd = $0E5C ; Mirror of samus's X extra run subspeed								
!VarMirXmom = $0E5E ; Mirror of samus's X momentum							
!VarMirSmom = $0E60 ; Mirror of samus's X submomentum


ORG !FreespaceCustomCode ;;;;;;;;;;Begin custom code

;WAVE DASH {

CheckWavedashInput:
	LDA $09A2  	;equipped items 
	BIT #$0002 	;check for Spring Ball
	BEQ +  	;ya ya ya

LDA $8F : BIT $09B6 : BEQ +				;Only check inputs if the run button is newly pressed
LDA $0B4A : LSR : BCS +									;Only check inputs if samus is not turning around
SetStateWave:
LDA #!WaveDashMovementHandler : STA $0A58			;Set movement handler to wave dashing
LDA #$0030 : STA $18A8							;WAS 1E Set samus's invulnerability timer (also used as a timer for the move itself)
LDA #$0005 : JSL $809049							;play a sound effect in library 1, max queued sounds allowed = 6
TDC : TAX
JSL UnderwaterCheck2									;check if underwater (see "spinjump.asm")
BCC ++ : INX : INX 
++ : LDA $0B44 : CLC : ADC.l WaveDashSpeeds+1,x : STA !VarMirSspd 		;Create a mirror of samus's X extra run speed + (wave dash speed)
LDA $0B42 : ADC.l WaveDashSpeeds,x : STA !VarMirXspd
LDA $0B46 : STA !VarMirXmom : LDA $0B48 : STA !VarMirSmom			;Create a mirror of samus's X momentum
BRA WaveDashMovementHandler
+ : RTL

WaveDashSpeeds:
dw $0002,$0000 ; air
dw $0000,$2AAA ; water/lava/acid (1/12 that of air)


;;;Wave-Dash main ASM;;;


WaveDashMovementHandler: 
LDA !VarMirXspd : STA $0B42 : LDA !VarMirSspd : STA $0B44			;Set samus's X extra run speed
LDA !VarMirXmom : STA $0B46 : LDA !VarMirSmom : STA $0B48			;Set samus's X momentum
LDA $0A1F : AND #$00FF : CMP #$0003 : BEQ + : CMP #$0014 : BNE EndWaveDash	 ;End routine if not spinjumping nor walljumping
+ : LDA $18A8 : BEQ EndWaveDash							 		;Once the invulnerability timer is at 0, end the routine
STZ $0B2C : STZ $0B2E : STZ $0B32 : STZ $0B34					;Clear samus's Y speed ram
TDC : INC : STA $0B3C											;set running momentum flag (needed to do extra run speed)
INC : STA $0B36													;samus's Y direction = down
LDA $18A8 : DEC : AND #$0003 : BNE +							;Only run every 4 frames:

LDA $0AF6 : STA $12 : LDA $0AFA : STA $14						;Setup a sprite's position
LDA #WaveDashParticleInst : STA $16 : STZ $18 : JSL $B4BC26		;Spawn a sprite (see "enemy hit explosion.asm")
RTL

EndWaveDash:									 ;;;Branch here to end wave dash
STZ $18A8									 ;Clear i frames
LDA #$A337 : STA $0A58		 				;Set movement handler back to normal
JSL $91DEBA									 ;Reload samus's suit palette
LDA #$0007 : JSL $809021					;End sound
LDA #$001C : JSL $90F084					;Resume spinjump sound if spinjumping or walljumping
+ : RTL

;;;Hijacks {

;Hijack the routune to cancel speedboosting
CancelWaveDashHijack:
LDA $0A58 : CMP #!WaveDashMovementHandler : BNE + : STZ $18A8	;end wavedash if wavedashing
+ : STZ $0B3C : STZ $0B3E : RTL					;Execute vanilla code and return

PaletteHijack:
LDA $0A58 : CMP #!WaveDashMovementHandler : BNE +				;If wavedashing:
LDX #$001F : - : LDA.l WaveDashPalette,X : STA $7EC180,X : DEX : DEX : BPL - ;Set palette
+ : LDA $0ACC : ASL : RTL					;Execute vanilla code and return
WaveDashPalette: DB $FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$7F


ORG $9498DC : LDA #$9F55 : STA $0A6C ;revert to vanilla
ORG $948F49 : STZ $14 : LDA $20
ORG $828B47 : JSL $A08EB6
ORG $91DE5E : JSL CancelWaveDashHijack : BRA $00 ; WDM crashes in SNES Classic/Canoe
ORG $91D70D : JSL PaletteHijack
; See "enemy touch ai rewrite.asm"

;;;Custom Sprites {
ORG !FreeSpaceB4
;Wave dash particle instructions
WaveDashParticleInst:
	DW $0002, WaveDashPart00
	DW $0002, WaveDashPart00A
	DW $0002, WaveDashPart01
	DW $0002, WaveDashPart01A
	DW $0002, WaveDashPart02
	DW $0002, WaveDashPart02A
	DW $0002, WaveDashPart03
	DW $0002, WaveDashPart03A
	DW $BD07 ; delete
;Wave dash particle spritemaps             ;01                  ;02                  ;03                  ;04 
WaveDashPart00:  DW $0001 : DB $F8,$01,$00,$38,$BC
WaveDashPart00A: DW $0001 : DB $F8,$01,$FE,$38,$BC
WaveDashPart01:  DW $0001 : DB $F8,$01,$FD,$39,$BC
WaveDashPart01A: DW $0001 : DB $F8,$01,$FE,$39,$BC
WaveDashPart02:  DW $0001 : DB $F8,$01,$00,$3A,$BC
WaveDashPart02A: DW $0001 : DB $F8,$01,$02,$3A,$BC
WaveDashPart03:  DW $0001 : DB $F8,$01,$03,$3B,$BC
WaveDashPart03A: DW $0001 : DB $F8,$01,$02,$3B,$BC


; Spritemap format is roughly:
;     nnnn         ; Number of entries (2 bytes)
;     xxxx yy aatt ; Entry 0 (5 bytes)
;     ...          ; Entry 1...
; Where:
;     n = number of entries
;     x = X offset of sprite from centre
;     y = Y offset of sprite from centre
;     a = attributes
;     t = tile number

; More specifically, a spritemap entry is:
;     s000000xxxxxxxxx yyyyyyyy YXppPPPttttttttt
; Where:
;     s = size bit
;     x = X offset of sprite from centre
;     y = Y offset of sprite from centre
;     Y = Y flip
;     X = X flip
;     P = palette
;     p = priority (relative to background)
;     t = tile number