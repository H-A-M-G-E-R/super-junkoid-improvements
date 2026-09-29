; Originally by ZUN, arranged by JX444444 (https://www.smwcentral.net/?p=section&a=details&id=30072)
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

!sample14 = $16
!sample15 = $17
!sample16 = $18
!sample17 = $19
!sample18 = $1A
!sample19 = $1B
!sample1A = $1C
!sample1B = $1D
!sample1C = $1E

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample14,$FF,$E0,$B8,$03,$F9
  db !sample15,$FF,$E0,$B8,$04,$02
  db !sample16,$FF,$F3,$B8,$03,$BF
  db !sample17,$FF,$F1,$B8,$07,$5A
  db !sample18,$FF,$E0,$B8,$07,$A6
  db !sample19,$FF,$ED,$B8,$09,$00
  db !sample1A,$FF,$E0,$B8,$07,$A6
  db !sample1B,$FF,$E0,$B8,$02,$FA
  db !sample1C,$FF,$E0,$B8,$03,$02
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+2520
  dw Sample15,Sample15+1035
  dw Sample16,Sample16+27
  dw Sample17,Sample17+1179
  dw Sample18,Sample18+2250
  dw Sample19,Sample19+702
  dw Sample1A,Sample1A+3384
  dw Sample1B,Sample1B+594
  dw Sample1C,Sample1C+513
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "09 Armored Armadillo_18.brr":2..0
  Sample15: incbin "09 Armored Armadillo_23.brr":2..0
  Sample16: incbin "09 Armored Armadillo_12.brr":2..0
  Sample17: incbin "09 Armored Armadillo_14.brr":2..0
  Sample18: incbin "09 Armored Armadillo_15.brr":2..0
  Sample19: incbin "09 Armored Armadillo_20.brr":2..0
  Sample1A: incbin "09 Armored Armadillo_16.brr":2..0
  Sample1B: incbin "09 Armored Armadillo_1a.brr":2..0
  Sample1C: incbin "09 Armored Armadillo_19.brr":2..0

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
  !echo,%11001111,-75,75
  !echoParameters,3,68,3
  !musicVolume,255
  !tempo,57
  !setDPMiscCommand,!noteEndInTicks,1
  !toggleKeyOffGain
  !pan,11
  !vibrato,38,12,178
.pattern1_0
  !volume,93*(256+233)/256
  db 74,$7F
  !rest
  !instr,!instr1E
  ;!addmusicFA_amplify,233
  !loop : dw .sub30E6 : db 1
  !loop : dw .sub3108 : db 1
  !loop : dw .sub30E6 : db 1
  !loop : dw .sub3119 : db 1
  !loop : dw .sub312F : db 1
  !loop : dw .sub319B : db 1
  !loop : dw .sub31A3 : db 1
  !loop : dw .sub31C9 : db 1
  !loop : dw .sub31A3 : db 1
  !loop : dw .sub31F0 : db 1
  !pan,12
  !volume,113
  ;!addmusicFA_amplify,0
  !loop : dw .sub3210 : db 1
  !pan,11
  !volume,93*(256+24)/256
  !instr,!instr25
  ;!addmusicFA_amplify,24
  !loop : dw .sub321E : db 1
  !loop : dw .sub3224 : db 1
  !loop : dw .sub3251 : db 1
  !loop : dw .sub3224 : db 1
  !loop : dw .sub3266 : db 1
  !loop : dw .sub3224 : db 1
  !loop : dw .sub3251 : db 1
  !loop : dw .sub3224 : db 1
  db 12,$7F
  !e6
  !rest
  !fs6
  !rest
  !a6
  !fs6
  !e6
  !rest
  !e6
  db 24
  !fs6
  db 34
  !rest
  !end

.pattern0_1
  !toggleKeyOffGain
.pattern1_1
  !instr,!instr1E
  !pan,5
  !volume,114*(256+47)/256
  ;!addmusicFA_amplify,47
  !loop : dw .sub327C : db 1
  !instr,!instr25
  !pan,4
  !volume,87
  ;!addmusicFA_amplify,0
  !loop : dw .sub32F2 : db 1
  !loop : dw .sub3319 : db 1
  !loop : dw .sub32F2 : db 2
  !loop : dw .sub3340 : db 1
  !transpose,0
  !instr,!instr26
  !pan,4
  !volume,110
  ;!addmusicFA_amplify,0
  db 96,$7F
  !fs6
  db 93
  !tie
  db 3
  !rest
  db 96
  !e6
  db 93
  !tie
  db 3
  !rest
  db 96
  !ds6
  db 93
  !tie
  db 15
  !rest
  !loop : dw .sub33A1 : db 1
  db 96,$7F
  !d6
  db 93
  !tie
  db 3
  !rest
  db 96
  !e6
  db 93
  !tie
  db 3
  !rest
  db 96
  !fs6
  db 93
  !tie
  db 15
  !rest
  !loop : dw .sub33A1 : db 1
  !instr,!instr26
  !pan,4
  !volume,87
  ;!addmusicFA_amplify,0
  !loop : dw .sub33B3 : db 7
  db 93,$7F
  !d5
  db 3
  !rest
  db 93
  !e5
  db 3
  !rest
  db 95
  !fs5
  db 25
  !rest
  !end

.pattern0_2
  !toggleKeyOffGain
  !pan,6
.pattern1_2
  !instr,!instr1E
  !volume,122
  db 12,$7F
  !fs4
  !rest
  !a4
  !rest
  !cs5
  !rest
  !loop : dw .sub312F : db 1
  db 12,$7F
  !cs6
  !instr,!instr25
  !volume,110
  !fs4
  !a4
  !b4
  !e5
  !f5
  !fs5
  !a5
  !gs5
  !loop : dw .sub312F : db 1
  !loop : dw .sub319B : db 1
  !loop : dw .sub31A3 : db 1
  !loop : dw .sub31C9 : db 1
  !loop : dw .sub31A3 : db 1
  !loop : dw .sub31F0 : db 1
  !loop : dw .sub3210 : db 1
  db 48,$7F
  !rest
  !instr,!instr26
  !volume,89
  !loop : dw .sub33C3 : db 7
  db 93,$7F
  !fs5
  db 3
  !rest
  db 93
  !gs5
  db 3
  !rest
  db 95
  !a5
  db 25
  !rest
  !end

.pattern0_3
  !toggleKeyOffGain
.pattern1_3
  db 24,$7F
  !rest
  !instr,!instr20
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 2
  !e5
  db 6
  !rest
  db 8
  !e5
  db 2
  !e5
  db 6
  !rest
  db 24
  !fs5
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub3425 : db 1
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub34A9 : db 1
  !loop : dw .sub3531 : db 1
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub3425 : db 1
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub34A9 : db 1
  !loop : dw .sub3531 : db 1
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub3425 : db 1
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub34A9 : db 1
  !loop : dw .sub3553 : db 1
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub3425 : db 1
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub34A9 : db 1
  !loop : dw .sub3553 : db 1
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub359F : db 1
  !loop : dw .sub35D6 : db 1
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub359F : db 1
  !loop : dw .sub35D6 : db 1
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub359F : db 1
  !loop : dw .sub35D6 : db 1
  !loop : dw .sub33D3 : db 1
  !loop : dw .sub359F : db 1
  db 6,$7F
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 12
  !c5
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  db 12
  !as4
  !as4
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 24
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 12
  !as4
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 69
  !f4
  db 15
  !rest
  !end

.pattern0_4
  !toggleKeyOffGain
.pattern1_4
  db 24,$7F
  !rest
  !instr,!instr20
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 2
  !e5
  db 6
  !rest
  db 8
  !e5
  db 2
  !e5
  db 6
  !rest
  db 24
  !fs5
  !loop : dw .sub3642 : db 6
  !loop : dw .sub3688 : db 1
  !loop : dw .sub3642 : db 5
  !loop : dw .sub36A6 : db 1
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 30,$7F
  !as4
  db 6
  !rest
  db 96
  !as4
  db 40
  !tie
  db 20
  !rest
  db 24
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  !fs5
  !rest
  !loop : dw .sub3642 : db 5
  !loop : dw .sub3688 : db 1
  !loop : dw .sub3642 : db 5
  !loop : dw .sub36A6 : db 1
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 30,$7F
  !as4
  db 6
  !rest
  db 96
  !as4
  db 40
  !tie
  db 20
  !rest
  db 24
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  !fs5
  !rest
  !loop : dw .sub3642 : db 5
  !loop : dw .sub3688 : db 1
  !loop : dw .sub3642 : db 5
  !loop : dw .sub36A6 : db 1
  !loop : dw .sub3730 : db 1
  !loop : dw .sub3745 : db 1
  !loop : dw .sub3642 : db 6
  !loop : dw .sub3688 : db 1
  !loop : dw .sub3642 : db 5
  !loop : dw .sub36A6 : db 1
  !loop : dw .sub3730 : db 1
  !loop : dw .sub3745 : db 1
  !loop : dw .sub3642 : db 6
  !loop : dw .sub3782 : db 1
  !loop : dw .sub3745 : db 1
  !loop : dw .sub3642 : db 5
  !loop : dw .sub3782 : db 1
  !loop : dw .sub3745 : db 1
  !loop : dw .sub3642 : db 5
  !loop : dw .sub3782 : db 1
  !loop : dw .sub3745 : db 1
  !loop : dw .sub3642 : db 3
  !loop : dw .sub36A6 : db 1
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 34,$7F
  !as4
  db 2
  !rest
  db 46
  !as4
  db 38
  !rest
  !end

.pattern0_5
  !toggleKeyOffGain
.pattern1_5
  db 72,$7F
  !rest
  !loop : dw .sub37B1 : db 2
  !instr,!instr23
  !pan,10
  !volume,123
  !loop : dw .sub38EE : db 1
  !loop : dw .sub396C : db 3
  db 18,$7F
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !cs3
  db 6
  !rest
  db 9
  !cs3
  db 3
  !rest
  db 18
  !cs3
  db 6
  !rest
  !loop : dw .sub38EE : db 1
  db 18,$7F
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !cs3
  db 3
  !rest
  db 18
  !cs3
  db 6
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  !loop : dw .sub3982 : db 3
  db 18,$7F
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  !loop : dw .sub3A0A : db 2
  db 18,$7F
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 18
  !fs3
  !rest
  !fs2
  db 66
  !rest
  !end

.pattern0_6
  !toggleKeyOffGain
  !pan,14
.pattern1_6
  !instr,!instr1F
  !volume,110
  !transpose,244
  !loop : dw .sub327C : db 1
  !instr,!instr25
  !volume,89
  !transpose,244
  !loop : dw .sub32F2 : db 1
  !loop : dw .sub3319 : db 1
  !loop : dw .sub32F2 : db 2
  !transpose,244
  !loop : dw .sub3340 : db 1
  !transpose,0
  !instr,!instr26
  !volume,110
  db 96,$7F
  !cs6
  db 93
  !tie
  db 3
  !rest
  db 96
  !b5
  db 93
  !tie
  db 3
  !rest
  db 96
  !as5
  db 93
  !tie
  db 15
  !rest
  !loop : dw .sub3A20 : db 1
  db 96,$7F
  !a5
  db 93
  !tie
  db 3
  !rest
  db 96
  !b5
  db 93
  !tie
  db 3
  !rest
  db 96
  !cs6
  db 93
  !tie
  db 15
  !rest
  !loop : dw .sub3A20 : db 1
  !instr,!instr26
  !volume,96
  !loop : dw .sub3A32 : db 7
  db 93,$7F
  !a5
  db 3
  !rest
  db 93
  !b5
  db 3
  !rest
  db 95
  !cs6
  db 25
  !rest
  !end

.pattern0_7
  !subtranspose,24
  !toggleKeyOffGain
  !vibrato,38,12,178
.pattern1_7
  !pan,10
  db 72,$7F
  !rest
  !instr,!instr1E
  !volume,123
  !loop : dw .sub30E6 : db 1
  !loop : dw .sub3108 : db 1
  !loop : dw .sub30E6 : db 1
  !loop : dw .sub3119 : db 1
  !loop : dw .sub312F : db 1
  !loop : dw .sub319B : db 1
  !loop : dw .sub31A3 : db 1
  !loop : dw .sub31C9 : db 1
  !loop : dw .sub31A3 : db 1
  !loop : dw .sub31F0 : db 1
  !volume,117
  !loop : dw .sub3210 : db 1
  !instr,!instr25
  !volume,97
  !loop : dw .sub321E : db 1
  !loop : dw .sub3224 : db 1
  !loop : dw .sub3251 : db 1
  !loop : dw .sub3224 : db 1
  !loop : dw .sub3266 : db 1
  !loop : dw .sub3224 : db 1
  !loop : dw .sub3251 : db 1
  !loop : dw .sub3224 : db 1
  db 12,$7F
  !e6
  !rest
  !fs6
  !rest
  !a6
  !fs6
  !e6
  !rest
  !e6
  db 24
  !fs6
  db 36
  !rest
  !end

.sub30E6
  db 12,$7F
  !d5
  !fs5
  !rest
  !cs5
  !rest
  !d5
  !rest
  db 94
  !e5
  db 14
  !rest
  db 12
  !e4
  !f4
  !rest
  !fs4
  !rest
  !a4
  !rest
  db 94
  !fs4
  db 14
  !rest
  db 12
  !d5
  !fs5
  !rest
  !cs5
  !rest
  !d5
  !rest
  !end

.sub3108
  db 94,$7F
  !f5
  db 38
  !rest
  db 12
  !fs4
  !a4
  !b4
  !cs5
  !b4
  !a4
  db 18
  !cs5
  db 78
  !rest
  !end

.sub3119
  db 94,$7F
  !e5
  db 14
  !rest
  db 24
  !fs5
  db 34
  !fs4
  db 42
  !rest
  db 12
  !fs4
  !a4
  !b4
  !e5
  !f5
  !fs5
  !a5
  db 8
  !gs5
  !end

.sub312F
  db 48,$7F
  !a4
  db 24
  !rest
  db 12
  !a5
  !rest
  db 24
  !gs5
  db 12
  !rest
  db 24
  !cs6
  db 12
  !rest
  db 24
  !b5
  db 12
  !gs5
  !rest
  !e5
  !rest
  !gs5
  !rest
  !gs5
  db 84
  !a5
  db 24
  !rest
  db 48
  !a4
  db 24
  !rest
  db 12
  !a5
  !rest
  db 24
  !gs5
  db 12
  !rest
  db 24
  !a5
  db 12
  !rest
  !b5
  !rest
  db 96
  !fs5
  db 72
  !tie
  db 24
  !rest
  db 48
  !a4
  db 24
  !rest
  db 12
  !a5
  !rest
  db 24
  !gs5
  db 12
  !rest
  db 24
  !a5
  db 12
  !rest
  db 24
  !b5
  db 12
  !cs6
  !rest
  !fs5
  !rest
  db 24
  !b5
  db 12
  !rest
  db 48
  !cs6
  db 12
  !rest
  db 48
  !e6
  db 12
  !fs6
  !rest
  db 24
  !cs6
  !rest
  db 12
  !e6
  !fs6
  db 36
  !e6
  !b5
  db 24
  !gs5
  db 12
  !b5
  !rest
  !gs5
  !rest
  !b5
  !rest
  !b5
  !end

.sub319B
  db 48,$7F
  !cs6
  db 12
  !rest
  db 48
  !gs5
  !end

.sub31A3
  db 120,$7F
  !a5
  db 24
  !rest
  db 36
  !cs6
  db 12
  !rest
  db 72
  !gs5
  db 24
  !rest
  db 72
  !cs6
  db 24
  !rest
  db 96
  !fs5
  !tie
  db 12
  !rest
  !a4
  !cs5
  !e5
  !fs5
  !cs5
  !fs5
  !gs5
  !a5
  !fs5
  !e5
  !cs5
  !fs5
  !rest
  !gs5
  !rest
  !end

.sub31C9
  db 48,$7F
  !a5
  db 24
  !rest
  !cs5
  !rest
  !gs5
  !a5
  db 72
  !gs5
  db 24
  !rest
  db 48
  !b5
  db 24
  !rest
  db 36
  !cs6
  db 12
  !rest
  db 96
  !a5
  !tie
  db 12
  !rest
  !a4
  !fs5
  !a5
  !cs6
  !fs6
  !e6
  !cs6
  db 24
  !fs5
  !rest
  !gs5
  !rest
  !end

.sub31F0
  db 48,$7F
  !a5
  db 24
  !rest
  !cs5
  !rest
  !gs5
  !a5
  db 36
  !gs5
  db 12
  !rest
  db 36
  !b4
  db 12
  !rest
  db 24
  !gs5
  !a5
  db 12
  !b5
  !e6
  !b5
  !gs5
  !a5
  db 96
  !fs5
  !tie
  db 12
  !tie
  !end

.sub3210
  db 12,$7F
  !e6
  !rest
  !cs6
  !rest
  !e6
  !rest
  !e6
  db 36
  !fs6
  db 24
  !rest
  !end

.sub321E
  db 36,$7F
  !gs6
  db 12
  !rest
  !end

.sub3224
  db 36,$7F
  !a6
  db 12
  !rest
  !cs6
  !rest
  !a6
  !rest
  !gs6
  !rest
  !fs6
  !rest
  !e6
  !rest
  !d6
  !rest
  !cs6
  !rest
  !e6
  !rest
  !b5
  !rest
  !cs6
  !rest
  db 48
  !a5
  db 24
  !rest
  db 12
  !a5
  !rest
  !b5
  !rest
  !cs6
  !rest
  !e6
  !rest
  !cs6
  !rest
  !b5
  !rest
  !cs6
  !rest
  !end

.sub3251
  db 12,$7F
  !b5
  !rest
  !a5
  !rest
  !fs5
  !rest
  !a5
  !rest
  !cs5
  !rest
  !e5
  !rest
  db 24
  !fs5
  db 48
  !rest
  db 24
  !a6
  !end

.sub3266
  db 12,$7F
  !e6
  !rest
  !fs6
  !rest
  !a6
  !rest
  !fs6
  !rest
  !e6
  !rest
  !e6
  db 36
  !fs6
  db 24
  !rest
  db 36
  !gs6
  db 12
  !rest
  !end

.sub327C
  db 12,$7F
  !a4
  !rest
  !cs5
  !rest
  !e5
  !rest
  db 48
  !fs5
  db 24
  !rest
  db 12
  !fs6
  !rest
  db 24
  !e6
  db 12
  !rest
  db 24
  !a6
  db 12
  !rest
  db 24
  !gs6
  db 12
  !e6
  !rest
  !cs6
  !rest
  !e6
  !rest
  !e6
  db 84
  !fs6
  db 24
  !rest
  db 48
  !fs5
  db 24
  !rest
  db 12
  !fs6
  !rest
  db 24
  !f6
  db 12
  !rest
  db 24
  !fs6
  db 12
  !rest
  !gs6
  !rest
  db 96
  !cs6
  db 72
  !tie
  db 24
  !rest
  db 48
  !fs5
  db 24
  !rest
  db 12
  !fs6
  !rest
  db 24
  !e6
  db 12
  !rest
  db 24
  !fs6
  db 12
  !rest
  db 24
  !gs6
  db 12
  !a6
  !rest
  !cs6
  !rest
  db 24
  !gs6
  db 12
  !rest
  db 48
  !a6
  db 12
  !rest
  db 48
  !b6
  db 12
  !cs7
  !rest
  db 24
  !fs6
  !rest
  db 12
  !gs6
  !a6
  db 36
  !gs6
  !e6
  db 24
  !cs6
  db 12
  !e6
  !rest
  !cs6
  !rest
  !e6
  !rest
  !e6
  !fs6
  db 96
  !rest
  !end

.sub32F2
  db 12,$7F
  !fs5
  !d6
  !fs6
  db 12,$7F
  !fs5
  !d6
  !fs6
  db 12,$7F
  !fs5
  !d6
  db 12,$7F
  !gs6
  !gs5
  !e5
  db 12,$7F
  !gs6
  !gs5
  !e5
  db 12,$7F
  !gs6
  !gs5
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !end

.sub3319
  db 12,$7F
  !fs5
  !d6
  !fs6
  db 12,$7F
  !fs5
  !d6
  !fs6
  db 12,$7F
  !fs5
  !d6
  db 12,$7F
  !gs6
  !gs5
  !f5
  db 12,$7F
  !gs6
  !gs5
  !f5
  db 12,$7F
  !gs6
  !gs5
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !end

.sub3340
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  db 12,$7F
  !gs5
  !e6
  !gs6
  db 12,$7F
  !gs5
  !e6
  !gs6
  db 12,$7F
  !gs5
  !e6
  !gs6
  db 12,$7F
  !gs5
  !e6
  !gs6
  db 12,$7F
  !gs5
  !e6
  !gs6
  db 12,$7F
  !gs5
  db 12,$7F
  !fs5
  !ds6
  !fs6
  db 12,$7F
  !fs5
  !ds6
  !fs6
  db 12,$7F
  !fs5
  !ds6
  !fs6
  db 12,$7F
  !fs5
  !ds6
  !fs6
  db 12,$7F
  !fs5
  !ds6
  !fs6
  db 12,$7F
  !fs5
  db 12,$7F
  !fs5
  !ds6
  !fs6
  db 12,$7F
  !fs5
  !ds6
  !fs6
  db 12,$7F
  !fs5
  !ds6
  !fs6
  db 12,$7F
  !fs5
  !ds6
  !fs6
  db 12,$7F
  !fs5
  !ds6
  !fs6
  db 12,$7F
  !fs5
  db 12,$7F
  !fs5
  !d6
  !fs6
  db 12,$7F
  !fs5
  !d6
  !fs6
  db 12,$7F
  !fs5
  !d6
  !fs6
  db 12,$7F
  !fs5
  !d6
  !fs6
  db 12,$7F
  !fs5
  !d6
  !fs6
  db 12,$7F
  !fs5
  db 12,$7F
  !gs5
  !e6
  !gs6
  db 12,$7F
  !gs5
  !e6
  !gs6
  db 12,$7F
  !gs5
  !e6
  !gs6
  db 12,$7F
  !gs5
  !e6
  !gs6
  db 12,$7F
  !gs5
  !e6
  !gs6
  db 12,$7F
  !gs5
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !fs6
  !a6
  db 12,$7F
  !a5
  !end

.sub33A1
  db 12,$7F
  !a5
  !cs6
  !e6
  !fs6
  !cs6
  !fs6
  !gs6
  !a6
  !fs6
  !e6
  !cs6
  !a5
  !fs5
  !e5
  !cs5
  !end

.sub33B3
  db 93,$7F
  !d5
  db 3
  !rest
  db 93
  !e5
  db 3
  !rest
  db 96
  !fs5
  db 93
  !tie
  db 3
  !rest
  !end

.sub33C3
  db 93,$7F
  !fs5
  db 3
  !rest
  db 93
  !gs5
  db 3
  !rest
  db 96
  !a5
  db 93
  !tie
  db 3
  !rest
  !end

.sub33D3
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 24,$7F
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12,$7F
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12,$7F
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12,$7F
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12,$7F
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12,$7F
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12,$7F
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12,$7F
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 5
  !as4
  db 1,$7F
  !tie
  !volume,117
  db 18
  !as4
  !end

.sub3425
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 24,$7F
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24,$7F
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24,$7F
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24,$7F
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24,$7F
  !as4
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 12
  !as4
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 36
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24,$7F
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24,$7F
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 5,$7F
  !as4
  db 1,$7F
  !tie
  !volume,117
  db 18
  !as4
  !end

.sub34A9
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 24,$7F
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 12
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 12
  !as4
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 24
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 12
  !as4
  !end

.sub3531
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 48,$7F
  !f4
  db 12
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  !volume,152
  !as4
  !as4
  db 24
  !as4
  !as4
  db 12
  !as4
  !as4
  !end

.sub3553
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 24,$7F
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 12
  !as4
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 48
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 5
  !as4
  db 1,$7F
  !tie
  !volume,117
  db 18
  !as4
  !end

.sub359F
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 24,$7F
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  !end

.sub35D6
  db 12,$7F
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr20
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 12
  !fs5
  !rest
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 12
  !as4
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 36
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 24
  !as4
  !instr,!instr21
  !pan,10
  !volume,152
  ;!addmusicFA_amplify,0
  db 48
  !f4
  db 24
  !f4
  !instr,!instr24
  !pan,10
  !volume,123
  ;!addmusicFA_amplify,0
  db 6
  !as4
  db 18
  !as4
  !end

.sub3642
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 24,$7F
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  !fs5
  !rest
  !end

.sub3688
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 24,$7F
  !as4
  db 12
  !rest
  db 24
  !as4
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  !fs5
  !rest
  !end

.sub36A6
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 24,$7F
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 24
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  !fs5
  !rest
  !end

.sub3730
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 35,$7F
  !as4
  db 1
  !rest
  db 35
  !as4
  db 1
  !rest
  db 24
  !as4
  !end

.sub3745
  db 24,$7F
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 6
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  !fs5
  !rest
  !end

.sub3782
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 35,$7F
  !as4
  db 1
  !rest
  db 24
  !as4
  db 12
  !as4
  !instr,!instr20
  !pan,11
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  !fs5
  !rest
  !instr,!instr22
  !pan,11
  !volume,98*(256+228)/256
  ;!addmusicFA_amplify,228
  db 46
  !as4
  db 2
  !rest
  db 46
  !as4
  db 2
  !rest
  !end

.sub37B1
  !instr,!instr23
  !pan,10
  !volume,123
  db 18,$7F
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 18
  !f3
  db 6
  !rest
  db 9
  !f3
  db 3
  !rest
  db 18
  !f3
  db 6
  !rest
  db 9
  !f3
  db 3
  !rest
  db 18
  !f3
  db 6
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 18
  !fs3
  !rest
  !fs2
  db 46
  !rest
  !instr,!instr24
  !pan,10
  !volume,97
  db 12
  !g4
  !g4
  db 16
  !g4
  db 8
  !rest
  db 16
  !g4
  db 8
  !rest
  db 12
  !g4
  db 6
  !g4
  db 2
  !rest
  !end

.sub38EE
  db 18,$7F
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 18,$7F
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 18,$7F
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 18,$7F
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 18,$7F
  !ds3
  db 6
  !rest
  db 9
  !ds3
  db 3
  !rest
  db 18
  !ds3
  db 6
  !rest
  db 9
  !ds3
  db 3
  !rest
  db 18
  !ds3
  db 6
  !rest
  db 18,$7F
  !ds3
  db 6
  !rest
  db 9
  !ds3
  db 3
  !rest
  db 18
  !ds3
  db 6
  !rest
  db 9
  !ds3
  db 3
  !rest
  db 18
  !ds3
  db 6
  !rest
  db 18,$7F
  !ds3
  db 6
  !rest
  db 9
  !ds3
  db 3
  !rest
  db 18
  !ds3
  db 6
  !rest
  db 9
  !ds3
  db 3
  !rest
  db 18
  !ds3
  db 6
  !rest
  db 18,$7F
  !ds3
  db 6
  !rest
  db 9
  !ds3
  db 3
  !rest
  db 18
  !ds3
  db 6
  !rest
  db 9
  !ds3
  db 3
  !rest
  db 18
  !ds3
  db 6
  !rest
  db 18,$7F
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 18,$7F
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 18,$7F
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 18,$7F
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  !end

.sub396C
  db 18,$7F
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  !end

.sub3982
  db 18,$7F
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 18,$7F
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 18,$7F
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 18,$7F
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 9
  !d3
  db 3
  !rest
  db 18
  !d3
  db 6
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 9
  !e3
  db 3
  !rest
  db 18
  !e3
  db 6
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 34
  !fs3
  db 14
  !rest
  db 34
  !e3
  db 14
  !rest
  !end

.sub3A0A
  db 18,$7F
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  db 9
  !fs3
  db 3
  !rest
  db 18
  !fs3
  db 6
  !rest
  !end

.sub3A20
  db 12,$7F
  !a4
  !cs5
  !e5
  !fs5
  !cs5
  !fs5
  !gs5
  !a5
  !fs5
  !e5
  !cs5
  !a4
  !fs4
  !e4
  !cs4
  !end

.sub3A32
  db 93,$7F
  !a5
  db 3
  !rest
  db 93
  !b5
  db 3
  !rest
  db 96
  !cs6
  db 93
  !tie
  db 3
  !rest
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
