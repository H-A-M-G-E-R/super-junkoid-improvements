lorom

org $90B5BB ; Beam trail instruction list pointers
dw $B4C9, ;  0: Uncharged power
   $B58F, ; *1: Uncharged wave
   $B4CB, ; *2: Uncharged ice
   $B4CB, ; *3: Uncharged ice + wave
   $B4C9, ;  4: Uncharged spazer
   $B58F, ; *5: Uncharged spazer + wave
   $B4CB, ; *6: Uncharged spazer + ice
   $B4CB, ; *7: Uncharged spazer + ice + wave
   $B4C9, ;  8: Uncharged plasma
   $B58F, ; *9: Uncharged plasma + wave
   $B4CB, ; *Ah: Uncharged plasma + ice
   $B4CB, ; *Bh: Uncharged plasma + ice + wave
   $B4C9, ;  Ch
   $B4C9, ;  Dh
   $B4C9, ;  Eh
   $B4C9, ;  Fh
   $B4C9, ;  10h: Charged power
   $B58F, ; *11h: Charged wave
   $B4CB, ; *12h: Charged ice
   $B4CB, ; *13h: Charged ice + wave
   $B4C9, ;  14h: Charged spazer
   $B58F, ; *15h: Charged spazer + wave
   $B4CB, ; *16h: Charged spazer + ice
   $B4CB, ; *17h: Charged spazer + ice + wave
   $B4C9, ;  18h: Charged plasma
   $B58F, ; *19h: Charged plasma + wave
   $B4CB, ; *1Ah: Charged plasma + ice
   $B4CB, ; *1Bh: Charged plasma + ice + wave
   $B4C9, ;  1Ch
   $B4C9, ;  1Dh
   $B4C9, ;  1Eh
   $B4C9, ;  1Fh
   $B5A1, ; *20h: Missile
   $B5A1, ; *21h: Super missile
   $B4C9, ;  22h
   $B4C9, ;  23h
   $B4CB, ; *24h: Spazer SBA trail
   $B4CB, ; *25h
   $B4CB  ; *26h
org $90B609
dw $B4C9, ;  0: Uncharged power
   $B4C9, ;  1: Uncharged wave
   $B4C9, ;  2: Uncharged ice
   $B4C9, ;  3: Uncharged ice + wave
   $B4C9, ;  4: Uncharged spazer
   $B58F, ; *5: Uncharged spazer + wave
   $B52D, ; *6: Uncharged spazer + ice
   $B52D, ; *7: Uncharged spazer + ice + wave
   $B4C9, ;  8: Uncharged plasma
   $B58F, ; *9: Uncharged plasma + wave
   $B4C9, ;  Ah: Uncharged plasma + ice
   $B52D, ; *Bh: Uncharged plasma + ice + wave
   $B4C9, ;  Ch
   $B4C9, ;  Dh
   $B4C9, ;  Eh
   $B4C9, ;  Fh
   $B4C9, ;  10h: Charged power
   $B58F, ; *11h: Charged wave
   $B4C9, ;  12h: Charged ice
   $B52D, ; *13h: Charged ice + wave
   $B4C9, ;  14h: Charged spazer
   $B58F, ; *15h: Charged spazer + wave
   $B52D, ; *16h: Charged spazer + ice
   $B52D, ; *17h: Charged spazer + ice + wave
   $B4C9, ;  18h: Charged plasma
   $B58F, ; *19h: Charged plasma + wave
   $B4C9, ;  1Ah: Charged plasma + ice
   $B52D, ; *1Bh: Charged plasma + ice + wave
   $B4C9, ;  1Ch
   $B4C9, ;  1Dh
   $B4C9, ;  1Eh
   $B4C9, ;  1Fh
   $B4C9, ;  20h: Missile
   $B4C9, ;  21h: Super missile
   $B4C9, ;  22h
   $B4C9, ;  23h
   $B4CB, ; *24h: Spazer SBA trail
   $B52D, ; *25h
   $B4CB  ; *26h
org $9BA4B3
dw $A50B, $A4F7, $A50B, $A4F7, $A50B, $A533, $A51F, $A533, $A50B, $A55B, $A547, $A55B
dw $A98F, $A9A3, $A98F, $A9A3, $A98F, $A9CB, $A9B7, $A9CB, $A98F, $A9F3, $A9DF, $A9F3

org $90C28F ; revert beam sounds as P. Yoshi intended
dw $000B ; 0: Power
dw $000D ; 1: Wave
dw $000C ; 2: Ice
dw $000E ; 3: Ice + wave
dw $000F ; 4: Spazer
dw $0012 ; 5: Spazer + wave
dw $0010 ; 6: Spazer + ice
dw $0011 ; 7: Spazer + ice + wave
dw $0013 ; 8: Plasma
dw $0016 ; 9: Plasma + wave
dw $0014 ; Ah: Plasma + ice
dw $0015 ; Bh: Plasma + ice + wave

;org $90B8D0		;hi-jack
;	JMP $F740	;free space

;org $90F740		;new code here
;	LDA $09A6
;	BIT #$1000	;normally, charge won't be equiped unless you have it
;	BNE Charge	;if charge is equiped, go there
;	LDA $09D2 : DEC : BEQ + ;if missiles selected, fire charged shot and consumes a missile. if not, fire uncharged shot
;	LDA $09A6
;	JMP $B8D3	;back to original code
;	+
;	DEC $09C6   ;decrement missiles by 1
;	BNE Charge
;	-
;	STZ $09D2   ;deselect missiles
;	STZ $0A04
;Charge:
;	LDA $0A04
;	BNE -		;auto-cancel
;	JMP $B9C7   ;CHARGE BEAM YES

org $93F62C
MultiplyDamageFromMeteorShards:
{
; check projectile type (beam or bomb)
LDA $0C18,x : AND #$0F00 : BEQ +
CMP #$0500 : BNE .no
+
LDA $0000,y : STA $26 ; projectile damage
LDA $09D8 : AND #$000F : CLC : ADC #$0004 : STA $28 ; number of meteor shards + 4
JSL $A0B6FF ; 16-bit multiplication
LDA $2A : LSR : LSR : RTS ; / 4

.no
LDA $0000,y : RTS
}

; Bomb damage scales depending on beams equipped, including hyper beam. It's set to half the charged beam damage. Vulnerabilities remain unchanged.
SetBombDamage:
{
LDA $0C18,x : AND #$0F00 : CMP #$0500 : BNE .NotBomb ; If bomb:
LDA $09A6 : AND #$000F : ASL : TAY ; equipped beams
LDA $83D9,y : TAY : JSR MultiplyDamageFromMeteorShards : LSR ; charged beam damage / 2
LDY $0A76 : BEQ .NoHyper : LDA $83BF : LSR : .NoHyper ; If hyper: bomb damage = half of hyper beam damage
STA $0C2C,x ; Else: bomb damage = half of charged beam damage
.NotBomb : PLB : PLP : RTL
}

SetHyperBeamTrailTimer:
{
LDA #$0004 : STA $0C90,x ; trail timer
JML $938000 ; restore from hijack
}

org $9380CC : JMP SetBombDamage

org $90BCF9 : LDA #$9017 ; hyper beam type
org $90BD35 : LDA #$0007 ; hyper beam fire rate
org $90BD29 : LDA #$B0F1 ; hyper beam pre-instruction (spawn trail, don't delete if flagged for deletion)

org $90BD0F : JSL SetHyperBeamTrailTimer

org 4*$7+$90C2D1 ; fast beam
dw $0A00,round($0A00*2/3, 0)

if defined("spritesomething")
  org $91E5F0 : LDA #$1007 ; let me freeze enemies with the hyper beam
endif
