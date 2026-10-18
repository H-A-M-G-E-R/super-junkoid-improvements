asar 1.91
norom : org 0
incsrc "../../defines.asm"

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
  db !sample1D,$9F,$F4,$B8,$15,$00
  db !sample1E,$FF,$F4,$B8,$08,$00
  db !sample1F,$FF,$F6,$B8,$09,$00
  db !sample20,$FF,$FC,$B8,$0B,$00
  db !sample20,$FD,$FB,$B8,$0A,$D0
  db !sample20,$FF,$F5,$B8,$0A,$40
  db !sample21,$9F,$F2,$B8,$0A,$00
  db !sample21,$9F,$F3,$B8,$0A,$00
  db !sample14,$FF,$EC,$B8,$02,$68
  db !sample15,$A9,$E9,$B8,$04,$00
  db !sample16,$FF,$EA,$B8,$04,$00
  db !sample17,$FF,$EC,$B8,$03,$F0
  db !sample18,$FF,$A0,$B8,$08,$03
  db !sample19,$AF,$6F,$B8,$03,$00
  db !sample1A,$FA,$E0,$B8,$01,$E8
  db !sample1B,$9F,$E0,$B8,$04,$00
  db !sample1C,$AF,$CF,$B8,$05,$C0
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+2259
  dw Sample15,Sample15+567
  dw Sample16,Sample16+27
  dw Sample17,Sample17+1107
  dw Sample18,Sample18+27
  dw Sample19,Sample19+216
  dw Sample1A,Sample1A+9
  dw Sample1B,Sample1B+54
  dw Sample1C,Sample1C+1845
  dw Sample1D,Sample1D+909
  dw Sample1E,Sample1E+1278
  dw Sample1F,Sample1F+684
  dw Sample20,Sample20+234
  dw Sample21,Sample21+909
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "Scarlet Piano 3+.brr":2..0
  Sample15: incbin "RS1 Oboe.brr":2..0
  Sample16: incbin "Ken Pulse Wave.brr":2..0
  Sample17: incbin "Rudra Sawtooth.brr":2..0
  Sample18: incbin "MM7 Pulse 50%.brr":2..0
  Sample19: incbin "Kirb Clarinet.brr":2..0
  Sample1A: incbin "Wind String Ens.brr":2..0
  Sample1B: incbin "EB Elec Piano.brr":2..0
  Sample1C: incbin "S3 Slap Bass II.brr":2..0
  Sample1D: incbin "Yasui Snare.brr":2..0
  Sample1E: incbin "DNB Bass Drum.brr":2..0
  Sample1F: incbin "S-550 LA Tom.brr":2..0
  Sample20: incbin "TR-909 Hi-Hat.brr":2..0
  Sample21: incbin "R-8 Crash Cym.brr":2..0

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
  !echo,%10111100,58,-59
  !echoParameters,5,170,0
  !setDPMiscCommand,!noteEndInTicks,1
  !musicTranspose,254
  !musicVolume,100
  !tempo,60
  !subtranspose,0
  !endVibrato
  !amplify,66
  !instr,!instr1F
  !volume,215
  !pan,10
  db 24,$7F
  !d4
  !rest
  db 12
  !d4
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !loop : dw .sub3B5E : db 14
  !loop : dw .sub3B63 : db 1
  !loop : dw .sub3B79 : db 1
  !loop : dw .sub3B98 : db 2
  !loop : dw .sub3BB9 : db 1
  !loop : dw .sub3B98 : db 3
  !loop : dw .sub3BDB : db 1
.pattern1_0:
  !instr,!instr1F
  !volume,215
  !pan,10
  !loop : dw .sub3BEF : db 3
  !loop : dw .sub3C08 : db 1
  !loop : dw .sub3BEF : db 3
  db 24,$7F
  !d4
  db 24,$7D
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !d4
  db 12
  !d4
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !loop : dw .sub3BEF : db 3
  !loop : dw .sub3C08 : db 1
  !loop : dw .sub3BEF : db 3
  db 24,$7F
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  db 12
  !d4
  db 24
  !d4
  db 12
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !loop : dw .sub3C1D : db 1
  !loop : dw .sub3BEF : db 2
  !loop : dw .sub3C08 : db 1
  !loop : dw .sub3BEF : db 3
  db 24,$7F
  !d4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  db 12
  !d4
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !loop : dw .sub3C1D : db 1
  !loop : dw .sub3BEF : db 2
  !loop : dw .sub3C08 : db 1
  !loop : dw .sub3BEF : db 3
  db 12,$7F
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  db 24
  !d4
  !d4
  db 12
  !d4
  !d4
  !loop : dw .sub3C38 : db 1
  db 24,$7F
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  db 12
  !d4
  !d4
  !loop : dw .sub3C38 : db 1
  db 12,$7F
  !d4
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  db 24
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  db 12
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !d4
  db 12
  !d4
  !d4
  !loop : dw .sub3C60 : db 1
  db 24,$7F
  !d4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !d4
  db 24
  !d4
  db 12
  !d4
  !d4
  !loop : dw .sub3C60 : db 1
  db 12,$7F
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  db 24
  !d4
  db 12
  !d4
  db 24
  !d4
  db 12
  !d4
  !d4
  !d4
  !d4
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !loop : dw .sub3C85 : db 1
  !loop : dw .sub3CA4 : db 2
  !loop : dw .sub3CB5 : db 1
  !loop : dw .sub3CA4 : db 3
  !loop : dw .sub3CC8 : db 1
  !loop : dw .sub3CA4 : db 3
  !loop : dw .sub3CB5 : db 1
  !loop : dw .sub3CA4 : db 3
  !loop : dw .sub3CDB : db 1
  !loop : dw .sub3CA4 : db 3
  !loop : dw .sub3CB5 : db 1
  !loop : dw .sub3CA4 : db 3
  !loop : dw .sub3CC8 : db 1
  !loop : dw .sub3CA4 : db 3
  !loop : dw .sub3CB5 : db 1
  !loop : dw .sub3CA4 : db 2
  !loop : dw .sub3CEE : db 1
  !instr,!instr1F
  !volume,215
  !pan,10
  !loop : dw .sub3C85 : db 1
  !loop : dw .sub3CA4 : db 2
  !loop : dw .sub3CB5 : db 1
  !loop : dw .sub3CA4 : db 3
  !loop : dw .sub3CC8 : db 1
  !loop : dw .sub3CA4 : db 3
  !loop : dw .sub3CB5 : db 1
  !loop : dw .sub3CA4 : db 3
  !loop : dw .sub3CDB : db 1
  !loop : dw .sub3CA4 : db 3
  !loop : dw .sub3CB5 : db 1
  !loop : dw .sub3CA4 : db 3
  !loop : dw .sub3CC8 : db 1
  !loop : dw .sub3CA4 : db 1
  !loop : dw .sub3CC8 : db 1
  !loop : dw .sub3CA4 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !d4
  db 12
  !d4
  !d4
  !loop : dw .sub3CEE : db 1
  db 8,$7F
  !d4
  !d4
  !d4
  !subloop,0
  db 12,$7F
  !d4
  !subloop,5
  !instr,!instr1F
  !volume,215
  !pan,10
  !loop : dw .sub3B5E : db 14
  !loop : dw .sub3B63 : db 1
  !loop : dw .sub3B79 : db 1
  !loop : dw .sub3B98 : db 2
  !loop : dw .sub3BB9 : db 1
  !loop : dw .sub3B98 : db 3
  !loop : dw .sub3BDB : db 1
  !end

.pattern0_1
  !subtranspose,0
  !endVibrato
  db 12,$7F
  !rest
  !instr,!instr20
  !volume,255
  !pan,13
  !d6
  !d6
  !pan,12
  !d6
  !as5
  !pan,11
  !as5
  !pan,9
  !f5
  !pan,7
  !f5
  !subtranspose,58
  !instr,!instr2E
  !volume,215
  !pan,10
  !loop : dw .sub3F90 : db 1
  db 24,$7F
  !ds5
  !gs4
  !ds5
  !loop : dw .sub3F90 : db 1
  !loop : dw .sub3FA0 : db 1
  !loop : dw .sub3FA9 : db 1
  !transpose,254
  !loop : dw .sub3FA9 : db 1
  !transpose,252
  !loop : dw .sub3FA9 : db 1
  !transpose,0
  !loop : dw .sub3FB3 : db 2
  !loop : dw .sub3FA9 : db 1
  !transpose,254
  !loop : dw .sub3FA9 : db 1
  !transpose,252
  !loop : dw .sub3FA9 : db 1
  !transpose,0
  !loop : dw .sub3FBA : db 1
.pattern1_1:
  !loop : dw .sub3FC5 : db 2
  !transpose,254
  !loop : dw .sub3FC5 : db 2
  !transpose,0
  db 24,$7F
  !e4
  !a4
  !e5
  !a4
  !e4
  !a4
  !e5
  !a5
  !a4
  !e5
  !a5
  !e5
  !a4
  !e5
  !b4
  !fs5
  !loop : dw .sub3FC5 : db 2
  db 24,$7F
  !fs4
  !ds5
  !b5
  !ds5
  !fs4
  !ds5
  !b5
  !cs6
  !transpose,3
  !loop : dw .sub3FC5 : db 3
  !transpose,0
  db 24,$7F
  !b4
  db 12
  !cs6
  !cs6
  !gs5
  !gs5
  !cs5
  !cs5
  db 24
  !cs5
  db 12
  !gs5
  !gs5
  db 24
  !cs6
  !gs5
  !cs5
  !gs5
  db 12
  !cs6
  !cs6
  db 24
  !gs5
  !b4
  db 12
  !fs5
  !fs5
  db 24
  !b5
  !fs5
  !b4
  !fs5
  db 12
  !b5
  !b5
  db 24
  !cs6
  !loop : dw .sub3FCC : db 1
  db 24,$7F
  !e5
  db 12
  !a5
  !a5
  db 24
  !e5
  !loop : dw .sub3FCC : db 1
  db 24,$7F
  !a5
  db 12
  !gs4
  !gs4
  !gs5
  !gs5
  db 24
  !gs4
  db 12
  !cs5
  !cs5
  db 24
  !gs5
  !cs5
  !gs4
  !cs5
  db 12
  !gs5
  !gs5
  db 24
  !cs5
  !b4
  db 12
  !ds5
  !ds5
  db 24
  !b5
  !ds5
  !b4
  !ds5
  db 12
  !b5
  !b5
  db 24
  !cs6
  !loop : dw .sub3FD7 : db 1
  db 24,$7F
  !e5
  db 12
  !b5
  !b5
  db 24
  !e5
  !loop : dw .sub3FD7 : db 1
  db 12,$7F
  !e6
  !e6
  !b5
  !b5
  !e5
  !e5
  !loop : dw .sub3FE2 : db 1
  db 24,$7F
  !fs5
  !fs5
  !transpose,254
  !loop : dw .sub3FE2 : db 1
  !transpose,0
  db 24,$7F
  !gs5
  !gs5
  !transpose,253
  !loop : dw .sub3FE2 : db 1
  !transpose,0
  db 24,$7F
  !fs5
  !fs5
  !transpose,251
  !loop : dw .sub3FE2 : db 1
  !transpose,0
  db 24,$7F
  !cs5
  !b4
  !subloop,0
  db 24,$7F
  !a4
  !subloop,4
  db 24,$7F
  !b4
  !b4
  !b4
  !subloop,0
  db 24,$7F
  !gs4
  !subloop,5
  db 24,$7F
  !a4
  !a4
  !subloop,0
  db 24,$7F
  !as4
  !subloop,4
  db 24,$7F
  !b4
  !cs5
  !cs5
  !c5
  !c5
  !c5
  !c5
  db 12
  !c5
  !ds5
  !gs5
  !c6
  !gs5
  !ds5
  !gs5
  !c5
  !loop : dw .sub3FF5 : db 2
  !transpose,254
  !loop : dw .sub3FF5 : db 2
  !transpose,252
  !loop : dw .sub3FF5 : db 2
  !transpose,0
  !loop : dw .sub4000 : db 1
  !loop : dw .sub4013 : db 2
  !loop : dw .sub401E : db 2
  !loop : dw .sub4029 : db 2
  !loop : dw .sub4034 : db 1
  db 12,$7F
  !ds5
  !a5
  !cs6
  !ds5
  !a5
  !c6
  !ds6
  !c6
  !loop : dw .sub3FF5 : db 2
  !transpose,254
  !loop : dw .sub3FF5 : db 2
  !transpose,252
  !loop : dw .sub3FF5 : db 2
  !transpose,0
  !loop : dw .sub4000 : db 1
  !loop : dw .sub4013 : db 2
  !loop : dw .sub401E : db 2
  !loop : dw .sub4029 : db 2
  !loop : dw .sub4034 : db 1
  db 12,$7F
  !c5
  !gs5
  !ds5
  !ds5
  !gs5
  !gs5
  !c5
  !c5
  !loop : dw .sub3F90 : db 1
  db 24,$7F
  !ds5
  !gs4
  !ds5
  !loop : dw .sub3F90 : db 1
  !loop : dw .sub3FA0 : db 1
  !loop : dw .sub3FA9 : db 1
  !transpose,254
  !loop : dw .sub3FA9 : db 1
  !transpose,252
  !loop : dw .sub3FA9 : db 1
  !transpose,0
  !loop : dw .sub3FB3 : db 2
  !loop : dw .sub3FA9 : db 1
  !transpose,254
  !loop : dw .sub3FA9 : db 1
  !transpose,252
  !loop : dw .sub3FA9 : db 1
  !transpose,0
  !loop : dw .sub3FBA : db 1
  !end

.pattern0_2
  !subtranspose,58
  db 96,$7F
  !rest
  !instr,!instr26
  !volume,240
  !vibrato,24,12,63
  !pan,9
  !loop : dw .sub403F : db 3
  !loop : dw .sub4049 : db 1
  !loop : dw .sub403F : db 3
  db 96,$7F
  !c5
  !loop : dw .sub403F : db 3
  !loop : dw .sub4049 : db 1
  !loop : dw .sub403F : db 3
  !loop : dw .sub4050 : db 1
.pattern1_2:
  !instr,!instr27
  !volume,255
  !vibrato,32,9,56
  db 96,$7F
  !cs5
  !loop : dw .sub405B : db 1
  db 96,$7F
  !cs5
  !tie
  !tie
  db 24
  !tie
  !cs5
  !e5
  !ds5
  db 72
  !cs5
  db 24
  !cs5
  db 48
  !gs5
  db 24
  !fs5
  !loop : dw .sub406A : db 1
  db 96,$7F
  !gs5
  !tie
  !tie
  db 48
  !tie
  db 24
  !e5
  !ds5
  db 96
  !cs5
  !loop : dw .sub405B : db 1
  db 96,$7F
  !cs5
  !tie
  !tie
  db 24
  !tie
  !cs5
  !e5
  !ds5
  db 96
  !cs5
  db 24
  !gs5
  !gs5
  !fs5
  !gs5
  db 72
  !ds5
  db 48
  !b5
  db 24
  !gs5
  db 48
  !fs5
  db 96
  !gs5
  !tie
  !tie
  db 48
  !tie
  !adsrGain,$7F,$F2
  !tie
  !instr,!instr28
  !volume,255
  !vibrato,24,12,68
  !remoteCode : dw .remoteCode3B53 : db -1,0
  !remoteCode : dw .remoteCode3B56 : db 3,0
  db 12
  !a5
  db 24
  !rest
  !loop : dw .sub4076 : db 1
  !loop : dw .sub4099 : db 1
  db 12,$7F
  !cs5
  db 24
  !rest
  db 12
  !cs5
  !rest
  !pan,9
  !a5
  db 24
  !rest
  !loop : dw .sub4076 : db 1
  db 12,$7F
  !gs5
  !rest
  !gs5
  !rest
  !as5
  db 24
  !rest
  db 12,$7E
  !as5
  db 24
  !rest
  db 12,$7F
  !b5
  db 24
  !rest
  db 12,$7E
  !b5
  db 24
  !rest
  db 12,$7F
  !cs6
  !rest
  !cs6
  !rest
  db 24
  !ds6
  !ds6
  !ds6
  !e6
  !e6
  !e6
  db 48
  !fs6
  !remoteCode : dw .remoteCode3B53 : db 0,0
  !remoteCode : dw .remoteCode3B56 : db 0,0
  !instr,!instr29
  !volume,240
  !vibrato,22,10,50
  !pan,9
  db 96
  !gs6
  db 36
  !e7
  !ds7
  db 24
  !e7
  db 72
  !gs6
  db 12
  !b6
  !cs7
  db 36
  !e7
  !ds7
  db 24
  !e7
  db 48
  !fs7
  !e7
  !ds7
  !e7
  db 96
  !gs6
  !tie
  !a6
  db 36
  !a6
  !gs6
  db 24
  !fs6
  db 96
  !gs6
  db 36
  !e6
  !gs6
  db 24
  !e6
  db 96
  !fs6
  db 36
  !fs6
  !gs6
  db 24
  !fs6
  db 84
  !ds6
  db 24
  !ds6
  db 12
  !e6
  !fs6
  !c7
  !fs6
  !fs6
  !ds6
  !fs6
  db 96
  !gs6
  db 36
  !e7
  !ds7
  db 24
  !e7
  db 96
  !gs6
  db 36
  !e7
  !ds7
  db 24
  !e7
  db 48
  !fs7
  !e7
  db 36
  !ds7
  !e7
  db 24
  !ds7
  db 96
  !gs6
  !tie
  !a6
  db 36
  !a6
  !gs6
  db 24
  !fs6
  db 48
  !gs6
  !e6
  db 72
  !cs6
  db 12
  !cs6
  !e6
  db 96
  !fs6
  db 36
  !fs6
  !gs6
  db 24
  !fs6
  db 84
  !ds6
  db 24
  !ds6
  db 12
  !ds6
  !fs6
  !c6
  !ds6
  !fs6
  !c6
  !fs6
  !instr,!instr2A
  !volume,235
  !vibrato,32,10,47
  !pan,10
  !loop : dw .sub40C5 : db 3
  !loop : dw .sub40DA : db 1
  db 12,$7F
  !fs5
  !fs5
  !loop : dw .sub40C5 : db 3
  db 48,$7F
  !c5
  db 24,$79
  !c5
  db 24,$76
  !c5
  !instr,!instr26
  !volume,240
  !vibrato,24,12,63
  !pan,9
  !loop : dw .sub403F : db 3
  !loop : dw .sub4049 : db 1
  !loop : dw .sub403F : db 3
  !loop : dw .sub4050 : db 1
  !end

.pattern0_3
  !subtranspose,58
  db 96,$7F
  !rest
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  !pan,7
  !cs5
  !b4
  !a4
  !c5
  !gs4
  !fs4
  !a4
  db 48
  !c5
  !tie
  !instr,!instr26
  !volume,240
  !vibrato,24,12,63
  !pan,11
  !loop : dw .sub40E3 : db 3
  !loop : dw .sub40ED : db 1
  !loop : dw .sub40E3 : db 3
  db 48,$7E
  !c6
  !adsrGain,$7F,$F2
  !tie
.pattern1_3:
  !subtranspose,0
  !endVibrato
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  db 84,$7F
  !ds5
  !amplify,0
  !subtranspose,58
  !instr,!instr27
  !volume,255
  !vibrato,32,9,56
  !volume,160
  !pan,10
  db 60
  !cs5
  !loop : dw .sub405B : db 1
  db 96,$7F
  !cs5
  db 48
  !tie
  !instr,!instr2B
  !volume,210
  !pan,11
  !gs6
  !fs6
  db 48,$7E
  !gs6
  db 24
  !b6
  db 48
  !gs6
  !dynamicVolume,255,13
  db 24
  !b6
  !fs6
  !gs6
  !e6
  !fs6
  !ds6
  !e6
  db 48
  !cs6
  !dynamicVolume,0,0
  !instr,!instr27
  !volume,255
  !vibrato,32,9,56
  !volume,160
  !pan,10
  !loop : dw .sub406A : db 1
  db 120,$7F
  !gs5
  !instr,!instr2B
  !volume,210
  !pan,11
  db 48
  !e7
  db 48,$7E
  !ds7
  db 24,$7D
  !cs7
  db 48,$7C
  !b6
  db 24,$7B
  !cs7
  !instr,!instr27
  !volume,255
  !vibrato,32,9,56
  !pan,12
  db 96,$7C
  !gs4
  db 48
  !e5
  db 24
  !ds5
  !e5
  db 72
  !gs4
  db 48
  !e5
  db 24
  !e5
  !ds5
  !e5
  db 96
  !a4
  !tie
  !tie
  db 24
  !tie
  !a4
  !b4
  !b4
  db 96
  !gs4
  db 24
  !cs5
  !cs5
  !cs5
  !cs5
  db 72
  !b4
  db 48
  !gs5
  db 24
  !ds5
  db 48
  !ds5
  db 96
  !e5
  !tie
  !tie
  db 12
  !tie
  !instr,!instr28
  !volume,255
  !vibrato,24,12,68
  !pan,9
  !remoteCode : dw .remoteCode3B53 : db -1,0
  !remoteCode : dw .remoteCode3B56 : db 3,0
  db 12,$5B
  !gs5
  db 12,$5C
  !gs5
  db 12,$5D
  !gs5
  db 12,$5E
  !gs5
  !gs5
  db 12,$5F
  !gs5
  !gs5
  !instr,!instr2D
  !volume,170
  !pan,7
  !remoteCode : dw .remoteCode3B53 : db -1,0
  !remoteCode : dw .remoteCode3B5A : db 3,0
  !loop : dw .sub40F4 : db 1
  db 12,$7D
  !cs5
  db 24
  !rest
  db 12,$7F
  !cs5
  !rest
  !cs5
  !rest
  !cs5
  db 24
  !rest
  db 12,$7D
  !cs5
  db 24
  !rest
  db 12,$7B
  !cs5
  !rest
  db 12,$7F
  !c5
  db 24
  !rest
  db 12,$7D
  !ds5
  db 24
  !rest
  db 12,$7B
  !fs5
  !rest
  db 12,$7F
  !e5
  db 24
  !rest
  db 12,$7D
  !e5
  db 24
  !rest
  db 12,$7B
  !e5
  !rest
  db 12,$7F
  !e5
  db 24
  !rest
  db 12,$7D
  !e5
  db 24
  !rest
  db 12,$7B
  !e5
  !rest
  !instr,!instr28
  !volume,255
  !vibrato,24,12,68
  !pan,12
  !remoteCode : dw .remoteCode3B53 : db -1,0
  !remoteCode : dw .remoteCode3B56 : db 3,0
  db 12,$7D
  !fs5
  db 24
  !rest
  db 12,$7C
  !fs5
  db 24
  !rest
  db 12,$7B
  !fs5
  !rest
  db 36,$7D
  !fs5
  !gs5
  db 24
  !fs5
  db 12
  !e5
  db 24
  !rest
  db 12,$7C
  !e5
  db 24
  !rest
  db 12,$7D
  !ds5
  db 24
  !rest
  db 12,$7C
  !ds5
  db 24
  !rest
  db 12,$7D
  !e5
  !rest
  !e5
  !rest
  !fs5
  db 24
  !rest
  db 12,$7C
  !fs5
  db 24
  !rest
  db 12,$7B
  !gs5
  db 24
  !rest
  db 12,$7C
  !gs5
  db 24
  !rest
  db 12,$7D
  !as5
  !rest
  !as5
  !rest
  db 24
  !c6
  !c6
  !c6
  !cs6
  !cs6
  !cs6
  db 48
  !ds6
  !remoteCode : dw .remoteCode3B53 : db 0,0
  !remoteCode : dw .remoteCode3B56 : db 0,0
  !instr,!instr29
  !volume,240
  !vibrato,22,10,50
  !pan,12
  db 72,$7D
  !e6
  db 12
  !e6
  !fs6
  db 36
  !gs6
  !fs6
  db 24
  !gs6
  db 72
  !ds6
  db 12
  !e6
  !fs6
  db 36
  !gs6
  !gs6
  db 24
  !gs6
  !ds7
  !fs6
  !cs7
  !e6
  !b6
  !ds6
  !cs7
  !e6
  db 96
  !e6
  db 60
  !tie
  db 12
  !cs6
  !ds6
  !e6
  db 96
  !fs6
  db 36
  !fs6
  !e6
  db 24
  !ds6
  db 96
  !e6
  db 36
  !cs6
  !cs6
  db 12
  !cs6
  !b5
  db 96
  !as5
  db 36
  !as5
  !b5
  db 24
  !cs6
  db 84
  !c6
  db 24
  !c6
  db 12
  !c6
  !ds6
  !fs6
  !ds6
  !e6
  !c6
  !ds6
  db 72
  !e6
  db 12
  !cs6
  !ds6
  db 24
  !gs6
  db 12
  !ds6
  db 24
  !fs6
  db 12
  !ds6
  db 24
  !gs6
  db 36
  !ds6
  db 24
  !ds6
  db 12
  !e6
  !fs6
  !ds6
  db 24
  !gs6
  db 12
  !fs6
  db 24
  !gs6
  db 12
  !fs6
  !gs6
  !fs6
  db 24
  !ds7
  !fs6
  !cs7
  !e6
  !b6
  db 12
  !e6
  db 36
  !cs7
  db 12
  !b6
  !gs6
  db 72
  !e6
  db 12
  !gs5
  !e6
  !ds6
  !e6
  !ds6
  !e6
  !cs6
  !ds6
  !gs5
  !cs6
  db 72
  !fs6
  db 12
  !ds6
  !e6
  db 36
  !fs6
  !e6
  db 24
  !ds6
  db 48
  !e6
  !cs6
  db 96
  !gs5
  db 72
  !as5
  db 12
  !fs5
  !gs5
  db 36
  !as5
  !b5
  db 24
  !cs6
  db 84
  !c6
  db 24
  !c6
  db 12
  !cs6
  !c6
  !gs5
  !fs5
  !gs5
  !fs5
  !gs5
  !instr,!instr2D
  !volume,170
  !pan,7
  !remoteCode : dw .remoteCode3B53 : db -1,0
  !remoteCode : dw .remoteCode3B5A : db 3,0
  !loop : dw .sub411C : db 1
  !transpose,255
  !loop : dw .sub411C : db 1
  !transpose,253
  !loop : dw .sub411C : db 1
  !transpose,255
  !loop : dw .sub411C : db 1
  !transpose,0
  !remoteCode : dw .remoteCode3B53 : db 0,0
  !remoteCode : dw .remoteCode3B56 : db 0,0
  !instr,!instr2A
  !volume,235
  !vibrato,32,10,47
  !pan,10
  !subloop,0
  db 12,$7C
  !gs4
  db 12,$76
  !gs4
  db 12,$7C
  !e5
  !ds5
  !e5
  db 12,$76
  !e5
  db 12,$7C
  !gs4
  db 12,$76
  !gs4
  !subloop,2
  db 48,$7C
  !gs4
  db 24,$76
  !gs4
  !instr,!instr26
  !volume,240
  !vibrato,24,12,63
  !pan,11
  db 12,$7E
  !e5
  !fs5
  !loop : dw .sub40E3 : db 3
  !loop : dw .sub40ED : db 1
  !loop : dw .sub40E3 : db 3
  db 48,$7E
  !c6
  !adsrGain,$7F,$F2
  !tie
  !end

.pattern0_4
  !subtranspose,58
  db 96,$7F
  !rest
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  !pan,13
  !e5
  !ds5
  !cs5
  !ds5
  !cs5
  !b4
  !cs5
  !ds5
  !loop : dw .sub4127 : db 1
.pattern1_4:
  db 96,$7F
  !cs5
  !tie
  db 96
  !b4
  !tie
  db 96
  !cs5
  !tie
  !tie
  !ds5
  db 96
  !e5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !e5
  !tie
  !tie
  db 48
  !tie
  !ds5
  db 96
  !cs5
  !tie
  db 96
  !b4
  !tie
  db 96
  !cs5
  !tie
  !tie
  !b4
  db 96
  !cs5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !e5
  !tie
  !tie
  !tie
  !instr,!instr2D
  !volume,170
  !loop : dw .sub4132 : db 1
  db 12,$7D
  !e5
  db 24
  !rest
  db 12,$7F
  !e5
  !rest
  !e5
  !rest
  !ds5
  db 24
  !rest
  db 12,$7D
  !ds5
  db 24
  !rest
  db 12,$7B
  !ds5
  !rest
  !ds5
  db 24
  !rest
  db 12,$7D
  !fs5
  db 24
  !rest
  db 12,$7B
  !gs5
  !rest
  db 12,$7F
  !gs5
  db 24
  !rest
  db 12,$7D
  !gs5
  db 24
  !rest
  db 12,$7B
  !gs5
  !rest
  !gs5
  db 24
  !rest
  db 12,$7D
  !gs5
  db 24
  !rest
  db 12,$7B
  !gs5
  !rest
  !loop : dw .sub4132 : db 1
  db 12,$7D
  !e5
  !rest
  db 12,$7F
  !e5
  db 24
  !rest
  db 12
  !e5
  !rest
  !fs5
  db 24
  !rest
  db 12,$7D
  !fs5
  db 24
  !rest
  db 12,$7B
  !fs5
  db 24
  !rest
  db 12,$7F
  !g5
  db 24
  !rest
  db 12,$7D
  !g5
  !rest
  db 12,$7F
  !g5
  !g5
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  db 72
  !ds5
  !fs5
  !instr,!instr29
  !volume,240
  !vibrato,22,10,50
  !pan,9
  db 24
  !e6
  !fs6
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  !pan,13
  db 96
  !e5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !fs5
  !tie
  db 96
  !e5
  !tie
  db 96
  !fs5
  !tie
  db 96
  !e5
  !tie
  db 96
  !fs5
  !tie
  db 72
  !ds5
  db 120
  !fs5
  db 96
  !e5
  !gs5
  !fs5
  !ds5
  db 48
  !e5
  !ds5
  !cs5
  !ds5
  db 96
  !e5
  !tie
  db 96
  !fs5
  !tie
  db 96
  !e5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !fs5
  !tie
  !instr,!instr2D
  !volume,170
  !subloop,0
  !loop : dw .sub415A : db 1
  !transpose,254
  !loop : dw .sub415A : db 1
  !transpose,252
  !loop : dw .sub415A : db 1
  !transpose,254
  !loop : dw .sub415A : db 1
  !transpose,0
  !subloop,1
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  !loop : dw .sub4127 : db 1
  !end

.pattern0_5
  !remoteCode : dw .remoteCode3B53 : db -1,0
  !remoteCode : dw .remoteCode3B5A : db 3,0
  !subtranspose,58
  db 96,$7F
  !rest
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  !pan,11
  !gs4
  !fs4
  !e4
  !gs4
  !e4
  !ds4
  !e4
  !fs4
  !loop : dw .sub4171 : db 1
.pattern1_5:
  db 96,$7F
  !e4
  !tie
  db 96
  !ds4
  !tie
  db 96
  !e4
  !tie
  !tie
  !fs4
  db 96
  !gs4
  !tie
  db 96
  !fs4
  !tie
  db 96
  !gs4
  !tie
  !tie
  !tie
  db 96
  !e4
  !tie
  db 96
  !ds4
  !tie
  db 96
  !e4
  !tie
  !tie
  !tie
  !tie
  !tie
  db 96
  !fs4
  !tie
  db 96
  !gs4
  !tie
  !tie
  !tie
  !instr,!instr2D
  !volume,170
  !loop : dw .sub417C : db 1
  db 12,$7F
  !b4
  db 24
  !rest
  db 12,$7D
  !b4
  db 24
  !rest
  db 12,$7B
  !b4
  db 24
  !rest
  db 12,$7D
  !b4
  db 24
  !rest
  db 12,$7F
  !b4
  !rest
  !b4
  !rest
  !as4
  db 24
  !rest
  db 12,$7D
  !as4
  db 24
  !rest
  db 12,$7B
  !as4
  !rest
  db 12,$7F
  !gs4
  db 24
  !rest
  db 12,$7D
  !c5
  db 24
  !rest
  db 12,$7B
  !c5
  !rest
  !subloop,0
  db 12,$7F
  !b4
  db 24
  !rest
  db 12,$7D
  !b4
  db 24
  !rest
  db 12,$7B
  !b4
  !rest
  !subloop,1
  !loop : dw .sub417C : db 1
  db 12,$7F
  !gs4
  db 24
  !rest
  db 12,$7D
  !gs4
  db 24
  !rest
  db 12,$7B
  !gs4
  db 24
  !rest
  db 12,$7D
  !gs4
  !rest
  db 12,$7F
  !gs4
  db 24
  !rest
  db 12
  !gs4
  !rest
  !as4
  db 24
  !rest
  db 12,$7D
  !as4
  db 24
  !rest
  db 12,$7B
  !as4
  db 24
  !rest
  db 12,$7F
  !as4
  db 24
  !rest
  db 12,$7D
  !as4
  !rest
  db 12,$7F
  !as4
  !as4
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  db 72
  !gs4
  !a4
  db 48
  !b4
  db 96
  !gs4
  !tie
  db 96
  !fs4
  !tie
  db 96
  !a4
  !tie
  db 96
  !gs4
  !tie
  db 96
  !a4
  !tie
  db 96
  !gs4
  !tie
  db 96
  !as4
  !tie
  db 72
  !gs4
  !a4
  db 48
  !b4
  db 96
  !gs4
  db 96
  !b4
  !tie
  !gs4
  db 48
  !a4
  !gs4
  !fs4
  db 96
  !gs4
  !tie
  db 48
  !tie
  db 96
  !a4
  !tie
  db 96
  !gs4
  !tie
  db 96
  !fs4
  !tie
  db 96
  !gs4
  !tie
  !instr,!instr2D
  !volume,170
  !subloop,0
  !loop : dw .sub4197 : db 1
  !transpose,254
  !loop : dw .sub4197 : db 1
  !transpose,252
  !loop : dw .sub4197 : db 1
  !transpose,255
  !loop : dw .sub4197 : db 1
  !transpose,0
  !subloop,1
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  !pan,11
  !loop : dw .sub4171 : db 1
  !end

.pattern0_6
  !subtranspose,0
  !endVibrato
  db 96,$7F
  !rest
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub3D01 : db 1
  !loop : dw .sub3D1D : db 1
  !loop : dw .sub3D01 : db 1
  !loop : dw .sub3D36 : db 1
  !loop : dw .sub3D01 : db 1
  !loop : dw .sub3D1D : db 1
  !loop : dw .sub3D01 : db 1
  !loop : dw .sub3D57 : db 1
  !loop : dw .sub3D85 : db 1
  !loop : dw .sub3DBC : db 6
  !loop : dw .sub3DEA : db 1
.pattern1_6:
  !instr,!instr21
  !volume,195
  !pan,9
  !subloop,0
  !loop : dw .sub3E1F : db 1
  !amplify,66
  db 24,$7F
  !d4
  !amplify,0
  !instr,!instr22
  !volume,195
  !pan,11
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub3E1F : db 1
  !amplify,66
  db 24,$7F
  !d4
  !amplify,0
  !instr,!instr23
  !volume,196
  !pan,10
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !subloop,2
  !loop : dw .sub3E1F : db 1
  !amplify,66
  db 24,$7F
  !d4
  !amplify,0
  !instr,!instr22
  !volume,195
  !pan,11
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub3E1F : db 1
  !amplify,66
  db 12,$7F
  !d4
  !amplify,0
  !instr,!instr20
  !volume,255
  !pan,8
  db 24
  !gs5
  !pan,7
  db 12
  !f5
  !loop : dw .sub3E55 : db 1
  !loop : dw .sub3E84 : db 3
  db 24,$7F
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  !d5
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 12
  !d4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  db 24
  !d5
  !loop : dw .sub3E55 : db 1
  !loop : dw .sub3E84 : db 3
  db 12,$7F
  !d5
  !instr,!instr20
  !volume,255
  !pan,13
  !d6
  !pan,12
  !b5
  !pan,11
  !gs5
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  !d4
  !amplify,0
  !instr,!instr20
  !volume,255
  !pan,9
  !b5
  !pan,8
  !gs5
  !pan,7
  !f5
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub3ED7 : db 3
  !loop : dw .sub3EFB : db 2
  !loop : dw .sub3ED7 : db 3
  !loop : dw .sub3EFB : db 2
  !loop : dw .sub3ED7 : db 1
  !loop : dw .sub3F0C : db 1
  !loop : dw .sub3ED7 : db 1
  !subloop,0
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 24,$7F
  !d4
  !amplify,0
  !instr,!instr23
  !volume,196
  !pan,10
  !d5
  !subloop,1
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub3ED7 : db 1
  !loop : dw .sub3F0C : db 1
  db 24,$7F
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  db 12
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  db 24
  !d5
  db 12
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  !d4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr20
  !volume,255
  !pan,13
  !d6
  !d6
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  !d4
  !amplify,0
  !instr,!instr20
  !volume,255
  !pan,11
  !gs5
  !pan,9
  !f5
  !pan,7
  !f5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !ds5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub3F47 : db 14
  !loop : dw .sub3F5A : db 2
  !loop : dw .sub3F47 : db 15
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 12,$7F
  !d4
  !amplify,0
  !instr,!instr20
  !volume,255
  !pan,11
  !b5
  !pan,9
  !gs5
  !pan,7
  !f5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !ds5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub3F47 : db 14
  !loop : dw .sub3F5A : db 2
  !loop : dw .sub3F47 : db 11
  !loop : dw .sub3F6B : db 3
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 12,$7F
  !d4
  !amplify,0
  !instr,!instr20
  !volume,255
  !pan,7
  !d6
  !d6
  !pan,8
  !d6
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  !d4
  !amplify,0
  !instr,!instr20
  !volume,255
  !pan,9
  !b5
  !pan,11
  !gs5
  !pan,13
  !f5
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub3D01 : db 1
  !loop : dw .sub3D1D : db 1
  !loop : dw .sub3D01 : db 1
  !loop : dw .sub3D36 : db 1
  !loop : dw .sub3D01 : db 1
  !loop : dw .sub3D1D : db 1
  !loop : dw .sub3D01 : db 1
  !loop : dw .sub3D57 : db 1
  !loop : dw .sub3D85 : db 1
  !loop : dw .sub3DBC : db 6
  !loop : dw .sub3DEA : db 1
  !end

.pattern0_7
  !remoteCode : dw .remoteCode3B53 : db -1,0
  !remoteCode : dw .remoteCode3B5A : db 3,0
  db 96,$7F
  !rest
  !subtranspose,0
  !endVibrato
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  db 60
  !ds5
  !amplify,0
  !subtranspose,58
  !instr,!instr26
  !volume,240
  !vibrato,24,12,63
  !volume,160
  db 12
  !gs5
  !fs5
  db 24
  !gs5
  !cs5
  !loop : dw .sub403F : db 2
  !loop : dw .sub4049 : db 1
  !loop : dw .sub403F : db 3
  db 36,$7F
  !c5
  !instr,!instr26
  !volume,240
  !vibrato,24,12,63
  !pan,11
  db 12,$7E
  !e5
  !fs5
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  !pan,7
  !loop : dw .sub4165 : db 1
.pattern1_7:
  db 96,$7E
  !gs4
  !tie
  db 96
  !fs4
  !tie
  db 96
  !a4
  !tie
  !tie
  !b4
  db 96
  !cs5
  !tie
  db 96
  !b4
  !tie
  !tie
  !tie
  !tie
  !tie
  db 96
  !gs4
  !tie
  db 96
  !fs4
  !tie
  db 96
  !a4
  !tie
  !tie
  !fs4
  db 96
  !gs4
  !tie
  db 96
  !b4
  !tie
  !tie
  !tie
  !tie
  !tie
  !subtranspose,0
  !endVibrato
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  db 54,$7F
  !ds5
  !amplify,0
  !subtranspose,58
  !instr,!instr28
  !volume,255
  !vibrato,24,12,68
  !volume,150
  !remoteCode : dw .remoteCode3B53 : db -1,0
  !remoteCode : dw .remoteCode3B56 : db 3,0
  !loop : dw .sub4076 : db 1
  !loop : dw .sub4099 : db 1
  db 12,$7F
  !cs5
  db 24
  !rest
  db 6
  !cs5
  !instr,!instr2D
  !volume,170
  !pan,7
  !remoteCode : dw .remoteCode3B53 : db -1,0
  !remoteCode : dw .remoteCode3B5A : db 3,0
  !loop : dw .sub40F4 : db 1
  db 12,$7D
  !cs5
  !rest
  db 12,$7F
  !cs5
  db 24
  !rest
  db 12
  !cs5
  !rest
  !ds5
  db 24
  !rest
  db 12,$7D
  !ds5
  db 24
  !rest
  db 12,$7B
  !ds5
  db 24
  !rest
  db 12,$7F
  !e5
  db 24
  !rest
  db 12,$7D
  !e5
  !rest
  db 12,$7F
  !e5
  !e5
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  db 72
  !c5
  !cs5
  !instr,!instr29
  !volume,240
  !vibrato,22,10,50
  !pan,12
  db 24,$7D
  !cs6
  !ds6
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  !pan,7
  db 96,$7F
  !cs5
  !tie
  db 96
  !b4
  !tie
  db 96
  !cs5
  !tie
  !tie
  !tie
  !tie
  !tie
  db 96
  !b4
  !tie
  db 96
  !ds5
  !tie
  db 72
  !c5
  !cs5
  db 48
  !ds5
  db 96
  !cs5
  !e5
  !ds5
  !b4
  db 48
  !cs5
  !b4
  !a4
  db 96
  !b4
  !tie
  db 48
  !tie
  db 96
  !cs5
  !tie
  db 96
  !b4
  !tie
  db 96
  !as4
  !tie
  !ds5
  !c5
  !subtranspose,0
  !endVibrato
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  db 54
  !ds5
  !amplify,0
  !subtranspose,58
  !instr,!instr2A
  !volume,235
  !vibrato,32,10,47
  !volume,145
  db 12
  !fs5
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !cs5
  db 12,$79
  !cs5
  !loop : dw .sub40C5 : db 2
  !loop : dw .sub40DA : db 1
  db 6,$7F
  !fs5
  !instr,!instr2D
  !volume,170
  !pan,7
  !loop : dw .sub411C : db 1
  !transpose,255
  !loop : dw .sub411C : db 1
  !transpose,253
  !loop : dw .sub411C : db 1
  !transpose,255
  !loop : dw .sub411C : db 1
  !transpose,0
  !instr,!instr2C
  !volume,180
  !vibrato,10,8,31
  !pan,7
  !loop : dw .sub4165 : db 1
  !end

.sub3B63
  db 24,$7F
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  db 12
  !d4
  !d4
  !d4
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3B79
  db 24,$7F
  !d4
  !instr,!instr23
  !volume,196
  !pan,10
  !amplify,0
  !d5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3B98
  db 24,$7F
  !d4
  db 12
  !rest
  !instr,!instr21
  !volume,195
  !pan,9
  !amplify,0
  !d5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3BB9
  db 24,$7F
  !d4
  db 12
  !rest
  !instr,!instr21
  !volume,195
  !pan,9
  !amplify,0
  !d5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !d4
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3BDB
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !d4
  db 12
  !d4
  !d4
  db 8
  !d4
  !d4
  !d4
  db 12
  !d4
  !d4
  !end

.sub3BEF
  !instr,!instr1F
  !volume,215
  !pan,10
  db 24,$7F
  !d4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3C08
  db 24,$7F
  !d4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !d4
  db 12
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3C1D
  db 24,$7F
  !d4
  !instr,!instr22
  !volume,195
  !pan,11
  !amplify,0
  db 12
  !d5
  !d5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !d4
  !end

.sub3C38
  !instr,!instr1F
  !volume,215
  !pan,10
  db 24,$7F
  !d4
  db 48
  !rest
  db 12
  !d4
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !d4
  db 36,$7E
  !d4
  db 24,$7C
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  db 24,$7F
  !d4
  db 48
  !rest
  !end

.sub3C60
  !instr,!instr1F
  !volume,215
  !pan,10
  db 24,$7F
  !d4
  !rest
  !d4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !d4
  db 36,$7E
  !d4
  db 24,$7C
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
.sub3B5E:
  db 24,$7F
  !d4
  !rest
  !end

.sub3C85
  db 12,$7F
  !d4
  !instr,!instr21
  !volume,195
  !pan,9
  !amplify,0
  !d5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3CA4
  db 24,$7F
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3CB5
  db 12,$7F
  !d4
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3CC8
  db 12,$7F
  !d4
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3CDB
  db 12,$7F
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  !d4
  !d4
  !d4
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3CEE
  db 12,$7F
  !d4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !d4
  !subloop,0
  db 12,$7F
  !d4
  !subloop,4
  !end

.sub3F90
  db 24,$7F
  !cs5
  !gs5
  !cs5
  !gs5
  !b4
  !fs5
  !b4
  !fs5
  !a4
  !e5
  !a4
  !e5
  !gs4
  !end

.sub3FA0
  db 12,$7F
  !cs6
  !cs6
  !gs5
  !gs5
  !cs5
  !cs5
  !end

.sub3FA9
  db 24,$7F
  !cs5
  db 12
  !gs5
  !gs5
  db 24
  !cs5
  !gs5
  !end

.sub3FB3
  db 24,$7F
  !gs4
  db 12
  !ds5
  !ds5
  !end

.sub3FBA
  db 12,$7F
  !gs4
  !c5
  !ds5
  !fs5
  !gs5
  !fs5
  !ds5
  !c5
  !end

.sub3FC5
  db 24,$7F
  !gs4
  !cs5
  !gs5
  !cs5
  !end

.sub3FCC
  db 24,$7F
  !a4
  db 12
  !e5
  !e5
  db 24
  !a5
  !e5
  !a4
  !end

.sub3FD7
  db 24,$7F
  !b4
  db 12
  !e5
  !e5
  db 24
  !b5
  !e5
  !b4
  !end

.sub3FE2
  db 24,$7F
  !fs5
  db 24,$7E
  !fs5
  db 24,$7C
  !fs5
  db 24,$7A
  !fs5
  db 24,$7C
  !fs5
  db 24,$7E
  !fs5
  !end

.sub3FF5
  db 12,$7F
  !cs5
  !cs5
  !cs6
  !cs5
  !cs5
  !gs5
  !cs6
  !cs5
  !end

.sub4000
  db 12,$7F
  !gs4
  !gs4
  !gs5
  !gs4
  !gs4
  !e5
  !gs5
  !gs4
  !gs4
  !cs5
  !fs5
  !a5
  !b5
  !a5
  !fs5
  !cs5
  !end

.sub4013
  db 12,$7F
  !a4
  !a4
  !a5
  !a4
  !a4
  !cs5
  !a5
  !a4
  !end

.sub401E
  db 12,$7F
  !gs4
  !gs4
  !gs5
  !gs4
  !gs4
  !b4
  !gs5
  !gs4
  !end

.sub4029
  db 12,$7F
  !as4
  !as4
  !as5
  !as4
  !as4
  !ds4
  !as5
  !as4
  !end

.sub4034
  db 12,$7F
  !c5
  !c5
  !c6
  !c5
  !c5
  !e5
  !c6
  !c5
  !end

.sub403F
  db 24,$7F
  !cs5
  db 12
  !gs5
  !fs5
  db 24
  !gs5
  !cs5
  !end

.sub4049
  db 24,$7F
  !c5
  !cs5
  !ds5
  !fs5
  !end

.sub4050
  db 24,$7F
  !ds5
  db 12
  !ds5
  !e5
  !fs5
  !c6
  !fs5
  !ds5
  !end

.sub405B
  db 48,$7F
  !gs5
  db 24
  !fs5
  !gs5
  db 72
  !cs5
  db 48
  !gs5
  db 24
  !gs5
  !fs5
  !gs5
  !end

.sub406A
  db 24,$7F
  !gs5
  db 72
  !ds5
  db 48
  !b5
  db 24
  !gs5
  db 48
  !fs5
  !end

.sub4076
  db 12,$7E
  !a5
  db 24
  !rest
  db 12,$7D
  !a5
  !rest
  db 36,$7F
  !a5
  !b5
  db 24
  !a5
  db 12
  !gs5
  db 24
  !rest
  db 12,$7E
  !gs5
  db 24
  !rest
  db 12,$7F
  !fs5
  db 24
  !rest
  db 12,$7E
  !fs5
  db 24
  !rest
  !end

.sub4099
  db 12,$7F
  !e5
  !rest
  !e5
  !rest
  !fs5
  db 24
  !rest
  db 12,$7E
  !fs5
  db 24
  !rest
  db 12,$7D
  !fs5
  db 24
  !rest
  db 36,$7F
  !gs5
  db 24
  !e5
  !ds5
  db 12
  !e5
  db 24
  !rest
  db 12,$7E
  !e5
  db 24
  !rest
  db 12,$7F
  !cs5
  !rest
  db 12,$7E
  !cs5
  db 24
  !rest
  !end

.sub40C5
  db 12,$7F
  !cs5
  db 12,$79
  !cs5
  db 12,$7F
  !gs5
  !fs5
  !gs5
  db 12,$79
  !gs5
  db 12,$7F
  !cs5
  db 12,$79
  !cs5
  !end

.sub40DA
  db 12,$7F
  !c5
  !c5
  !cs5
  !cs5
  !ds5
  !ds5
  !end

.sub40E3
  db 24,$7E
  !gs5
  db 12
  !e6
  !ds6
  db 24
  !e6
  !gs5
  !end

.sub40ED
  db 24,$7E
  !fs5
  !gs5
  !c6
  !ds6
  !end

.sub40F4
  db 12,$7F
  !e5
  db 24
  !rest
  db 12,$7D
  !e5
  db 24
  !rest
  db 12,$7B
  !e5
  db 24
  !rest
  db 12,$7D
  !e5
  db 24
  !rest
  db 12,$7F
  !e5
  !rest
  !e5
  !rest
  !cs5
  db 24
  !rest
  db 12,$7D
  !cs5
  db 24
  !rest
  db 12,$7B
  !cs5
  db 24
  !rest
  !end

.sub411C
  db 12,$7D
  !e5
  !e5
  !rest
  !e5
  !e5
  !rest
  !e5
  !e5
  !end

.sub4127
  db 96,$7F
  !e5
  !ds5
  !cs5
  !c5
  !cs5
  !b4
  !cs5
  !ds5
  !end

.sub4132
  db 12,$7F
  !fs5
  db 24
  !rest
  db 12,$7D
  !fs5
  db 24
  !rest
  db 12,$7B
  !fs5
  db 24
  !rest
  db 12,$7D
  !fs5
  db 24
  !rest
  db 12,$7F
  !fs5
  !rest
  !fs5
  !rest
  !e5
  db 24
  !rest
  db 12,$7D
  !e5
  db 24
  !rest
  db 12,$7B
  !e5
  db 24
  !rest
  !end

.sub415A
  db 12,$7F
  !gs5
  !gs5
  !rest
  !gs5
  !gs5
  !rest
  !gs5
  !gs5
  !end

.sub4171
  db 96,$7F
  !gs4
  !fs4
  !e4
  !ds4
  !e4
  !ds4
  !e4
  !fs4
  !end

.sub417C
  db 12,$7F
  !cs5
  db 24
  !rest
  db 12,$7D
  !cs5
  db 24
  !rest
  db 12,$7B
  !cs5
  db 24
  !rest
  db 12,$7D
  !cs5
  db 24
  !rest
  db 12,$7F
  !cs5
  !rest
  !cs5
  !rest
  !end

.sub4197
  db 12,$7F
  !cs5
  !cs5
  !rest
  !cs5
  !cs5
  !rest
  !cs5
  !cs5
  !end

.sub3D01
  db 24,$7F
  !d5
  db 12
  !d5
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  db 24
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub3D1D
  db 24,$7F
  !d5
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub3D36
  db 12,$7F
  !d5
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  db 24
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub3D57
  db 12,$7F
  !d5
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  db 24
  !d5
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 12
  !d4
  !amplify,0
  !instr,!instr20
  !volume,255
  !pan,9
  !b5
  !pan,11
  !gs5
  !pan,13
  !f5
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub3D85
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !ds5
  !amplify,0
  !toggleEcho
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 12
  !d4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  db 24
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub3DBC
  db 24,$7F
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  !d5
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 12
  !d4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  db 24
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub3DEA
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 12,$7F
  !d4
  !amplify,0
  !instr,!instr20
  !volume,255
  !pan,13
  !d6
  !d6
  !pan,12
  !d6
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  !d4
  !amplify,0
  !instr,!instr20
  !volume,255
  !pan,11
  !b5
  !pan,9
  !gs5
  !pan,7
  !f5
  !end

.sub3E1F
  db 24,$7F
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  db 12
  !d5
  !d5
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 24
  !d4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  !d5
  !instr,!instr1F
  !volume,215
  !pan,10
  !end

.sub3E55
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !ds5
  !amplify,0
  !toggleEcho
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 24
  !d4
  !amplify,0
  !instr,!instr22
  !volume,195
  !pan,11
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub3E84
  db 24,$7F
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  !d5
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 12
  !d4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  db 24
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  db 12
  !d5
  !d5
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 24
  !d4
  !amplify,0
  !instr,!instr22
  !volume,195
  !pan,11
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub3ED7
  db 24,$7F
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  db 12
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  db 24
  !d5
  !instr,!instr22
  !volume,195
  !pan,11
  db 12
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  db 24
  !d5
  !end

.sub3EFB
  db 24,$7F
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub3F0C
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 24,$7F
  !d4
  !amplify,0
  !instr,!instr22
  !volume,195
  !pan,11
  db 12
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  !d4
  !amplify,0
  !instr,!instr22
  !volume,195
  !pan,11
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  db 24
  !d5
  !end

.sub3F47
  db 12,$7F
  !d5
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !end

.sub3F5A
  db 12,$7F
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub3F6B
  !instr,!instr1F
  !volume,215
  !pan,10
  !amplify,66
  db 12,$7F
  !d4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !instr,!instr23
  !volume,196
  !pan,10
  !d5
  !instr,!instr21
  !volume,195
  !pan,9
  !d5
  !end

.sub4165
  db 96,$7E
  !cs5
  !b4
  !a4
  db 96
  !gs4
  !tie
  !fs4
  !a4
  !c5
  !end

.remoteCode3B53
  !restoreInstrument
  !end

.remoteCode3B56
  !adsrGain,$7F,$FB
  !end

.remoteCode3B5A
  !adsrGain,$7F,$FA
  !end

assert pc() <= $10000-(5*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
