; Fixes springball lock (when Samus morphs in midair or falls of a ledge as morphball, with springball equipped, Samus can't control her height of her jumps, even if she unmorphed midair.)
; Doesn't fix turnaround lock (when Samus turns around midair and she can't control her height during her turnaround animation)
lorom

org $90A590 : JSR $8FB3 ; use jumping movement (can control height) instead of falling movement (can't control height)

org 2*8+$90A34B ; Samus movement - morph ball - falling -> Samus movement - spring ball - in air
dw $A6F1

org 2*$13+$90A34B ; Samus movement - spring ball - falling -> Samus movement - spring ball - in air
dw $A6F1