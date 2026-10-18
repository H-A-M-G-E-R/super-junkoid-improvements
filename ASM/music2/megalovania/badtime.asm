; Originally by Toby Fox, arranged by Lui (https://www.smwcentral.net/?p=section&a=details&id=13771)
asar 1.91
norom : org 0
incsrc "../defines.asm"

!instr1E = $16
!instr1F = $17
!instr20 = $18
!instr21 = $19
!instr22 = $1A
!instr23 = $1B
!instr24 = $1C
!instr25 = $1D
!instr26 = $1E
!instr27 = $1F
!instr28 = $20
!instr29 = $21
!instr2A = $22
!instr2B = $23
!instr2C = $24
!instr2D = $25

!sample14 = $16
!sample15 = $17
!sample16 = $18
!sample17 = $19
!sample18 = $1A
!sample19 = $1B
!sample1A = $1C
!sample1B = $1D
!sample1C = $1E
!sample1D = $1F
!sample1E = $20
!sample1F = $21
!sample20 = $22
!sample21 = $23

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample14,$FF,$E0,$B8,$06,$10
  db !sample15,$FF,$E0,$B8,$05,$BE
  db !sample16,$FF,$E0,$B8,$05,$BE
  db !sample17,$FF,$E0,$B8,$07,$A8
  db !sample18,$FF,$E0,$B8,$07,$A8
  db !sample19,$FF,$EE,$B8,$03,$01
  db !sample1A,$8F,$C5,$B8,$08,$00
  db !sample1B,$FE,$E0,$B8,$06,$00
  db !sample1C,$FF,$E0,$B8,$01,$8F
  db !sample1A,$AF,$AA,$B8,$08,$00
  db !sample1D,$FF,$F2,$B8,$07,$5C
  db !sample1E,$FF,$E0,$B8,$04,$00
  db !sample1F,$FF,$E0,$B8,$03,$70
  db !sample14,$F7,$E3,$B8,$06,$10
  db !sample20,$FF,$E0,$B8,$04,$00
  db !sample21,$FF,$E0,$B8,$05,$04
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+2367
  dw Sample15,Sample15+0
  dw Sample16,Sample16+0
  dw Sample17,Sample17+0
  dw Sample18,Sample18+0
  dw Sample19,Sample19+945
  dw Sample1A,Sample1A+0
  dw Sample1B,Sample1B+1098
  dw Sample1C,Sample1C+405
  dw Sample1D,Sample1D+1800
  dw Sample1E,Sample1E+36
  dw Sample1F,Sample1F+0
  dw Sample20,Sample20+27
  dw Sample21,Sample21+2277
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "eb dist guitar.brr":2..0
  Sample15: incbin "ff6 kick 24k.brr":2..0
  Sample16: incbin "ff6 power snare 24k.brr":2..0
  Sample17: incbin "ff6 closed hi-hat.brr":2..0
  Sample18: incbin "ff6 open hi-hat.brr":2..0
  Sample19: incbin "ff6 picked bass.brr":2..0
  Sample1A: incbin "off od guitar.brr":2..0
  Sample1B: incbin "sai sax 24k.brr":2..0
  Sample1C: incbin "ff6 strings 16k.brr":2..0
  Sample1D: incbin "mmx2 crash cymbal.brr":2..0
  Sample1E: incbin "50+12.brr":2..0
  Sample1F: incbin "thg orch hit 24k.brr":2..0
  Sample20: incbin "mm7 sawtooth.brr":2..0
  Sample21: incbin "mmx3 dist guitar.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2BAB

Tracker2BAB:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !tempo,48
  !musicVolume,255
  !setDPMiscCommand,!noteEndInTicks,1
  !loop : dw .sub3548 : db 8
.pattern1_0:
  !echo,%11000110,29,29
  !echoParameters,4,70,0
  !loop : dw .sub3548 : db 8
  !volume,160
  !pan,10
  !subloop,0
  !loop : dw .sub354C : db 3
  !instr,!instr1F
  db 24,$7E
  !c5
  !instr,!instr20
  db 24,$7C
  !c5
  !instr,!instr1F
  db 12,$7E
  !c5
  !c5
  !instr,!instr20
  db 24,$7C
  !c5
  db 24,$7D
  !c5
  db 12,$79
  !c5
  db 24,$7B
  !c5
  db 12,$7A
  !c5
  db 24,$7D
  !c5
  !subloop,7
  !subloop,0
  !instr,!instr1F
  db 24,$7E
  !c5
  !c5
  !instr,!instr20
  db 12,$7C
  !c5
  !instr,!instr1F
  db 24,$7E
  !c5
  !c5
  !instr,!instr20
  db 24,$7C
  !c5
  !instr,!instr1F
  db 12,$7E
  !c5
  !c5
  !c5
  !instr,!instr20
  db 24,$7C
  !c5
  !subloop,13
  db 96,$7C
  !rest
  !tie
  !tie
  !instr,!instr20
  db 24,$7D
  !c5
  db 12,$79
  !c5
  db 24,$7B
  !c5
  db 12,$7A
  !c5
  db 12,$7D
  !c5
  !c5
  !loop : dw .sub354C : db 16
  !loop : dw .sub3548 : db 16
  !end

.pattern0_1
  !loop : dw .sub3548 : db 8
.pattern1_1:
  !loop : dw .sub3548 : db 7
  !volume,140
  !pan,11
  db 12,$7F
  !rest
  !instr,!instr22
  db 24,$77
  !c5
  db 24,$7B
  !c5
  db 12,$7C
  !c5
  db 24,$7D
  !c5
  !loop : dw .sub357A : db 3
  !loop : dw .sub3599 : db 1
  db 96,$76
  !rest
  !loop : dw .sub357A : db 3
  !loop : dw .sub3599 : db 1
  db 48,$76
  !rest
  !instr,!instr29
  db 12,$77
  !a5
  !toggleLegato
  db 9
  !as5
  !c6
  !d6
  db 6
  !e6
  !toggleLegato
  db 3
  !tie
  !instr,!instr21
  !subloop,0
  db 12,$7B
  !c5
  db 12,$78
  !c5
  !c5
  db 12,$79
  !c5
  !subloop,11
  !instr,!instr22
  !loop : dw .sub35AB : db 1
  db 96,$7B
  !rest
  !loop : dw .sub357A : db 3
  !loop : dw .sub3599 : db 1
  db 96,$7B
  !rest
  !loop : dw .sub35BE : db 12
  !loop : dw .sub35AB : db 1
  !instr,!instr28
  !pan,8
  db 36,$7E
  !c5
  !c5
  db 24
  !c5
  !subloop,0
  db 24,$7E
  !c5
  !instr,!instr22
  !pan,11
  db 24,$77
  !c5
  !loop : dw .sub35C5 : db 11
  !loop : dw .sub35AB : db 1
  !instr,!instr28
  !pan,8
  db 36,$7E
  !c5
  !c5
  db 24
  !c5
  !subloop,2
  !instr,!instr22
  !pan,11
  !subloop,0
  db 24,$7A
  !c5
  !subloop,111
  !instr,!instr2A
  !volume,140
  !pan,10
  !subloop,0
  db 24,$7A
  !rest
  db 24,$7F
  !f5
  db 36
  !e5
  db 24
  !c5
  !e5
  !d5
  db 12
  !g4
  !a4
  !c5
  !subloop,1
  !instr,!instr22
  !volume,140
  !pan,11
  !loop : dw .sub357A : db 16
  !loop : dw .sub3548 : db 16
  !end

.pattern0_2
  !loop : dw .sub3548 : db 8
.pattern1_2:
  !loop : dw .sub3548 : db 8
  !instr,!instr23
  !volume,135
  !pan,10
  !loop : dw .sub35CC : db 4
  !subloop,0
  db 24,$5E
  !as5
  !as5
  db 12
  !as5
  db 24
  !as5
  !as5
  !as5
  db 12
  !as5
  !as5
  !as5
  db 24
  !as5
  !c6
  !c6
  db 12
  !c6
  db 24
  !c6
  !c6
  !c6
  db 12
  !c6
  !c6
  !c6
  db 24
  !c6
  !d6
  !d6
  db 12
  !d6
  db 24
  !d6
  !d6
  !d6
  db 12
  !d6
  !d6
  !d6
  db 24
  !d6
  !cs6
  !cs6
  db 12
  !cs6
  db 24
  !cs6
  !ds6
  !ds6
  db 12
  !ds6
  !ds6
  !ds6
  db 24
  !ds6
  !subloop,3
  !subloop,0
  db 24,$5E
  !as5
  !as5
  db 12
  !as5
  db 24
  !as5
  !as5
  !as5
  db 12
  !as5
  !as5
  !as5
  db 24
  !as5
  !c6
  !c6
  db 12
  !c6
  db 24
  !c6
  !c6
  !c6
  db 12
  !c6
  !c6
  !c6
  db 24
  !c6
  !b5
  !b5
  db 12
  !b5
  db 24
  !b5
  !b5
  !b5
  db 12
  !b5
  !b5
  !b5
  db 24
  !b5
  !b5
  !b5
  db 12
  !b5
  db 24
  !b5
  !b5
  !b5
  db 12
  !b5
  !b5
  !b5
  db 24
  !b5
  !loop : dw .sub3607 : db 1
  !subloop,1
  !subloop,0
  db 24,$5E
  !as5
  !as5
  db 12
  !as5
  db 24
  !as5
  !as5
  !as5
  db 12
  !as5
  !as5
  !as5
  db 24
  !as5
  !c6
  !c6
  db 12
  !c6
  db 24
  !c6
  !c6
  !c6
  db 12
  !c6
  !c6
  !c6
  db 24
  !c6
  !d6
  !d6
  db 12
  !d6
  db 24
  !d6
  !cs6
  !cs6
  db 12
  !cs6
  !cs6
  !cs6
  db 24
  !cs6
  !c6
  !c6
  db 12
  !c6
  db 24
  !c6
  !b5
  !b5
  db 12
  !b5
  !b5
  !b5
  db 24
  !b5
  !loop : dw .sub3607 : db 1
  !subloop,1
  !loop : dw .sub3548 : db 16
  !end

.pattern0_3
  !loop : dw .sub3548 : db 8
.pattern1_3:
  !instr,!instr1E
  !volume,105
  !pan,10
  db 24,$4E
  !d3
  !d3
  db 12
  !d3
  db 24
  !d3
  !d3
  !d3
  db 12
  !d3
  !d3
  !d3
  db 24
  !d3
  !c3
  !c3
  db 12
  !c3
  db 24
  !c3
  !c3
  !c3
  db 12
  !c3
  !c3
  !c3
  db 24
  !c3
  !b2
  !b2
  db 12
  !b2
  db 24
  !b2
  !b2
  !b2
  db 12
  !b2
  !b2
  !b2
  db 24
  !b2
  !as2
  !as2
  db 12
  !as2
  db 24
  !as2
  !c3
  !c3
  db 12
  !c3
  !c3
  !c3
  db 24
  !c3
  !volume,80
  !pan,10
  !toggleEcho
  !loop : dw .sub3642 : db 4
  !subloop,0
  !instr,!instr24
  db 24,$7E
  !as2
  !as2
  !instr,!instr27
  db 12
  !as2
  !instr,!instr24
  db 24
  !as2
  !as2
  !as2
  !instr,!instr27
  db 12
  !as2
  !as2
  !instr,!instr24
  !as2
  db 24,$7D
  !as3
  db 24,$7E
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !instr,!instr24
  db 24
  !c3
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !c3
  !instr,!instr24
  !c3
  db 24
  !c3
  !d3
  !d3
  !instr,!instr27
  db 12
  !d3
  !instr,!instr24
  db 24
  !d3
  !d3
  !d3
  !instr,!instr27
  db 12
  !d3
  !d3
  !instr,!instr24
  !d3
  db 24
  !d3
  !cs3
  !cs3
  !instr,!instr27
  db 12
  !cs3
  !instr,!instr24
  db 24
  !cs3
  !ds3
  !ds3
  !instr,!instr27
  db 12
  !ds3
  !ds3
  !instr,!instr24
  !ds3
  db 24
  !ds3
  !subloop,3
  !subloop,0
  !instr,!instr24
  db 24,$7E
  !as2
  !as2
  !instr,!instr27
  db 12
  !as2
  !instr,!instr24
  db 24
  !as2
  !as2
  !as2
  !instr,!instr27
  db 12
  !as2
  !as2
  !instr,!instr24
  !as2
  db 24
  !as2
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !instr,!instr24
  db 24
  !c3
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !c3
  !instr,!instr24
  !c3
  db 24
  !c3
  !b2
  !b2
  !instr,!instr27
  db 12
  !b2
  !instr,!instr24
  db 24
  !b2
  !b2
  !b2
  !instr,!instr27
  db 12
  !b2
  !b2
  !instr,!instr24
  !b2
  db 24
  !b2
  !b2
  !b2
  !instr,!instr27
  db 12
  !b2
  !instr,!instr24
  db 24
  !b2
  !b2
  !b2
  !instr,!instr27
  db 12
  !b2
  !b2
  !instr,!instr24
  !b2
  db 24
  !b2
  !instr,!instr24
  !as2
  !as2
  !instr,!instr27
  db 12
  !as2
  !instr,!instr24
  db 24
  !as2
  !as2
  !as2
  !instr,!instr27
  db 12
  !as2
  !as2
  !instr,!instr24
  !as2
  db 24
  !as2
  !loop : dw .sub36A2 : db 1
  !subloop,1
  !subloop,0
  !instr,!instr24
  db 24,$7E
  !as2
  !as2
  !instr,!instr27
  db 12
  !as2
  !instr,!instr24
  db 24
  !as2
  !as2
  !as2
  !instr,!instr27
  db 12
  !as2
  !as2
  !instr,!instr24
  !as2
  db 24,$7D
  !as3
  db 24,$7E
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !instr,!instr24
  db 24
  !c3
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !c3
  !instr,!instr24
  !c3
  db 24
  !c3
  !d3
  !d3
  !instr,!instr27
  db 12
  !d3
  !instr,!instr24
  db 24
  !d3
  !cs3
  !cs3
  !instr,!instr27
  db 12
  !cs3
  !cs3
  !instr,!instr24
  !cs3
  db 24
  !cs3
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !instr,!instr24
  db 24
  !c3
  !b2
  !b2
  !instr,!instr27
  db 12
  !b2
  !b2
  !instr,!instr24
  !b2
  db 24
  !b2
  !instr,!instr24
  !as2
  !as2
  !instr,!instr27
  db 12
  !as2
  !instr,!instr24
  db 24
  !as2
  !as2
  !as2
  !instr,!instr27
  db 12
  !as2
  !as2
  !instr,!instr24
  !as2
  db 24,$7D
  !as3
  !loop : dw .sub36A2 : db 1
  !subloop,1
  !loop : dw .sub3548 : db 16
  !end

.pattern0_4
  !instr,!instr1E
  !volume,135
  !pan,10
  !loop : dw .sub36E7 : db 1
.pattern1_4:
  !loop : dw .sub36E7 : db 1
  !instr,!instr26
  !volume,162
  !pan,12
  !toggleEcho
  !loop : dw .sub373A : db 2
  !instr,!instr29
  !volume,125
  !pan,10
  !vibrato,12,16,48
  db 24,$59
  !f6
  db 12
  !f6
  !f6
  !rest
  !f6
  !rest
  db 24,$69
  !e6
  !pitchSlide,0,12 : !f6
  db 12,$59
  !d6
  !rest
  db 60,$69
  !d6
  db 24,$59
  !f6
  db 12
  !f6
  db 12,$29
  !f6
  !rest
  db 12,$59
  !g6
  !rest
  db 24,$79
  !gs6
  db 6
  !g6
  db 3
  !gs6
  !g6
  db 12,$59
  !f6
  db 12,$29
  !d6
  db 12,$59
  !f6
  db 12,$29
  !g6
  db 24
  !rest
  db 24,$59
  !f6
  db 12
  !f6
  db 12,$29
  !f6
  !rest
  !g6
  !rest
  !gs6
  !rest
  db 18,$69
  !a6
  db 6
  !rest
  db 12,$59
  !c7
  !rest
  db 36
  !a6
  db 12,$59
  !d7
  !rest
  !d7
  !rest
  db 12,$69
  !d7
  !a6
  !d7
  db 108
  !c7
  !volume,115
  !pan,12
  db 24,$59
  !f6
  db 12
  !f6
  !f6
  !rest
  !f6
  !rest
  db 24,$69
  !e6
  !pitchSlide,0,12 : !f6
  db 12,$59
  !d6
  !rest
  db 60,$79
  !d6
  db 24,$59
  !f6
  db 12
  !f6
  db 12,$29
  !f6
  !rest
  !f6
  !rest
  !d6
  !rest
  !f6
  !rest
  !e6
  !rest
  !d6
  db 24,$69
  !c6
  db 12,$29
  !a6
  !f6
  !d6
  !e6
  !f6
  !d6
  !b5
  !d6
  !f6
  !d6
  !b5
  !d6
  !b5
  !g5
  !b5
  !g5
  db 24,$69
  !d5
  db 12,$59
  !e5
  !f5
  db 12,$29
  !g5
  !a5
  !rest
  db 108,$79
  !e6
  !instr,!instr2D
  !volume,95
  !pan,9
  !subloop,0
  db 96,$79
  !rest
  db 12,$3E
  !f6
  !d6
  !f6
  !g6
  !gs6
  !g6
  !f6
  !d6
  db 6,$7E
  !gs6
  !g6
  !f6
  !d6
  db 24,$5E
  !f6
  db 96,$7E
  !g6
  db 12
  !rest
  db 24,$5E
  !gs6
  db 12
  !a6
  !c7
  !rest
  db 12,$3E
  !a6
  !gs6
  !g6
  !f6
  !d6
  !e6
  db 24,$5E
  !f6
  !g6
  !a6
  !c7
  !cs7
  db 12
  !gs6
  !rest
  !gs6
  !g6
  !f6
  db 12,$7E
  !g6
  db 96
  !tie
  !pitchSlide,48,48 : !g5
  db 24,$5E
  !d5
  !e5
  !f5
  !f6
  db 48,$6E
  !e6
  !d6
  !e6
  !f6
  !g6
  !e6
  db 96,$7E
  !a6
  db 12,$3E
  !a6
  !gs6
  !g6
  !fs6
  !f6
  !e6
  !ds6
  !d6
  db 96,$7E
  !cs6
  !pitchSlide,48,72 : !ds6
  !ds6
  !subloop,1
  !volume,117
  !pan,10
  !subloop,0
  !instr,!instr2B
  db 96,$7E
  !as3
  db 48
  !tie
  !f4
  db 96
  !e4
  !d4
  db 96
  !f4
  db 48
  !tie
  !adsrGain,$80,$A8
  db 96
  !tie
  !tie
  db 48
  !tie
  !instr,!instr2B
  db 96
  !as3
  db 48
  !tie
  !f4
  db 96
  !e4
  !d4
  db 96
  !d4
  db 48
  !tie
  !adsrGain,$80,$A8
  !tie
  !pitchSlide,0,48 : !c4
  db 96
  !tie
  !pitchSlide,0,96 : !g3
  !tie
  !pitchSlide,0,96 : !d3
  !subloop,1
  !endVibrato
  !loop : dw .sub3548 : db 28
  !instr,!instr1E
  !volume,135
  !pan,10
  !toggleEcho
  db 12,$5E
  !d4
  !d4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !d4
  !d4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !subloop,0
  db 12,$5E
  !as3
  !as3
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !c4
  !c4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !d4
  !d4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !d4
  !d4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !subloop,1
  !end

.pattern0_5
  !loop : dw .sub3548 : db 8
.pattern1_5:
  !instr,!instr1E
  !volume,78
  !pan,10
  db 96,$7E
  !d4
  !tie
  db 96
  !c4
  !tie
  db 96
  !b3
  !tie
  db 84
  !as3
  db 108
  !c4
  !instr,!instr25
  !volume,150
  !pan,9
  !toggleEcho
  !loop : dw .sub378D : db 2
  !loop : dw .sub3548 : db 7
  !instr,!instr29
  !vibrato,12,16,48
  db 24,$5E
  !rest
  !volume,60
  !dynamicVolume,72,120
  db 72,$79
  !g7
  !volume,115
  !pan,8
  db 24,$59
  !a6
  db 12
  !a6
  !a6
  !rest
  !a6
  !rest
  db 24,$69
  !gs6
  !pitchSlide,0,12 : !a6
  db 12,$59
  !g6
  !rest
  db 60,$79
  !g6
  db 24,$59
  !a6
  db 12
  !a6
  db 12,$29
  !a6
  !rest
  !a6
  !rest
  !g6
  !rest
  !a6
  !rest
  !d7
  !rest
  !a6
  db 24,$69
  !g6
  db 24,$59
  !d7
  !a6
  !g6
  !f6
  !c7
  !g6
  !f6
  !e6
  db 24,$69
  !as5
  db 12,$59
  !c6
  !d6
  db 12,$29
  !e6
  !f6
  !rest
  db 108,$79
  !c7
  !instr,!instr25
  !volume,145
  !pan,12
  !endVibrato
  !subtranspose,32
  !vibrato,12,15,64
  !subloop,0
  db 96,$79
  !rest
  db 12,$3E
  !f5
  !d5
  !f5
  !g5
  !gs5
  !g5
  !f5
  !d5
  db 6,$7E
  !gs5
  !g5
  !f5
  !d5
  db 24,$5E
  !f5
  db 96,$7E
  !g5
  db 12
  !rest
  db 24,$5E
  !gs5
  db 12
  !a5
  !c6
  !rest
  db 12,$3E
  !a5
  !gs5
  !g5
  !f5
  !d5
  !e5
  db 24,$5E
  !f5
  !g5
  !a5
  !c6
  !cs6
  db 12
  !gs5
  !rest
  !gs5
  !g5
  !f5
  db 108,$7E
  !g5
  db 24,$5E
  !d4
  !e4
  !f4
  !f5
  db 48,$6E
  !e5
  !d5
  !e5
  !f5
  !g5
  !e5
  db 96,$7E
  !a5
  db 12,$3E
  !a5
  !gs5
  !g5
  !fs5
  !f5
  !e5
  !ds5
  !d5
  db 96,$7E
  !cs5
  !pitchSlide,48,72 : !ds5
  !ds5
  !subloop,1
  !endVibrato
  !loop : dw .sub3548 : db 16
  !instr,!instr1E
  !volume,130
  !pan,10
  !toggleEcho
  db 12,$5E
  !d4
  !d4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !c4
  !c4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !b3
  !b3
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !b3
  !b3
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  db 12,$5E
  !as3
  !as3
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !c4
  !c4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !instr,!instr26
  !volume,155
  !pan,11
  !toggleEcho
  !subloop,0
  db 24,$5E
  !rest
  db 24,$2E
  !f6
  !e6
  db 12
  !rest
  db 24
  !c6
  !e6
  db 24,$5E
  !d6
  db 12,$3E
  !g5
  !a5
  !c6
  !subloop,1
  !loop : dw .sub3548 : db 48
  !end

.pattern0_6
  !loop : dw .sub3548 : db 8
.pattern1_6:
  !loop : dw .sub3548 : db 8
  !instr,!instr25
  !volume,155
  !pan,9
  !subtranspose,32
  !loop : dw .sub37E0 : db 2
  !loop : dw .sub3548 : db 8
  !instr,!instr1E
  !volume,130
  !pan,10
  !toggleEcho
  !subtranspose,0
  !loop : dw .sub36E7 : db 1
  !instr,!instr25
  !volume,138
  !pan,8
  !toggleEcho
  !vibrato,12,15,64
  !subloop,0
  db 96,$5E
  !rest
  db 12,$3E
  !f6
  !d6
  !f6
  !g6
  !gs6
  !g6
  !f6
  !d6
  db 6,$7E
  !gs6
  !g6
  !f6
  !d6
  db 24,$5E
  !f6
  db 96,$7E
  !g6
  db 12
  !rest
  db 24,$5E
  !gs6
  db 12
  !a6
  !c7
  !rest
  db 12,$3E
  !a6
  !gs6
  !g6
  !f6
  !d6
  !e6
  db 24,$5E
  !f6
  !g6
  !a6
  !c7
  !cs7
  db 12
  !gs6
  !rest
  !gs6
  !g6
  !f6
  db 108,$7E
  !g6
  db 24,$5E
  !d5
  !e5
  !f5
  !f6
  db 48,$6E
  !e6
  !d6
  !e6
  !f6
  !g6
  !e6
  db 96,$7E
  !a6
  db 12,$3E
  !a6
  !gs6
  !g6
  !fs6
  !f6
  !e6
  !ds6
  !d6
  db 96,$7E
  !cs6
  !pitchSlide,48,72 : !ds6
  !ds6
  !subloop,1
  !endVibrato
  !loop : dw .sub3548 : db 22
  !instr,!instr2C
  !volume,100
  !pan,9
  db 12,$7E
  !rest
  db 12,$5E
  !g5
  !f6
  !d6
  !g6
  !rest
  !f6
  !rest
  !d6
  !c6
  !rest
  db 24
  !a5
  db 12
  !g5
  !a5
  !c6
  !endVibrato
  !loop : dw .sub3548 : db 4
  !instr,!instr25
  !volume,140
  !pan,9
  !subloop,0
  db 24,$5E
  !rest
  db 24,$2E
  !f6
  !e6
  db 12
  !rest
  db 24
  !c6
  !e6
  db 24,$5E
  !d6
  db 12,$3E
  !g5
  !a5
  !c6
  !subloop,1
  !loop : dw .sub3548 : db 48
  !end

.pattern0_7
  !loop : dw .sub3548 : db 8
.pattern1_7:
  !loop : dw .sub3548 : db 8
  !instr,!instr28
  !volume,140
  !pan,8
  !subloop,0
  db 96,$7E
  !c5
  !loop : dw .sub3548 : db 6
  db 36,$7E
  !c5
  !c5
  db 24
  !c5
  !subloop,3
  db 96,$7E
  !c5
  !instr,!instr2D
  !volume,90
  !pan,11
  !loop : dw .sub3833 : db 1
  db 96,$7E
  !rest
  !loop : dw .sub3833 : db 1
  !instr,!instr28
  !volume,140
  !pan,8
  db 96,$7E
  !c5
  !loop : dw .sub3548 : db 21
  !instr,!instr2C
  !volume,90
  !pan,11
  db 12,$7E
  !rest
  db 12,$5E
  !d5
  !c6
  !a5
  !d6
  !rest
  !c6
  !rest
  !a5
  !g5
  !rest
  db 24
  !f5
  db 12
  !d5
  !f5
  !g5
  !endVibrato
  !loop : dw .sub3548 : db 4
  !instr,!instr1E
  !volume,130
  !pan,10
  !toggleEcho
  db 12,$5E
  !d4
  !d4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !d4
  !d4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !instr,!instr28
  !volume,140
  !pan,8
  !toggleEcho
  db 96,$7E
  !c5
  !loop : dw .sub3548 : db 47
  !end

.sub3548
  db 96,$7F
  !rest
  !end

.sub354C
  !instr,!instr1F
  db 24,$7E
  !c5
  !instr,!instr20
  db 24,$7C
  !c5
  !instr,!instr1F
  db 12,$7E
  !c5
  !c5
  !instr,!instr20
  db 12,$7C
  !c5
  !instr,!instr1F
  db 12,$7E
  !c5
  !c5
  !c5
  !instr,!instr20
  db 12,$7C
  !c5
  !instr,!instr1F
  db 12,$7E
  !c5
  db 24
  !c5
  !instr,!instr20
  db 24,$7C
  !c5
  !end

.sub357A
  db 12,$76
  !c5
  !c5
  db 24,$7B
  !c5
  db 12,$76
  !c5
  !c5
  db 12,$7B
  !c5
  db 12,$76
  !c5
  !c5
  !c5
  db 12,$7B
  !c5
  db 12,$76
  !c5
  db 24
  !c5
  db 24,$7B
  !c5
  !end

.sub3599
  db 12,$76
  !c5
  !c5
  db 24,$7B
  !c5
  db 12,$76
  !c5
  !c5
  db 12,$7B
  !c5
  db 12,$76
  !c5
  !end

.sub35AB
  db 12,$7A
  !c5
  db 12,$77
  !c5
  db 24,$79
  !c5
  db 12,$77
  !c5
  db 12,$7A
  !c5
  db 24,$7B
  !c5
  !end

.sub35BE
  db 24,$7B
  !c5
  db 24,$77
  !c5
  !end

.sub35C5
  db 24,$7B
  !c5
  db 24,$77
  !c5
  !end

.sub35CC
  db 24,$5E
  !d6
  !d6
  db 12
  !d6
  db 24
  !d6
  !d6
  !d6
  db 12
  !d6
  !d6
  !d6
  db 24
  !d6
  !c6
  !c6
  db 12
  !c6
  db 24
  !c6
  !c6
  !c6
  db 12
  !c6
  !c6
  !c6
  db 24
  !c6
  !b5
  !b5
  db 12
  !b5
  db 24
  !b5
  !b5
  !b5
  db 12
  !b5
  !b5
  !b5
  db 24
  !b5
  !as5
  !as5
  db 12
  !as5
  db 24
  !as5
  !c6
  !c6
  db 12
  !c6
  !c6
  !c6
  db 24
  !c6
  !end

.sub3607
  db 24,$5E
  !as5
  !as5
  db 12
  !as5
  db 24
  !as5
  !as5
  !as5
  db 12
  !as5
  !as5
  !as5
  db 24
  !as5
  !c6
  !c6
  db 12
  !c6
  db 24
  !c6
  !c6
  !c6
  db 12
  !c6
  !c6
  !c6
  db 24
  !c6
  !d6
  !d6
  db 12
  !d6
  db 24
  !d6
  !d6
  !d6
  db 12
  !d6
  !d6
  !d6
  db 24
  !d6
  !d6
  !d6
  db 12
  !d6
  db 24
  !d6
  !d6
  !d6
  db 12
  !d6
  !d6
  !d6
  db 24
  !d6
  !end

.sub3642
  !instr,!instr24
  db 24,$7E
  !d3
  !d3
  !instr,!instr27
  db 12
  !d3
  !instr,!instr24
  db 24
  !d3
  !d3
  !d3
  !instr,!instr27
  db 12
  !d3
  !d3
  !instr,!instr24
  !d3
  db 24,$7D
  !d4
  db 24,$7E
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !instr,!instr24
  db 24
  !c3
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !c3
  !instr,!instr24
  !c3
  db 24
  !c3
  !b2
  !b2
  !instr,!instr27
  db 12
  !b2
  !instr,!instr24
  db 24
  !b2
  !b2
  !b2
  !instr,!instr27
  db 12
  !b2
  !b2
  !instr,!instr24
  !b2
  db 24
  !b2
  !as2
  !as2
  !instr,!instr27
  db 12
  !as2
  !instr,!instr24
  db 24
  !as2
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !c3
  !instr,!instr24
  !c3
  db 24
  !c3
  !end

.sub36A2
  db 24,$7E
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !instr,!instr24
  db 24
  !c3
  !c3
  !c3
  !instr,!instr27
  db 12
  !c3
  !c3
  !instr,!instr24
  !c3
  db 24
  !c3
  !d3
  !d3
  !instr,!instr27
  db 12
  !d3
  !instr,!instr24
  db 24
  !d3
  !d3
  !d3
  !instr,!instr27
  db 12
  !d3
  !d3
  !instr,!instr24
  !d3
  db 24
  !d3
  !d3
  !d3
  !instr,!instr27
  db 12
  !d3
  !instr,!instr24
  db 24
  !d3
  !d3
  !d3
  !instr,!instr27
  db 12
  !d3
  !d3
  !instr,!instr24
  !d3
  db 24
  !d3
  !end

.sub36E7
  db 12,$5E
  !d4
  !d4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !c4
  !c4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !b3
  !b3
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !as3
  !as3
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !end

.sub373A
  db 12,$5E
  !d6
  !d6
  !d7
  !rest
  !a6
  db 24
  !rest
  db 12
  !gs6
  !rest
  !g6
  !rest
  db 24,$6E
  !f6
  db 12,$5E
  !d6
  !f6
  !g6
  !c6
  !c6
  !d7
  !rest
  !a6
  db 24
  !rest
  db 12
  !gs6
  !rest
  !g6
  !rest
  db 24,$6E
  !f6
  db 12,$5E
  !d6
  !f6
  !g6
  !b5
  !b5
  !d7
  !rest
  !a6
  db 24
  !rest
  db 12
  !gs6
  !rest
  !g6
  !rest
  db 24,$6E
  !f6
  db 12,$5E
  !d6
  !f6
  !g6
  !as5
  !as5
  !d7
  !rest
  !a6
  db 24
  !rest
  db 12
  !gs6
  !rest
  !g6
  !rest
  db 24,$6E
  !f6
  db 12,$5E
  !d6
  !f6
  !g6
  !end

.sub378D
  db 12,$5E
  !d5
  !d5
  !d6
  !rest
  !a5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !g5
  !rest
  db 24,$6E
  !f5
  db 12,$5E
  !d5
  !f5
  !g5
  !c5
  !c5
  !d6
  !rest
  !a5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !g5
  !rest
  db 24,$6E
  !f5
  db 12,$5E
  !d5
  !f5
  !g5
  !b4
  !b4
  !d6
  !rest
  !a5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !g5
  !rest
  db 24,$6E
  !f5
  db 12,$5E
  !d5
  !f5
  !g5
  !as4
  !as4
  !d6
  !rest
  !a5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !g5
  !rest
  db 24,$6E
  !f5
  db 12,$5E
  !d5
  !f5
  !g5
  !end

.sub37E0
  db 12,$5E
  !d4
  !d4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !c4
  !c4
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !b3
  !b3
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !as3
  !as3
  !d5
  !rest
  !a4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !g4
  !rest
  db 24,$6E
  !f4
  db 12,$5E
  !d4
  !f4
  !g4
  !end

.sub3833
  db 12,$3E
  !d6
  !as5
  !d6
  !e6
  !f6
  !e6
  !d6
  !as5
  db 6,$7E
  !f6
  !e6
  !d6
  !as5
  db 24,$5E
  !d6
  db 96,$7E
  !e6
  db 12
  !rest
  db 24,$5E
  !gs5
  db 12
  !a5
  !c6
  !rest
  db 12,$3E
  !a5
  !gs5
  !g5
  !f5
  !d5
  !e5
  db 24,$5E
  !f5
  !g5
  !a5
  !c6
  !cs6
  db 12
  !gs5
  !rest
  !gs5
  !g5
  !f5
  db 96,$7E
  !d6
  !pitchSlide,0,24 : !ds6
  db 12
  !tie
  db 24,$5E
  !as4
  !c5
  !d5
  !d6
  db 48,$6E
  !c6
  !a5
  !g5
  !a5
  !c6
  !a5
  db 96,$7E
  !d6
  db 12,$3E
  !a5
  !gs5
  !g5
  !fs5
  !f5
  !e5
  !ds5
  !d5
  db 96,$7E
  !gs5
  !pitchSlide,48,72 : !as5
  !as5
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
