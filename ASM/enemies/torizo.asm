lorom

org $AA994A ; fix one of torizo's spritemaps
dw $001B

NewBTHaze:
{
org $88DD32
JSL $888435 : dw $2100,$DD62 ; HDMA to CGADD
JSL $888435 : dw $2202,$DD4A ; HDMA to CGDATA
RTL

org $88DD43 : RTL ; RTL out setting layer blending configuration to 2Ch

function rgb555(r,g,b) = r|(g<<5)|(b<<10)

org $88DD75
db $48 : dw rgb555(0,0,0)
db $0A : dw rgb555(1,1,1)
db $0A : dw rgb555(1,1,1)
db $0A : dw rgb555(1,1,2)
db $0A : dw rgb555(2,2,2)
db $0A : dw rgb555(2,2,3)
db $0A : dw rgb555(2,2,3)
db $0A : dw rgb555(3,3,4)
db $0A : dw rgb555(3,3,4)
db $0A : dw rgb555(3,3,5)
db $0A : dw rgb555(4,4,5)
db $0A : dw rgb555(4,4,6)
db $0A : dw rgb555(4,4,6)
db $0A : dw rgb555(5,5,7)
db $0A : dw rgb555(5,5,7)
db $0A : dw rgb555(5,5,8)
db $00

org $88DDA6
db $48,$1B, ; palette 1 color Bh
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $0A,$1B,
   $00
}

org $A0BAB1 ; change where bt's drops are
AND #$00FF : CLC : ADC #$0080

; Adjust Golden Torizo's health thresholds
org $AAD474 : LDA.w #3208/7
org $AAD49B : LDA.w #3208*4/5

org $86B00E : JSL $808111 ; fix golden torizo egg hatch timer (see https://patrickjohnston.org/bank/86#B001)
