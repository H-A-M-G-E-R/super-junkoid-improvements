; Originally by Toby Fox, ported by Forgado (https://www.smwcentral.net/?p=section&a=details&id=42444)
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
!sample22 = $24
!sample23 = $25

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample16,$00,$00,$6F,$02,$A1
  db !sample19,$00,$00,$7F,$03,$53
  db !sample18,$00,$00,$6F,$04,$B3
  db !sample1D,$00,$00,$7F,$03,$B9
  db !sample17,$00,$00,$67,$03,$BA
  db !sample1C,$00,$00,$0F,$06,$2E
  db !sample1A,$00,$00,$3F,$03,$93
  db !sample22,$00,$00,$2F,$01,$DC
  db !sample21,$00,$00,$37,$03,$BA
  db !sample15,$00,$00,$77,$03,$B7
  db !sample1E,$00,$00,$17,$02,$0E
  db !sample14,$00,$00,$37,$07,$38
  db !sample23,$00,$00,$3F,$02,$96
  db !sample1F,$00,$00,$47,$03,$B3
  db !sample20,$00,$00,$3F,$07,$68
  db !sample1B,$00,$00,$3F,$03,$B7
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+441
  dw Sample15,Sample15+1530
  dw Sample16,Sample16+1035
  dw Sample17,Sample17+576
  dw Sample18,Sample18+0
  dw Sample19,Sample19+0
  dw Sample1A,Sample1A+639
  dw Sample1B,Sample1B+1584
  dw Sample1C,Sample1C+45
  dw Sample1D,Sample1D+0
  dw Sample1E,Sample1E+18
  dw Sample1F,Sample1F+720
  dw Sample20,Sample20+720
  dw Sample21,Sample21+2016
  dw Sample22,Sample22+2034
  dw Sample23,Sample23+1278
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "bbass.brr":2..0
  Sample15: incbin "brass.brr":2..0
  Sample16: incbin "cymbl.brr":2..0
  Sample17: incbin "gitar.brr":2..0
  Sample18: incbin "hihat.brr":2..0
  Sample19: incbin "kicks.brr":2..0
  Sample1A: incbin "lead1.brr":2..0
  Sample1B: incbin "lead2.brr":2..0
  Sample1C: incbin "organ.brr":2..0
  Sample1D: incbin "snare.brr":2..0
  Sample1E: incbin "sqare.brr":2..0
  Sample1F: incbin "strb1.brr":2..0
  Sample20: incbin "strb2.brr":2..0
  Sample21: incbin "strch.brr":2..0
  Sample22: incbin "strng.brr":2..0
  Sample23: incbin "tmpni.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2A54

Tracker2A54:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !endEcho
  !setDPMiscCommand,!noteEndInTicks,1
.pattern1_0:
  !musicVolume,145*4/3
  !tempo,48
  !instr,!instr1E
  db 96,$7F
  !fs4
  !pitchSlide,24,168 : !cs6
  !tie
  !pan,3
  !dynamicPan,48,12
  db 48
  !f5
  !pitchSlide,24,24 : !c5
  !loop : dw .sub2F80 : db 5
  !loop : dw .sub2F88 : db 1
  !loop : dw .sub2F80 : db 4
  !subloop,0
  !loop : dw .sub2F95 : db 1
  db 12,$7F
  !rest
  !subloop,1
  !loop : dw .sub2F95 : db 1
  !loop : dw .sub2F80 : db 7
  !loop : dw .sub2F88 : db 1
  !loop : dw .sub2F80 : db 4
  !subloop,0
  !loop : dw .sub2F95 : db 1
  db 12,$7F
  !rest
  !subloop,1
  !loop : dw .sub2F95 : db 1
  !loop : dw .sub2FA1 : db 14
  !loop : dw .sub2FB4 : db 1
  !subloop,0
  !loop : dw .sub2F80 : db 7
  !loop : dw .sub2F88 : db 1
  !loop : dw .sub2F80 : db 4
  !loop : dw .sub2F95 : db 1
  db 12,$7F
  !rest
  !loop : dw .sub2F95 : db 1
  db 12,$7F
  !rest
  !loop : dw .sub2F95 : db 1
  !subloop,1
  !loop : dw .sub2FA1 : db 14
  !loop : dw .sub2FB4 : db 1
  !pan,10
  !instr,!instr20
  !loop : dw .sub2FBC : db 16
  !loop : dw .sub2FC9 : db 2
  !loop : dw .sub2FBC : db 8
  !loop : dw .sub2FC9 : db 4
  !end

.pattern0_1
  db 96,$7F
  !rest
  !instr,!instr21
  db 24
  !c5
  !f5
  db 12
  !d5
  !d5
  db 6
  !d5
  !d5
  db 12
  !d5
  !subloop,0
  !loop : dw .sub2FEA : db 2
  !loop : dw .sub3035 : db 1
  !loop : dw .sub3050 : db 1
  !loop : dw .sub3035 : db 1
  !loop : dw .sub3050 : db 1
  !loop : dw .sub3035 : db 1
  !loop : dw .sub3050 : db 1
  !loop : dw .sub3035 : db 1
  db 48,$7F
  !rest
  !volume,190
  db 6
  !e5
  !volume,210
  !e5
  !volume,230
  !e5
  !volume,255
  !e5
  !subloop,1
  !subloop,0
  !loop : dw .sub3076 : db 2
  !instr,!instr1F
  db 24,$7F
  !c5
  !instr,!instr21
  db 12
  !e5
  !instr,!instr1F
  !c5
  !c5
  !c5
  !instr,!instr21
  db 24
  !e5
  !subloop,11
  !end

.pattern0_2
  db 96,$7F
  !rest
  !tie
  !instr,!instr22
  !subloop,0
  db 12,$7F
  !g4
  !loop : dw .sub307F : db 1
  db 36,$7F
  !d5
  !pitchSlide,18,18 : !gs4
  !loop : dw .sub307F : db 1
  db 24,$7F
  !d4
  !loop : dw .sub30A9 : db 1
  db 48,$7F
  !c4
  !c4
  !loop : dw .sub30A9 : db 1
  db 24,$7F
  !d4
  db 72
  !rest
  !subloop,1
  !loop : dw .sub30B2 : db 2
  !loop : dw .sub30D5 : db 1
  db 12,$7F
  !cs4
  !loop : dw .sub30E6 : db 1
  db 12,$7F
  !fs4
  !as4
  !loop : dw .sub30B2 : db 1
  !subloop,0
  !loop : dw .sub30D5 : db 1
  db 12,$7F
  !c4
  !loop : dw .sub30E6 : db 1
  db 12,$7F
  !f4
  !as4
  !subloop,1
  !end

.pattern0_3
  db 96,$7F
  !rest
  !tie
  !volume,255
  !endVibrato
  !subloop,0
  !pan,10
  !instr,!instr24
  db 24,$7F
  !g5
  db 12
  !f5
  !volume,170
  !g5
  !volume,255
  !loop : dw .sub30F8 : db 1
  !loop : dw .sub3108 : db 1
  !loop : dw .sub3117 : db 1
  !loop : dw .sub3122 : db 1
  !volume,255
  db 12,$7F
  !g5
  !f5
  !loop : dw .sub30F8 : db 1
  !loop : dw .sub3108 : db 1
  !loop : dw .sub3117 : db 1
  !loop : dw .sub3122 : db 1
  !instr,!instr27
  !loop : dw .sub312B : db 1
  db 12,$7F
  !d5
  !c5
  !volume,170
  !ds5
  !volume,255
  !c5
  db 24
  !as4
  !volume,170
  !as4
  !loop : dw .sub312B : db 1
  db 12,$7F
  !c5
  !fs5
  !volume,170
  !c5
  !volume,255
  !g5
  db 24
  !a5
  !subloop,1
  !loop : dw .sub3162 : db 2
  !pan,12
  db 24,$7F
  !rest
  !instr,!instr2D
  db 12
  !as4
  !rest
  !d5
  !volume,170
  !as4
  !volume,255
  !g5
  !volume,170
  !d5
  !volume,255
  db 48
  !gs5
  !pitchSlide,0,18 : !as5
  !g5
  db 24
  !fs5
  !g5
  !vibrato,36,10,160
  db 72
  !fs5
  !pitchSlide,0,18 : !a5
  !endVibrato
  db 24
  !f5
  !pitchSlide,0,9 : !g5
  !d5
  !as4
  !dynamicPan,255,10
  !dynamicVolume,255,119
  !vibrato,36,10,160
  db 96
  !cs5
  !tie
  !pitchSlide,48,192 : !c5
  db 96
  !tie
  !tie
  !endVibrato
  !volume,255
  !pan,13
  db 12
  !f4
  !g4
  !as4
  !c5
  !d5
  !as4
  !g5
  !f5
  db 48
  !gs5
  !pitchSlide,0,18 : !as5
  !f5
  db 24
  !e5
  !f5
  db 48
  !g5
  db 24
  !e5
  !c5
  !a4
  !as4
  !volume,220
  !vibrato,48,10,160
  db 96
  !ds5
  !pitchSlide,0,18 : !f5
  !tie
  !endVibrato
  !volume,190
  !vibrato,48,10,160
  db 96
  !e5
  !tie
  !end

.pattern0_4
  db 96,$7F
  !rest
  !tie
  !vibrato,0,18,144
  !subloop,0
  !pan,15
  !loop : dw .sub31AE : db 2
  !pan,5
  !loop : dw .sub31C4 : db 1
  db 96,$7F
  !c5
  !loop : dw .sub31C4 : db 1
  db 24,$7F
  !d5
  db 72
  !rest
  !subloop,1
  !endVibrato
  !pan,6
  !loop : dw .sub31CC : db 2
  !loop : dw .sub3216 : db 1
  !instr,!instr2B
  db 12,$7F
  !as3
  !rest
  !loop : dw .sub3216 : db 1
  !instr,!instr2B
  db 12,$7F
  !cs4
  !rest
  !loop : dw .sub3216 : db 1
  !instr,!instr2B
  db 12,$7F
  !as3
  !rest
  !loop : dw .sub3216 : db 1
  !instr,!instr2B
  db 12,$7F
  !a3
  !rest
  !loop : dw .sub321D : db 1
  !instr,!instr2B
  db 12,$7F
  !ds4
  !rest
  !loop : dw .sub321D : db 1
  !instr,!instr2B
  db 12,$7F
  !f4
  !rest
  !loop : dw .sub321D : db 1
  !instr,!instr2B
  db 12,$7F
  !ds4
  !rest
  !loop : dw .sub321D : db 1
  !instr,!instr2B
  db 12,$7F
  !ds4
  !rest
  !loop : dw .sub31CC : db 1
  !subloop,0
  !loop : dw .sub3216 : db 1
  !instr,!instr2B
  db 12,$7F
  !as3
  !rest
  !loop : dw .sub3216 : db 1
  !instr,!instr2B
  db 12,$7F
  !c4
  !rest
  !loop : dw .sub3216 : db 1
  !instr,!instr2B
  db 12,$7F
  !as3
  !rest
  !loop : dw .sub3216 : db 1
  !instr,!instr2B
  db 12,$7F
  !a3
  !rest
  !loop : dw .sub321D : db 1
  !instr,!instr2B
  db 12,$7F
  !e4
  !rest
  !loop : dw .sub321D : db 1
  !instr,!instr2B
  db 12,$7F
  !e4
  !rest
  !loop : dw .sub321D : db 1
  !instr,!instr2B
  db 12,$7F
  !e4
  !rest
  !loop : dw .sub321D : db 1
  !instr,!instr2B
  db 12,$7F
  !d4
  !rest
  !subloop,1
  !end

.pattern0_5
  db 96,$7F
  !rest
  !tie
  !subloop,0
  !vibrato,0,18,144
  !pan,15
  !loop : dw .sub3224 : db 2
  !endVibrato
  !pan,12
  db 24,$7F
  !rest
  !loop : dw .sub323A : db 1
  db 12,$7F
  !fs5
  !g5
  !d5
  !f5
  !ds5
  !volume,170
  !f5
  !volume,255
  !d5
  db 24
  !ds5
  !volume,170
  !ds5
  !loop : dw .sub323A : db 1
  db 12,$7F
  !f5
  !fs5
  !d5
  !fs5
  !a5
  !volume,170
  !fs5
  !volume,255
  !d6
  db 24
  !fs6
  !subloop,1
  !loop : dw .sub3266 : db 2
  !loop : dw .sub327B : db 1
  !vibrato,36,10,160
  db 72,$7F
  !ds5
  !endVibrato
  db 24
  !ds5
  !as4
  !g4
  !dynamicPan,255,10
  !dynamicVolume,255,119
  !vibrato,36,10,160
  db 96
  !a4
  !tie
  !pitchSlide,48,192 : !gs4
  db 96
  !tie
  !tie
  !endVibrato
  !volume,255
  !loop : dw .sub327B : db 1
  db 48,$7F
  !e5
  db 24
  !c5
  !g4
  !f4
  !g4
  !volume,220
  !vibrato,48,10,160
  db 96
  !g4
  !pitchSlide,0,18 : !as4
  !tie
  !endVibrato
  !volume,190
  !vibrato,48,10,160
  db 96
  !g4
  !tie
  !end

.pattern0_6
  db 96,$7F
  !rest
  !tie
  !vibrato,0,18,144
  !subloop,0
  !volume,255
  !pan,15
  !loop : dw .sub329C : db 2
  !volume,220
  !pan,5
  !loop : dw .sub32B2 : db 1
  db 96,$7F
  !g5
  !loop : dw .sub32B2 : db 1
  db 24,$7F
  !a5
  db 72
  !rest
  !subloop,1
  !subloop,0
  db 96,$7F
  !rest
  !subloop,7
  !endVibrato
  !pan,16
  !loop : dw .sub32BA : db 1
  !instr,!instr2B
  db 12,$7F
  !cs4
  !loop : dw .sub32DB : db 1
  !instr,!instr2B
  db 12,$7F
  !fs4
  !rest
  !loop : dw .sub3162 : db 1
  !subloop,0
  !loop : dw .sub32BA : db 1
  !instr,!instr2B
  db 12,$7F
  !cs4
  !loop : dw .sub32DB : db 1
  !instr,!instr2B
  db 12,$7F
  !fs4
  !rest
  !subloop,1
  !end

.pattern0_7
  db 96,$7F
  !rest
  !tie
  !endVibrato
  !subloop,0
  !pan,10
  !volume,210
  !instr,!instr24
  db 24,$7F
  !as4
  db 12
  !a4
  !volume,150
  !as4
  !volume,210
  !as4
  !rest
  !volume,160
  !loop : dw .sub30F8 : db 1
  !loop : dw .sub32FE : db 1
  !loop : dw .sub3117 : db 1
  !volume,210
  db 24,$7F
  !rest
  db 12
  !as4
  !a4
  !as4
  !volume,150
  !a4
  !volume,160
  !loop : dw .sub30F8 : db 1
  !loop : dw .sub32FE : db 1
  !loop : dw .sub3117 : db 1
  !volume,200
  !pan,15
  !instr,!instr28
  !loop : dw .sub330D : db 1
  db 12,$7F
  !g6
  !rest
  !c7
  !rest
  !as6
  !rest
  !g6
  !rest
  !loop : dw .sub330D : db 1
  db 24,$7F
  !d7
  db 72
  !rest
  !subloop,1
  !subloop,0
  db 96,$7F
  !rest
  !subloop,11
  !volume,255
  !loop : dw .sub3266 : db 1
  db 96,$7F
  !rest
  db 72
  !tie
  !pan,12
  !instr,!instr2D
  db 12
  !g5
  !a5
  !as5
  !rest
  !a5
  db 36
  !rest
  db 12
  !as5
  !rest
  !a5
  !f4
  !f5
  !rest
  !g5
  !rest
  !f5
  !rest
  !volume,220
  !vibrato,48,10,160
  db 96
  !c5
  !pitchSlide,0,18 : !d5
  !tie
  !endVibrato
  !volume,190
  !vibrato,48,10,160
  db 96
  !c5
  !tie
  !end

.sub2F80
  !pan,10
  !instr,!instr20
  db 24,$7F
  !c5
  !end

.sub2F88
  !volume,190
  db 6,$7F
  !c5
  !volume,220
  !c5
  !volume,255
  db 12
  !c5
  !end

.sub2F95
  !pan,13
  !instr,!instr1E
  db 24,$7F
  !as5
  !pitchSlide,12,18 : !as4
  !end

.sub2FA1
  !volume,255
  db 6,$7F
  !as5
  !rest
  !volume,210
  !as5
  !rest
  !volume,190
  !as5
  !rest
  !volume,210
  !as5
  !rest
  !end

.sub2FB4
  !volume,255
  db 6,$7F
  !as5
  db 90
  !rest
  !end

.sub2FBC
  !volume,255
  db 12,$7F
  !c5
  !volume,190
  !c5
  !volume,210
  !c5
  !c5
  !end

.sub2FC9
  !subloop,0
  !volume,255
  db 24,$7F
  !c5
  !volume,210
  !c5
  !subloop,1
  !volume,255
  db 24,$7F
  !c5
  !volume,210
  db 12
  !c5
  !c5
  !volume,255
  !c5
  !volume,190
  !c5
  !volume,210
  !c5
  !c5
  !end

.sub2FEA
  !instr,!instr1F
  db 24,$7F
  !c5
  !instr,!instr21
  !e5
  !instr,!instr1F
  !c5
  !instr,!instr21
  !e5
  !instr,!instr1F
  !c5
  !instr,!instr21
  db 12
  !e5
  !instr,!instr1F
  db 24
  !c5
  db 12
  !c5
  !instr,!instr21
  !e5
  !instr,!instr1F
  !c5
  !instr,!instr1F
  db 24
  !c5
  !instr,!instr21
  !e5
  !instr,!instr1F
  !c5
  !instr,!instr21
  db 12
  !e5
  !instr,!instr1F
  !c5
  !instr,!instr21
  db 6
  !e5
  !e5
  db 12
  !e5
  !instr,!instr1F
  !c5
  !instr,!instr21
  db 6
  !e5
  !e5
  db 12
  !e5
  !instr,!instr1F
  !c5
  !instr,!instr21
  db 24
  !e5
  !end

.sub3035
  !volume,255
  db 24,$7F
  !e5
  !volume,190
  db 6
  !e5
  !volume,210
  !e5
  !volume,230
  db 12
  !e5
  !volume,255
  db 24
  !e5
  !volume,230
  !e5
  !volume,255
  !e5
  !end

.sub3050
  !volume,230
  db 6,$7F
  !e5
  !volume,190
  !e5
  !volume,210
  !e5
  !volume,230
  !e5
  !volume,255
  !e5
  !volume,210
  !e5
  !volume,190
  db 12
  !e5
  !volume,230
  db 6
  !e5
  !volume,190
  !e5
  !volume,210
  !e5
  !volume,230
  !e5
  !end

.sub3076
  !instr,!instr1F
  db 24,$7F
  !c5
  !instr,!instr21
  !e5
  !end

.sub307F
  db 12,$7F
  !g4
  !g4
  !f4
  !g4
  !g4
  !f4
  !fs4
  !g4
  !g4
  !f4
  !g4
  !g4
  !f4
  !g4
  !as4
  !c5
  !c5
  !c5
  !as4
  !c5
  !c5
  !as4
  !b4
  db 24
  !c5
  !pitchSlide,12,18 : !fs4
  db 12
  !rest
  db 24
  !cs5
  !pitchSlide,12,18 : !g4
  db 12
  !rest
  !end

.sub30A9
  db 48,$7F
  !ds4
  !ds4
  !d4
  !d4
  !cs4
  !cs4
  !end

.sub30B2
  db 12,$7F
  !g4
  !g4
  !d5
  !f4
  !d4
  !d4
  !e5
  !f4
  !g4
  !g4
  !d5
  !f4
  !d4
  !d4
  !cs5
  !f4
  !c5
  !c5
  !g5
  !as4
  !g4
  !g4
  !a5
  !as4
  !c5
  !c5
  !g5
  !as4
  !g4
  !g4
  !fs5
  !as4
  !end

.sub30D5
  db 12,$7F
  !g4
  !g4
  !d4
  !f4
  !d4
  !d4
  !e4
  !f4
  !g4
  !g4
  !d4
  !f4
  !d4
  !d4
  !end

.sub30E6
  db 12,$7F
  !f4
  !c5
  !c5
  !g4
  !as4
  !g4
  !g4
  !a4
  !as4
  !c5
  !c5
  !g4
  !as4
  !g4
  !g4
  !end

.sub30F8
  db 12,$7F
  !g5
  !rest
  !f4
  !fs4
  !g4
  !g5
  !f5
  db 24
  !d5
  db 12
  !c5
  !as4
  !g4
  !end

.sub3108
  db 24,$7F
  !rest
  !volume,255
  db 12
  !c5
  !as4
  !c5
  !volume,160
  !as4
  !volume,255
  !end

.sub3117
  db 12,$7F
  !d4
  !ds4
  !e4
  !c5
  !e4
  !f4
  !cs5
  !f4
  !end

.sub3122
  db 12,$7F
  !fs4
  !d5
  !volume,160
  !fs4
  !d5
  !end

.sub312B
  !pan,9
  !volume,255
  db 12,$7F
  !d5
  !pitchSlide,0,9 : !ds5
  !d5
  !ds5
  !volume,170
  !d5
  !volume,255
  !ds5
  !f5
  !fs5
  !d5
  !a4
  !fs4
  !volume,170
  !a4
  !volume,255
  !g4
  db 24
  !a4
  !volume,170
  !a4
  !volume,255
  db 12
  !c5
  !as4
  !c5
  !volume,170
  !as4
  !volume,255
  !c5
  !as4
  !as4
  !pitchSlide,0,9 : !c5
  !as4
  !end

.sub3162
  !pan,16
  !instr,!instr25
  db 24,$7F
  !g4
  !instr,!instr2C
  db 12
  !d4
  !rest
  !instr,!instr25
  db 24
  !d4
  !instr,!instr2C
  db 12
  !e4
  !rest
  !instr,!instr25
  db 24
  !g4
  !instr,!instr2C
  db 12
  !d4
  !rest
  !instr,!instr25
  db 24
  !d4
  !instr,!instr2C
  db 12
  !cs4
  !rest
  !instr,!instr25
  db 24
  !c5
  !instr,!instr2C
  db 12
  !g4
  !rest
  !instr,!instr25
  db 24
  !g4
  !instr,!instr2C
  db 12
  !a4
  !rest
  !instr,!instr25
  db 24
  !c5
  !instr,!instr2C
  db 12
  !g4
  !rest
  !instr,!instr25
  db 24
  !g4
  !instr,!instr2C
  db 12
  !fs4
  !rest
  !end

.sub31AE
  !instr,!instr23
  db 96,$7F
  !d5
  !tie
  !e5
  db 24
  !e5
  db 12
  !rest
  db 24
  !f5
  db 12
  !rest
  db 24
  !fs5
  !pitchSlide,12,18 : !gs4
  !end

.sub31C4
  !instr,!instr26
  db 96,$7F
  !ds5
  !d5
  !cs5
  !end

.sub31CC
  !instr,!instr29
  db 24,$7F
  !g3
  !instr,!instr2C
  db 12
  !as3
  !rest
  !instr,!instr29
  db 24
  !d3
  !instr,!instr2C
  db 12
  !c4
  !rest
  !instr,!instr29
  db 24
  !g3
  !instr,!instr2C
  db 12
  !as3
  !rest
  !instr,!instr29
  db 24
  !d3
  !instr,!instr2C
  db 12
  !a3
  !rest
  !instr,!instr29
  db 24
  !c4
  !instr,!instr2C
  db 12
  !ds4
  !rest
  !instr,!instr29
  db 24
  !g3
  !instr,!instr2C
  db 12
  !f4
  !rest
  !instr,!instr29
  db 24
  !c4
  !instr,!instr2C
  db 12
  !ds4
  !rest
  !instr,!instr29
  db 24
  !g3
  !instr,!instr2C
  db 12
  !d4
  !rest
  !end

.sub3216
  !instr,!instr29
  db 12,$7F
  !g3
  !g3
  !end

.sub321D
  !instr,!instr29
  db 12,$7F
  !c4
  !c4
  !end

.sub3224
  !instr,!instr23
  db 96,$7F
  !g4
  !tie
  !as4
  db 24
  !as4
  db 12
  !rest
  db 24
  !b4
  db 12
  !rest
  db 24
  !c5
  !pitchSlide,12,18 : !e4
  !end

.sub323A
  !volume,255
  !instr,!instr28
  db 12,$7F
  !g5
  !fs5
  !g5
  !volume,170
  !fs5
  !volume,255
  !g5
  !a5
  !as5
  !fs5
  !d5
  !a4
  !volume,170
  !d4
  !volume,255
  !as4
  db 24
  !c5
  !volume,170
  !c5
  !volume,255
  db 12
  !gs5
  !g5
  !gs5
  !volume,170
  !g5
  !volume,255
  !gs5
  !end

.sub3266
  !instr,!instr2A
  !pan,10
  !subloop,0
  db 48,$7F
  !g4
  !d4
  !subloop,1
  !subloop,0
  db 48,$7F
  !c5
  !g4
  !subloop,1
  !end

.sub327B
  db 24,$7F
  !rest
  !pan,12
  !instr,!instr2D
  db 12
  !g4
  !rest
  !as4
  !volume,170
  !g4
  !volume,255
  !d5
  !volume,170
  !as4
  !volume,255
  db 48
  !f5
  !pitchSlide,0,18 : !g5
  !d5
  db 24
  !c5
  !d5
  !end

.sub329C
  !instr,!instr23
  db 96,$7F
  !as4
  !tie
  !c5
  db 24
  !c5
  db 12
  !rest
  db 24
  !cs5
  db 12
  !rest
  db 24
  !d5
  !pitchSlide,12,18 : !d4
  !end

.sub32B2
  !instr,!instr25
  db 96,$7F
  !c6
  !a5
  !gs5
  !end

.sub32BA
  !instr,!instr25
  db 24,$7F
  !g4
  !instr,!instr2B
  db 12
  !d4
  !rest
  !instr,!instr25
  db 24
  !d4
  !instr,!instr2B
  db 12
  !e4
  !rest
  !instr,!instr25
  db 24
  !g4
  !instr,!instr2B
  db 12
  !d4
  !rest
  !instr,!instr25
  db 24
  !d4
  !end

.sub32DB
  db 12,$7F
  !rest
  !instr,!instr25
  db 24
  !c5
  !instr,!instr2B
  db 12
  !g4
  !rest
  !instr,!instr25
  db 24
  !g4
  !instr,!instr2B
  db 12
  !a4
  !rest
  !instr,!instr25
  db 24
  !c5
  !instr,!instr2B
  db 12
  !g4
  !rest
  !instr,!instr25
  db 24
  !g4
  !end

.sub32FE
  !volume,210
  db 12,$7F
  !g4
  !fs4
  !g4
  !volume,150
  !fs4
  !g4
  !rest
  !volume,160
  !end

.sub330D
  db 12,$7F
  !as6
  !rest
  !ds7
  !rest
  !g7
  !rest
  !ds7
  !rest
  !a6
  !rest
  !d7
  !rest
  !fs7
  !rest
  !d7
  !rest
  !gs6
  !rest
  !cs7
  !rest
  !f7
  !rest
  !cs7
  !rest
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
