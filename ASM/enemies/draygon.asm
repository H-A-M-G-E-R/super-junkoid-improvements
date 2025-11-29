lorom

org $A58687 ; draygon goo palette fix when shot
LDX #$005E

;org $A5A1F7 : incbin "draygon palettes new.pal" ; draygon now has blood wand
;
;org $A586C5 ; load new palettes when initializing draygon
;PHX : LDX #$001E
;- : LDA $A277,x : STA $7EC2A0,x : DEX : DEX : BPL -
;PLX : BRA $00

org $A59654 ; fix standup when draygon dies that causes bluesuit glitch
LDA $0A5A : CMP #$E2A1 : BNE + ; If [timer / Samus hack handler] != grabbed by Draygon: return
  JSL $90E2D4 ; Release Samus from Draygon
  STZ $0A64 ; Grapple connected flags = 0
+
JSR $9701 ; Draygon health-based palette handling
RTL
