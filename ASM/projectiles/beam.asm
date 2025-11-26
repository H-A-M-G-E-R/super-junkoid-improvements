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
