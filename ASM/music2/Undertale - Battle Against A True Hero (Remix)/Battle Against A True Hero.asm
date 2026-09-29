; Originally by Toby Fox, arranged by Segment1Zone2 (https://www.smwcentral.net/?p=section&a=details&id=30853)
; I have to reduce the echo from 7 to 3.
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
!instr2E = $26
!instr2F = $27

!sample06 = $16
!sample14 = $17
!sample15 = $18
!sample16 = $19
!sample17 = $1A
!sample18 = $1B
!sample19 = $1C
!sample1A = $1D
!sample1B = $1E
!sample1C = $1F
!sample1D = $20
!sample1E = $21
!sample1F = $22
!sample20 = $23
!sample21 = $24
!sample22 = $25

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample14,$AE,$70,$B8,$03,$00
  db !sample15,$00,$00,$D8,$02,$00
  db !sample16,$FF,$EB,$B8,$02,$00
  db !sample17,$8A,$A0,$B8,$03,$00
  db !sample18,$8E,$A8,$B8,$02,$71
  db !sample19,$FF,$A0,$B8,$10,$00
  db !sample1A,$DF,$CF,$B8,$06,$00
  db !sample18,$86,$E0,$B8,$02,$71
  db !sample1B,$AF,$70,$B8,$04,$00
  db !sample1C,$00,$00,$D9,$05,$00
  db !sample1D,$FF,$E0,$B8,$05,$00
  db !sample1D,$8F,$36,$B8,$05,$00
  db !sample1E,$FF,$F5,$B8,$04,$00
  db !sample1F,$AF,$B7,$B8,$06,$00
  db !sample20,$8F,$D4,$B8,$07,$80
  db !sample06,$FF,$E0,$B8,$07,$A8
  db !sample21,$FF,$E0,$B8,$07,$A8
  db !sample22,$FF,$E0,$B8,$05,$80
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample06,Sample06+0
  dw Sample14,Sample14+45
  dw Sample15,Sample15+279
  dw Sample16,Sample16+909
  dw Sample17,Sample17+27
  dw Sample18,Sample18+36
  dw Sample19,Sample19+45
  dw Sample1A,Sample1A+1026
  dw Sample1B,Sample1B+738
  dw Sample1C,Sample1C+864
  dw Sample1D,Sample1D+450
  dw Sample1E,Sample1E+891
  dw Sample1F,Sample1F+864
  dw Sample20,Sample20+1503
  dw Sample21,Sample21+0
  dw Sample22,Sample22+0
endspcblock

;spcblock !p_sampleData nspc ; sample data
spcblock !p_songSpecificData nspc ; sample data
  Sample06: incbin "06 SMW @22.brr":2..0
  Sample14: incbin "Piano.brr":2..0
  Sample15: incbin "Trumpet.brr":2..0
  Sample16: incbin "Bass.brr":2..0
  Sample17: incbin "Choir.brr":2..0
  Sample18: incbin "Strings.brr":2..0
  Sample19: incbin "Sawtooth.brr":2..0
  Sample1A: incbin "Guitar.brr":2..0
  Sample1B: incbin "Tubular Bells.brr":2..0
  Sample1C: incbin "Oct Strings.brr":2..0
  Sample1D: incbin "Crash Cymbal.brr":2..0
  Sample1E: incbin "Kick.brr":2..0
  Sample1F: incbin "Snare.brr":2..0
  Sample20: incbin "Sleigh Bells.brr":2..0
  Sample21: incbin "Open Hat.brr":2..0
  Sample22: incbin "Tamborine.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

FirFilters: ; FIR filters
  db $FF,$08,$17,$24,$24,$00,$00,$00

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2B0A

Tracker2B0A:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !echo,%11111111,-48,-48
  !setEchoFirFilters : dw FirFilters
  ;!echoParameters,7,63,0
  !echoParameters,3,80,0
  !musicVolume,255
  !tempo,60
  !setDPMiscCommand,!noteEndInTicks,1
.pattern1_0
  !volume,187
  !instr,!instr1E
  !endVibrato
  !subloop,0
  !loop : dw .sub315A : db 1
  !loop : dw .sub31B5 : db 1
  !loop : dw .sub315A : db 1
  !pan,10
  db 18,$7F
  !gs7
  !pan,138
  db 18,$79
  !gs7
  !pan,10
  db 18,$7F
  !g7
  !pan,74
  db 18,$79
  !g7
  !pan,138
  db 12,$76
  !g7
  !subloop,13
  !loop : dw .sub315A : db 1
  !loop : dw .sub31B5 : db 1
  !loop : dw .sub315A : db 1
  !pan,10
  db 18,$7F
  !gs6
  !pan,138
  db 18,$79
  !gs6
  !pan,10
  db 18,$7F
  !g6
  !pan,74
  db 18,$79
  !g6
  !pan,138
  db 12,$76
  !g6
  !subloop,0
  !loop : dw .sub31D4 : db 1
  !pan,10
  db 18,$7F
  !g6
  !pan,74
  db 18,$79
  !g6
  !pan,138
  db 36,$76
  !g6
  !pan,10
  db 18,$7F
  !as6
  !pan,74
  db 18,$79
  !as6
  !pan,138
  db 36,$76
  !as6
  !pan,10
  db 18,$7F
  !f6
  !pan,74
  db 18,$79
  !f6
  !pan,138
  db 36,$76
  !f6
  !pan,10
  db 18,$7F
  !ds6
  !pan,74
  db 18,$79
  !ds6
  !pan,138
  db 36,$76
  !ds6
  !loop : dw .sub31D4 : db 1
  !pan,10
  db 18,$7F
  !g6
  !pan,74
  db 18,$79
  !g6
  !pan,138
  db 12,$76
  !g6
  !pan,10
  db 18,$7F
  !as6
  !pan,74
  db 18,$79
  !as6
  !pan,138
  db 12,$76
  !as6
  !pan,10
  db 18,$7F
  !ds7
  !pan,74
  db 14,$79
  !ds7
  !pan,10
  db 8,$7F
  !d7
  !cs7
  db 18
  !c7
  !pan,74
  db 18,$79
  !c7
  !pan,138
  db 108,$76
  !c7
  !subloop,1
  !volume,160
  !instr,!instr1F
  !pan,9
  !vibrato,24,12,24
  !subloop,0
  !loop : dw .sub3248 : db 1
  db 72,$7F
  !g6
  !as6
  !f6
  !ds6
  !loop : dw .sub3248 : db 1
  db 48,$7F
  !g6
  !as6
  db 32
  !ds7
  db 8
  !d7
  !cs7
  db 96
  !c7
  db 48
  !tie
  !loop : dw .sub3248 : db 1
  db 72,$7F
  !g6
  !as6
  !f6
  !ds6
  !f6
  db 24
  !c6
  !ds6
  !f6
  db 48
  !gs6
  !g6
  !ds6
  db 96
  !f6
  db 48
  !tie
  db 96
  !f6
  db 48
  !tie
  !subloop,1
  !end

.pattern1_1
  !toggleKeyOffGain

.pattern0_1
  !volume,213
  !instr,!instr20
  !pan,10
  !loop : dw .sub3257 : db 8
  !toggleKeyOffGain
  !loop : dw .sub325B : db 1
  db 96,$7F
  !f5
  db 48
  !tie
  db 12
  !g4
  !as4
  !c5
  !ds5
  !loop : dw .sub325B : db 1
  db 12,$7F
  !cs5
  db 24
  !cs5
  db 36
  !ds5
  db 24
  !as5
  db 96
  !rest
  !subloop,0
  db 12,$7F
  !f4
  !f4
  db 24
  !f5
  !f4
  db 12
  !f5
  !f4
  !rest
  !f4
  db 24
  !f5
  db 12
  !f4
  !f4
  db 24
  !f5
  db 12
  !cs4
  !cs4
  db 24
  !cs5
  !cs4
  db 12
  !cs5
  !cs4
  !rest
  !ds4
  db 24
  !ds5
  db 12
  !ds4
  !ds4
  db 24
  !ds5
  !subloop,23
  !loop : dw .sub3257 : db 12
  !volume,107
  !instr,!instr21
  !pan,11
  db 96,$7F
  !cs5
  db 48
  !tie
  db 96
  !ds5
  db 48
  !tie
  db 96
  !f5
  db 48
  !tie
  db 96
  !f5
  db 48
  !tie
  db 96
  !cs5
  db 48
  !tie
  db 96
  !ds5
  db 48
  !tie
  db 96
  !f5
  db 48
  !tie
  db 96
  !as5
  db 48
  !tie
  !volume,213
  !instr,!instr20
  !pan,10
  !subloop,0
  db 24,$7F
  !cs4
  !cs5
  !cs4
  !cs5
  !cs4
  !cs5
  !ds4
  !ds5
  !ds4
  !ds5
  !ds4
  !ds5
  !c4
  !c5
  !c4
  !c5
  !c4
  !c5
  !f4
  !f5
  !f4
  !f5
  !ds4
  !ds5
  !subloop,7
  !end

.pattern0_2
  !volume,120
  !instr,!instr21
  !pan,11
  !loop : dw .sub3257 : db 8
  !toggleKeyOffGain
  !endVibrato
  !loop : dw .sub3268 : db 1
  !volume,160
  !instr,!instr22
  !subloop,0
  !loop : dw .sub327C : db 1
  db 24,$7F
  !gs5
  db 12,$7B
  !gs5
  db 24,$7F
  !g5
  !ds5
  !loop : dw .sub327C : db 1
  db 24,$7F
  !gs6
  db 12,$7B
  !gs6
  db 36,$7F
  !g6
  db 12,$7B
  !g6
  !subloop,3
  !volume,133
  !subloop,0
  !loop : dw .sub32A9 : db 1
  !loop : dw .sub32C3 : db 1
  !loop : dw .sub32A9 : db 1
  !loop : dw .sub32D2 : db 1
  !subloop,1
  !volume,133
  !instr,!instr24
  !pan,10
  !subloop,0
  db 96,$7F
  !cs4
  db 48
  !tie
  db 96
  !ds4
  db 48
  !tie
  db 96
  !f4
  db 48
  !tie
  db 96
  !f4
  db 48
  !tie
  !subloop,1
  !volume,107
  !instr,!instr21
  !pan,9
  db 96,$7F
  !gs5
  db 48
  !tie
  db 96
  !as5
  db 48
  !tie
  db 96
  !c6
  db 48
  !tie
  db 96
  !gs5
  db 48
  !tie
  db 96
  !gs5
  db 48
  !tie
  db 96
  !as5
  db 48
  !tie
  db 96
  !c6
  db 48
  !tie
  db 96
  !f6
  db 48
  !tie
  !toggleKeyOffGain
  !volume,160
  !instr,!instr1F
  !pan,11
  !vibrato,24,12,24
  !subloop,0
  !loop : dw .sub32E0 : db 1
  db 72,$7F
  !ds6
  !ds6
  !c6
  !c6
  !loop : dw .sub32E0 : db 1
  db 48,$7F
  !ds6
  !g6
  !as6
  db 96
  !a6
  db 48
  !tie
  !loop : dw .sub32E0 : db 1
  db 72,$7F
  !ds6
  !ds6
  !c6
  !c6
  !c6
  db 24
  !gs5
  !c6
  !c6
  db 48
  !ds6
  !ds6
  !as5
  db 96
  !as5
  db 48
  !tie
  db 96
  !a5
  db 48
  !tie
  !subloop,1
  !end

.pattern0_3
  !volume,120
  !instr,!instr21
  !pan,9
  !loop : dw .sub3257 : db 8
  !toggleKeyOffGain
  !loop : dw .sub32EF : db 1
  db 96,$7F
  !cs5
  db 48
  !tie
  !g4
  !loop : dw .sub32EF : db 1
  db 96,$7F
  !c5
  !rest
  !toggleKeyOffGain
  !volume,147
  !instr,!instr23
  !pan,10
  !subloop,0
  !loop : dw .sub32FC : db 1
  !loop : dw .sub330F : db 1
  !loop : dw .sub3319 : db 1
  !loop : dw .sub32FC : db 1
  !loop : dw .sub3325 : db 1
  !loop : dw .sub3319 : db 1
  !subloop,3
  !subloop,0
  !instr,!instr23
  !loop : dw .sub32FC : db 1
  !loop : dw .sub330F : db 1
  !loop : dw .sub3319 : db 1
  !loop : dw .sub32FC : db 1
  !loop : dw .sub3325 : db 1
  !loop : dw .sub3319 : db 1
  !loop : dw .sub32FC : db 1
  !loop : dw .sub330F : db 1
  !loop : dw .sub3319 : db 1
  !loop : dw .sub32FC : db 1
  !loop : dw .sub3325 : db 1
  !loop : dw .sub3319 : db 1
  !loop : dw .sub32FC : db 1
  !loop : dw .sub330F : db 1
  !loop : dw .sub3319 : db 1
  !loop : dw .sub32FC : db 1
  !loop : dw .sub3325 : db 1
  !loop : dw .sub3319 : db 1
  !instr,!instr22
  db 96,$7F
  !gs5
  !tie
  !tie
  !rest
  db 96
  !a5
  !tie
  !tie
  !tie
  !subloop,1
  !volume,173
  !instr,!instr24
  !pan,10
  !subloop,0
  db 96,$7F
  !ds5
  db 48
  !tie
  db 96
  !f5
  db 48
  !tie
  db 96
  !g5
  db 48
  !tie
  db 96
  !gs5
  db 48
  !tie
  db 96
  !ds5
  db 48
  !tie
  db 96
  !f5
  db 48
  !tie
  db 96
  !g5
  db 48
  !tie
  !gs5
  !g5
  !ds5
  !subloop,1
  !volume,93
  !instr,!instr25
  !pan,11
  !subloop,0
  db 96,$7F
  !gs5
  db 48
  !tie
  db 96
  !as5
  db 48
  !tie
  db 96
  !ds6
  db 48
  !tie
  db 96
  !f6
  db 48
  !tie
  db 96
  !gs5
  db 48
  !tie
  db 96
  !as5
  db 48
  !tie
  db 96
  !c6
  db 48
  !tie
  db 96
  !f6
  db 48
  !tie
  !subloop,3
  !end

.pattern0_4
  !volume,133
  !instr,!instr21
  !pan,10
  !loop : dw .sub3257 : db 8
  !toggleKeyOffGain
  !transpose,244
  !loop : dw .sub3268 : db 1
  !transpose,0
  !volume,93
  !instr,!instr26
  !loop : dw .sub332F : db 4
  !volume,133
  !toggleKeyOffGain ; have to do it because it uses gain
  !instr,!instr27
  !subloop,0
  db 96,$7F
  !gs5
  !tie
  !tie
  !tie
  db 96
  !as4
  !tie
  !tie
  !tie
  !subloop,1
  !toggleKeyOffGain
  !volume,147
  !instr,!instr22
  !pan,9
  !transpose,244
  !subloop,0
  !loop : dw .sub32A9 : db 1
  !loop : dw .sub32C3 : db 1
  !loop : dw .sub32A9 : db 1
  !loop : dw .sub32D2 : db 1
  !subloop,1
  !transpose,0
  !toggleKeyOffGain
  !instr,!instr24
  !pan,10
  !subloop,0
  db 96,$7F
  !gs4
  db 48
  !tie
  db 96
  !as4
  db 48
  !tie
  db 96
  !c5
  db 48
  !tie
  db 96
  !c5
  db 48
  !tie
  !subloop,3
  !volume,93
  !instr,!instr25
  !pan,9
  !subloop,0
  db 96,$7F
  !f5
  db 48
  !tie
  db 96
  !g5
  db 48
  !tie
  db 96
  !as5
  db 48
  !tie
  db 96
  !c6
  db 48
  !tie
  !subloop,7
  !end

.pattern0_5
  !volume,93
  !instr,!instr26
  !pan,10
  !loop : dw .sub3257 : db 8
  !subloop,0
  db 96,$7F
  !f6
  !tie
  !tie
  !tie
  !subloop,2
  db 96,$7F
  !f6
  db 48
  !tie
  !volume,53
  !instr,!instr28
  !dynamicVolume,144,173
  db 96
  !c5
  db 48
  !tie
  db 96
  !rest
  !volume,240
  !subloop,0
  !instr,!instr2A
  db 24,$7F
  !c5
  !instr,!instr2B
  db 12
  !c5
  !instr,!instr2A
  db 36
  !c5
  !instr,!instr2B
  db 24
  !c5
  !instr,!instr2A
  db 12
  !c5
  !c5
  !instr,!instr2B
  db 24
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr2B
  !c5
  !subloop,46
  !instr,!instr2A
  db 24,$7F
  !c5
  !instr,!instr2B
  db 12
  !c5
  !instr,!instr2A
  db 36
  !c5
  !instr,!instr2B
  !c5
  !c5
  db 12
  !c5
  db 24
  !c5
  db 12
  !c5
  !volume,160
  !instr,!instr2C
  !loop : dw .sub3343 : db 16
  !volume,240
  !subloop,0
  !instr,!instr2A
  db 24,$7F
  !c5
  !instr,!instr2B
  !c5
  !subloop,95
  !end

.pattern0_6
  !pan,10
  !loop : dw .sub3257 : db 24
  !subloop,0
  !volume,187
  !instr,!instr29
  db 48,$7F
  !c5
  !volume,147
  !loop : dw .sub3349 : db 31
  !subloop,4
  !volume,187
  !instr,!instr29
  db 48,$7F
  !c5
  !volume,147
  !loop : dw .sub3349 : db 29
  !volume,80
  !instr,!instr28
  !dynamicVolume,96,187
  db 96,$7F
  !c5
  !volume,187
  !instr,!instr29
  db 96
  !c5
  db 48
  !tie
  !volume,160
  !instr,!instr2F
  !loop : dw .sub3343 : db 15
  !subloop,0
  !volume,187
  !instr,!instr29
  db 48,$7F
  !c5
  !volume,147
  !loop : dw .sub3349 : db 47
  !subloop,1
  !end

.pattern0_7
  !volume,120
  !instr,!instr21
  !pan,10
  !loop : dw .sub3257 : db 24
  !subloop,0
  db 96,$7F
  !f5
  !tie
  db 72
  !cs5
  db 120
  !ds5
  !subloop,3
  !volume,93
  !instr,!instr26
  !loop : dw .sub332F : db 3
  db 96,$7F
  !f6
  db 72
  !tie
  db 24,$79
  !f6
  db 48,$7F
  !cs6
  !volume,53
  !instr,!instr28
  !dynamicVolume,144,173
  db 96
  !c5
  db 48
  !tie
  !subloop,0
  !volume,120
  !instr,!instr21
  !loop : dw .sub3355 : db 6
  !volume,147
  !instr,!instr23
  !loop : dw .sub32FC : db 1
  !loop : dw .sub330F : db 1
  !loop : dw .sub3319 : db 1
  !loop : dw .sub32FC : db 1
  !loop : dw .sub3325 : db 1
  !loop : dw .sub3319 : db 1
  !subloop,1
  !volume,160
  !instr,!instr2F
  db 96,$7F
  !c5
  db 48
  !tie
  !volume,93
  !instr,!instr26
  !subloop,0
  db 96,$7F
  !c6
  db 48
  !tie
  !subloop,14
  !instr,!instr25
  !pan,10
  !subloop,0
  db 96,$7F
  !cs5
  db 48
  !tie
  db 96
  !ds5
  db 48
  !tie
  db 96
  !g5
  db 48
  !tie
  db 96
  !gs5
  db 48
  !tie
  db 96
  !cs5
  db 48
  !tie
  db 96
  !ds5
  db 48
  !tie
  db 96
  !f5
  db 48
  !tie
  db 96
  !a5
  db 48
  !tie
  !subloop,3
  !end

.sub315A
  !pan,10
  db 18,$7F
  !ds7
  !pan,74
  db 18,$79
  !ds7
  !pan,10
  db 18,$7F
  !f7
  !pan,138
  db 18,$79
  !f7
  !pan,10
  db 18,$7F
  !as6
  !pan,74
  db 18,$79
  !as6
  !pan,10
  db 18,$7F
  !c7
  !pan,138
  db 18,$79
  !c7
  !pan,10
  db 18,$7F
  !gs6
  !pan,74
  db 6,$79
  !gs6
  !pan,10
  db 18,$7F
  !f6
  !pan,138
  db 6,$79
  !f6
  !pan,10
  db 18,$7F
  !cs7
  !pan,74
  db 18,$79
  !cs7
  !pan,10
  db 18,$7F
  !gs6
  !pan,138
  db 18,$79
  !gs6
  !pan,10
  db 18,$7F
  !ds7
  !pan,74
  db 18,$79
  !ds7
  !end

.sub31B5
  !pan,10
  db 18,$7F
  !gs6
  !pan,138
  db 18,$79
  !gs6
  !pan,10
  db 18,$7F
  !g6
  !pan,74
  db 6,$79
  !g6
  !pan,10
  db 18,$7F
  !ds6
  !pan,138
  db 6,$79
  !ds6
  !end

.sub31D4
  !pan,10
  db 18,$7F
  !f6
  !pan,138
  db 6,$79
  !f6
  !pan,10
  db 18,$7F
  !c7
  !pan,138
  db 6,$79
  !c7
  !pan,10
  db 18,$7F
  !as6
  !pan,74
  db 6,$79
  !as6
  !pan,10
  db 18,$7F
  !c7
  !pan,138
  db 6,$79
  !c7
  !pan,10
  db 18,$7F
  !gs6
  !pan,74
  db 6,$79
  !gs6
  !pan,10
  db 18,$7F
  !c7
  !pan,138
  db 6,$79
  !c7
  !pan,10
  db 18,$7F
  !g6
  !pan,74
  db 18,$79
  !g6
  !pan,138
  db 12,$76
  !g6
  !pan,10
  db 18,$7F
  !g6
  !pan,74
  db 6,$79
  !g6
  !pan,10
  db 18,$7F
  !gs6
  !pan,74
  db 6,$79
  !gs6
  !pan,10
  db 18,$7F
  !g6
  !pan,74
  db 6,$79
  !g6
  !pan,10
  db 18,$7F
  !gs6
  !pan,74
  db 6,$79
  !gs6
  !end

.sub3248
  db 24,$4F
  !f6
  !c7
  !as6
  !c7
  !gs6
  !c7
  !g6
  !rest
  !g6
  !gs6
  !g6
  !gs6
  !end

.sub3257
  db 96,$7F
  !rest
  !end

.sub325B
  db 96,$7F
  !f5
  !tie
  db 96
  !f5
  db 48
  !tie
  !ds5
  db 96
  !f5
  !tie
  !end

.sub3268
  !subloop,0
  db 96,$7F
  !f5
  !tie
  db 96
  !f5
  db 48
  !tie
  !ds5
  !subloop,2
  db 96,$7F
  !f5
  !tie
  !f5
  !rest
  !end

.sub327C
  db 24,$7F
  !ds6
  db 12,$7B
  !ds6
  db 24,$7F
  !f6
  db 12,$7B
  !f6
  db 24,$7F
  !as5
  db 12,$7B
  !as5
  db 24,$7F
  !c6
  db 12,$7B
  !c6
  db 24,$7F
  !gs5
  !f5
  !cs6
  db 12,$7B
  !cs6
  db 24,$7F
  !gs5
  db 12,$7B
  !gs5
  db 24,$7F
  !ds6
  db 12,$7B
  !ds6
  !end

.sub32A9
  db 36,$7F
  !c6
  !f6
  db 24
  !gs6
  db 96
  !f6
  !tie
  db 48
  !tie
  db 24
  !g6
  !gs6
  db 96
  !as6
  !tie
  !tie
  db 12
  !f6
  !g6
  db 24
  !gs6
  !as6
  !c7
  !end

.sub32C3
  db 96,$7F
  !g6
  !tie
  !tie
  !rest
  db 96
  !g6
  db 48
  !tie
  !f6
  db 96
  !c6
  !tie
  !end

.sub32D2
  db 96,$7F
  !ds7
  !tie
  !tie
  db 48
  !rest
  !f7
  db 96
  !c7
  !tie
  !tie
  !tie
  !end

.sub32E0
  db 24,$4F
  !c6
  !f6
  !f6
  !f6
  !f6
  !f6
  !ds6
  !rest
  !ds6
  !ds6
  !ds6
  !ds6
  !end

.sub32EF
  db 96,$7F
  !c5
  !tie
  db 96
  !c5
  db 48
  !tie
  !as4
  db 96
  !c5
  !tie
  !end

.sub32FC
  db 12,$3F
  !f4
  !f4
  !c4
  !c4
  !f4
  !f4
  !c4
  !f4
  !rest
  !c4
  !f4
  !g4
  !gs4
  !g4
  !f4
  !c4
  !end

.sub330F
  db 12,$3F
  !cs4
  !cs4
  !gs3
  !gs3
  !cs4
  !cs4
  !gs3
  !end

.sub3319
  db 12,$3F
  !ds4
  !rest
  !as3
  !ds4
  !f4
  !g4
  !f4
  !ds4
  !as3
  !end

.sub3325
  db 12,$3F
  !cs4
  !rest
  !cs4
  !gs3
  !rest
  !gs3
  !cs4
  !end

.sub332F
  db 96,$7F
  !f6
  db 72
  !tie
  db 24,$79
  !f6
  db 72,$7F
  !cs6
  db 96
  !ds6
  db 24
  !tie
  !pitchSlide,0,24 : !ds5
  !end

.sub3343
  db 96,$7F
  !c5
  db 48
  !tie
  !end

.sub3349
  !instr,!instr2E
  db 24,$7B
  !c5
  !instr,!instr2D
  db 12,$7F
  !c5
  !c5
  !end

.sub3355
  db 96,$7F
  !f5
  !tie
  !tie
  !tie
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 1
endspcblock execute !p_spcEngine
