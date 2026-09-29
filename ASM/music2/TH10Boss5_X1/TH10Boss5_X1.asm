; Originally by ZUN, arranged by JX444444 (https://www.smwcentral.net/?p=section&a=details&id=32110)
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
!instr26_2 = $20

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
  db !sample17,$FF,$E0,$B8,$07,$A8
  db !sample1A,$FF,$F3,$B8,$03,$BF
  db !sample15,$FF,$EF,$B8,$0E,$00
  db !sample14,$FF,$E0,$B8,$07,$AB
  db !sample1D,$FF,$E0,$B8,$04,$00
  db !sample16,$FF,$E0,$B8,$09,$10
  db !sample18,$FF,$F1,$B8,$07,$5C
  db !sample19,$FF,$E0,$B8,$04,$00
  db !sample1B,$FF,$E0,$B8,$02,$FA
  db !sample1C,$FF,$E0,$B8,$07,$A5
  db !sample1B,$FF,$E0,$B0,$02,$FA
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+3384
  dw Sample15,Sample15+1629
  dw Sample16,Sample16+738
  dw Sample17,Sample17+2250
  dw Sample18,Sample18+1179
  dw Sample19,Sample19+2520
  dw Sample1A,Sample1A+27
  dw Sample1B,Sample1B+594
  dw Sample1C,Sample1C+1692
  dw Sample1D,Sample1D+1035
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "16.brr":2..0
  Sample15: incbin "21.brr":2..0
  Sample16: incbin "1f.brr":2..0
  Sample17: incbin "15.brr":2..0
  Sample18: incbin "14.brr":2..0
  Sample19: incbin "18.brr":2..0
  Sample1A: incbin "12.brr":2..0
  Sample1B: incbin "1a.brr":2..0
  Sample1C: incbin "22.brr":2..0
  Sample1D: incbin "23.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2AA4

Tracker2AA4:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !musicVolume,255
  !tempo,67
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%11010111,-54,54
  !echoParameters,3,68,3
  db 96,$6F
  !rest
  !tie
  !toggleKeyOffGain
.pattern1_0
  !endVibrato
  !instr,!instr22
  !pan,9
  !volume,109
  !loop : dw .sub31C7 : db 2
  !loop : dw .sub31F8 : db 2
  db 12,$7F
  !a5
  db 12,$79
  !a5
  db 12,$7F
  !e5
  db 12,$79
  !e5
  db 12,$7F
  !b5
  db 12,$79
  !b5
  db 12,$7F
  !e5
  db 12,$79
  !e5
  db 12,$7F
  !cs6
  db 12,$79
  !cs6
  db 12,$7F
  !e5
  !a5
  db 12,$79
  !a5
  !a5
  db 12,$7F
  !e5
  db 12,$79
  !e5
  db 12,$7F
  !b5
  db 12,$79
  !b5
  db 12,$7F
  !e5
  db 12,$79
  !e5
  db 12,$7F
  !cs6
  db 12,$79
  !cs6
  db 12,$7F
  !e5
  !ds6
  db 12,$79
  !ds6
  !ds6
  db 12,$7F
  !e5
  db 12,$79
  !e5
  db 12,$7F
  !b5
  db 12,$79
  !b5
  db 12,$7F
  !e5
  db 12,$79
  !e5
  db 12,$7F
  !c6
  db 12,$79
  !c6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !cs6
  db 12,$79
  !cs6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !ds6
  db 12,$79
  !ds6
  db 12,$7F
  !gs5
  !fs6
  db 12,$79
  !fs6
  !fs6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !e6
  db 12,$79
  !e6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !ds6
  db 12,$79
  !ds6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !ds5
  !ds6
  !cs6
  !c6
  !gs5
  !fs5
  !e5
  !ds5
  !pan,10
  !instr,!instr26
  !volume,84
  !vibrato,80,16,64
  !loop : dw .sub3229 : db 1
  !loop : dw .sub325F : db 1
  !loop : dw .sub3229 : db 1
  !loop : dw .sub3266 : db 1
  !instr,!instr25
  !volume,123
  !endVibrato
  !loop : dw .sub3277 : db 1
  !instr,!instr26
  !volume,84
  !vibrato,80,16,64
  !loop : dw .sub32B8 : db 1
  !loop : dw .sub32D5 : db 1
  !loop : dw .sub32EB : db 1
  db 12,$6F
  !c7
  !end

.pattern0_1
  !pan,14
  !toggleKeyOffGain
  db 96,$7F
  !rest
  !tie
.pattern1_1
  !instr,!instr23
  !volume,89
  db 96,$6F
  !fs4
  !tie
  db 96
  !e4
  !tie
  db 96
  !gs3
  !tie
  db 96
  !ds4
  !tie
  db 96
  !e4
  !tie
  db 96
  !cs4
  !tie
  db 96
  !c4
  !tie
  db 96
  !ds4
  db 48
  !tie
  !volume,101
  db 24,$3F
  !gs4
  !gs4
  !instr,!instr23
  !volume,89
  !loop : dw .sub332F : db 1
  db 24,$3F
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,!instr22
  !volume,109
  db 12,$7F
  !gs5
  !gs6
  !ds6
  !gs5
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !gs6
  !gs5
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !gs6
  !gs5
  !instr,!instr23
  !volume,89
  !loop : dw .sub332F : db 1
  db 24,$3F
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,!instr22
  !volume,109
  db 12,$7F
  !gs5
  !c6
  !ds6
  !gs6
  !gs5
  !c6
  !ds6
  !gs6
  !ds6
  !gs6
  !cs6
  !gs6
  !c6
  !gs6
  !gs5
  !c6
  !vibrato,48,13,80
  !instr,!instr23
  !volume,69
  !loop : dw .sub3362 : db 1
  db 96,$6F
  !e4
  db 48
  !tie
  db 24
  !cs4
  !e4
  !f4
  !d3
  !d3
  !d4
  !d3
  !d3
  !d4
  !d3
  db 96
  !e4
  db 48
  !tie
  db 24
  !b3
  !e4
  !f4
  !loop : dw .sub3362 : db 1
  db 120,$6F
  !a4
  db 36
  !a4
  !b4
  db 24
  !cs5
  !b3
  !b3
  !b4
  !b3
  !b3
  !b4
  !b3
  !b3
  db 36
  !c5
  !c5
  db 24
  !c5
  db 48
  !c5
  !rest
  !volume,89
  !endVibrato
  !loop : dw .sub336C : db 1
  db 24,$3F
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !loop : dw .sub336C : db 1
  !volume,101
  db 36,$3F
  !ds4
  !ds4
  db 24
  !ds4
  db 96
  !gs4
  !end

.pattern0_2
  !pan,12
  !toggleKeyOffGain
  db 96,$7F
  !rest
  !tie
.pattern1_2
  !instr,!instr23
  !volume,90
  ;!addmusicFA_amplify,0
  db 96,$6F
  !cs4
  !tie
  db 96
  !cs4
  !tie
  db 96
  !b3
  !tie
  db 96
  !b3
  !tie
  db 96
  !a3
  !tie
  db 96
  !a3
  !tie
  db 96
  !gs3
  !tie
  db 96
  !gs3
  db 48
  !tie
  !volume,97*(256+40)/256
  ;!addmusicFA_amplify,40
  db 24,$3F
  !ds4
  !ds4
  !volume,90
  ;!addmusicFA_amplify,0
  !loop : dw .sub33A8 : db 2
  !vibrato,48,13,80
  !volume,70
  !loop : dw .sub33EB : db 1
  db 96,$6F
  !b4
  db 48
  !tie
  db 24
  !gs4
  !b4
  !c5
  !a3
  !a3
  !a4
  !a3
  !a3
  !a4
  !a3
  db 96
  !b4
  db 48
  !tie
  db 24
  !gs4
  !b4
  !c5
  !loop : dw .sub33EB : db 1
  db 120,$6F
  !e5
  db 36
  !e5
  !fs5
  db 24
  !gs5
  !fs4
  !fs4
  !fs5
  !fs4
  !fs4
  !fs5
  !fs4
  !fs4
  db 36
  !ds5
  !ds5
  db 24
  !ds5
  db 48
  !gs5
  !rest
  !volume,90
  !endVibrato
  !loop : dw .sub33F5 : db 1
  db 24,$3F
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !loop : dw .sub33F5 : db 1
  !volume,97*(256+40)/256
  ;!addmusicFA_amplify,40
  db 36,$3F
  !gs4
  !gs4
  db 24
  !gs4
  db 96
  !c5
  !end

.pattern0_3
  !pan,9
  !toggleKeyOffGain
  !instr,!instr20
  !volume,126*(256+35)/256
  ;!addmusicFA_amplify,35
  db 96,$6F
  !rest
  db 72
  !tie
  db 12
  !b2
  !b2
.pattern1_3
  !volume,126*(256+35)/256
  ;!addmusicFA_amplify,35
  !loop : dw .sub3431 : db 1
  !volume,109*(256+187)/256
  ;!addmusicFA_amplify,187
  !loop : dw .sub3431 : db 2
  db 24,$6F
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !fs2
  !fs3
  !fs2
  !fs3
  !fs2
  !fs3
  !fs2
  !fs3
  !a2
  !a3
  !a2
  !a3
  !a2
  !a3
  !a2
  !a3
  !b2
  !b3
  !b2
  !b3
  !b2
  !b3
  !b2
  !b3
  !c3
  !c4
  !c3
  !c4
  !c3
  !c4
  !c3
  !c4
  !loop : dw .sub3474 : db 2
  !end

.pattern0_4
  !toggleKeyOffGain
  db 120,$7F
  !rest
  !instr,!instr1F
  !pan,9
  !volume,82*(256+43)/256
  ;!addmusicFA_amplify,43
  db 24
  !gs5
  !rest
  !instr,!instr21
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 12
  !b4
  !b4
.pattern1_4
  !instr,!instr24
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  !loop : dw .sub34BB : db 7
  !instr,!instr21
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 72,$7F
  !b4
  !b4
  db 12
  !b4
  !b4
  !b4
  !b4
  !loop : dw .sub34C0 : db 2
  !instr,!instr24
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 96,$7F
  !e4
  !tie
  !tie
  !tie
  db 96
  !e4
  !tie
  db 96
  !e4
  db 48
  !tie
  !instr,!instr21
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 12
  !b4
  !b4
  !b4
  !b4
  !instr,!instr24
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 96
  !e4
  db 48
  !tie
  !instr,!instr21
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 96
  !b4
  !tie
  db 48
  !b4
  !instr,!instr24
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 96
  !e4
  db 48
  !tie
  !instr,!instr21
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 12
  !b4
  !b4
  !b4
  !b4
  !instr,!instr24
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 24
  !e4
  !instr,!instr27
  !pan,9
  !volume,98*(256+57)/256
  ;!addmusicFA_amplify,57
  db 12
  !a4
  !a4
  db 24
  !f4
  !instr,!instr24
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 48
  !e4
  !instr,!instr27
  !pan,9
  !volume,98*(256+57)/256
  ;!addmusicFA_amplify,57
  db 12
  !a4
  !a4
  !g4
  !g4
  !f4
  !f4
  !loop : dw .sub350B : db 2
  !end

.pattern0_5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  !toggleKeyOffGain
  db 48,$7F
  !c5
  !c5
  !c5
  !c5
.pattern1_5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  db 48,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  db 24,$7F
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 12
  !c5
  !c5
  db 24
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 12
  !c5
  !c5
  db 24
  !c5
  db 48
  !c5
  !loop : dw .sub3558 : db 3
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  db 48
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 12
  !c5
  db 84
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  db 24
  !gs5
  !loop : dw .sub3558 : db 3
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  !gs5
  db 48
  !gs5
  db 24
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 72
  !c5
  !loop : dw .sub3558 : db 3
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  db 48
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 12
  !c5
  db 84
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  db 24
  !gs5
  !loop : dw .sub3558 : db 3
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  !gs5
  db 48
  !gs5
  db 24
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 72
  !c5
  !loop : dw .sub358B : db 14
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  db 72
  !gs5
  !loop : dw .sub358B : db 2
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  !gs5
  !gs5
  !gs5
  !loop : dw .sub358B : db 2
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  !gs5
  !gs5
  !gs5
  !loop : dw .sub358B : db 2
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  db 72
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  !c5
  db 120
  !c5
  !loop : dw .sub3558 : db 3
  db 48,$7F
  !gs5
  !gs5
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  !c5
  !loop : dw .sub3558 : db 3
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  db 48
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 12
  !c5
  !c5
  db 96
  !c5
  !loop : dw .sub3558 : db 3
  db 48,$7F
  !gs5
  !gs5
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  !c5
  !loop : dw .sub3558 : db 3
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  db 48
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 12
  !c5
  !c5
  db 96
  !c5
  !end

.pattern0_6
  db 96,$6F
  !rest
  !tie
  !toggleKeyOffGain
.pattern1_6
  !loop : dw .sub35A2 : db 8
  !instr,!instr26
  !pan,6
  !volume,89
  ;!addmusicFA_amplify,0
  !vibrato,80,16,64
  !subtranspose,22
  !loop : dw .sub3229 : db 1
  !loop : dw .sub325F : db 1
  !loop : dw .sub3229 : db 1
  !loop : dw .sub3266 : db 1
  !subtranspose,0
  !endVibrato
  !instr,!instr25
  !pan,6
  !volume,101
  db 96,$6F
  !fs5
  db 36
  !fs5
  !gs5
  db 24
  !a5
  db 48
  !e5
  db 24
  !fs5
  db 48
  !e5
  db 24
  !b4
  db 48
  !gs4
  db 96
  !d5
  db 36
  !d5
  !e5
  db 24
  !fs5
  db 48
  !cs5
  !gs5
  db 36
  !fs5
  !e5
  db 24
  !fs5
  db 96
  !fs5
  db 36
  !fs5
  !gs5
  db 24
  !a5
  db 96
  !a5
  db 36
  !a5
  !b5
  db 24
  !cs6
  db 48
  !cs6
  !b5
  !gs5
  !cs6
  db 36
  !cs6
  !cs6
  db 24
  !cs6
  db 48
  !ds6
  db 12
  !cs6
  !b5
  !as5
  !gs5
  !instr,!instr26
  !pan,6
  !volume,89
  ;!addmusicFA_amplify,0
  !vibrato,80,16,64
  !subtranspose,22
  db 72
  !e5
  db 12
  !a5
  !b5
  db 96
  !cs6
  db 48
  !b5
  !fs5
  db 96
  !ds5
  db 72
  !ds5
  db 12
  !a5
  !as5
  db 72
  !c6
  db 12
  !cs6
  !ds6
  db 48
  !cs6
  !b5
  db 96
  !gs5
  !gs5
  !e6
  db 48
  !ds6
  !e6
  !gs6
  db 24
  !b5
  db 72
  !cs6
  db 48
  !ds6
  !e6
  !gs6
  db 96
  !ds6
  db 48
  !cs6
  !c6
  db 72
  !e5
  db 12
  !a5
  !b5
  db 72
  !cs6
  db 12
  !b5
  !cs6
  db 48
  !b5
  db 16
  !gs5
  !fs5
  !gs5
  db 48
  !fs5
  !ds5
  db 72
  !ds5
  db 12
  !a5
  !as5
  db 66
  !c6
  db 18
  !cs6
  db 12
  !ds6
  db 24
  !cs6
  !ds6
  db 12
  !cs6
  db 36
  !b5
  db 96
  !gs5
  !gs5
  !e6
  db 48
  !ds6
  !e6
  !gs6
  db 24
  !b5
  db 72
  !cs6
  db 48
  !ds6
  !e6
  !gs6
  db 36
  !gs6
  !c7
  db 24
  !ds7
  db 12
  !cs6
  !c6
  !fs6
  !c7
  !ds5
  !fs5
  !cs6
  !c6
  !end

.pattern0_7
  db 96,$6F
  !rest
  !tie
  !toggleKeyOffGain
  !pan,4
.pattern1_7
  !subtranspose,42
  !loop : dw .sub35A7 : db 8
  db 2,$6F
  !rest
  !volume,84
  !instr,!instr26
  !loop : dw .sub3229 : db 1
  !loop : dw .sub325F : db 1
  !loop : dw .sub3229 : db 1
  !loop : dw .sub3266 : db 1
  !volume,101
  !instr,!instr25
  !loop : dw .sub3277 : db 1
  !volume,84
  !instr,!instr26
  !loop : dw .sub32B8 : db 1
  !loop : dw .sub32D5 : db 1
  !loop : dw .sub32EB : db 1
  db 10,$6F
  !c7
  !end

.sub31C7
  db 12,$7F
  !cs6
  db 12,$79
  !cs6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !ds6
  db 12,$79
  !ds6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !e6
  db 12,$79
  !e6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !fs6
  db 12,$79
  !fs6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  !end

.sub31F8
  db 12,$7F
  !b5
  db 12,$79
  !b5
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !cs6
  db 12,$79
  !cs6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !ds6
  db 12,$79
  !ds6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !e6
  db 12,$79
  !e6
  db 12,$7F
  !gs5
  db 12,$79
  !gs5
  !end

.sub3229
  db 96,$6F
  !cs6
  db 36
  !cs6
  !ds6
  db 24
  !e6
  db 96
  !e6
  db 36
  !e6
  !fs6
  db 24
  !gs6
  db 48
  !ds6
  db 24
  !e6
  db 48
  !ds6
  db 24
  !b5
  db 96
  !gs5
  db 72
  !tie
  db 24
  !rest
  db 48
  !gs5
  db 96
  !a5
  db 36
  !a5
  !b5
  db 24
  !cs6
  db 96
  !cs6
  db 36
  !cs6
  !ds6
  db 24
  !e6
  db 48
  !c6
  !cs6
  db 36
  !ds6
  !e6
  db 24
  !fs6
  !end

.sub325F
  db 96,$6F
  !ds6
  db 48
  !tie
  !rest
  !end

.sub3266
  !instr,!instr26_2
  db 96,$6F
  !gs6
  db 48
  !tie
  !rest
  !instr,!instr26
  !end

.sub3277
  db 96,$6F
  !a5
  db 36
  !a5
  !b5
  db 24
  !cs6
  db 48
  !gs5
  db 24
  !a5
  db 48
  !gs5
  db 24
  !e5
  db 48
  !cs5
  db 96
  !fs5
  db 36
  !fs5
  !gs5
  db 24
  !a5
  db 48
  !e5
  !b5
  db 36
  !a5
  !gs5
  db 24
  !a5
  db 96
  !a5
  db 36
  !a5
  !b5
  db 24
  !cs6
  db 96
  !cs6
  db 36
  !cs6
  !ds6
  db 24
  !e6
  db 48
  !e6
  !ds6
  !cs6
  !e6
  db 36
  !fs6
  !fs6
  db 24
  !fs6
  db 48
  !gs6
  db 12
  !fs6
  !e6
  !ds6
  !cs6
  !end

.sub32B8
  db 72,$6F
  !gs5
  db 12
  !cs6
  !ds6
  db 96
  !e6
  db 48
  !ds6
  !b5
  db 96
  !fs5
  db 72
  !gs5
  db 12
  !ds6
  !e6
  db 72
  !fs6
  db 12
  !e6
  !fs6
  db 48
  !e6
  !ds6
  db 96
  !cs6
  !end

.sub32D5
  db 96,$6F
  !cs6
  !gs6
  db 48
  !fs6
  !gs6
  !b6
  db 24
  !ds6
  db 72
  !e6
  db 48
  !fs6
  !gs6
  !b6
  db 96
  !fs6
  db 48
  !e6
  !ds6
  !end

.sub32EB
  db 72,$6F
  !gs5
  db 12
  !cs6
  !ds6
  db 72
  !e6
  db 12
  !ds6
  !e6
  db 48
  !ds6
  db 16
  !cs6
  !b5
  !cs6
  db 48
  !b5
  !fs5
  db 72
  !gs5
  db 12
  !ds6
  !e6
  db 66
  !fs6
  db 18
  !e6
  db 12
  !fs6
  db 24
  !e6
  !fs6
  db 12
  !e6
  db 36
  !ds6
  db 96
  !cs6
  !cs6
  !gs6
  db 48
  !fs6
  !gs6
  !b6
  db 24
  !ds6
  db 72
  !e6
  db 48
  !fs6
  !gs6
  !b6
  db 36
  !c7
  !ds7
  db 24
  !gs7
  db 12
  !e7
  !ds7
  !cs7
  !c7
  !ds6
  !fs6
  !cs7
  !end

.sub332F
  db 24,$3F
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !end

.sub3362
  db 24,$6F
  !fs3
  !fs3
  !fs4
  !fs3
  !fs3
  !fs4
  !fs3
  !end

.sub336C
  db 24,$3F
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !fs4
  !fs4
  !fs4
  !fs4
  !fs4
  !fs4
  !fs4
  !fs4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  db 48,$5F
  !e4
  !ds4
  db 96
  !cs4
  !endVibrato
  db 24,$3F
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !end

.sub33A8
  db 24,$3F
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !end

.sub33EB
  db 24,$6F
  !cs4
  !cs4
  !cs5
  !cs4
  !cs4
  !cs5
  !cs4
  !end

.sub33F5
  db 24,$3F
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !b3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  db 48,$5F
  !gs4
  !fs4
  db 96
  !e4
  !endVibrato
  db 24,$3F
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !end

.sub3431
  db 24,$6F
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !a3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !fs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !gs3
  !end

.sub3474
  db 24,$6F
  !a2
  !a3
  !a2
  !a3
  !a2
  !a3
  !a2
  !a3
  !b2
  !b3
  !b2
  !b3
  !b2
  !b3
  !b2
  !b3
  !gs2
  !gs3
  !gs2
  !gs3
  !gs2
  !gs3
  !gs2
  !gs3
  db 48
  !a3
  !b3
  db 24
  !cs4
  !cs4
  db 12
  !fs3
  !e3
  !ds3
  !b2
  db 24
  !fs2
  !fs3
  !fs2
  !fs3
  !fs2
  !fs3
  !fs2
  !fs3
  !gs2
  !gs3
  !gs2
  !gs3
  !gs2
  !gs3
  !gs2
  !gs3
  !a2
  !a3
  !a2
  !a3
  !a2
  !a3
  !a2
  !a3
  !gs2
  !gs3
  !gs2
  !gs3
  !gs2
  !gs3
  !gs2
  !gs3
  !end

.sub34BB
  db 96,$7F
  !e4
  !tie
  !end

.sub34C0
  !instr,!instr24
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 48,$7F
  !e4
  !instr,!instr21
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 96
  !b4
  !b4
  !b4
  !b4
  !b4
  !b4
  db 48
  !b4
  db 12
  !b4
  !b4
  db 24
  !b4
  db 48
  !b4
  !instr,!instr24
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  !e4
  !instr,!instr21
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 96
  !b4
  !b4
  !b4
  !b4
  !b4
  !b4
  db 12
  !b4
  !b4
  !b4
  !b4
  !b4
  db 36
  !b4
  db 24
  !b4
  !b4
  !end

.sub350B
  !instr,!instr24
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 48,$7F
  !e4
  !instr,!instr21
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 96
  !b4
  !b4
  !b4
  !b4
  !b4
  db 48
  !b4
  !b4
  !b4
  db 12
  !b4
  !b4
  db 48
  !b4
  db 24
  !b4
  !instr,!instr24
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 48
  !e4
  !instr,!instr21
  !pan,10
  !volume,127
  ;!addmusicFA_amplify,0
  db 96
  !b4
  !b4
  !b4
  !b4
  !b4
  !b4
  db 48
  !b4
  db 12
  !b4
  !b4
  db 24
  !b4
  !b4
  db 12
  !b4
  !b4
  !end

.sub3558
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  db 48
  !gs5
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 12
  !c5
  !c5
  db 24
  !c5
  db 48
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  db 24
  !gs5
  !end

.sub358B
  !instr,!instr1E
  !pan,10
  !volume,147
  ;!addmusicFA_amplify,0
  db 24,$7F
  !c5
  !instr,!instr1F
  !pan,11
  !volume,98
  ;!addmusicFA_amplify,0
  !gs5
  !end

.sub35A2
  db 96,$6F
  !rest
  !tie
  !end

.sub35A7
  db 96,$6F
  !rest
  !tie
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
