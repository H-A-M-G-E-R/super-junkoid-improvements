; Fixes the water row at the bottom of the hud not rendering correctly.
lorom

org $88C57E
JMP SetXScroll

org $88F21B ; freespace
SetXScroll:
ADC #$005E : STA $12 : LDA ($12) : TAX : LDA $7E9C00,x : STA $7ECADC : PLY : PLX : PLB : RTL