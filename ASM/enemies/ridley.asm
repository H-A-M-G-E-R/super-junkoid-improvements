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