; Fix Y offsets of on-ground poses to match vanilla while keeping the shrunken hitboxes.
lorom : org 0

macro fix_y_offset(pose_id, offset)
	org 8*<pose_id>+$91B62D : db <offset>
endmacro

%fix_y_offset($00,$10) ; $00: $20,$08,$18, $1B,$0B,$10 Facing forward - power suit
%fix_y_offset($01,$0B) ; $01: $1B,$06,$15, $1C,$0C,$10 Facing right - normal
%fix_y_offset($02,$0B) ; $02: $1B,$06,$15, $1C,$0C,$10 Facing left  - normal
%fix_y_offset($9B,$10) ; $9B: $20,$08,$18, $1B,$0B,$10 Facing forward - varia/gravity suit
%fix_y_offset($A6,$08) ; $A6: $18,$03,$15, $13,$03,$10 Facing right - landing from spin jump
%fix_y_offset($A7,$08) ; $A7: $18,$03,$15, $13,$03,$10 Facing left  - landing from spin jump
%fix_y_offset($C1,$0D) ; $C1: $1D,$08,$15, $18,$08,$10 Facing right - moonwalking - turn/jump left  - aiming up-right
%fix_y_offset($C2,$0D) ; $C2: $1D,$08,$15, $1B,$0B,$10 Facing left  - moonwalking - turn/jump right - aiming up-left
%fix_y_offset($C3,$0D) ; $C3: $1D,$08,$15, $18,$08,$10 Facing right - moonwalking - turn/jump left  - aiming down-right
%fix_y_offset($C4,$0D) ; $C4: $1D,$08,$15, $1B,$0B,$10 Facing left  - moonwalking - turn/jump right - aiming down-left
%fix_y_offset($E0,$08) ; $E0: $18,$03,$15, $13,$03,$10 Facing right - landing from normal jump - aiming up
%fix_y_offset($E1,$08) ; $E1: $18,$03,$15, $13,$03,$10 Facing left  - landing from normal jump - aiming up
%fix_y_offset($E2,$08) ; $E2: $18,$03,$15, $13,$03,$10 Facing right - landing from normal jump - aiming up-right
%fix_y_offset($E3,$08) ; $E3: $18,$03,$15, $13,$03,$10 Facing left  - landing from normal jump - aiming up-left
%fix_y_offset($E4,$08) ; $E4: $18,$03,$15, $13,$03,$10 Facing right - landing from normal jump - aiming down-right
%fix_y_offset($E5,$08) ; $E5: $18,$03,$15, $13,$03,$10 Facing left  - landing from normal jump - aiming down-left
%fix_y_offset($E6,$08) ; $E6: $18,$03,$15, $13,$03,$10 Facing right - landing from normal jump - firing
%fix_y_offset($E7,$08) ; $E7: $18,$03,$15, $13,$03,$10 Facing left  - landing from normal jump - firing
%fix_y_offset($E8,$01) ; $E8: $11,$FC,$15, $0C,$FC,$10 Facing right - Samus drained - crouching/falling
%fix_y_offset($E9,$01) ; $E9: $11,$FC,$15, $0C,$FC,$10 Facing left  - Samus drained - crouching/falling
%fix_y_offset($EA,$01) ; $EA: $11,$FC,$15, $0C,$FC,$10 Facing right - Samus drained - standing
%fix_y_offset($EB,$01) ; $EB: $11,$FC,$15, $0C,$FC,$10 Facing left  - Samus drained - standing
%fix_y_offset($F7,$08) ; $F7: $18,$03,$15, $13,$03,$10 Facing right - standing transition - aiming up
%fix_y_offset($F8,$08) ; $F8: $18,$03,$15, $13,$03,$10 Facing left  - standing transition - aiming up
%fix_y_offset($F9,$08) ; $F9: $18,$03,$15, $13,$03,$10 Facing right - standing transition - aiming up-right
%fix_y_offset($FA,$08) ; $FA: $18,$03,$15, $13,$03,$10 Facing left  - standing transition - aiming up-left
%fix_y_offset($FB,$08) ; $FB: $18,$03,$15, $13,$03,$10 Facing right - standing transition - aiming down-right
%fix_y_offset($FC,$08) ; $FC: $18,$03,$15, $13,$03,$10 Facing left  - standing transition - aiming down-left

org $80C47F ; when loading game
LDA $000A,x : CLC : ADC $0915 : ADC #$0008 : STA $0AFA : STA $0B14
LDA $0911 : CLC : ADC #$0080 : ADC $000C,x : STA $0AF6 : STA $0B10
STZ $B1 : STZ $B3
LDX $079B : LDA $8F0001,x : STA $079F
STZ $05F7
PLB : PLP : RTL

; Calculate Samus spritemap position - standing
org $908CF2 : -
org $908D0F : LDA $0AFA : SEC : SBC #$0009 : BRA -

org $A39619 : SBC #$0012 ; elevator

org $908D28
db $08,$0B,$00,$00, ; Facing right - landing from normal jump
   $08,$0B,$00,$00, ; Facing left  - landing from normal jump
   $08,$08,$0B,$00, ; Facing right - landing from spin jump
   $08,$08,$0B,$00  ; Facing left  - landing from spin jump

; Calculate Samus spritemap position - shinespark / crystal flash / drained by metroid / damaged by MB's attacks
org $908DB9 : LDA #$0002 ; Samus drained - standing with [Samus animation frame] >= 5 (unused)

; Samus drained - crouching
org $908DEF
db $0C, $0A, ; Unmorphing (for some reason this is unused...)
   $FD, $FD, ; Falling
   $FD, $FD, $FD, 
   $00, ; Hit the ground
   $09, $09, $09, $09, $00, $00, ; Crouching
   $09, $02, $00, $00, $00, ; Let up
   $09, $02, $00, $02, $09, $00, $00, ; Fails to stand up
   $09, $00, $00, ; Gets hit
   $09, $00, $00 ; Gets hyper beam

; Prospective pose change command 7 - start transition animation
; Fix a bug where if you crouch while standing on a frozen enemy, you go through it
org $91ED36
dw $0000, ;  35h: Facing right - crouching transition
   $0000, ;  36h: Facing left  - crouching transition
   $0009, ; *37h: Facing right - morphing transition
   $0009, ; *38h: Facing left  - morphing transition
   $0000, ;  39h: Unused
   $0000, ;  3Ah: Unused
   $0000, ;  3Bh: Facing right - standing transition
   $0000, ;  3Ch: Facing left  - standing transition
   $0000, ;  3Dh: Facing right - unmorphing transition
   $0000, ;  3Eh: Facing left  - unmorphing transition
   $0000, ;  3Fh: Unused
   $0000  ;  40h: Unused

; Drained Samus controller - 0: let drained Samus fall
org $91E4F8 : LDA #$0010