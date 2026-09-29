; Originally by ZUN, arranged by JX444444 (https://www.smwcentral.net/?p=section&a=details&id=26383)
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

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample15,$FF,$E0,$B8,$12,$30
  db !sample1A,$FF,$E0,$B8,$02,$00
  db !sample17,$FF,$F3,$B8,$06,$F4
  db !sample1C,$FF,$ED,$B8,$04,$79
  db !sample18,$FF,$E0,$B8,$0F,$58
  db !sample19,$FF,$E0,$B8,$0C,$02
  db !sample16,$FF,$F6,$B8,$06,$DE
  db !sample1B,$FF,$E0,$B8,$06,$9F
  db !sample14,$FF,$E0,$B8,$06,$02
  db !sample1D,$FF,$E0,$B4,$06,$02
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+594
  dw Sample15,Sample15+738
  dw Sample16,Sample16+27
  dw Sample17,Sample17+1179
  dw Sample18,Sample18+2250
  dw Sample19,Sample19+3384
  dw Sample1A,Sample1A+45
  dw Sample1B,Sample1B+1692
  dw Sample1C,Sample1C+702
  dw Sample1D,Sample1D+513
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "1a.brr":2..0
  Sample15: incbin "1f.brr":2..0
  Sample16: incbin "12.brr":2..0
  Sample17: incbin "14.brr":2..0
  Sample18: incbin "15.brr":2..0
  Sample19: incbin "16.brr":2..0
  Sample1A: incbin "232.brr":2..0
  Sample1B: incbin "22.brr":2..0
  Sample1C: incbin "bass.brr":2..0
  Sample1D: incbin "19.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2B34

Tracker2B34:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !musicVolume,192;145
  !tempo,68
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%10100111,-54,54
  !echoParameters,3,68,3
  !toggleKeyOffGain
  !pan,9
  db 24,$7F
  !rest
  !vibrato,16,12,48
  !instr,!instr1E
  !volume,156
  !transpose,0
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,4
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,1
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,0
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !a3
  !transpose,0
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,4
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,1
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,0
  db 12
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  db 24
  !g3
  !rest
  db 12
  !g3
  !g3
  !g3
  !g3
  db 24
  !gs3
  !rest
  db 12
  !gs3
  !gs3
  !gs3
  !gs3
  db 24
  !g3
  !rest
  db 12
  !g3
  !g3
  !g3
  !g3
  db 24
  !f3
  !rest
  db 12
  !f3
  !f3
  !f3
  !f3
  db 24
  !g3
  !rest
  db 12
  !g3
  !g3
  !g3
  !g3
  !g3
  !g3
  !subloop,0
  db 16,$7F
  !gs3
  !subloop,5
  !loop : dw .sub311D : db 3
  !loop : dw .sub3121 : db 3
  !volume,136
  !subloop,0
  db 48,$7F
  !f4
  !loop : dw .sub3125 : db 1
  db 48,$7F
  !gs4
  !f4
  db 24
  !gs4
  db 72
  !as4
  db 48
  !gs4
  !f4
  db 24
  !gs4
  db 72
  !f4
  db 48
  !ds4
  !f4
  db 24
  !gs4
  db 96
  !f4
  db 72
  !tie
  db 24
  !rest
  db 72
  !f4
  !loop : dw .sub3125 : db 1
  db 48,$7F
  !gs4
  !f4
  db 24
  !gs4
  db 72
  !as4
  db 48
  !gs4
  !f4
  db 24
  !gs4
  db 96
  !as4
  !tie
  !tie
  db 72
  !tie
  db 48
  !rest
  !subloop,1
  !volume,162
  db 96,$7F
  !b3
  db 48
  !tie
  db 24
  !rest
  db 48
  !b3
  db 24
  !rest
  !cs4
  !rest
  !d4
  !rest
  db 12
  !e4
  !rest
  db 96
  !fs4
  db 72
  !tie
  db 24
  !rest
  db 48
  !fs4
  db 24
  !rest
  !e4
  !rest
  !d4
  !rest
  db 12
  !e4
  !rest
  db 48
  !d4
  !loop : dw .sub3142 : db 2
  db 24,$7F
  !rest
  !e4
  !rest
  !fs4
  !rest
  db 12
  !e4
  !rest
  db 96
  !fs4
  db 72
  !tie
  db 48
  !rest
  db 96
  !fs3
  db 48
  !tie
  db 24
  !rest
  db 48
  !b3
  db 24
  !rest
  !cs4
  !rest
  !d4
  !rest
  db 12
  !cs4
  !rest
  db 48
  !d4
  db 24
  !rest
  !cs4
  !rest
  !b3
  !rest
  db 12
  !a3
  !rest
  db 96
  !b3
  db 24
  !rest
  db 12
  !b3
  !rest
  !b3
  !rest
  !b3
  db 84
  !rest
  db 24
  !cs4
  !rest
  !b3
  !rest
  db 12
  !cs4
  !rest
  db 48
  !d4
  db 24
  !rest
  !cs4
  !rest
  !b3
  !rest
  db 12
  !cs4
  !rest
  db 96
  !ds4
  !tie
  !tie
  db 84
  !tie
  db 36
  !rest
  !vibrato,48,12,64
  !instr,!instr26
  !volume,151
  db 48
  !d5
  !loop : dw .sub314F : db 1
  db 72,$7F
  !b4
  db 48
  !a4
  !fs4
  db 12
  !a4
  !rest
  db 96
  !b4
  db 72
  !tie
  db 48
  !rest
  !b4
  !loop : dw .sub314F : db 1
  db 96,$7F
  !ds5
  !tie
  !tie
  db 72
  !tie
  db 48
  !rest
  !end

.pattern0_1
  !toggleKeyOffGain
  !pan,8
  db 24,$7F
  !rest
  !vibrato,16,12,48
  !instr,!instr1E
  !volume,156
  !transpose,0
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,4
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,1
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,0
  !loop : dw .sub317A : db 1
  db 16,$7F
  !e3
  !transpose,0
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,4
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,1
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,0
  db 12
  !c3
  !c3
  !c3
  !c3
  !c3
  !c3
  db 24
  !d3
  !rest
  db 12
  !d3
  !d3
  !d3
  !d3
  db 24
  !ds3
  !rest
  db 12
  !ds3
  !ds3
  !ds3
  !ds3
  db 24
  !d3
  !rest
  db 12
  !d3
  !d3
  !d3
  !d3
  db 24
  !c3
  !rest
  db 12
  !c3
  !c3
  !c3
  !c3
  db 24
  !d3
  !rest
  db 12
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !subloop,0
  db 16,$7F
  !ds3
  !subloop,5
  !loop : dw .sub31B9 : db 3
  !loop : dw .sub31BD : db 3
  !volume,136
  !subloop,0
  db 48,$7F
  !c4
  !gs4
  !g4
  !loop : dw .sub31C1 : db 1
  !loop : dw .sub31DB : db 1
  db 72,$7F
  !f4
  !loop : dw .sub31DB : db 1
  db 72,$7F
  !c4
  db 48
  !as3
  !c4
  db 24
  !ds4
  db 96
  !c4
  db 72
  !tie
  db 24
  !rest
  db 72
  !c4
  db 48
  !gs4
  !g4
  !loop : dw .sub31C1 : db 1
  !loop : dw .sub31DB : db 1
  db 72,$7F
  !f4
  !loop : dw .sub31DB : db 1
  db 96,$7F
  !f4
  !tie
  !tie
  db 72
  !tie
  db 48
  !rest
  !subloop,1
  db 96,$7F
  !g3
  db 48
  !tie
  db 24
  !rest
  db 48
  !g3
  db 24
  !rest
  !a3
  !rest
  !b3
  !rest
  db 12
  !cs4
  !rest
  db 96
  !d4
  db 72
  !tie
  db 24
  !rest
  db 48
  !d4
  db 24
  !rest
  !cs4
  !rest
  !b3
  !rest
  db 12
  !cs4
  !rest
  db 48
  !b3
  !loop : dw .sub31E2 : db 1
  db 48,$7F
  !b3
  !loop : dw .sub31E2 : db 1
  db 48,$7F
  !b3
  db 24
  !rest
  !cs4
  !rest
  !d4
  !rest
  db 12
  !cs4
  !rest
  db 96
  !d4
  db 72
  !tie
  db 48
  !rest
  db 96
  !d3
  db 48
  !tie
  db 24
  !rest
  db 48
  !fs3
  db 24
  !rest
  !a3
  !rest
  !b3
  !rest
  db 12
  !a3
  !rest
  db 48
  !b3
  db 24
  !rest
  !a3
  !rest
  !fs3
  !rest
  db 12
  !e3
  !rest
  db 96
  !fs3
  db 24
  !rest
  db 12
  !fs3
  !rest
  !fs3
  !rest
  !fs3
  db 60
  !rest
  !loop : dw .sub31E2 : db 1
  db 48,$7F
  !b3
  !loop : dw .sub31E2 : db 1
  db 96,$7F
  !b3
  !tie
  !tie
  db 72
  !tie
  db 48
  !rest
  !vibrato,48,12,64
  !instr,!instr26
  !volume,151
  !b4
  !loop : dw .sub31ED : db 1
  db 72,$7F
  !d5
  db 48
  !e5
  !fs5
  db 12
  !e5
  !rest
  db 96
  !fs5
  db 72
  !tie
  db 48
  !rest
  !fs4
  !loop : dw .sub31ED : db 1
  db 96,$7F
  !b4
  !tie
  !tie
  db 72
  !tie
  db 48
  !rest
  !end

.pattern0_2
  !toggleKeyOffGain
  !instr,!instr1F
  !pan,5
  db 24,$7F
  !rest
  !volume,134
  !transpose,0
  !loop : dw .sub3218 : db 1
  !transpose,4
  !loop : dw .sub3218 : db 1
  !transpose,1
  !loop : dw .sub3218 : db 1
  !transpose,0
  !subloop,0
  db 9,$7C
  !f6
  db 3
  !rest
  db 9
  !g6
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  db 9
  !as6
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  db 9
  !g6
  db 3
  !rest
  !subloop,7
  db 16,$7F
  !as5
  !b5
  !as5
  !a5
  !as5
  !a5
  !gs5
  !a5
  !gs5
  !g5
  !gs5
  !a5
  !transpose,0
  !loop : dw .sub3218 : db 1
  !transpose,4
  !loop : dw .sub3218 : db 1
  !transpose,1
  !loop : dw .sub3218 : db 1
  !transpose,0
  !subloop,0
  db 9,$7F
  !f6
  db 3
  !rest
  db 9
  !g6
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  db 9
  !as6
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  db 9
  !g6
  db 3
  !rest
  !subloop,7
  !subloop,0
  db 16,$7F
  !gs5
  !subloop,5
  !loop : dw .sub3244 : db 3
  !loop : dw .sub3248 : db 3
  !loop : dw .sub324C : db 8
  !transpose,1
  !loop : dw .sub324C : db 8
  !end

.pattern0_3
  db 24,$7F
  !rest
  !loop : dw .sub326D : db 8
  !loop : dw .sub329B : db 16
  !end

.pattern0_4
  !instr,!instr21
  !volume,200
  !pan,12
  db 24,$7F
  !rest
  !transpose,0
  !loop : dw .sub32C6 : db 1
  !transpose,4
  !loop : dw .sub32C6 : db 1
  !transpose,1
  !loop : dw .sub32C6 : db 1
  !transpose,0
  !loop : dw .sub32C6 : db 1
  !transpose,0
  !loop : dw .sub32C6 : db 1
  !transpose,4
  !loop : dw .sub32C6 : db 1
  !transpose,1
  !loop : dw .sub32C6 : db 1
  !transpose,0
  !loop : dw .sub32EB : db 3
  !subloop,0
  db 16,$7F
  !f4
  !f4
  !f4
  !subloop,3
  !subloop,0
  !transpose,0
  !loop : dw .sub32FE : db 1
  !transpose,2
  !loop : dw .sub32FE : db 1
  !transpose,4
  !loop : dw .sub32FE : db 2
  !subloop,7
  !subloop,0
  !transpose,1
  !loop : dw .sub32FE : db 1
  !transpose,3
  !loop : dw .sub32FE : db 1
  !transpose,5
  !loop : dw .sub32FE : db 2
  !subloop,7
  !end

.pattern0_5
  db 24,$7F
  !rest
  !loop : dw .sub3311 : db 8
  !subloop,0
  !loop : dw .sub3341 : db 1
  !loop : dw .sub3366 : db 1
  !loop : dw .sub3341 : db 1
  !loop : dw .sub3366 : db 1
  !loop : dw .sub3341 : db 1
  !loop : dw .sub3366 : db 1
  !loop : dw .sub3341 : db 1
  !instr,!instr23
  !volume,208
  !loop : dw .sub338B : db 4
  db 60,$7F
  !c4
  !loop : dw .sub338B : db 2
  db 60,$7F
  !c4
  !subloop,7
  !end

.pattern0_6
  !instr,!instr22
  !volume,224
  db 24,$7F
  !rest
  !loop : dw .sub3392 : db 8
  !loop : dw .sub33BB : db 8
  !end

.pattern0_7
  !pan,15
  !toggleKeyOffGain
  !instr,!instr27
  !volume,134
  db 24,$7F
  !rest
  !transpose,0
  !loop : dw .sub33DD : db 1
  !transpose,4
  !volume,121
  !loop : dw .sub33DD : db 1
  !transpose,1
  !volume,134
  !loop : dw .sub33DD : db 1
  !transpose,0
  !loop : dw .sub33DD : db 2
  !transpose,4
  !volume,121
  !loop : dw .sub33DD : db 1
  !transpose,1
  !volume,134
  !loop : dw .sub33DD : db 1
  !transpose,0
  db 96,$7F
  !b5
  db 72
  !tie
  db 24
  !rest
  db 96
  !c6
  db 72
  !tie
  db 24
  !rest
  db 96
  !b5
  db 72
  !tie
  db 24
  !rest
  !subloop,0
  db 16,$7F
  !gs5
  !subloop,5
  !loop : dw .sub33FE : db 3
  !loop : dw .sub3402 : db 3
  !loop : dw .sub3406 : db 8
  !transpose,1
  !loop : dw .sub3406 : db 8
  !end

.pattern1_0
  !vibrato,16,12,48
  !instr,!instr1E
  !volume,156
  !transpose,0
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,4
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,1
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,0
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !a3
  !transpose,0
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,4
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,1
  !loop : dw .sub30DE : db 1
  db 16,$7F
  !ds3
  !transpose,0
  db 12
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  db 24
  !g3
  !rest
  db 12
  !g3
  !g3
  !g3
  !g3
  db 24
  !gs3
  !rest
  db 12
  !gs3
  !gs3
  !gs3
  !gs3
  db 24
  !g3
  !rest
  db 12
  !g3
  !g3
  !g3
  !g3
  db 24
  !f3
  !rest
  db 12
  !f3
  !f3
  !f3
  !f3
  db 24
  !g3
  !rest
  db 12
  !g3
  !g3
  !g3
  !g3
  !g3
  !g3
  !subloop,0
  db 16,$7F
  !gs3
  !subloop,5
  !loop : dw .sub311D : db 3
  !loop : dw .sub3121 : db 3
  !volume,136
  !subloop,0
  db 48,$7F
  !f4
  !loop : dw .sub3125 : db 1
  db 48,$7F
  !gs4
  !f4
  db 24
  !gs4
  db 72
  !as4
  db 48
  !gs4
  !f4
  db 24
  !gs4
  db 72
  !f4
  db 48
  !ds4
  !f4
  db 24
  !gs4
  db 96
  !f4
  db 72
  !tie
  db 24
  !rest
  db 72
  !f4
  !loop : dw .sub3125 : db 1
  db 48,$7F
  !gs4
  !f4
  db 24
  !gs4
  db 72
  !as4
  db 48
  !gs4
  !f4
  db 24
  !gs4
  db 96
  !as4
  !tie
  !tie
  db 72
  !tie
  db 48
  !rest
  !subloop,1
  !volume,162
  db 96,$7F
  !b3
  db 48
  !tie
  db 24
  !rest
  db 48
  !b3
  db 24
  !rest
  !cs4
  !rest
  !d4
  !rest
  db 12
  !e4
  !rest
  db 96
  !fs4
  db 72
  !tie
  db 24
  !rest
  db 48
  !fs4
  db 24
  !rest
  !e4
  !rest
  !d4
  !rest
  db 12
  !e4
  !rest
  db 48
  !d4
  !loop : dw .sub3142 : db 2
  db 24,$7F
  !rest
  !e4
  !rest
  !fs4
  !rest
  db 12
  !e4
  !rest
  db 96
  !fs4
  db 72
  !tie
  db 48
  !rest
  db 96
  !fs3
  db 48
  !tie
  db 24
  !rest
  db 48
  !b3
  db 24
  !rest
  !cs4
  !rest
  !d4
  !rest
  db 12
  !cs4
  !rest
  db 48
  !d4
  db 24
  !rest
  !cs4
  !rest
  !b3
  !rest
  db 12
  !a3
  !rest
  db 96
  !b3
  db 24
  !rest
  db 12
  !b3
  !rest
  !b3
  !rest
  !b3
  db 84
  !rest
  db 24
  !cs4
  !rest
  !b3
  !rest
  db 12
  !cs4
  !rest
  db 48
  !d4
  db 24
  !rest
  !cs4
  !rest
  !b3
  !rest
  db 12
  !cs4
  !rest
  db 96
  !ds4
  !tie
  !tie
  db 84
  !tie
  db 36
  !rest
  !vibrato,48,12,64
  !instr,!instr26
  !volume,151
  db 48
  !d5
  !loop : dw .sub314F : db 1
  db 72,$7F
  !b4
  db 48
  !a4
  !fs4
  db 12
  !a4
  !rest
  db 96
  !b4
  db 72
  !tie
  db 48
  !rest
  !b4
  !loop : dw .sub314F : db 1
  db 96,$7F
  !ds5
  !tie
  !tie
  db 72
  !tie
  db 48
  !rest
  !end

.pattern1_1
  !vibrato,16,12,48
  !instr,!instr1E
  !volume,156
  !transpose,0
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,4
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,1
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,0
  !loop : dw .sub317A : db 1
  db 16,$7F
  !e3
  !transpose,0
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,4
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,1
  !loop : dw .sub317A : db 1
  db 16,$7F
  !as2
  !transpose,0
  db 12
  !c3
  !c3
  !c3
  !c3
  !c3
  !c3
  db 24
  !d3
  !rest
  db 12
  !d3
  !d3
  !d3
  !d3
  db 24
  !ds3
  !rest
  db 12
  !ds3
  !ds3
  !ds3
  !ds3
  db 24
  !d3
  !rest
  db 12
  !d3
  !d3
  !d3
  !d3
  db 24
  !c3
  !rest
  db 12
  !c3
  !c3
  !c3
  !c3
  db 24
  !d3
  !rest
  db 12
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !subloop,0
  db 16,$7F
  !ds3
  !subloop,5
  !loop : dw .sub31B9 : db 3
  !loop : dw .sub31BD : db 3
  !volume,136
  !subloop,0
  db 48,$7F
  !c4
  !gs4
  !g4
  !loop : dw .sub31C1 : db 1
  !loop : dw .sub31DB : db 1
  db 72,$7F
  !f4
  !loop : dw .sub31DB : db 1
  db 72,$7F
  !c4
  db 48
  !as3
  !c4
  db 24
  !ds4
  db 96
  !c4
  db 72
  !tie
  db 24
  !rest
  db 72
  !c4
  db 48
  !gs4
  !g4
  !loop : dw .sub31C1 : db 1
  !loop : dw .sub31DB : db 1
  db 72,$7F
  !f4
  !loop : dw .sub31DB : db 1
  db 96,$7F
  !f4
  !tie
  !tie
  db 72
  !tie
  db 48
  !rest
  !subloop,1
  db 96,$7F
  !g3
  db 48
  !tie
  db 24
  !rest
  db 48
  !g3
  db 24
  !rest
  !a3
  !rest
  !b3
  !rest
  db 12
  !cs4
  !rest
  db 96
  !d4
  db 72
  !tie
  db 24
  !rest
  db 48
  !d4
  db 24
  !rest
  !cs4
  !rest
  !b3
  !rest
  db 12
  !cs4
  !rest
  db 48
  !b3
  !loop : dw .sub31E2 : db 1
  db 48,$7F
  !b3
  !loop : dw .sub31E2 : db 1
  db 48,$7F
  !b3
  db 24
  !rest
  !cs4
  !rest
  !d4
  !rest
  db 12
  !cs4
  !rest
  db 96
  !d4
  db 72
  !tie
  db 48
  !rest
  db 96
  !d3
  db 48
  !tie
  db 24
  !rest
  db 48
  !fs3
  db 24
  !rest
  !a3
  !rest
  !b3
  !rest
  db 12
  !a3
  !rest
  db 48
  !b3
  db 24
  !rest
  !a3
  !rest
  !fs3
  !rest
  db 12
  !e3
  !rest
  db 96
  !fs3
  db 24
  !rest
  db 12
  !fs3
  !rest
  !fs3
  !rest
  !fs3
  db 60
  !rest
  !loop : dw .sub31E2 : db 1
  db 48,$7F
  !b3
  !loop : dw .sub31E2 : db 1
  db 96,$7F
  !b3
  !tie
  !tie
  db 72
  !tie
  db 48
  !rest
  !vibrato,48,12,64
  !instr,!instr26
  !volume,151
  !b4
  !loop : dw .sub31ED : db 1
  db 72,$7F
  !d5
  db 48
  !e5
  !fs5
  db 12
  !e5
  !rest
  db 96
  !fs5
  db 72
  !tie
  db 48
  !rest
  !fs4
  !loop : dw .sub31ED : db 1
  db 96,$7F
  !b4
  !tie
  !tie
  db 72
  !tie
  db 48
  !rest
  !end

.pattern1_2
  !volume,134
  !transpose,0
  !loop : dw .sub3218 : db 1
  !transpose,4
  !loop : dw .sub3218 : db 1
  !transpose,1
  !loop : dw .sub3218 : db 1
  !transpose,0
  !subloop,0
  db 9,$7C
  !f6
  db 3
  !rest
  db 9
  !g6
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  db 9
  !as6
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  db 9
  !g6
  db 3
  !rest
  !subloop,7
  db 16,$7F
  !as5
  !b5
  !as5
  !a5
  !as5
  !a5
  !gs5
  !a5
  !gs5
  !g5
  !gs5
  !a5
  !transpose,0
  !loop : dw .sub3218 : db 1
  !transpose,4
  !loop : dw .sub3218 : db 1
  !transpose,1
  !loop : dw .sub3218 : db 1
  !transpose,0
  !subloop,0
  db 9,$7F
  !f6
  db 3
  !rest
  db 9
  !g6
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  db 9
  !as6
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  db 9
  !g6
  db 3
  !rest
  !subloop,7
  !subloop,0
  db 16,$7F
  !gs5
  !subloop,5
  !loop : dw .sub3244 : db 3
  !loop : dw .sub3248 : db 3
  !loop : dw .sub324C : db 8
  !transpose,1
  !loop : dw .sub324C : db 8
  !end

.pattern1_3
  !loop : dw .sub326D : db 8
  !loop : dw .sub329B : db 16
  !end

.pattern1_4
  !transpose,0
  !loop : dw .sub32C6 : db 1
  !transpose,4
  !loop : dw .sub32C6 : db 1
  !transpose,1
  !loop : dw .sub32C6 : db 1
  !transpose,0
  !loop : dw .sub32C6 : db 1
  !transpose,0
  !loop : dw .sub32C6 : db 1
  !transpose,4
  !loop : dw .sub32C6 : db 1
  !transpose,1
  !loop : dw .sub32C6 : db 1
  !transpose,0
  !loop : dw .sub32EB : db 3
  !subloop,0
  db 16,$7F
  !f4
  !f4
  !f4
  !subloop,3
  !subloop,0
  !transpose,0
  !loop : dw .sub32FE : db 1
  !transpose,2
  !loop : dw .sub32FE : db 1
  !transpose,4
  !loop : dw .sub32FE : db 2
  !subloop,7
  !subloop,0
  !transpose,1
  !loop : dw .sub32FE : db 1
  !transpose,3
  !loop : dw .sub32FE : db 1
  !transpose,5
  !loop : dw .sub32FE : db 2
  !subloop,7
  !end

.pattern1_5
  !loop : dw .sub3311 : db 8
  !subloop,0
  !loop : dw .sub3341 : db 1
  !loop : dw .sub3366 : db 1
  !loop : dw .sub3341 : db 1
  !loop : dw .sub3366 : db 1
  !loop : dw .sub3341 : db 1
  !loop : dw .sub3366 : db 1
  !loop : dw .sub3341 : db 1
  !instr,!instr23
  !volume,208
  !loop : dw .sub338B : db 4
  db 60,$7F
  !c4
  !loop : dw .sub338B : db 2
  db 60,$7F
  !c4
  !subloop,7
  !end

.pattern1_6
  !loop : dw .sub3392 : db 8
  !loop : dw .sub33BB : db 8
  !end

.pattern1_7
  !transpose,0
  !loop : dw .sub33DD : db 1
  !transpose,4
  !volume,121
  !loop : dw .sub33DD : db 1
  !transpose,1
  !volume,134
  !loop : dw .sub33DD : db 1
  !transpose,0
  !loop : dw .sub33DD : db 2
  !transpose,4
  !volume,121
  !loop : dw .sub33DD : db 1
  !transpose,1
  !volume,134
  !loop : dw .sub33DD : db 1
  !transpose,0
  db 96,$7F
  !b5
  db 72
  !tie
  db 24
  !rest
  db 96
  !c6
  db 72
  !tie
  db 24
  !rest
  db 96
  !b5
  db 72
  !tie
  db 24
  !rest
  !subloop,0
  db 16,$7F
  !gs5
  !subloop,5
  !loop : dw .sub33FE : db 3
  !loop : dw .sub3402 : db 3
  !loop : dw .sub3406 : db 8
  !transpose,1
  !loop : dw .sub3406 : db 8
  !end

.sub30DE
  db 12,$7F
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  db 24
  !g3
  !rest
  db 12
  !g3
  !g3
  !g3
  !g3
  db 24
  !gs3
  !rest
  db 12
  !gs3
  !gs3
  !gs3
  !gs3
  db 24
  !g3
  !rest
  db 12
  !g3
  !g3
  !g3
  !g3
  db 24
  !f3
  !rest
  db 12
  !f3
  !f3
  !f3
  !f3
  db 24
  !g3
  !rest
  db 12
  !g3
  !g3
  !g3
  !g3
  !gs3
  !gs3
  db 16
  !as3
  !b3
  !as3
  !a3
  !as3
  !a3
  !gs3
  !a3
  !gs3
  !g3
  !gs3
  !end

.sub311D
  db 16,$7F
  !as3
  !end

.sub3121
  db 16,$7F
  !ds4
  !end

.sub3125
  db 48,$7F
  !cs5
  !c5
  db 24
  !ds4
  db 96
  !f4
  db 72
  !tie
  db 24
  !rest
  db 72
  !f4
  db 48
  !ds5
  !cs5
  db 24
  !c5
  db 72
  !cs5
  db 48
  !c5
  !as4
  db 24
  !gs4
  db 72
  !as4
  !end

.sub3142
  db 24,$7F
  !rest
  !cs4
  !rest
  !b3
  !rest
  db 12
  !cs4
  !rest
  db 48
  !d4
  !end

.sub314F
  db 48,$7F
  !fs5
  !e5
  db 24
  !cs5
  db 96
  !d5
  db 72
  !tie
  db 24
  !rest
  db 72
  !d5
  db 48
  !a5
  !fs5
  db 24
  !e5
  db 72
  !fs5
  db 48
  !e5
  !d5
  db 24
  !cs5
  db 72
  !d5
  db 48
  !cs5
  !b4
  db 12
  !cs5
  !rest
  db 72
  !d5
  db 48
  !cs5
  !b4
  db 12
  !cs5
  !rest
  !end

.sub317A
  db 12,$7F
  !c3
  !c3
  !c3
  !c3
  !c3
  !c3
  db 24
  !d3
  !rest
  db 12
  !d3
  !d3
  !d3
  !d3
  db 24
  !ds3
  !rest
  db 12
  !ds3
  !ds3
  !ds3
  !ds3
  db 24
  !d3
  !rest
  db 12
  !d3
  !d3
  !d3
  !d3
  db 24
  !c3
  !rest
  db 12
  !c3
  !c3
  !c3
  !c3
  db 24
  !d3
  !rest
  db 12
  !d3
  !d3
  !d3
  !d3
  !ds3
  !ds3
  db 16
  !f3
  !fs3
  !f3
  !e3
  !f3
  !e3
  !ds3
  !e3
  !ds3
  !d3
  !ds3
  !end

.sub31B9
  db 16,$7F
  !f3
  !end

.sub31BD
  db 16,$7F
  !as3
  !end

.sub31C1
  db 24,$7F
  !as3
  db 96
  !c4
  db 72
  !tie
  db 24
  !rest
  db 72
  !c4
  db 48
  !as4
  !gs4
  db 24
  !g4
  db 72
  !gs4
  db 48
  !g4
  !f4
  db 24
  !ds4
  db 72
  !f4
  !end

.sub31DB
  db 48,$7F
  !ds4
  !c4
  db 24
  !ds4
  !end

.sub31E2
  db 24,$7F
  !rest
  !a3
  !rest
  !fs3
  !rest
  db 12
  !a3
  !rest
  !end

.sub31ED
  db 48,$7F
  !d5
  !cs5
  db 24
  !a4
  db 96
  !b4
  db 72
  !tie
  db 24
  !rest
  db 72
  !b4
  db 48
  !fs5
  !d5
  db 24
  !cs5
  db 72
  !d5
  db 48
  !cs5
  !b4
  db 24
  !a4
  db 72
  !b4
  db 48
  !a4
  !fs4
  db 12
  !a4
  !rest
  db 72
  !b4
  db 48
  !a4
  !fs4
  db 12
  !a4
  !rest
  !end

.sub3218
  !subloop,0
  db 9,$7C
  !f6
  db 3
  !rest
  db 9
  !g6
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  db 9
  !as6
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  db 9
  !g6
  db 3
  !rest
  !subloop,7
  db 16,$7F
  !as5
  !b5
  !as5
  !a5
  !as5
  !a5
  !gs5
  !a5
  !gs5
  !g5
  !gs5
  !g5
  !end

.sub3244
  db 16,$7F
  !as5
  !end

.sub3248
  db 16,$7F
  !ds6
  !end

.sub324C
  db 24,$7F
  !cs5
  !fs5
  !cs5
  !fs5
  !cs5
  !fs5
  !cs5
  !fs5
  !ds5
  !gs5
  !ds5
  !gs5
  !ds5
  !gs5
  !ds5
  !gs5
  !subloop,0
  db 24,$7F
  !f5
  !as5
  !f5
  !as5
  !f5
  !as5
  !f5
  !as5
  !subloop,1
  !end

.sub326D
  !instr,!instr20
  !volume,216
  db 48,$7F
  !gs4
  !instr,!instr24
  !volume,138
  !subloop,0
  db 24,$7F
  !a4
  !subloop,13
  !instr,!instr20
  !volume,216
  db 48,$7F
  !gs4
  !instr,!instr24
  !volume,138
  db 24
  !a4
  !a4
  !a4
  !a4
  !a4
  !a4
  !instr,!instr20
  !volume,216
  db 48
  !gs4
  !gs4
  db 96
  !gs4
  !end

.sub329B
  !subloop,0
  !instr,!instr20
  !volume,216
  db 48,$7F
  !gs4
  !instr,!instr24
  !volume,138
  !a4
  !a4
  !a4
  !subloop,1
  !instr,!instr20
  !volume,216
  db 48,$7F
  !gs4
  !instr,!instr24
  !volume,138
  !a4
  !a4
  db 120
  !a4
  !instr,!instr20
  !volume,216
  db 72
  !gs4
  db 24
  !gs4
  !gs4
  !end

.sub32C6
  !subloop,0
  db 12,$7F
  !ds4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f5
  !f4
  !as4
  !f4
  !b4
  !f4
  !c5
  !f4
  !ds4
  !ds5
  !subloop,2
  db 16,$7F
  !as4
  !b4
  !as4
  !a4
  !as4
  !a4
  !gs4
  !a4
  !gs4
  !g4
  !gs4
  !ds4
  !end

.sub32EB
  db 12,$7F
  !ds4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f5
  !f4
  !as4
  !f4
  !b4
  !f4
  !c5
  !f4
  !ds4
  !ds5
  !end

.sub32FE
  db 12,$7F
  !f3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !end

.sub3311
  !instr,!instr20
  !volume,216
  db 24,$7F
  !g4
  !instr,!instr23
  !volume,208
  !subloop,0
  db 48,$7F
  !c4
  !subloop,6
  db 24,$7F
  !c4
  !instr,!instr20
  !volume,216
  !g4
  !instr,!instr23
  !volume,208
  db 48
  !c4
  !c4
  !c4
  db 24
  !c4
  db 48
  !c4
  !c4
  !c4
  !instr,!instr25
  db 12
  !d5
  !c5
  !a4
  !fs4
  !end

.sub3341
  !instr,!instr20
  !volume,216
  db 24,$7F
  !g4
  !instr,!instr23
  !volume,208
  db 48
  !c4
  !c4
  db 12
  !c4
  !c4
  !instr,!instr25
  !c4
  !c4
  !instr,!instr23
  !volume,208
  db 11
  !c4
  db 1,$7C
  !tie
  db 11,$7F
  !c4
  db 1,$7C
  !tie
  !end

.sub3366
  !instr,!instr20
  !volume,216
  db 24,$7F
  !g4
  !instr,!instr23
  !volume,208
  db 48
  !c4
  !c4
  db 12
  !c4
  !c4
  !instr,!instr25
  !g4
  !g4
  !instr,!instr23
  !volume,208
  db 11
  !c4
  db 1,$7C
  !tie
  db 11,$7F
  !c4
  db 1,$7C
  !tie
  !end

.sub338B
  db 11,$7F
  !c4
  db 1,$7C
  !tie
  !end

.sub3392
  !subloop,0
  db 48,$7F
  !c4
  db 12
  !c4
  db 36
  !c4
  !c4
  db 24
  !c4
  db 36
  !c4
  !subloop,1
  db 48,$7F
  !c4
  db 12
  !c4
  db 36
  !c4
  !c4
  db 24
  !c4
  db 52
  !c4
  db 16
  !c4
  db 32
  !c4
  db 16
  !c4
  db 32
  !c4
  db 16
  !c4
  db 64
  !c4
  !end

.sub33BB
  !subloop,0
  db 48,$7F
  !c4
  db 12
  !c4
  db 36
  !c4
  db 12
  !c4
  db 84
  !c4
  !subloop,5
  db 48,$7F
  !c4
  db 12
  !c4
  db 36
  !c4
  db 12
  !c4
  db 96
  !c4
  db 60
  !tie
  db 72
  !c4
  db 24
  !c4
  !c4
  !end

.sub33DD
  db 96,$7F
  !b5
  db 72
  !tie
  db 24
  !rest
  db 96
  !c6
  db 72
  !tie
  db 24
  !rest
  db 96
  !b5
  db 72
  !tie
  db 24
  !rest
  db 16
  !as5
  !b5
  !as5
  !a5
  !as5
  !a5
  !gs5
  !a5
  !gs5
  !g5
  !gs5
  !ds5
  !end

.sub33FE
  db 16,$7F
  !as5
  !end

.sub3402
  db 16,$7F
  !ds6
  !end

.sub3406
  db 96,$7F
  !fs5
  db 72
  !tie
  db 24
  !rest
  db 96
  !gs5
  db 72
  !tie
  db 24
  !rest
  !subloop,0
  db 96,$7F
  !as5
  db 72
  !tie
  db 24
  !rest
  !subloop,1
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
