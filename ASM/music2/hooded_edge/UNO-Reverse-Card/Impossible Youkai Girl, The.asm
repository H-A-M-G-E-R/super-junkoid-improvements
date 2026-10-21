; The correct title is "The Impossible Youkai Girl".
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

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample1C,$9F,$F5,$B8,$15,$00
  db !sample1D,$CF,$FA,$B8,$15,$00
  db !sample1E,$FF,$FB,$B8,$0A,$A0
  db !sample1E,$FF,$F4,$B8,$0A,$A0
  db !sample1F,$9F,$F2,$B8,$0A,$00
  db !sample1F,$9F,$F3,$B8,$0A,$00
  db !sample14,$FE,$E0,$B8,$02,$00
  db !sample15,$FC,$A6,$B8,$03,$CE
  db !sample16,$FE,$A6,$B8,$02,$A0
  db !sample17,$AA,$E6,$B8,$04,$00
  db !sample18,$FF,$E4,$B8,$03,$E0
  db !sample19,$8F,$2B,$B8,$05,$52
  db !sample1A,$FA,$E0,$B8,$03,$00
  db !sample1B,$FF,$E2,$B8,$05,$C0
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+279
  dw Sample15,Sample15+1683
  dw Sample16,Sample16+2502
  dw Sample17,Sample17+1098
  dw Sample18,Sample18+1701
  dw Sample19,Sample19+9
  dw Sample1A,Sample1A+513
  dw Sample1B,Sample1B+1845
  dw Sample1C,Sample1C+909
  dw Sample1D,Sample1D+1584
  dw Sample1E,Sample1E+909
  dw Sample1F,Sample1F+909
endspcblock

pushpc
org !p_songSpecificData ; sample data
  Sample14: skip filesize("Plok Overdrive.brr")-2
  Sample15: skip filesize("S2 Synth Brass.brr")-2
  Sample16: skip filesize("XG Sawtooth.brr")-2
  Sample17: skip filesize("KDL3 Trumpet.brr")-2
  Sample18: skip filesize("Suku Dist Guitar.brr")-2
  Sample19: skip filesize("S3 Bell.brr")-2
  Sample1A: skip filesize("MMX1 String Ens.brr")-2
  Sample1B: skip filesize("S3 Slap Bass II.brr")-2
  Sample1C: skip filesize("Yasui Snare.brr")-2
  Sample1D: skip filesize("DR-880 Kick.brr")-2
  Sample1E: skip filesize("Ultima Hi-Hat.brr")-2
  Sample1F: skip filesize("R-8 Crash Cym.brr")-2
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
.pattern1: dw .pattern1_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !echo,%10111100,50,50
  !echoParameters,4,80,0
  !setDPMiscCommand,!noteEndInTicks,1
  !musicVolume,100
  !tempo,67
  !amplify,47
.pattern1_0:
  !loop : dw .sub34DB : db 1
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !c4
  !loop : dw .sub34DB : db 1
  db 36,$7F
  !c4
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  !c4
  !c4
  !c4
  !loop : dw .sub351D : db 1
  !loop : dw .sub353F : db 1
  !loop : dw .sub351D : db 1
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !c4
  !loop : dw .sub351D : db 1
  !loop : dw .sub353F : db 1
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  db 8
  !c4
  !c4
  !c4
  db 12
  !c4
  !c4
  db 24
  !c4
  !c4
  !loop : dw .sub3561 : db 1
  db 12,$7F
  !c4
  !c4
  !c4
  !c4
  !loop : dw .sub35E2 : db 1
  !loop : dw .sub360F : db 1
  !loop : dw .sub35E2 : db 1
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  db 24
  !c4
  !loop : dw .sub35E2 : db 1
  !loop : dw .sub360F : db 1
  !loop : dw .sub35E2 : db 1
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !loop : dw .sub3635 : db 1
  !loop : dw .sub351D : db 1
  !loop : dw .sub3641 : db 1
  !loop : dw .sub351D : db 1
  !loop : dw .sub3635 : db 1
  !loop : dw .sub351D : db 1
  !loop : dw .sub353F : db 1
  !loop : dw .sub3665 : db 1
  !loop : dw .sub351D : db 1
  !loop : dw .sub3641 : db 1
  !loop : dw .sub351D : db 1
  !loop : dw .sub368F : db 1
  !loop : dw .sub351D : db 1
  !loop : dw .sub369A : db 1
  !loop : dw .sub3635 : db 1
  !subloop,0
  !loop : dw .sub3561 : db 1
  db 12,$7F
  !c4
  !c4
  !c4
  !c4
  !subloop,1
  !loop : dw .sub36DE : db 15
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  !loop : dw .sub36E9 : db 14
  !instr,!instr1E
  !volume,255
  !pan,10
  !loop : dw .sub3635 : db 1
  !loop : dw .sub351D : db 1
  !loop : dw .sub3641 : db 1
  !loop : dw .sub351D : db 1
  db 12,$7F
  !c4
  !c4
  db 24
  !c4
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  !loop : dw .sub351D : db 1
  !loop : dw .sub353F : db 1
  !loop : dw .sub3665 : db 1
  !loop : dw .sub351D : db 1
  !loop : dw .sub3641 : db 1
  !loop : dw .sub351D : db 1
  !loop : dw .sub368F : db 1
  !loop : dw .sub351D : db 1
  !loop : dw .sub369A : db 1
  !loop : dw .sub3635 : db 1
  !loop : dw .sub3561 : db 1
  db 12,$7F
  !c4
  db 24
  !c4
  db 12
  !c4
  !loop : dw .sub36F4 : db 14
  !instr,!instr1E
  !volume,255
  !pan,10
  !loop : dw .sub3635 : db 1
  !subloop,0
  !loop : dw .sub351D : db 3
  !loop : dw .sub36FF : db 1
  !loop : dw .sub351D : db 3
  !loop : dw .sub3717 : db 1
  !loop : dw .sub351D : db 3
  !loop : dw .sub36FF : db 1
  !loop : dw .sub351D : db 3
  !loop : dw .sub3635 : db 1
  !subloop,1
  !loop : dw .sub351D : db 3
  !loop : dw .sub36FF : db 1
  !loop : dw .sub351D : db 3
  !loop : dw .sub3717 : db 1
  !loop : dw .sub351D : db 3
  !loop : dw .sub36FF : db 1
  !loop : dw .sub351D : db 2
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !c4
  !c4
  db 12
  !c4
  !c4
  !c4
  !c4
  !end

.pattern0_1
  !instr,!instr2B
  !volume,215
  !loop : dw .sub3810 : db 3
  db 48,$7F
  !c5
  db 24
  !c5
  !c5
  !b4
  db 72
  !b4
  !loop : dw .sub381A : db 28
  !loop : dw .sub381E : db 4
  !loop : dw .sub3822 : db 1
  !loop : dw .sub383B : db 2
  !loop : dw .sub385E : db 2
  !loop : dw .sub3822 : db 1
  db 96,$7F
  !c5
  !d5
  !ds5
  !f5
  db 36
  !g5
  !g5
  db 24
  !g5
  db 36
  !as5
  !as5
  db 24
  !as5
  db 36
  !c6
  !c6
  db 24
  !c6
  !b4
  db 12
  !b5
  db 12,$79
  !b5
  db 24,$7F
  !b4
  db 12
  !b5
  db 12,$79
  !b5
  db 24,$7F
  !rest
  !loop : dw .sub38A8 : db 1
  db 12,$79
  !cs6
  db 12,$76
  !cs6
  !loop : dw .sub38A8 : db 1
  !transpose,2
  !loop : dw .sub385E : db 2
  !transpose,0
  !loop : dw .sub3933 : db 1
  db 96,$7F
  !g5
  !e5
  !loop : dw .sub3933 : db 1
  db 96,$7F
  !d5
  db 12
  !d5
  !d5
  !d5
  !d5
  !d5
  !d5
  !d5
  !d5
  !loop : dw .sub393D : db 1
  db 24,$7F
  !g5
  db 12
  !g5
  !g5
  !g5
  !g5
  !g5
  !g5
  db 24
  !e5
  db 12
  !e5
  !e5
  !e5
  !e5
  !e5
  !e5
  !loop : dw .sub393D : db 1
  db 12,$7F
  !d5
  !d5
  db 24
  !d5
  db 12
  !d5
  !d5
  !d5
  !d5
  !d5
  !d5
  db 24
  !d5
  db 12
  !ds5
  !ds5
  !ds5
  !ds5
  !loop : dw .sub3975 : db 2
  !end

.pattern0_2
  !instr,!instr24
  !volume,255
  !vibrato,22,10,47
  !amplify,34
  !pan,9
  !subloop,0
  !loop : dw .sub3A06 : db 1
  db 72,$7F
  !as5
  !loop : dw .sub3A06 : db 1
  db 72,$7F
  !b5
  !loop : dw .sub3A06 : db 1
  db 72,$7F
  !as5
  !loop : dw .sub3A06 : db 1
  db 24,$7F
  !b5
  db 12
  !c6
  db 36
  !d6
  !subloop,1
  !loop : dw .sub3A14 : db 1
  db 24,$7F
  !ds6
  !d6
  !c6
  !f5
  !rest
  !subloop,0
  !loop : dw .sub3A38 : db 1
  db 12,$79
  !c6
  db 24,$7F
  !d6
  db 12,$79
  !d6
  db 12,$76
  !d6
  !subloop,2
  !loop : dw .sub3A38 : db 1
  db 12,$79
  !c6
  db 24,$7F
  !d6
  !loop : dw .sub3A14 : db 1
  db 24,$7F
  !g5
  !d6
  !ds6
  !f6
  !loop : dw .sub3A14 : db 1
  db 24,$7F
  !ds6
  !d6
  !c6
  !b5
  !rest
  !instr,!instr25
  !volume,255
  !vibrato,16,10,28
  !amplify,79
  !pan,9
  !transpose,14
  !subloop,0
  !loop : dw .sub3A38 : db 1
  db 12,$79
  !c6
  db 24,$7F
  !d6
  db 12,$79
  !d6
  db 12,$76
  !d6
  !subloop,2
  !loop : dw .sub3A38 : db 1
  db 12,$79
  !c6
  db 24,$7F
  !d6
  !transpose,0
  !instr,!instr26
  !volume,255
  !vibrato,32,10,47
  !amplify,63
  !loop : dw .sub3A8D : db 1
  !loop : dw .sub3AA5 : db 1
  db 96,$7F
  !d6
  db 48
  !tie
  !g6
  !loop : dw .sub3AB0 : db 1
  db 96,$7F
  !fs7
  db 48
  !tie
  !c7
  db 36
  !d7
  !a6
  db 24
  !d7
  db 36
  !c7
  !a6
  db 24
  !c7
  db 36
  !b6
  !a6
  db 24
  !g6
  db 48
  !g6
  db 24
  !f6
  !g6
  db 36
  !a6
  !loop : dw .sub3AA5 : db 1
  db 96,$7F
  !d6
  db 48
  !tie
  !g6
  !loop : dw .sub3AB0 : db 1
  db 96,$7F
  !fs7
  db 48
  !tie
  !adsrGain,$7F,$F2
  !tie
  !instr,!instr27
  !volume,235
  !vibrato,26,10,63
  !amplify,0
  !pan,11
  !loop : dw .sub3AD0 : db 1
  db 96,$7F
  !gs7
  db 48
  !tie
  !d7
  !loop : dw .sub3AD0 : db 1
  db 96,$7F
  !gs7
  db 48
  !tie
  !adsrGain,$7F,$F2
  !tie
  !end

.pattern0_3
  !instr,!instr24
  !volume,255
  !vibrato,22,10,47
  !amplify,34
  !volume,155
  !pan,11
  db 36,$7F
  !rest
  !loop : dw .sub3A06 : db 1
  db 72,$7F
  !as5
  !loop : dw .sub3A06 : db 1
  db 72,$7F
  !b5
  !loop : dw .sub3A06 : db 1
  db 72,$7F
  !as5
  !loop : dw .sub3A06 : db 1
  db 24,$7F
  !b5
  db 12
  !c6
  !instr,!instr24
  !volume,255
  !vibrato,22,10,47
  !amplify,34
  !pan,12
  !loop : dw .sub3B13 : db 1
  db 72,$7D
  !fs5
  !loop : dw .sub3B13 : db 1
  db 72,$7D
  !g5
  !loop : dw .sub3B13 : db 1
  db 72,$7D
  !fs5
  !loop : dw .sub3B13 : db 1
  db 24,$7D
  !g5
  db 12
  !a5
  db 36
  !b5
  !instr,!instr28
  !volume,255
  !pan,10
  !amplify,47
  !loop : dw .sub3B21 : db 1
  !loop : dw .sub3B2C : db 2
  !amplify,0
  !instr,!instr2A
  !volume,205
  !pan,11
  db 18,$7D
  !ds5
  !loop : dw .sub3B4F : db 1
  !instr,!instr28
  !volume,255
  !pan,10
  !amplify,47
  !loop : dw .sub3B21 : db 1
  db 96,$7F
  !c5
  !d5
  !ds5
  !f5
  db 36
  !g5
  !g5
  db 24
  !g5
  db 36
  !as5
  !as5
  db 24
  !as5
  db 36
  !c6
  !c6
  db 24
  !c6
  db 36
  !b4
  !b4
  db 24
  !b4
  db 60
  !rest
  !instr,!instr25
  !volume,255
  !vibrato,16,10,28
  !amplify,79
  !volume,165
  !pan,11
  !transpose,14
  !loop : dw .sub3A38 : db 1
  db 12,$79
  !c5
  db 24,$7F
  !d5
  db 12,$79
  !d5
  db 12,$76
  !d5
  !loop : dw .sub3A38 : db 1
  !instr,!instr28
  !volume,255
  !pan,10
  !amplify,47
  !transpose,2
  !loop : dw .sub3B9B : db 2
  !transpose,0
  !instr,!instr26
  !volume,255
  !vibrato,32,10,47
  !amplify,63
  !volume,165
  !pan,11
  db 36,$7F
  !rest
  !loop : dw .sub3A8D : db 1
  !loop : dw .sub3AA5 : db 1
  db 108,$7F
  !d6
  !instr,!instr26
  !volume,255
  !vibrato,32,10,47
  !amplify,63
  !pan,12
  !loop : dw .sub3BE5 : db 1
  db 48,$7D
  !e6
  db 36
  !f6
  !a5
  db 24
  !f6
  db 36
  !e6
  !a5
  db 24
  !e6
  db 36
  !g6
  !f6
  db 24
  !e6
  db 48
  !d6
  db 24
  !d6
  !e6
  db 36
  !f6
  !e6
  db 24
  !d6
  db 36
  !c6
  !a5
  db 24
  !f5
  db 96
  !b5
  db 48
  !tie
  !loop : dw .sub3BE5 : db 1
  !instr,!instr27
  !volume,235
  !vibrato,26,10,63
  !amplify,0
  !pan,11
  db 48,$7F
  !as6
  !pan,8
  !loop : dw .sub3C0B : db 1
  db 96,$7D
  !e6
  db 48
  !tie
  !d6
  !loop : dw .sub3C0B : db 1
  db 96,$7D
  !e6
  db 48
  !tie
  !adsrGain,$7F,$F2
  !tie
  !end

.pattern0_4
  !instr,!instr2A
  !volume,205
  !pan,11
  db 96,$7D
  !ds5
  !tie
  !tie
  !tie
  db 96
  !g5
  !tie
  !tie
  !ds5
  db 96
  !ds5
  !tie
  !tie
  !tie
  db 96
  !g5
  !tie
  !tie
  !tie
  !loop : dw .sub3C4E : db 1
  db 96,$7D
  !b5
  !loop : dw .sub3C58 : db 1
  db 96,$7D
  !ds5
  !loop : dw .sub3C58 : db 1
  db 96,$7D
  !g5
  !instr,!instr28
  !volume,255
  !pan,10
  !amplify,47
  !loop : dw .sub3B9B : db 2
  !amplify,0
  !instr,!instr2A
  !volume,205
  !pan,11
  !loop : dw .sub3C4E : db 1
  db 96,$7D
  !f5
  !loop : dw .sub3C4E : db 1
  db 96,$7D
  !b5
  !loop : dw .sub3C63 : db 1
  db 96,$7D
  !cs5
  !loop : dw .sub3C63 : db 1
  db 96,$7D
  !g5
  db 18
  !d5
  !transpose,2
  !loop : dw .sub3B4F : db 1
  !transpose,0
  !instr,!instr2A
  !volume,205
  !subloop,0
  !loop : dw .sub3C6E : db 1
  db 96,$7D
  !d5
  !e5
  !loop : dw .sub3C6E : db 1
  db 96,$7D
  !fs5
  !tie
  !subloop,1
  !subloop,0
  !loop : dw .sub3C78 : db 1
  db 96,$7D
  !cs5
  !ds5
  !loop : dw .sub3C78 : db 1
  db 96,$7D
  !e5
  !tie
  !subloop,1
  !end

.pattern0_5
  !instr,!instr2A
  !volume,205
  !pan,8
  db 96,$7C
  !c5
  !tie
  !tie
  !tie
  db 96
  !ds5
  !tie
  !tie
  !b4
  db 96
  !c5
  !tie
  !tie
  !tie
  db 96
  !ds5
  !tie
  !tie
  !tie
  !loop : dw .sub3C82 : db 1
  !loop : dw .sub3C89 : db 1
  !loop : dw .sub3C90 : db 2
  !loop : dw .sub3C82 : db 2
  !instr,!instr25
  !volume,255
  !vibrato,16,10,28
  !amplify,79
  !pan,11
  db 36,$7E
  !c7
  !ds6
  db 24
  !c7
  db 36
  !d6
  !as6
  db 24
  !d6
  db 36
  !g6
  !c6
  db 24
  !g6
  !c6
  !d6
  !ds6
  !f6
  db 36
  !g6
  !ds7
  db 24
  !g6
  db 36
  !as6
  !f7
  db 24
  !as6
  db 36
  !c7
  !g7
  db 24
  !c7
  !g7
  !f7
  !ds7
  !d7
  !amplify,0
  !instr,!instr2A
  !volume,205
  !pan,8
  !loop : dw .sub3CA6 : db 2
  !loop : dw .sub3CBC : db 2
  db 96,$7C
  !b4
  !loop : dw .sub3CD2 : db 1
  db 96,$7C
  !b4
  !tie
  !tie
  !tie
  !loop : dw .sub3CD2 : db 1
  db 96,$7C
  !b4
  !tie
  !tie
  !end

.pattern0_6
  !loop : dw .sub372E : db 1
  !instr,!instr20
  !volume,225
  !pan,9
  db 12,$7F
  !c5
  !c5
  !loop : dw .sub3752 : db 1
  !instr,!instr20
  !volume,225
  !pan,9
  db 12,$7F
  !c5
  !c5
  !subloop,0
  !loop : dw .sub3765 : db 1
  !loop : dw .sub3752 : db 1
  !instr,!instr20
  !volume,225
  !pan,9
  db 12,$7F
  !c5
  !c5
  !loop : dw .sub3752 : db 1
  !instr,!instr20
  !volume,225
  !pan,9
  db 12,$7F
  !c5
  !c5
  !subloop,1
  !loop : dw .sub3765 : db 1
  !loop : dw .sub3752 : db 1
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub3752 : db 12
  !loop : dw .sub377E : db 2
  !toggleEcho
  !instr,!instr22
  !volume,255
  !pan,10
  !amplify,207
  db 96,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub379D : db 2
  db 24,$7F
  !c5
  !rest
  !loop : dw .sub37B6 : db 1
  !loop : dw .sub37D9 : db 3
  db 24,$7F
  !c5
  db 12
  !c5
  !c5
  !loop : dw .sub3765 : db 2
  !toggleEcho
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,207
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub377E : db 1
  !subloop,0
  !loop : dw .sub3752 : db 1
  !loop : dw .sub377E : db 1
  !subloop,13
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub377E : db 1
  !loop : dw .sub3752 : db 3
  !loop : dw .sub377E : db 2
  !loop : dw .sub3752 : db 4
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 2
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 1
  !loop : dw .sub3752 : db 1
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 2
  !loop : dw .sub3752 : db 4
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 2
  !toggleEcho
  !instr,!instr22
  !volume,255
  !pan,10
  !amplify,207
  db 96,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub379D : db 2
  db 24,$7F
  !c5
  !rest
  !loop : dw .sub37B6 : db 1
  !loop : dw .sub37D9 : db 3
  db 24,$7F
  !c5
  db 12
  !c5
  !c5
  !loop : dw .sub37D9 : db 1
  !loop : dw .sub3765 : db 1
  !toggleEcho
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,207
  db 72,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,225
  !pan,9
  db 12
  !c5
  !c5
  !loop : dw .sub37F2 : db 2
  db 24,$7F
  !c5
  db 12
  !c5
  !c5
  !loop : dw .sub37B6 : db 1
  !loop : dw .sub37D9 : db 3
  db 24,$7F
  !c5
  db 12
  !c5
  !c5
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub3752 : db 28
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub377E : db 1
  !loop : dw .sub3752 : db 3
  !loop : dw .sub377E : db 2
  !loop : dw .sub3752 : db 4
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 2
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 1
  !loop : dw .sub3752 : db 1
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 2
  !loop : dw .sub3752 : db 4
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 2
  !toggleEcho
  !instr,!instr22
  !volume,255
  !pan,10
  !amplify,207
  db 96,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub379D : db 2
  db 24,$7F
  !c5
  !rest
  !loop : dw .sub37B6 : db 1
  !loop : dw .sub37D9 : db 2
  db 24,$7F
  !c5
  db 12
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  !loop : dw .sub37D9 : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub3752 : db 10
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub3752 : db 4
  !loop : dw .sub377E : db 2
  !loop : dw .sub3752 : db 4
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub3752 : db 4
  !loop : dw .sub377E : db 2
  !loop : dw .sub3752 : db 4
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub3752 : db 4
  !loop : dw .sub377E : db 2
  !loop : dw .sub3752 : db 6
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub3752 : db 4
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub3752 : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub3752 : db 4
  !loop : dw .sub377E : db 2
  !loop : dw .sub3752 : db 4
  !loop : dw .sub3752 : db 2
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub3752 : db 4
  !loop : dw .sub377E : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub3752 : db 2
  !loop : dw .sub372E : db 1
  !loop : dw .sub377E : db 2
  !end

.pattern0_7
  !instr,!instr2A
  !volume,205
  !pan,12
  db 96,$7C
  !g4
  !tie
  !tie
  !tie
  db 96
  !as4
  !tie
  !tie
  db 96
  !g4
  !tie
  !tie
  !tie
  !tie
  db 96
  !as4
  !tie
  !tie
  !b4
  !loop : dw .sub3CE3 : db 1
  db 96,$7C
  !d5
  !loop : dw .sub3CED : db 2
  !loop : dw .sub3CE3 : db 1
  db 96,$7C
  !b4
  !loop : dw .sub3CE3 : db 1
  db 96,$7C
  !d5
  !loop : dw .sub3D03 : db 1
  db 96,$7C
  !a4
  !loop : dw .sub3D03 : db 1
  db 96,$7C
  !a4
  !tie
  !loop : dw .sub3D18 : db 1
  db 96,$7C
  !a4
  !tie
  !tie
  !tie
  !loop : dw .sub3D18 : db 1
  db 96,$7C
  !a4
  !tie
  !tie
  !subloop,0
  !loop : dw .sub3D2A : db 1
  db 96,$7C
  !e4
  !fs4
  !loop : dw .sub3D2A : db 1
  db 96,$7C
  !gs4
  !tie
  !subloop,1
  !end

.sub34DB
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  !c4
  !rest
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !end

.sub351D
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !end

.sub353F
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !end

.sub3561
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 48
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !c4
  db 48
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  db 48
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  db 60
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 24
  !c4
  db 12
  !c4
  !c4
  db 24
  !c4
  !end

.sub35E2
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24
  !c4
  db 12
  !rest
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  !c4
  !end

.sub360F
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  db 12
  !c4
  !end

.sub3635
  db 12,$7F
  !c4
  !c4
  db 24
  !c4
  db 12
  !c4
  !c4
  !c4
  !c4
  !end

.sub3641
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !end

.sub3665
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 24
  !c4
  db 36
  !c4
  db 24
  !c4
  db 12
  !c4
  !c4
  !c4
  !end

.sub368F
  db 12,$7F
  !c4
  db 24
  !c4
  !c4
  db 12
  !c4
  !c4
  !c4
  !end

.sub369A
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 24
  !c4
  !end

.sub36DE
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !rest
  !end

.sub36E9
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !rest
  !end

.sub36F4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !rest
  !end

.sub36FF
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  db 12
  !c4
  !c4
  !c4
  !end

.sub3717
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !c4
  !c4
  !end

.sub3810
  db 48,$7F
  !c5
  db 24
  !c5
  db 48
  !c5
  db 72
  !c5
  !end

.sub381A
  db 24,$7F
  !c5
  !end

.sub381E
  db 24,$7F
  !b4
  !end

.sub3822
  db 96,$7F
  !c5
  !d5
  !ds5
  !f5
  !g5
  !f5
  !gs5
  db 24
  !b4
  db 12
  !b5
  db 12,$79
  !b5
  db 24,$7F
  !b4
  db 12
  !b5
  db 12,$79
  !b5
  !end

.sub383B
  db 24,$7F
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !g5
  !g5
  !g5
  !g5
  !fs5
  !fs5
  !fs5
  !fs5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !fs5
  !fs5
  !fs5
  !fs5
  !b5
  !b5
  !b5
  !b5
  !end

.sub385E
  db 24,$7F
  !c5
  db 12
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  db 24
  !g5
  db 12
  !g5
  !g5
  !g5
  !g5
  !g5
  !g5
  db 24
  !fs5
  db 12
  !fs5
  !fs5
  !fs5
  !fs5
  !fs5
  !fs5
  db 24
  !ds5
  db 12
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  db 24
  !ds5
  db 12
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  db 24
  !fs5
  db 12
  !fs5
  !fs5
  !fs5
  !fs5
  !fs5
  !fs5
  db 24
  !b5
  db 12
  !b5
  !b5
  !b5
  !b5
  !b5
  !b5
  !end

.sub38A8
  db 24,$7F
  !d5
  db 12,$79
  !d5
  db 12,$76
  !d5
  db 24,$7F
  !d5
  db 12,$79
  !d5
  db 12,$76
  !d5
  db 24,$7F
  !d5
  db 12,$79
  !d5
  db 12,$76
  !d5
  db 24,$7F
  !d5
  db 12,$79
  !d5
  db 12,$76
  !d5
  db 24,$7F
  !a5
  db 12,$79
  !a5
  db 12,$76
  !a5
  db 24,$7F
  !a5
  db 12,$79
  !a5
  db 12,$76
  !a5
  db 24,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$76
  !gs5
  db 24,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$76
  !gs5
  db 24,$7F
  !f5
  db 12,$79
  !f5
  db 12,$76
  !f5
  db 24,$7F
  !f5
  db 12,$79
  !f5
  db 12,$76
  !f5
  db 24,$7F
  !f5
  db 12,$79
  !f5
  db 12,$76
  !f5
  db 24,$7F
  !f5
  db 12,$79
  !f5
  db 12,$76
  !f5
  db 24,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$76
  !gs5
  db 24,$7F
  !gs5
  db 12,$79
  !gs5
  db 12,$76
  !gs5
  db 24,$7F
  !cs6
  db 12,$79
  !cs6
  db 12,$76
  !cs6
  db 24,$7F
  !cs6
  !end

.sub3933
  db 96,$7F
  !d5
  !c5
  db 96
  !b4
  !tie
  !as4
  !c5
  !end

.sub393D
  db 24,$7F
  !d5
  db 12
  !d5
  !d5
  !d5
  !d5
  !d5
  !d5
  db 24
  !c5
  db 12
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  db 24
  !b4
  db 12
  !b4
  !b4
  !b4
  !b4
  !b4
  !b4
  db 24
  !b4
  db 12
  !b4
  !b4
  !b4
  !b4
  !b4
  !b4
  db 24
  !as4
  db 12
  !as4
  !as4
  !as4
  !as4
  !as4
  !as4
  db 24
  !c5
  db 12
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !end

.sub3975
  db 24,$7F
  !e5
  db 12
  !e5
  !e5
  !e5
  !e5
  !e5
  !e5
  db 24
  !d5
  db 12
  !d5
  !d5
  !d5
  !d5
  !d5
  !d5
  db 24
  !cs5
  db 12
  !cs5
  !cs5
  !cs5
  !cs5
  !cs5
  !cs5
  db 24
  !cs5
  db 12
  !cs5
  !cs5
  !cs5
  !cs5
  !cs5
  !cs5
  db 24
  !c5
  !c5
  db 12
  !c5
  !c5
  db 24
  !c5
  !d5
  db 12
  !d5
  !d5
  db 24
  !d5
  db 12
  !d5
  !d5
  db 24
  !a5
  db 12
  !a5
  !a5
  !a5
  !a5
  !a5
  !a5
  db 24
  !fs5
  db 12
  !fs5
  !fs5
  !fs5
  !fs5
  !fs5
  !fs5
  !e5
  !e5
  db 24
  !e5
  db 12
  !e5
  !e5
  !e5
  !e5
  !d5
  !d5
  db 24
  !d5
  db 12
  !d5
  !d5
  !d5
  !d5
  !cs5
  !cs5
  db 24
  !cs5
  db 12
  !cs5
  !cs5
  !cs5
  !cs5
  !cs5
  !cs5
  db 24
  !cs5
  db 12
  !cs5
  !cs5
  !cs5
  !cs5
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  !c5
  !c5
  !d5
  !d5
  db 24
  !d5
  db 12
  !d5
  !d5
  !d5
  !d5
  !e5
  !e5
  db 24
  !e5
  db 12
  !e5
  !e5
  !e5
  !e5
  !e5
  !e5
  db 24
  !e5
  db 12
  !e5
  !e5
  !e5
  !e5
  !end

.sub3A06
  db 12,$7F
  !c5
  !ds5
  !fs5
  !g5
  db 24
  !as5
  db 12
  !c5
  !ds5
  !fs5
  !g5
  !end

.sub3A14
  db 36,$7F
  !ds6
  !g5
  db 24
  !ds6
  db 36
  !f5
  !d6
  db 24
  !f5
  db 36
  !c6
  !ds5
  db 24
  !c6
  !c5
  !d5
  !ds5
  !f5
  db 36
  !ds5
  !c6
  db 24
  !ds5
  db 36
  !f5
  !d6
  db 24
  !f5
  db 36
  !g5
  !ds6
  db 24
  !g5
  !end

.sub3A38
  db 24,$7F
  !g5
  !fs5
  !g5
  !fs5
  db 12,$79
  !fs5
  db 24,$7F
  !ds5
  db 12,$79
  !ds5
  db 24,$7F
  !c5
  db 12,$79
  !c5
  db 12,$76
  !c5
  db 24,$7F
  !g5
  !fs5
  !g5
  !as5
  db 12,$79
  !as5
  db 24,$7F
  !fs5
  db 12,$79
  !fs5
  db 24,$7F
  !g5
  db 12,$79
  !g5
  db 12,$76
  !g5
  db 24,$7F
  !g5
  !fs5
  !g5
  !fs5
  db 12,$79
  !fs5
  db 24,$7F
  !ds5
  db 12,$79
  !ds5
  db 24,$7F
  !c5
  db 12,$79
  !c5
  db 12,$76
  !c5
  db 24,$7F
  !g5
  !fs5
  !g5
  !b5
  db 12,$79
  !b5
  db 24,$7F
  !c6
  !end

.sub3A8D
  db 36,$7F
  !f6
  !a5
  db 24
  !f6
  db 36
  !e6
  !a5
  db 24
  !e6
  db 36
  !g6
  !f6
  db 24
  !e6
  db 48
  !d6
  db 24
  !d6
  !e6
  db 36
  !f6
  !end

.sub3AA5
  db 36,$7F
  !g6
  db 24
  !f6
  db 36
  !e6
  !c6
  db 24
  !a5
  !end

.sub3AB0
  db 36,$7F
  !a6
  !f6
  db 24
  !a6
  db 36
  !c7
  !a6
  db 24
  !c7
  db 36
  !d7
  !c7
  db 24
  !a6
  db 48
  !d7
  db 24
  !a6
  !c7
  db 36
  !d7
  !e7
  db 24
  !c7
  db 36
  !a6
  !c7
  db 24
  !g7
  !end

.sub3AD0
  db 36,$7F
  !b6
  !g6
  db 24
  !b6
  db 36
  !a6
  !fs6
  db 24
  !a6
  db 36
  !cs7
  !b6
  db 24
  !a6
  db 48
  !a6
  db 24
  !g6
  !a6
  db 36
  !b6
  !a6
  db 24
  !g6
  db 36
  !fs6
  !d6
  db 24
  !b5
  db 96
  !e6
  db 48
  !tie
  !a6
  db 36
  !b6
  !g6
  db 24
  !b6
  db 36
  !d7
  !b6
  db 24
  !d7
  db 36
  !e7
  !d7
  db 24
  !b6
  db 48
  !e7
  db 24
  !b6
  !d7
  db 36
  !e7
  !fs7
  db 24
  !d7
  db 36
  !b6
  !d7
  db 24
  !a7
  !end

.sub3B13
  db 12,$7D
  !g4
  !c5
  !d5
  !ds5
  db 24
  !fs5
  db 12
  !g4
  !c5
  !d5
  !ds5
  !end

.sub3B21
  db 96,$7F
  !c5
  !d5
  !ds5
  !f5
  !g5
  !f5
  !gs5
  !b4
  !end

.sub3B2C
  db 24,$7F
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !g5
  !g5
  !g5
  !g5
  !fs5
  !fs5
  !fs5
  !fs5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !fs5
  !fs5
  !fs5
  !fs5
  !b5
  !b5
  !b5
  !b5
  !end

.sub3B4F
  !instr,!instr29
  !volume,235
  !pan,11
  db 6,$7D
  !fs6
  db 96
  !g6
  db 90
  !tie
  db 6
  !fs6
  db 72
  !g6
  db 12
  !c6
  !d6
  !ds6
  !g6
  !as6
  !c7
  !g6
  !fs6
  db 24
  !c5
  !g5
  !fs5
  !g5
  !as5
  !g5
  !fs5
  !g5
  !c6
  !g6
  !fs6
  !g6
  !b6
  !g6
  !fs6
  !g6
  !c6
  !g6
  !fs6
  !g6
  !as6
  !g6
  !fs6
  !g6
  !c6
  !g6
  !fs6
  !g6
  !b6
  !g6
  !fs6
  !g6
  !c5
  !g5
  !fs5
  !g5
  !as5
  !g5
  !fs5
  !g5
  !c6
  !g6
  !fs6
  !g6
  !b6
  !g6
  !fs6
  !g6
  !end

.sub3B9B
  db 24,$7F
  !c5
  db 12
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  db 24
  !g5
  db 12
  !g5
  !g5
  !g5
  !g5
  !g5
  !g5
  db 24
  !fs5
  db 12
  !fs5
  !fs5
  !fs5
  !fs5
  !fs5
  !fs5
  db 24
  !ds5
  db 12
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  db 24
  !ds5
  db 12
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  db 24
  !fs5
  db 12
  !fs5
  !fs5
  !fs5
  !fs5
  !fs5
  !fs5
  db 24
  !b5
  db 12
  !b5
  !b5
  !b5
  !b5
  !b5
  !b5
  !end

.sub3BE5
  db 48,$7D
  !e6
  db 36
  !f6
  !a5
  db 24
  !f6
  db 36
  !e6
  !a5
  db 24
  !e6
  db 36
  !a6
  !g6
  db 24
  !f6
  db 48
  !a6
  db 24
  !d6
  !e6
  db 36
  !f6
  !g6
  db 24
  !f6
  db 36
  !e6
  !c6
  db 24
  !a5
  db 96
  !d6
  db 48
  !tie
  !end

.sub3C0B
  db 36,$7D
  !e6
  !b5
  db 24
  !e6
  db 36
  !d6
  !b5
  db 24
  !d6
  db 36
  !a6
  !g6
  db 24
  !fs6
  db 48
  !e6
  db 24
  !e6
  !fs6
  db 36
  !g6
  !fs6
  db 24
  !e6
  db 36
  !d6
  !b5
  db 24
  !g5
  db 96
  !cs6
  db 48
  !tie
  !fs6
  db 36
  !g6
  !b5
  db 24
  !g6
  db 36
  !fs6
  !b5
  db 24
  !fs6
  db 36
  !b6
  !fs6
  db 24
  !e6
  db 48
  !b6
  db 24
  !e6
  !fs6
  db 36
  !g6
  !a6
  db 24
  !g6
  db 36
  !fs6
  !d6
  db 24
  !b5
  !end

.sub3C4E
  db 96,$7D
  !ds5
  !f5
  !g5
  !f5
  !ds5
  !f5
  !gs5
  !end

.sub3C58
  db 96,$7D
  !ds5
  !tie
  !g5
  !fs5
  db 96
  !g5
  !tie
  !gs5
  !end

.sub3C63
  db 96,$7D
  !d5
  !tie
  !f5
  !e5
  db 96
  !f5
  !tie
  !tie
  !end

.sub3C6E
  db 96,$7D
  !f5
  !e5
  db 96
  !d5
  !tie
  !tie
  !e5
  !end

.sub3C78
  db 96,$7D
  !e5
  !d5
  db 96
  !cs5
  !tie
  !c5
  !d5
  !end

.sub3C82
  db 96,$7C
  !c5
  !d5
  !ds5
  !d5
  !end

.sub3C89
  db 96,$7C
  !c5
  !d5
  !ds5
  !f5
  !end

.sub3C90
  db 96,$7C
  !c5
  !tie
  !ds5
  !d5
  db 96
  !ds5
  !tie
  !ds5
  !b4
  db 96
  !c5
  !tie
  !ds5
  !d5
  db 96
  !ds5
  !tie
  !ds5
  !f5
  !end

.sub3CA6
  db 96,$7C
  !a4
  !tie
  !d5
  !b4
  db 96
  !c5
  !tie
  !tie
  db 96
  !a4
  !tie
  !tie
  !d5
  !b4
  db 96
  !c5
  !tie
  !tie
  !cs5
  !end

.sub3CBC
  db 96,$7C
  !d5
  !c5
  db 96
  !b4
  !tie
  !as4
  !c5
  !b4
  !cs5
  !d5
  !c5
  db 96
  !b4
  !tie
  !as4
  !c5
  db 96
  !d5
  !tie
  !end

.sub3CD2
  db 96,$7C
  !a4
  !tie
  !tie
  !tie
  !b4
  !a4
  db 96
  !b4
  !tie
  db 96
  !a4
  !tie
  !tie
  !tie
  !end

.sub372E
  !toggleEcho
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,207
  db 60,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,225
  !pan,9
  db 12
  !c5
  !instr,!instr21
  !volume,225
  !pan,10
  db 24
  !c5
  !end

.sub3752
  !instr,!instr20
  !volume,225
  !pan,9
  db 12,$7F
  !c5
  !c5
  !instr,!instr21
  !volume,225
  !pan,10
  db 24
  !c5
  !end

.sub3765
  !amplify,47
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr20
  !volume,225
  !pan,9
  !c5
  !c5
  !c5
  !end

.sub377E
  !amplify,47
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr20
  !volume,225
  !pan,9
  !c5
  !instr,!instr21
  !volume,225
  !pan,10
  db 24
  !c5
  !end

.sub379D
  !amplify,47
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !rest
  !amplify,0
  !instr,!instr20
  !volume,225
  !pan,9
  !c5
  !rest
  !end

.sub37B6
  !amplify,47
  !instr,!instr1F
  !volume,240
  !pan,10
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr20
  !volume,225
  !pan,9
  !c5
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  !end

.sub37D9
  !amplify,47
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !amplify,0
  !instr,!instr20
  !volume,225
  !pan,9
  db 12
  !c5
  !c5
  !end

.sub37F2
  !amplify,47
  !instr,!instr1F
  !volume,240
  !pan,10
  db 24,$7F
  !c4
  !amplify,0
  !instr,!instr20
  !volume,225
  !pan,9
  db 12
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  !end

.sub3CE3
  db 96,$7C
  !g4
  !as4
  !c5
  !as4
  !g4
  !as4
  !c5
  !end

.sub3CED
  db 96,$7C
  !g4
  !tie
  !c5
  !a4
  db 96
  !c5
  !tie
  !tie
  db 96
  !g4
  !tie
  !tie
  !c5
  !a4
  db 96
  !c5
  !tie
  !tie
  !b4
  !end

.sub3D03
  db 96,$7C
  !f4
  !tie
  !a4
  !gs4
  db 96
  !a4
  !tie
  !gs4
  db 96
  !f4
  !tie
  !tie
  !a4
  !gs4
  db 96
  !a4
  !tie
  !gs4
  !end

.sub3D18
  db 96,$7C
  !g4
  db 96
  !g4
  !tie
  !tie
  !a4
  !g4
  db 96
  !a4
  !tie
  !g4
  db 96
  !g4
  !tie
  !tie
  !end

.sub3D2A
  db 96,$7C
  !g4
  !fs4
  db 96
  !e4
  !tie
  !tie
  !fs4
  !end

assert pc() <= $10000-(4*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
