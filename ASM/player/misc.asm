lorom

org $82DBB2 ; Disable Black Falcon's arm cannon palette
LDA $09DA

org $9B802B ; Fix walljump graphics
BIT #$0040

; unpause fixes
org $91E749 ; Update Samus pose due to change of equipment - standing
BIT #$0080
org $91E75F
BIT #$0080
org $91E7AB ; Update Samus pose due to change of equipment - spin jumping (rewritten in "spinjump.asm")
BIT #$0040
org $91E7BA
BIT #$0040
org $91E840 ; Update Samus pose due to change of equipment - morph ball
BRA $00
org $91E867 ; Update Samus pose due to change of equipment - spring ball
RTS
;org $91E897 ; Update Samus pose due to change of equipment - wall jumping
;BIT #$0040

; in case you're forced to transform without rat cloak...
org $91B4CA : db $FA,$79,$7D
org $91B4D3 : db $FA,$7A,$7E

org $8DE3C1 ; fix heat palette with gravity suit
BIT #$0080
org $8DE443
BIT #$0080

org $908096 ; fix splashing out of water with gravity suit (check equipment instead of palette)
LDA $09A2
BIT #$0020

org $90C7D9 ; arm cannon open flags (for samus and many other SpriteSomething sprites that aren't junko)
db 0, ; nothing
   0, ; charged shots
   1, ; baseball
   0, ; sparksuit
   1, ; grapple
   0  ; x-ray

org $90C4C2 : BEQ $05 ; disable the evil hex tweak made by P. Yoshi to disable auto-cancel

org $88E05A ; remove item room music after getting varia suit
dw $E25F

org $88E373 ; fix samus getting buff suit after getting gravity without varia
JSL $91DEBA
INC $0DEC
SEC
RTS

org $82DFC7 : RTS ; why does this even exist (draws samus twice in door transitions)

org $9085F6 : BRA $03 ; samus flickers when getting hit while shine is stored

; shinespark doesn't reset hurt flash since it doesn't damage samus anymore
org $90D0B1 : BRA $04
org $90D0DD : BRA $04
org $90D10C : BRA $04
org $90D333 : BRA $01

; no hurt sound after shinespark, and iframes after shinespark
org $90D336
LDA.w #96 : STA $18A8 : NOP
