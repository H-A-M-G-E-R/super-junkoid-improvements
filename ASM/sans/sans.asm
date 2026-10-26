; Sans render is from the SMG4 wiki.

lorom

check bankcross off

org $95F90E
incbin "Sans_Render_again.gfx.comp"
assert pc() <= $96D10A

org $96FF14
incbin "Sans_Render_again.map.comp"
assert pc() <= $9788CC

org $8CE3E9
incbin "Sans_Render_again.pal"

check bankcross full

org $8BB170 : RTS
org $8BB2DA : BRA + : org $8BB30A : +

org $8C8CF3 : dw $0000
org $8C8D13 : dw $0000
org $8C8D33 : dw $0000

org $8BA6B4 : BRA + : org $8BA6E7 : +
