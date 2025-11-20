; Fixes bird doors in Super Junkoid when going through it by spawning the door closing PLM and running the PLM handler without drawing (letting the scrolling do it) before the scrolling.

lorom

org $82E3B9
JSR SpawnAndDrawClosingDoor ; after door transition scrolling setup

org $82DFD1 ; Space freed up by "enemy tile loading rewrite 1.03.asm"
SpawnAndDrawClosingDoor:
JSL $8483C3 ; Clear PLMs
JSR $E8EB ; Spawn door closing PLM
JSL HandlePLMAtLastSlot ; Handle PLM at last slot (don't draw, let the scrolling do it)
LDA $7EDE1C : INC : STA $7EDE1C ; to preserve timing at end of door transition
LDA #$E3C0 : RTS
SpawnPLMAtLastSlot: ; Y = 0 (last PLM slot)
PHP : PHB : PHY : PHX : PEA $8484 : PLB : PLB
TDC : TAY : JML $848482

org $82E915 : JSL SpawnPLMAtLastSlot

org $84F617 ; Freespace
HandlePLMAtLastSlot:
PHB : PHK : PLB
STZ $1C25 ; PLM draw tilemap index = 0
TDC : TAX ; X = 0 (PLM index)
LDA $1C37,x : BEQ + ; If [PLM ID] != 0: (check if there's a closing door)
STX $1C27 ; PLM index = [X]
JSR $85DA ; Process PLM
+ PLB : RTL

org $82E53C ; Fixes the bug noted in https://patrickjohnston.org/bank/82#fE4A9
JSL $808338 ; Wait for NMI (do the scrolling updates)
JSL $8485B4 ; PLM handler (this time, draw)
