lorom

org $A58687 ; draygon goo palette fix when shot
LDX #$005E

;org $A5A1F7 : incbin "draygon palettes new.pal" ; draygon now has blood wand
;
;org $A586C5 ; load new palettes when initializing draygon
;PHX : LDX #$001E
;- : LDA $A277,x : STA $7EC2A0,x : DEX : DEX : BPL -
;PLX : BRA $00
