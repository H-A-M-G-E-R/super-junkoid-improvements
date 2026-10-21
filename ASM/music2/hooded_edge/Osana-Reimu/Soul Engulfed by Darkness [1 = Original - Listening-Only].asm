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

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample1C,$9F,$F5,$B8,$15,$00
  db !sample1D,$CF,$FA,$B8,$15,$00
  db !sample1E,$FF,$F2,$B8,$08,$00
  db !sample1F,$FF,$FC,$B8,$0A,$B0
  db !sample1F,$FF,$F4,$B8,$0A,$B0
  db !sample20,$9F,$F2,$B8,$0A,$00
  db !sample20,$9F,$F3,$B8,$0A,$00
  db !sample14,$AE,$EA,$B8,$04,$02
  db !sample15,$9F,$F0,$B8,$02,$A2
  db !sample16,$FF,$E8,$B8,$02,$E0
  db !sample17,$FF,$A8,$B8,$04,$01
  db !sample18,$FF,$E6,$B8,$04,$01
  db !sample19,$FE,$E0,$B8,$03,$D0
  db !sample1A,$FB,$E0,$B8,$03,$05
  db !sample1B,$FF,$E2,$B8,$05,$C0
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+9
  dw Sample15,Sample15+396
  dw Sample16,Sample16+531
  dw Sample17,Sample17+27
  dw Sample18,Sample18+27
  dw Sample19,Sample19+27
  dw Sample1A,Sample1A+27
  dw Sample1B,Sample1B+1971
  dw Sample1C,Sample1C+909
  dw Sample1D,Sample1D+2034
  dw Sample1E,Sample1E+1809
  dw Sample1F,Sample1F+909
  dw Sample20,Sample20+909
endspcblock

pushpc
org !p_songSpecificData ; sample data
  Sample14: skip filesize("Chrono Pulse-Width Mod.brr")-2
  Sample15: skip filesize("02 SMW @2+3.brr")-2
  Sample16: skip filesize("JV1080 Square.brr")-2
  Sample17: skip filesize("MM7 Pulse 18.75%.brr")-2
  Sample18: skip filesize("MM7 Sawtooth.brr")-2
  Sample19: skip filesize("BDH1 Saw Wave.brr")-2
  Sample1A: skip filesize("Cool String Ens.brr")-2
  Sample1B: skip filesize("Shinobi FM Synth Bass.brr")-2
  Sample1C: skip filesize("Yasui Snare.brr")-2
  Sample1D: skip filesize("DR-660 Kick.brr")-2
  Sample1E: skip filesize("R-8 Tom 2.brr")-2
  Sample1F: skip filesize("Ultima Hi-Hat.brr")-2
  Sample20: skip filesize("R-8 Crash Cym.brr")-2
  NoteLengthTable:
pullpc

spcblock NoteLengthTable nspc
  ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2B04

Tracker2B04:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !echo,%11111000,50,-62
  !echoParameters,5,160,0
  !setDPMiscCommand,!noteEndInTicks,1
  !musicVolume,100
  !tempo,61
  !amplify,15
  !instr,!instr1F
  !volume,250
  db 24,$7F
  !c4
  !rest
  !c4
  !rest
.pattern1_0:
  !instr,!instr1F
  !volume,250
  !loop : dw .sub31DB : db 1
  !loop : dw .sub31FB : db 1
  !loop : dw .sub31DB : db 1
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,250
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,250
  !loop : dw .sub31DB : db 1
  !loop : dw .sub31FB : db 1
  !loop : dw .sub31DB : db 1
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !c4
  !instr,!instr1F
  !volume,250
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  db 24
  !c4
  db 12
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,250
  !loop : dw .sub31DB : db 1
  !loop : dw .sub31FB : db 1
  !loop : dw .sub31DB : db 1
  !loop : dw .sub3225 : db 1
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,250
  !loop : dw .sub31DB : db 1
  !loop : dw .sub31FB : db 1
  !loop : dw .sub31DB : db 1
  !loop : dw .sub3225 : db 1
  !instr,!instr1E
  !volume,255
  db 24,$7F
  !c4
  db 12
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,250
  !loop : dw .sub3244 : db 1
  !loop : dw .sub3262 : db 1
  !loop : dw .sub3244 : db 1
  !loop : dw .sub328A : db 1
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,250
  !loop : dw .sub3244 : db 1
  !loop : dw .sub3262 : db 1
  !loop : dw .sub3244 : db 1
  !loop : dw .sub328A : db 1
  db 12,$7F
  !c4
  !c4
  !instr,!instr1F
  !volume,250
  !loop : dw .sub32A5 : db 1
  !loop : dw .sub3262 : db 1
  db 12,$7F
  !c4
  !c4
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  db 48
  !c4
  !instr,!instr1F
  !volume,250
  db 24
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,250
  !loop : dw .sub32A5 : db 1
  !loop : dw .sub3262 : db 1
  !instr,!instr1E
  !volume,255
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,250
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,250
  !c4
  !instr,!instr1E
  !volume,255
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,250
  !c4
  !loop : dw .sub32E3 : db 5
  !end

.pattern0_1
  !instr,!instr20
  !volume,240
  !pan,13
  db 12,$7F
  !c6
  !pan,11
  !as5
  !pan,9
  !gs5
  !pan,7
  !fs5
  !amplify,15
  !pan,10
  !instr,!instr1E
  !volume,255
  db 24
  !c4
  db 12
  !c4
  !c4
  !toggleEcho
.pattern1_1:
  !loop : dw .sub32EB : db 1
  !loop : dw .sub3306 : db 14
  !toggleEcho
  !loop : dw .sub32EB : db 1
  !loop : dw .sub3306 : db 12
  !toggleEcho
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,175
  db 48,$7F
  !cs5
  !cs5
  !loop : dw .sub32EB : db 1
  !loop : dw .sub3306 : db 14
  !toggleEcho
  !loop : dw .sub32EB : db 1
  !loop : dw .sub3306 : db 10
  !toggleEcho
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,175
  db 72,$7F
  !cs5
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,175
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,240
  !pan,13
  db 12
  !c6
  !pan,12
  !c6
  !c6
  !pan,11
  !as5
  !pan,9
  !gs5
  !pan,7
  !fs5
  !loop : dw .sub3319 : db 1
  !loop : dw .sub333D : db 14
  !loop : dw .sub3319 : db 1
  !loop : dw .sub333D : db 13
  !instr,!instr20
  !volume,240
  !pan,7
  db 12,$7F
  !c6
  !pan,9
  !as5
  !pan,11
  !gs5
  !pan,13
  !fs5
  !subloop,0
  !loop : dw .sub3319 : db 1
  !loop : dw .sub333D : db 6
  !subloop,2
  !loop : dw .sub3319 : db 1
  !loop : dw .sub333D : db 2
  !loop : dw .sub3306 : db 2
  !toggleEcho
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,175
  db 48,$7F
  !cs5
  !cs5
  !end

.pattern0_2
  !subtranspose,111
  db 96,$7F
  !rest
.pattern1_2:
  !instr,!instr2C
  !volume,235
  !subloop,0
  !loop : dw .sub3350 : db 1
  db 24,$7F
  !e5
  !b4
  !e4
  !transpose,252
  !loop : dw .sub3350 : db 1
  !transpose,0
  db 12,$7F
  !c5
  !c5
  !g4
  !g4
  !c4
  !c4
  !subloop,1
  !loop : dw .sub3369 : db 1
  !loop : dw .sub3379 : db 1
  db 24,$7F
  !e4
  !e4
  !b4
  db 12
  !e4
  db 24
  !fs4
  db 12
  !fs4
  db 24
  !fs4
  !d5
  !fs4
  !g4
  !g4
  !e5
  db 12
  !g4
  db 24
  !g4
  db 12
  !g4
  !e5
  !e5
  !g4
  !g4
  db 24
  !e4
  !loop : dw .sub3369 : db 1
  !loop : dw .sub3379 : db 1
  !loop : dw .sub3369 : db 1
  db 24,$7F
  !ds4
  !ds4
  !b4
  db 12
  !ds4
  db 24
  !ds4
  db 12
  !ds4
  db 24
  !ds5
  db 12
  !b4
  !b4
  db 24
  !ds4
  !subloop,0
  !loop : dw .sub3389 : db 2
  !loop : dw .sub3390 : db 1
  !transpose,2
  !loop : dw .sub3389 : db 2
  !loop : dw .sub3390 : db 1
  !transpose,4
  !loop : dw .sub3389 : db 2
  !transpose,0
  db 24,$7F
  !a4
  db 12
  !a4
  db 24
  !c5
  db 12
  !c5
  !e5
  !a4
  !transpose,4
  !loop : dw .sub3389 : db 2
  !transpose,0
  db 12,$7F
  !a4
  !c5
  !e5
  !c5
  !a4
  !c5
  !e5
  !c5
  !subloop,3
  !end

.pattern0_3
  !subtranspose,111
  !remoteCode : dw .remoteCode31D4 : db -1,0
  !remoteCode : dw .remoteCode31D7 : db 3,0
  db 96,$7F
  !rest
.pattern1_3:
  !instr,!instr25
  !volume,220
  !vibrato,16,10,36
  !pan,9
  !loop : dw .sub339C : db 1
  db 18,$7D
  !b4
  !toggleLegato
  !tie
  db 6,$7F
  !e7
  !a6
  !g6
  !fs6
  !toggleLegato
  !loop : dw .sub339C : db 1
  db 36,$7D
  !b4
  !adsrGain,$7F,$F4
  db 24
  !tie
  !instr,!instr26
  !volume,255
  !vibrato,10,12,31
  !amplify,79
  db 96,$7F
  !b6
  db 36
  !e6
  !g6
  db 24
  !b6
  db 12
  !rest
  !loop : dw .sub33EC : db 1
  db 12,$7F
  !e7
  !g6
  !fs6
  !d7
  !e7
  !g6
  !fs6
  !d7
  db 96
  !e7
  db 36
  !g7
  !fs7
  db 24
  !d7
  db 12
  !rest
  !transpose,251
  !loop : dw .sub33EC : db 1
  !transpose,0
  db 16,$7F
  !b6
  !g7
  !fs7
  !a6
  !fs7
  !e7
  db 96
  !b6
  db 36
  !d7
  !d7
  db 24
  !e7
  db 12
  !rest
  !transpose,251
  !loop : dw .sub33EC : db 1
  !transpose,0
  db 16,$7F
  !e6
  !fs6
  !g6
  !a6
  !b6
  !g7
  db 96
  !e7
  db 12
  !rest
  !g6
  !fs6
  !d7
  !e7
  !g6
  !fs6
  !d7
  db 72
  !fs6
  db 48
  !fs6
  !adsrGain,$7F,$F4
  db 24
  !tie
  !instr,!instr27
  !vibrato,22,12,52
  !amplify,47
  db 12
  !e6
  db 12,$79
  !e6
  db 12,$7F
  !g6
  db 12,$79
  !g6
  !loop : dw .sub3402 : db 1
  !loop : dw .sub3442 : db 1
  !loop : dw .sub344B : db 1
  !transpose,244
  !loop : dw .sub3402 : db 1
  !loop : dw .sub3442 : db 1
  !transpose,0
  db 16,$7F
  !a5
  !e5
  !c5
  db 12
  !d6
  !b5
  !c6
  !d6
  !amplify,0
  !instr,!instr28
  !volume,200
  !loop : dw .sub3402 : db 1
  !loop : dw .sub3442 : db 1
  !loop : dw .sub344B : db 1
  !transpose,244
  !loop : dw .sub3402 : db 1
  !transpose,0
  db 96,$7F
  !a6
  db 72
  !tie
  !adsrGain,$7F,$F4
  db 24
  !tie
  !end

.pattern0_4
  !subtranspose,111
  !remoteCode : dw .remoteCode31D4 : db -1,0
  !remoteCode : dw .remoteCode31D7 : db 3,0
  db 96,$7F
  !rest
.pattern1_4:
  !instr,!instr25
  !volume,220
  !vibrato,16,10,36
  !pan,12
  !loop : dw .sub3456 : db 1
  db 18,$7C
  !g4
  !toggleLegato
  !tie
  db 6,$7E
  !c7
  !fs6
  !e6
  !d6
  !toggleLegato
  !loop : dw .sub3456 : db 1
  db 36,$7C
  !g4
  !adsrGain,$7F,$F4
  db 24
  !tie
  !instr,!instr26
  !volume,255
  !vibrato,10,12,31
  !amplify,79
  db 96,$7E
  !g6
  db 36
  !b5
  !e6
  db 24
  !g6
  db 18
  !rest
  !loop : dw .sub34A1 : db 1
  db 12,$7E
  !b6
  !e6
  !d6
  !b6
  !b6
  !e6
  !d6
  !b6
  db 96
  !b6
  db 36
  !e7
  !d7
  db 24
  !b6
  db 18
  !rest
  !transpose,253
  !loop : dw .sub34A1 : db 1
  !transpose,0
  db 16,$7E
  !g6
  !d7
  !d7
  !fs6
  !d7
  !b6
  db 96
  !g6
  db 36
  !fs6
  !fs6
  db 24
  !g6
  db 18
  !rest
  !loop : dw .sub34A1 : db 1
  db 16,$7E
  !b5
  !d6
  !e6
  !fs6
  !g6
  !b6
  db 96
  !g6
  db 12
  !rest
  !e6
  !e6
  !fs6
  !g6
  !e6
  !e6
  !fs6
  db 72
  !ds6
  db 24
  !ds6
  !instr,!instr27
  !vibrato,22,12,52
  !amplify,47
  !toggleLegato
  !pan,16
  db 6,$7D
  !ds7
  !pan,15
  !d7
  !pan,14
  !cs7
  !pan,13
  !c7
  db 6,$7E
  !b6
  !pan,12
  !as6
  !pan,11
  !a6
  !pan,10
  !gs6
  !toggleLegato
  !pan,12
  db 12
  !c6
  db 12,$78
  !c6
  db 12,$7E
  !d6
  db 12,$78
  !d6
  !loop : dw .sub34B7 : db 1
  db 12,$7E
  !e6
  !loop : dw .sub34E6 : db 1
  !loop : dw .sub34EF : db 1
  !transpose,244
  !loop : dw .sub34B7 : db 1
  db 12,$7E
  !g6
  !loop : dw .sub34E6 : db 1
  db 16,$7E
  !e6
  !c6
  !a5
  db 12
  !b6
  !g6
  !a6
  !b6
  !amplify,0
  !transpose,0
  !instr,!instr28
  !volume,200
  !loop : dw .sub34B7 : db 1
  db 12,$7E
  !e6
  !loop : dw .sub34E6 : db 1
  !loop : dw .sub34EF : db 1
  !transpose,244
  !loop : dw .sub34B7 : db 1
  db 12,$7E
  !g6
  !transpose,0
  db 96
  !e6
  db 72
  !tie
  !adsrGain,$7F,$F4
  db 24
  !tie
  !end

.pattern0_5
  !subtranspose,111
  db 96,$7F
  !rest
.pattern1_5:
  !instr,!instr2A
  !volume,215
  !vibrato,0,12,27
  !pan,7
  db 96,$7C
  !e5
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,!instr2B
  !volume,190
  db 96
  !e5
  !tie
  !tie
  !tie
  !tie
  !fs5
  db 96
  !g5
  !tie
  db 96
  !e5
  !tie
  !tie
  !tie
  !tie
  !fs5
  db 96
  !ds5
  !tie
  !loop : dw .sub34FA : db 2
  !instr,!instr2A
  !volume,215
  !vibrato,0,12,27
  !subloop,0
  !loop : dw .sub3507 : db 1
  !transpose,2
  !loop : dw .sub3507 : db 1
  !transpose,0
  db 96,$7C
  !e5
  !tie
  !tie
  !tie
  !subloop,1
  !end

.pattern0_6
  !subtranspose,111
  db 96,$7F
  !rest
.pattern1_6:
  !instr,!instr2A
  !volume,215
  !vibrato,0,12,27
  !pan,13
  db 96,$7C
  !b4
  !tie
  !tie
  !tie
  db 96
  !c5
  !tie
  !tie
  !tie
  db 96
  !b4
  !tie
  !tie
  !tie
  db 96
  !c5
  !tie
  !tie
  !tie
  !instr,!instr2B
  !volume,190
  !loop : dw .sub3511 : db 1
  db 96,$7C
  !e5
  !tie
  !loop : dw .sub3511 : db 1
  db 96,$7C
  !b4
  !tie
  !loop : dw .sub351B : db 2
  !instr,!instr2A
  !volume,215
  !vibrato,0,12,27
  !subloop,0
  !transpose,253
  !loop : dw .sub3507 : db 1
  !transpose,255
  !loop : dw .sub3507 : db 1
  !transpose,0
  db 96,$7C
  !c5
  !tie
  !tie
  !tie
  !subloop,1
  !end

.pattern0_7
  !subtranspose,111
  db 96,$7F
  !rest
.pattern1_7:
  !instr,!instr2A
  !volume,215
  !vibrato,0,12,27
  !pan,11
  !loop : dw .sub3528 : db 1
  db 96,$7C
  !g4
  !tie
  !tie
  db 12
  !tie
  !toggleLegato
  db 24
  !e4
  !c5
  !a4
  db 6
  !d4
  !toggleLegato
  !tie
  !loop : dw .sub3528 : db 1
  db 96,$7C
  !g4
  !tie
  db 96
  !a4
  !tie
  !instr,!instr2B
  !volume,190
  !loop : dw .sub353B : db 1
  db 96,$7C
  !b4
  !tie
  !loop : dw .sub353B : db 1
  db 96,$7C
  !fs4
  !tie
  !instr,!instr29
  !volume,205
  !endVibrato
  !loop : dw .sub3545 : db 4
  !transpose,2
  !loop : dw .sub3545 : db 4
  !transpose,4
  !loop : dw .sub3545 : db 8
  !transpose,0
  !loop : dw .sub3545 : db 4
  !transpose,9
  !loop : dw .sub3545 : db 1
  !transpose,6
  !loop : dw .sub3545 : db 1
  !transpose,2
  !loop : dw .sub3545 : db 2
  !transpose,4
  !loop : dw .sub3545 : db 8
  !transpose,0
  !instr,!instr2A
  !volume,215
  !vibrato,0,12,27
  !subloop,0
  !transpose,249
  !loop : dw .sub3507 : db 1
  !transpose,251
  !loop : dw .sub3507 : db 1
  !transpose,0
  db 96,$7C
  !a4
  !tie
  !tie
  !tie
  !subloop,1
  !end

.sub31DB
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,250
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,250
  !c4
  !end

.sub31FB
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,250
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,250
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,250
  !end

.sub3225
  !instr,!instr1E
  !volume,255
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,250
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  db 24
  !c4
  !instr,!instr1F
  !volume,250
  db 12
  !c4
  !c4
  !end

.sub3244
  db 12,$7F
  !c4
  !c4
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  db 48
  !c4
  !instr,!instr1F
  !volume,250
  db 24
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,250
  !c4
  !end

.sub3262
  db 12,$7F
  !c4
  !c4
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  db 48
  !c4
  !instr,!instr1F
  !volume,250
  db 24
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,250
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,250
  !end

.sub328A
  db 12,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  db 24
  !c4
  db 48
  !c4
  !instr,!instr1F
  !volume,250
  db 24
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  db 12
  !c4
  !c4
  !end

.sub32A5
  db 12,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  db 24
  !c4
  db 48
  !c4
  !instr,!instr1F
  !volume,250
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,250
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  db 24
  !c4
  db 48
  !c4
  !instr,!instr1F
  !volume,250
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  db 24
  !c4
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,250
  !end

.sub32E3
  !instr,!instr1E
  !volume,255
  db 12,$7F
  !c4
  !end

.sub32EB
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,175
  db 72,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,232
  !pan,9
  db 12
  !c5
  !c5
  !end

.sub3306
  !instr,!instr22
  !volume,230
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,232
  !pan,9
  db 12
  !c5
  !c5
  !end

.sub3319
  !toggleEcho
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,175
  db 60,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,232
  !pan,9
  db 12
  !c5
  !instr,!instr22
  !volume,230
  !pan,10
  db 24
  !c5
  !end

.sub333D
  !instr,!instr21
  !volume,232
  !pan,9
  db 12,$7F
  !c5
  !c5
  !instr,!instr22
  !volume,230
  !pan,10
  db 24
  !c5
  !end

.sub3350
  db 24,$7F
  !e4
  !e4
  !b4
  db 12
  !e4
  db 24
  !e4
  db 12
  !e4
  db 24
  !e4
  !e5
  !e4
  !e4
  !e4
  !b4
  db 12
  !e4
  db 24
  !e4
  db 12
  !e4
  !end

.sub3369
  db 24,$7F
  !c4
  !c4
  !g4
  db 12
  !c4
  db 24
  !d4
  db 12
  !d4
  db 24
  !d4
  !a4
  !d4
  !end

.sub3379
  db 24,$7F
  !e4
  !e4
  !b4
  db 12
  !e4
  db 24
  !e4
  db 12
  !e4
  db 24
  !e5
  !b4
  !e4
  !end

.sub3389
  db 24,$7F
  !f4
  db 12
  !c5
  !c5
  !end

.sub3390
  db 24,$7F
  !f4
  db 12
  !f4
  db 24
  !a4
  db 12
  !a4
  !c5
  !f4
  !end

.sub339C
  db 24,$7F
  !e6
  db 12
  !g5
  !d6
  !fs5
  !a5
  !b5
  !g5
  db 24
  !b5
  !a5
  db 12
  !g5
  !d5
  db 24
  !e6
  db 12
  !fs5
  !d6
  db 24,$7E
  !e6
  db 12
  !fs5
  !d6
  db 24,$7D
  !e6
  db 12
  !fs5
  !d6
  db 12,$7C
  !e5
  !a5
  db 36
  !b5
  !toggleLegato
  db 6,$7F
  !g5
  !a5
  !toggleLegato
  db 24
  !b5
  db 12
  !fs5
  !a5
  !e5
  !g5
  !d5
  !fs5
  !a4
  !b4
  !e5
  !a4
  !b4
  !e5
  db 24
  !b5
  db 12,$7E
  !c5
  !e5
  !fs5
  !a5
  !e5
  !g5
  db 12,$7D
  !d5
  !fs5
  !c5
  !e5
  !a4
  !end

.sub33EC
  db 12,$74
  !e7
  db 12,$77
  !e7
  db 12,$79
  !e7
  db 12,$7B
  !e7
  db 12,$7C
  !e7
  db 12,$7E
  !e7
  db 12,$7F
  !e7
  !end

.sub3402
  db 24,$7F
  !a6
  !c7
  db 12
  !b6
  !a6
  db 24
  !g6
  db 48
  !a6
  db 12
  !e6
  db 12,$79
  !e6
  db 12,$7F
  !g6
  db 12,$79
  !g6
  db 24,$7F
  !a6
  !c7
  db 12
  !b6
  !a6
  db 24
  !g6
  db 48
  !a6
  db 12
  !d6
  !e6
  !c6
  !toggleLegato
  db 6
  !g6
  db 3
  !gs6
  !toggleLegato
  !tie
  db 96
  !a6
  db 48
  !tie
  db 12
  !e6
  !d7
  !c7
  !toggleLegato
  db 6
  !b6
  db 3
  !a6
  !toggleLegato
  !tie
  !end

.sub3442
  db 16,$7F
  !a6
  !e6
  !c6
  !g6
  !d6
  !b5
  !end

.sub344B
  db 16,$7F
  !e6
  !c6
  !a5
  db 12
  !d6
  !b5
  !g5
  !a5
  !end

.sub3456
  db 24,$7E
  !b5
  db 12
  !d5
  !a5
  !d5
  !fs5
  !g5
  !e5
  db 24
  !g5
  !fs5
  db 12
  !d5
  !a4
  db 24
  !b5
  db 12
  !d5
  !a5
  db 24,$7D
  !b5
  db 12
  !d5
  !a5
  db 24,$7C
  !b5
  db 12
  !d5
  !b5
  db 12,$7B
  !c5
  !e5
  db 36
  !g5
  db 12,$7E
  !e5
  db 24
  !g5
  db 12
  !d5
  !fs5
  !b4
  !e5
  !b4
  !d5
  !fs4
  !g4
  !b4
  !fs4
  !g4
  !b4
  db 24
  !g5
  db 12,$7D
  !g4
  !c5
  !d5
  !e5
  !c5
  !d5
  db 12,$7C
  !b4
  !d5
  !g4
  !c5
  !fs4
  !end

.sub34A1
  db 12,$74
  !g6
  db 12,$76
  !g6
  db 12,$78
  !g6
  db 12,$7A
  !g6
  db 12,$7B
  !g6
  db 12,$7D
  !g6
  db 6,$7E
  !g6
  !end

.sub34B7
  db 24,$7E
  !e6
  !a6
  db 12
  !g6
  !e6
  db 24
  !d6
  db 48
  !e6
  db 12
  !c6
  db 12,$78
  !c6
  db 12,$7E
  !d6
  db 12,$78
  !d6
  db 24,$7E
  !e6
  !a6
  db 12
  !g6
  !e6
  db 24
  !d6
  db 48
  !e6
  db 12
  !b5
  !c6
  !a5
  !e6
  db 96
  !e6
  db 48
  !tie
  db 12
  !c6
  !b6
  !a6
  !end

.sub34E6
  db 16,$7E
  !e6
  !c6
  !a5
  !d6
  !b5
  !g5
  !end

.sub34EF
  db 16,$7E
  !c6
  !a5
  !e5
  db 12
  !b5
  !g5
  !d5
  !e5
  !end

.sub34FA
  db 96,$7C
  !c5
  !tie
  db 96
  !d5
  !tie
  db 96
  !e5
  !tie
  !tie
  !tie
  !end

.sub3507
  db 36,$7C
  !c5
  !c5
  !c5
  !c5
  db 24
  !c5
  !c5
  !end

.sub3511
  db 96,$7C
  !b4
  !d5
  db 96
  !b4
  !tie
  !tie
  !d5
  !end

.sub351B
  db 96,$7C
  !a4
  !tie
  db 96
  !b4
  !tie
  db 96
  !c5
  !tie
  !tie
  !tie
  !end

.sub3528
  db 96,$7C
  !g4
  !tie
  !tie
  db 12
  !tie
  !toggleLegato
  db 24
  !b4
  !g5
  !b4
  db 6
  !fs4
  !toggleLegato
  !tie
  !end

.sub353B
  db 96,$7C
  !g4
  !a4
  db 96
  !g4
  !tie
  !tie
  !a4
  !end

.sub3545
  db 12,$7E
  !f4
  !f4
  db 12,$78
  !f4
  db 12,$7E
  !f4
  !end

.remoteCode31D4
  !restoreInstrument
  !end

.remoteCode31D7
  !adsrGain,$7F,$F4
  !end

assert pc() <= $10000-(5*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
