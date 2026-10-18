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
!instr2F = $27
!instr30 = $28
!instr31 = $29

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
!sample24 = $26

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample21,$9F,$F5,$B8,$15,$40
  db !sample22,$CF,$FA,$B8,$13,$00
  db !sample23,$FF,$FC,$B8,$0B,$00
  db !sample23,$FF,$B5,$B8,$0A,$A0
  db !sample24,$9F,$F2,$B8,$0A,$00
  db !sample24,$9F,$F3,$B8,$0A,$00
  db !sample14,$DE,$E8,$B8,$04,$00
  db !sample15,$9F,$CA,$B8,$07,$02
  db !sample16,$AF,$AA,$B8,$02,$39
  db !sample17,$9F,$E9,$B8,$03,$C0
  db !sample18,$CF,$E9,$B8,$03,$01
  db !sample19,$FF,$CA,$B8,$06,$00
  db !sample1A,$CF,$CD,$B8,$03,$00
  db !sample1B,$9F,$A0,$7F,$08,$00
  db !sample1C,$9F,$A0,$7F,$0C,$00
  db !sample1D,$FF,$E0,$7F,$06,$00
  db !sample1E,$FC,$E0,$B8,$04,$80
  db !sample1F,$FE,$E0,$B8,$04,$01
  db !sample1B,$FE,$A0,$7F,$08,$00
  db !sample20,$BF,$86,$B8,$06,$00
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+1098
  dw Sample15,Sample15+27
  dw Sample16,Sample16+792
  dw Sample17,Sample17+441
  dw Sample18,Sample18+1530
  dw Sample19,Sample19+1359
  dw Sample1A,Sample1A+36
  dw Sample1B,Sample1B+9
  dw Sample1C,Sample1C+9
  dw Sample1D,Sample1D+9
  dw Sample1E,Sample1E+171
  dw Sample1F,Sample1F+27
  dw Sample20,Sample20+1431
  dw Sample21,Sample21+909
  dw Sample22,Sample22+1584
  dw Sample23,Sample23+234
  dw Sample24,Sample24+909
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "KDL3 Trumpet.brr":2..0
  Sample15: incbin "Chrono Square Wave.brr":2..0
  Sample16: incbin "MM Synth EP 4.brr":2..0
  Sample17: incbin "Popful Mail Overdrive.brr":2..0
  Sample18: incbin "Chrono Perc Organ.brr":2..0
  Sample19: incbin "MM FM Elec Piano 1.brr":2..0
  Sample1A: incbin "MM FM Elec Piano 2.brr":2..0
  Sample1B: incbin "MM Pulse 50% O4 Low.brr":2..0
  Sample1C: incbin "MM Pulse 50% O4 High.brr":2..0
  Sample1D: incbin "MM Pulse 25% O4 High.brr":2..0
  Sample1E: incbin "MMX2 String Ens.brr":2..0
  Sample1F: incbin "MM7 Sawtooth.brr":2..0
  Sample20: incbin "Cool Slap Bass.brr":2..0
  Sample21: incbin "Yasui Snare.brr":2..0
  Sample22: incbin "DR-880 Kick.brr":2..0
  Sample23: incbin "TR-909 Hi-Hat.brr":2..0
  Sample24: incbin "R-8 Crash Cym.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2B59

Tracker2B59:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !echo,%10111100,48,48
  !echoParameters,4,64,0
  !setDPMiscCommand,!noteEndInTicks,1
  !musicVolume,100
  !tempo,70
  !endVibrato
  !amplify,66
.pattern1_0:
  !instr,!instr1F
  !volume,225
  !pan,10
  !subloop,0
  db 24,$7F
  !c4
  !rest
  !subloop,14
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !instr,!instr21
  !volume,205
  !pan,10
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !subloop,0
  db 24,$7F
  !c4
  !rest
  !subloop,12
  !loop : dw .sub430E : db 1
  !loop : dw .sub432F : db 1
  !loop : dw .sub4357 : db 1
  !loop : dw .sub4379 : db 1
  !loop : dw .sub438D : db 1
  !loop : dw .sub4379 : db 1
  !loop : dw .sub4357 : db 1
  !loop : dw .sub4379 : db 1
  !loop : dw .sub43B5 : db 1
  !loop : dw .sub43DA : db 1
  !loop : dw .sub4407 : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub442F : db 1
  !loop : dw .sub4407 : db 2
  !loop : dw .sub441A : db 1
  !loop : dw .sub4442 : db 1
  !loop : dw .sub43DA : db 1
  !loop : dw .sub4407 : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub442F : db 1
  !loop : dw .sub4407 : db 2
  !loop : dw .sub441A : db 1
  !loop : dw .sub4442 : db 1
  !loop : dw .sub4465 : db 1
  !loop : dw .sub4407 : db 5
  !loop : dw .sub4407 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr20
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4407 : db 5
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 48
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4484 : db 1
  !loop : dw .sub44B4 : db 2
  !loop : dw .sub44D6 : db 1
  !subloop,0
  !loop : dw .sub44B4 : db 3
  !loop : dw .sub44D6 : db 1
  !subloop,1
  !loop : dw .sub4484 : db 1
  !loop : dw .sub44B4 : db 2
  !loop : dw .sub44D6 : db 1
  !subloop,0
  !loop : dw .sub44B4 : db 3
  !loop : dw .sub44D6 : db 1
  !subloop,1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub44D6 : db 1
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 72
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub43B5 : db 1
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,205
  !pan,10
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !subloop,0
  db 24,$7F
  !c4
  !rest
  !subloop,28
  !loop : dw .sub430E : db 1
  !loop : dw .sub432F : db 1
  !loop : dw .sub4357 : db 1
  !loop : dw .sub4379 : db 1
  !loop : dw .sub438D : db 1
  !loop : dw .sub4379 : db 1
  !loop : dw .sub4357 : db 1
  !loop : dw .sub4379 : db 1
  !loop : dw .sub43B5 : db 1
  !loop : dw .sub4484 : db 1
  !loop : dw .sub44B4 : db 2
  !loop : dw .sub44D6 : db 1
  !loop : dw .sub44B4 : db 3
  db 96,$7F
  !rest
  !loop : dw .sub43DA : db 1
  !loop : dw .sub4407 : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub442F : db 1
  !loop : dw .sub4407 : db 2
  !loop : dw .sub441A : db 1
  !loop : dw .sub4442 : db 1
  !loop : dw .sub4407 : db 2
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !loop : dw .sub44F8 : db 1
  !loop : dw .sub43DA : db 1
  !loop : dw .sub4407 : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub442F : db 1
  !loop : dw .sub4407 : db 2
  !loop : dw .sub441A : db 1
  !loop : dw .sub4442 : db 1
  !loop : dw .sub4407 : db 2
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 72
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,225
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
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub451D : db 1
  !loop : dw .sub442F : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub454C : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub442F : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub456D : db 1
  !loop : dw .sub451D : db 1
  !loop : dw .sub4407 : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub454C : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub4407 : db 1
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !loop : dw .sub44F8 : db 1
  !loop : dw .sub451D : db 1
  !loop : dw .sub442F : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub454C : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub442F : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub456D : db 1
  !loop : dw .sub451D : db 1
  !loop : dw .sub4407 : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub454C : db 1
  !loop : dw .sub441A : db 1
  !loop : dw .sub4407 : db 1
  !loop : dw .sub441A : db 1
  db 96,$7F
  !rest
  db 24
  !c4
  !instr,!instr21
  !volume,205
  !pan,10
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !subloop,0
  db 24,$7F
  !c4
  !rest
  !subloop,10
  !subloop,0
  db 24,$7F
  !c4
  db 8
  !rest
  !subloop,4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 16,$7F
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4465 : db 1
  !loop : dw .sub4407 : db 6
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4465 : db 1
  !loop : dw .sub4407 : db 7
  !loop : dw .sub4465 : db 1
  !loop : dw .sub4407 : db 3
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  db 120
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !rest
  !c4
  !rest
  !end

.pattern0_1
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,!instr31
  !volume,255
  !pan,10
  !amplify,18
  db 96,$7F
  !f5
  !pitchSlide,10,79 : !f4
  db 96
  !f4
  !tie
  !cs4
  !ds4
  db 96
  !f4
  !tie
  !cs4
  db 24
  !ds4
  db 12
  !f5
  !f5
  !c5
  !c5
  !g4
  !g4
  !loop : dw .sub46DD : db 1
  !loop : dw .sub46ED : db 1
  !loop : dw .sub46DD : db 1
  db 24,$7F
  !ds4
  !ds4
  !ds5
  !ds4
  !f4
  db 12
  !f5
  !f5
  !c5
  !c5
  !gs4
  !gs4
  !loop : dw .sub46FD : db 4
  !transpose,252
  !loop : dw .sub46FD : db 4
  !transpose,254
  !loop : dw .sub46FD : db 4
  !transpose,0
  !loop : dw .sub46FD : db 2
  db 12,$7F
  !f5
  !as5
  !c6
  !ds6
  !f6
  !c6
  !as5
  !g5
  !loop : dw .sub46FD : db 4
  !transpose,252
  !loop : dw .sub46FD : db 4
  !transpose,254
  !loop : dw .sub46FD : db 4
  !transpose,0
  !loop : dw .sub46FD : db 2
  db 12,$7F
  !c5
  !c5
  !f5
  !gs5
  !ds5
  !f5
  !g5
  !as5
  !loop : dw .sub4704 : db 4
  !transpose,252
  !loop : dw .sub4704 : db 4
  !transpose,254
  !loop : dw .sub4704 : db 4
  !transpose,251
  !loop : dw .sub4704 : db 2
  !transpose,254
  !loop : dw .sub4704 : db 2
  !transpose,0
  !loop : dw .sub470D : db 2
  db 12,$7F
  !d5
  !d5
  !as5
  db 12,$76
  !d5
  !loop : dw .sub470D : db 1
  !transpose,252
  !loop : dw .sub4704 : db 2
  !loop : dw .sub4716 : db 1
  !loop : dw .sub4704 : db 1
  !transpose,254
  !loop : dw .sub4704 : db 2
  !loop : dw .sub4716 : db 1
  !transpose,0
  db 24,$7F
  !ds5
  db 12
  !c6
  db 12,$76
  !ds5
  !transpose,2
  !loop : dw .sub470D : db 2
  !transpose,0
  db 12,$7F
  !fs5
  !a5
  !d6
  !fs6
  !a6
  !fs6
  !d6
  !a5
  !loop : dw .sub471F : db 8
  !transpose,252
  !loop : dw .sub471F : db 8
  !transpose,254
  !loop : dw .sub471F : db 8
  !transpose,0
  !loop : dw .sub471F : db 8
  !transpose,252
  !loop : dw .sub471F : db 8
  !transpose,254
  !loop : dw .sub471F : db 8
  !transpose,0
  db 24,$7F
  !d4
  !d5
  !d4
  db 24,$78
  !d5
  db 24,$7F
  !e5
  !e4
  !e5
  db 96
  !fs4
  !tie
  db 24
  !tie
  db 24,$78
  !fs4
  !loop : dw .sub4726 : db 1
  db 24,$78
  !e4
  !loop : dw .sub4726 : db 1
  !loop : dw .sub4754 : db 1
  db 24,$7F
  !e4
  !e4
  !e4
  !loop : dw .sub4754 : db 1
  db 12,$7F
  !fs5
  !fs5
  !cs5
  !cs5
  !gs4
  !gs4
  !subloop,0
  !transpose,5
  !loop : dw .sub46DD : db 1
  !transpose,1
  !loop : dw .sub46ED : db 1
  !subloop,1
  !transpose,0
  !loop : dw .sub471F : db 4
  !transpose,252
  !loop : dw .sub471F : db 2
  !transpose,254
  !loop : dw .sub471F : db 2
  !transpose,252
  !loop : dw .sub471F : db 4
  !transpose,254
  !loop : dw .sub471F : db 2
  !transpose,0
  db 96,$7F
  !rest
  !loop : dw .sub46FD : db 8
  !transpose,252
  !loop : dw .sub46FD : db 8
  !transpose,254
  !loop : dw .sub46FD : db 8
  !transpose,0
  !loop : dw .sub46FD : db 8
  !transpose,252
  !loop : dw .sub46FD : db 8
  !transpose,254
  !loop : dw .sub46FD : db 8
  !transpose,0
  db 24,$7F
  !f4
  !f5
  !f4
  db 24,$78
  !f5
  db 24,$7F
  !g5
  !g4
  !g5
  db 96
  !f4
  !tie
  db 24
  !tie
  !loop : dw .sub46FD : db 8
  !transpose,254
  !loop : dw .sub46FD : db 8
  !transpose,252
  !loop : dw .sub46FD : db 8
  !transpose,251
  !loop : dw .sub46FD : db 4
  !transpose,255
  !loop : dw .sub46FD : db 4
  !transpose,0
  !loop : dw .sub46FD : db 8
  !transpose,254
  !loop : dw .sub46FD : db 8
  !transpose,252
  !loop : dw .sub46FD : db 8
  !transpose,251
  !loop : dw .sub46FD : db 4
  !transpose,254
  !loop : dw .sub46FD : db 2
  db 96,$7F
  !rest
  !transpose,0
  !loop : dw .sub4766 : db 2
  !transpose,2
  !loop : dw .sub4766 : db 2
  !transpose,255
  !loop : dw .sub4766 : db 2
  !transpose,4
  !loop : dw .sub4766 : db 1
  !transpose,2
  !loop : dw .sub4766 : db 1
  !transpose,0
  !loop : dw .sub4766 : db 2
  !transpose,2
  !loop : dw .sub4766 : db 2
  !transpose,0
  db 20,$7F
  !f5
  db 12,$78
  !ds5
  db 20,$7F
  !c5
  db 12,$78
  !f5
  db 20,$7F
  !f5
  db 12,$78
  !c5
  db 20,$7F
  !ds5
  db 12,$78
  !f5
  db 20,$7F
  !c5
  db 12,$78
  !ds5
  db 20,$7F
  !ds5
  db 12,$78
  !c5
  !transpose,252
  !loop : dw .sub46FD : db 2
  !transpose,254
  !loop : dw .sub46FD : db 2
  !transpose,251
  !loop : dw .sub46FD : db 2
  !transpose,0
  !loop : dw .sub46FD : db 1
  !transpose,254
  !loop : dw .sub46FD : db 1
  !transpose,252
  !loop : dw .sub46FD : db 2
  !transpose,254
  !loop : dw .sub46FD : db 2
  !transpose,251
  !loop : dw .sub46FD : db 2
  !transpose,255
  !loop : dw .sub46FD : db 2
  !transpose,252
  !loop : dw .sub46FD : db 2
  !transpose,254
  !loop : dw .sub46FD : db 2
  !transpose,251
  !loop : dw .sub46FD : db 2
  !transpose,0
  !loop : dw .sub46FD : db 1
  !transpose,254
  !loop : dw .sub46FD : db 1
  !transpose,252
  !loop : dw .sub46FD : db 2
  !transpose,254
  !loop : dw .sub46FD : db 2
  !transpose,251
  !loop : dw .sub46FD : db 2
  !transpose,254
  !loop : dw .sub46FD : db 2
  !transpose,252
  !loop : dw .sub46FD : db 2
  !transpose,254
  !loop : dw .sub46FD : db 2
  !transpose,251
  !loop : dw .sub46FD : db 2
  !transpose,0
  !loop : dw .sub46FD : db 1
  !transpose,254
  !loop : dw .sub46FD : db 1
  !transpose,252
  !loop : dw .sub46FD : db 2
  !transpose,254
  !loop : dw .sub46FD : db 1
  !transpose,0
  db 24,$7F
  !ds4
  db 96
  !f4
  !tie
  db 24
  !tie
  !end

.pattern0_2
  !endVibrato
  !amplify,0
  !transpose,0
  !instr,!instr20
  !volume,195
  !pan,9
  !toggleEcho
  !subloop,0
  !loop : dw .sub4592 : db 2
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub4592 : db 1
  !subloop,3
  !toggleEcho
  !instr,!instr24
  !volume,250
  !vibrato,32,10,63
  !pan,11
  !subloop,0
  db 96,$7F
  !c6
  !tie
  db 48
  !c6
  !f6
  !g6
  !gs6
  !subloop,2
  db 96,$7F
  !gs6
  !tie
  db 48
  !f6
  db 36
  !gs6
  !as6
  db 24
  !gs6
  !g6
  !cs7
  !instr,!instr25
  !volume,180
  !vibrato,22,10,50
  !pan,9
  !loop : dw .sub476B : db 2
  !loop : dw .sub4774 : db 1
  db 24,$7F
  !ds6
  db 24,$79
  !c6
  db 24,$7F
  !as5
  !c6
  !ds6
  db 24,$79
  !c6
  db 24,$7F
  !c6
  !ds6
  !f6
  !c6
  !c7
  db 6
  !as6
  !c7
  db 12
  !as6
  db 24
  !gs6
  !g6
  !loop : dw .sub476B : db 2
  !loop : dw .sub4774 : db 1
  db 24,$7F
  !gs5
  !as5
  !g5
  db 24,$79
  !as5
  db 24,$7F
  !ds5
  db 24,$79
  !g5
  db 24,$7F
  !f5
  db 12
  !c5
  db 12,$79
  !f5
  db 24,$7F
  !g5
  db 12
  !c5
  db 12,$79
  !g5
  db 24,$7F
  !gs5
  db 12
  !c5
  !instr,!instr26
  !volume,255
  !vibrato,42,10,79
  !amplify,31
  !g5
  db 24
  !gs5
  !as5
  db 120
  !c6
  db 24
  !c6
  !as5
  !ds6
  db 96
  !f6
  db 24
  !f6
  !c6
  !g6
  !gs6
  db 84
  !g6
  db 4
  !fs6
  !f6
  !e6
  db 48
  !ds6
  db 24
  !f6
  db 120
  !c6
  db 24
  !as5
  !as5
  !c6
  !ds6
  db 96
  !f6
  db 48
  !tie
  db 24
  !d6
  !ds6
  db 96
  !f6
  db 24
  !f6
  !c6
  !f6
  !gs6
  db 96
  !g6
  db 48
  !gs6
  db 24
  !as6
  db 72
  !c7
  !adsrGain,$7F,$F4
  db 24
  !tie
  !instr,!instr27
  !volume,245
  !vibrato,32,10,63
  !amplify,52
  db 48
  !cs7
  db 24
  !b6
  !a6
  !gs6
  !loop : dw .sub4786 : db 1
  !loop : dw .sub4794 : db 1
  !loop : dw .sub4786 : db 1
  !loop : dw .sub47A1 : db 1
  !loop : dw .sub4786 : db 1
  !loop : dw .sub47AB : db 1
  !loop : dw .sub4786 : db 1
  !loop : dw .sub4794 : db 1
  !loop : dw .sub4786 : db 1
  db 96,$7F
  !cs7
  db 48
  !cs7
  db 24
  !b6
  !a6
  !gs6
  !loop : dw .sub4786 : db 1
  !loop : dw .sub47AB : db 1
  !loop : dw .sub47BA : db 1
  !instr,!instr25
  !volume,180
  !vibrato,22,10,50
  !loop : dw .sub47D4 : db 1
  !loop : dw .sub47F3 : db 1
  !loop : dw .sub47D4 : db 1
  db 12,$7F
  !cs6
  !rest
  db 24
  !gs6
  db 12
  !cs6
  !rest
  db 24
  !a6
  db 12
  !d6
  !rest
  !loop : dw .sub47D4 : db 1
  !loop : dw .sub47F3 : db 1
  !loop : dw .sub47D4 : db 1
  db 12,$7F
  !cs6
  !rest
  !instr,!instr2A
  !volume,205
  !vibrato,20,8,42
  !gs6
  !gs6
  !fs6
  !fs6
  !e6
  !e6
  !d6
  !d6
  db 120
  !cs6
  db 24
  !fs6
  !e6
  !d6
  db 48
  !cs6
  !fs6
  !gs6
  !a6
  db 96
  !cs6
  db 24
  !fs6
  !e6
  !d6
  !e6
  db 48
  !fs6
  !fs6
  !gs6
  !a6
  db 96
  !a6
  !tie
  db 48
  !a6
  !a6
  !b6
  !cs7
  db 120
  !a6
  db 24
  !fs6
  !e6
  !fs6
  db 48
  !fs6
  !a6
  !instr,!instr28
  !volume,255
  !vibrato,32,10,63
  db 24
  !c7
  !as6
  !gs6
  !g6
  !subloop,0
  !transpose,255
  !loop : dw .sub4786 : db 1
  !loop : dw .sub4794 : db 1
  !loop : dw .sub4786 : db 1
  !loop : dw .sub47A1 : db 1
  !loop : dw .sub4786 : db 1
  !loop : dw .sub47AB : db 1
  !transpose,0
  !subloop,1
  db 24,$7F
  !gs6
  !as6
  !c7
  db 24,$79
  !as6
  db 24,$7F
  !as6
  !c7
  !ds7
  db 96
  !f7
  db 72
  !tie
  !adsrGain,$7F,$F2
  db 48
  !tie
  !instr,!instr29
  !volume,215
  !vibrato,22,10,50
  !loop : dw .sub4802 : db 1
  db 72,$7F
  !g5
  db 24,$79
  !g5
  db 48,$7F
  !gs5
  db 12
  !g5
  db 12,$79
  !gs5
  db 24,$7F
  !f5
  !ds5
  !loop : dw .sub4830 : db 4
  db 24,$7F
  !f5
  !gs5
  db 12
  !as5
  db 12,$79
  !gs5
  db 72,$7F
  !g5
  db 24,$79
  !g5
  db 12,$7F
  !c5
  !g5
  db 24
  !c6
  db 12
  !cs6
  db 12,$79
  !c6
  db 12,$7F
  !as5
  db 12,$79
  !cs6
  db 48,$7F
  !c6
  db 24
  !as5
  db 24,$79
  !c6
  db 48,$7F
  !g5
  db 12
  !gs5
  db 12,$79
  !g5
  db 12,$7F
  !g5
  db 12,$79
  !gs5
  db 12,$7F
  !ds5
  db 12,$79
  !g5
  db 36,$7F
  !f5
  !gs5
  db 12
  !c6
  db 12,$79
  !gs5
  db 36,$7F
  !b5
  !g5
  db 12
  !gs5
  db 12,$79
  !g5
  db 36,$7F
  !as5
  !f5
  db 48
  !g5
  db 12
  !g5
  db 12,$79
  !g5
  db 24,$7F
  !gs5
  !f5
  !g5
  !g5
  db 24,$79
  !g5
  db 48,$7F
  !ds5
  db 24,$79
  !ds5
  db 48,$7F
  !c5
  !c6
  db 12
  !cs6
  db 12,$79
  !c6
  db 48,$7F
  !c6
  db 12
  !as5
  db 12,$79
  !c6
  db 24,$7F
  !gs5
  !g5
  !gs5
  !g5
  db 12
  !f5
  db 12,$79
  !g5
  db 48,$7F
  !f5
  db 24,$79
  !f5
  db 24,$7F
  !gs5
  !g5
  db 12
  !f5
  db 12,$79
  !g5
  db 48,$7F
  !f5
  db 12
  !f5
  !g5
  db 24
  !gs5
  !g5
  !gs5
  db 12
  !gs5
  !as5
  !subloop,0
  db 24,$7F
  !c6
  db 12
  !ds6
  db 12,$79
  !c6
  db 12,$7F
  !f6
  db 12,$79
  !ds6
  !subloop,1
  db 24,$7F
  !ds6
  db 12
  !f6
  db 12,$79
  !ds6
  db 72,$7F
  !c6
  !adsrGain,$7F,$F4
  db 24
  !tie
  db 12
  !rest
  !instr,!instr2D
  !volume,200
  !endVibrato
  !pan,10
  db 12,$78
  !c6
  !ds6
  !f6
  !ds6
  !c6
  !cs6
  !c6
  !instr,!instr2A
  !volume,205
  !vibrato,20,8,42
  !pan,9
  !loop : dw .sub483A : db 1
  db 36,$7F
  !f5
  db 24
  !ds5
  !f5
  !g5
  !gs5
  db 24,$79
  !g5
  db 24,$7F
  !g5
  !f5
  !ds5
  !f5
  !loop : dw .sub483A : db 1
  db 36,$7F
  !gs5
  db 24
  !as5
  db 20
  !c6
  db 12,$79
  !as5
  db 20,$7F
  !gs5
  db 12,$79
  !c6
  db 20,$7F
  !c6
  db 12,$79
  !gs5
  db 20,$7F
  !as5
  db 12,$79
  !c6
  db 20,$7F
  !g5
  db 12,$79
  !as5
  db 20,$7F
  !as5
  db 12,$79
  !g5
  !loop : dw .sub4843 : db 1
  db 24,$7F
  !gs5
  !as5
  !c6
  db 24,$79
  !as5
  db 24,$7F
  !as5
  !gs5
  !g5
  !gs5
  !loop : dw .sub4843 : db 1
  db 24,$7F
  !c6
  !g5
  !ds5
  !c6
  !e6
  !c6
  !g5
  !e6
  !instr,!instr27
  !volume,245
  !vibrato,32,10,63
  !amplify,52
  !transpose,255
  !loop : dw .sub4786 : db 1
  !transpose,0
  db 96,$7F
  !f6
  db 48
  !c6
  db 12
  !c6
  !c6
  !f6
  !f6
  !c6
  !c6
  !transpose,255
  !loop : dw .sub4786 : db 1
  !loop : dw .sub47A1 : db 1
  !transpose,0
  db 24,$7F
  !gs6
  !as6
  !c7
  db 24,$79
  !as6
  db 24,$7F
  !as6
  !gs6
  !g6
  db 48
  !ds7
  db 8
  !cs7
  !c7
  !cs7
  db 24
  !c7
  !as6
  !gs6
  !g6
  !f6
  !ds6
  !transpose,255
  !loop : dw .sub47BA : db 1
  !end

.pattern0_3
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !amplify,0
  !instr,!instr24
  !volume,250
  !vibrato,32,10,63
  !pan,9
  db 96,$7C
  !gs5
  !tie
  db 48
  !gs5
  !gs5
  !as5
  !c6
  db 96
  !gs5
  !tie
  db 48
  !f5
  db 36
  !gs5
  !as5
  db 24
  !gs5
  !g5
  !cs6
  db 96
  !gs5
  !tie
  db 48
  !gs5
  !c6
  !ds6
  !f6
  db 96
  !f6
  !tie
  db 48
  !c6
  db 36
  !f6
  !f6
  db 24
  !ds6
  !ds6
  !as6
  !instr,!instr25
  !volume,180
  !vibrato,22,10,50
  !pan,12
  !loop : dw .sub484F : db 2
  !loop : dw .sub4858 : db 1
  db 24,$7C
  !as5
  db 24,$76
  !gs5
  db 24,$7C
  !g5
  !gs5
  !as5
  db 24,$76
  !gs5
  db 24,$7C
  !gs5
  !as5
  !c6
  !gs5
  !gs6
  db 6
  !g6
  !gs6
  db 12
  !g6
  db 24
  !f6
  !ds6
  !loop : dw .sub486A : db 2
  !loop : dw .sub4858 : db 1
  db 24,$7C
  !f5
  !g5
  !ds5
  db 24,$76
  !g5
  db 24,$7C
  !as4
  db 24,$76
  !ds5
  db 24,$7C
  !c5
  db 12
  !gs4
  db 12,$76
  !c5
  db 24,$7C
  !ds5
  db 12
  !gs4
  db 12,$76
  !ds5
  db 24,$7C
  !f5
  db 12
  !gs4
  !instr,!instr26
  !volume,255
  !vibrato,42,10,79
  !amplify,31
  !g4
  db 24
  !gs4
  !as4
  db 120
  !c5
  db 24
  !c5
  !as4
  !ds5
  db 96
  !f5
  db 24
  !f5
  !c5
  !g5
  !gs5
  db 84
  !g5
  db 4
  !fs5
  !f5
  !e5
  db 48
  !ds5
  db 24
  !f5
  db 120
  !c5
  db 24
  !c5
  !f5
  !gs5
  !c6
  db 96
  !d6
  db 48
  !tie
  db 24
  !a5
  !c6
  db 96
  !cs6
  db 24
  !cs6
  !gs5
  !cs6
  !ds6
  db 84
  !ds6
  !pan,9
  db 4,$7F
  !d6
  !f6
  !g6
  !pan,12
  db 48,$7C
  !ds6
  db 24
  !ds6
  db 72
  !e6
  !instr,!instr27
  !volume,245
  !vibrato,32,10,63
  !amplify,52
  !pan,9
  !toggleLegato
  db 3
  !b5
  db 3,$7D
  !cs6
  db 3,$7E
  !d6
  db 3,$7F
  !e6
  !fs6
  !gs6
  !a6
  db 2
  !b6
  !toggleLegato
  db 1
  !tie
  !pan,12
  db 48,$7C
  !a6
  db 24
  !gs6
  !fs6
  !e6
  !loop : dw .sub4873 : db 1
  !loop : dw .sub4881 : db 1
  !loop : dw .sub4873 : db 1
  !loop : dw .sub488E : db 1
  !loop : dw .sub4873 : db 1
  !loop : dw .sub48AA : db 1
  !loop : dw .sub4873 : db 1
  !loop : dw .sub4881 : db 1
  !loop : dw .sub4873 : db 1
  db 96,$7C
  !fs6
  db 36
  !fs6
  !pan,9
  !toggleLegato
  db 3,$7F
  !e6
  !fs6
  !gs6
  db 2
  !a6
  !toggleLegato
  db 1
  !tie
  !pan,12
  db 24,$7C
  !gs6
  !fs6
  !e6
  !loop : dw .sub4873 : db 1
  !loop : dw .sub48AA : db 1
  db 12,$7C
  !fs6
  !fs6
  !gs6
  !gs6
  db 24
  !a6
  db 12,$76
  !gs6
  !gs6
  db 12,$7C
  !gs6
  !gs6
  !fs6
  !fs6
  !e6
  !e6
  db 96
  !fs6
  !tie
  db 24
  !tie
  !instr,!instr25
  !volume,180
  !vibrato,22,10,50
  !loop : dw .sub48B6 : db 1
  !loop : dw .sub48CD : db 1
  !loop : dw .sub48B6 : db 1
  !loop : dw .sub48E3 : db 1
  db 24,$7C
  !b5
  db 12
  !a5
  !rest
  db 24
  !gs5
  db 12
  !b5
  !rest
  !loop : dw .sub48B6 : db 1
  !loop : dw .sub48CD : db 1
  !loop : dw .sub48B6 : db 1
  !loop : dw .sub48E3 : db 1
  !instr,!instr2A
  !volume,205
  !vibrato,20,8,42
  db 12,$7C
  !e6
  !e6
  !d6
  !d6
  !cs6
  !cs6
  !b5
  !b5
  db 48
  !a5
  db 24
  !fs5
  !gs5
  db 96
  !a5
  db 48
  !a5
  !a5
  db 24
  !b5
  !a5
  !cs6
  !b5
  db 48
  !a5
  db 24
  !fs5
  !gs5
  !a5
  !cs6
  !b5
  !cs6
  db 48
  !a5
  db 24
  !b5
  !gs5
  !b5
  !a5
  !cs6
  !d6
  db 96
  !cs6
  db 24
  !gs5
  !a5
  !gs5
  !a5
  db 48
  !fs6
  !fs6
  !gs6
  !a6
  db 96
  !cs6
  db 24
  !b5
  !a5
  !gs5
  !a5
  db 48
  !cs6
  !fs6
  !instr,!instr28
  !volume,255
  !vibrato,32,10,63
  !pan,12
  db 24
  !gs6
  !g6
  !f6
  !ds6
  !subloop,0
  !transpose,255
  !loop : dw .sub4873 : db 1
  !loop : dw .sub4881 : db 1
  !loop : dw .sub4873 : db 1
  !loop : dw .sub488E : db 1
  !loop : dw .sub4873 : db 1
  !loop : dw .sub48AA : db 1
  !transpose,0
  !subloop,1
  db 24,$7C
  !f6
  !g6
  !gs6
  db 24,$76
  !g6
  db 24,$7C
  !g6
  !f6
  !ds6
  db 96
  !f6
  db 72
  !tie
  !instr,!instr29
  !volume,215
  !vibrato,22,10,50
  !pan,9
  db 12
  !f4
  db 12,$7D
  !g4
  db 12,$7E
  !gs4
  db 12,$7F
  !as4
  !volume,140
  !pan,10
  !subtranspose,18
  db 6,$7D
  !g4
  db 12,$7E
  !gs4
  db 12,$7F
  !as4
  !loop : dw .sub4802 : db 1
  db 66,$7F
  !g5
  !subtranspose,0
  !instr,!instr29
  !volume,215
  !vibrato,22,10,50
  !pan,11
  db 48,$7C
  !f5
  db 12
  !ds5
  db 12,$76
  !f5
  db 24,$7C
  !cs5
  !c5
  !loop : dw .sub48EF : db 4
  db 24,$7C
  !cs5
  !f5
  db 12
  !g5
  db 12,$76
  !f5
  db 72,$7C
  !ds5
  db 24,$76
  !ds5
  db 12,$7C
  !gs4
  !c5
  db 24
  !g5
  db 12
  !as5
  db 12,$76
  !g5
  db 12,$7C
  !g5
  db 12,$76
  !as5
  db 48,$7C
  !g5
  db 24
  !g5
  db 24,$76
  !g5
  db 48,$7C
  !e5
  db 12
  !f5
  db 12,$76
  !e5
  db 12,$7C
  !ds5
  db 12,$76
  !f5
  db 12,$7C
  !c5
  db 12,$76
  !ds5
  db 36,$7C
  !c5
  !f5
  db 12
  !gs5
  db 12,$76
  !f5
  db 36,$7C
  !g5
  !ds5
  db 12
  !f5
  db 12,$76
  !ds5
  db 36,$7C
  !g5
  !c5
  db 48
  !ds5
  db 12
  !ds5
  db 12,$76
  !ds5
  db 24,$7C
  !f5
  !c5
  db 48
  !ds5
  db 24,$76
  !ds5
  db 48,$7C
  !c5
  db 24,$76
  !c5
  db 96,$7C
  !g4
  !tie
  db 24
  !tie
  !ds5
  !f5
  !ds5
  db 12
  !cs5
  db 12,$76
  !ds5
  db 48,$7C
  !cs5
  db 24,$76
  !cs5
  db 24,$7C
  !f5
  !ds5
  db 12
  !cs5
  db 12,$76
  !ds5
  db 72,$7C
  !cs5
  db 24
  !f5
  !ds5
  db 48
  !f5
  !subloop,0
  db 24,$7C
  !g5
  db 12
  !c6
  db 12,$76
  !g5
  db 12,$7C
  !c6
  db 12,$76
  !c6
  !subloop,1
  db 24,$7C
  !g5
  db 12
  !c6
  db 12,$76
  !g5
  db 72,$7C
  !g5
  !instr,!instr2D
  !volume,200
  !endVibrato
  !pan,10
  db 12,$7F
  !c6
  !ds6
  !f6
  !ds6
  !c6
  !cs6
  !c6
  !as5
  !gs5
  !f5
  !instr,!instr2A
  !volume,205
  !vibrato,20,8,42
  !pan,12
  !loop : dw .sub48F9 : db 1
  db 36,$7C
  !c5
  db 24
  !c5
  !c5
  !ds5
  !f5
  db 24,$76
  !ds5
  db 24,$7C
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub48F9 : db 1
  db 36,$7C
  !f5
  db 24
  !g5
  db 20
  !gs5
  db 12,$76
  !g5
  db 20,$7C
  !f5
  db 12,$76
  !gs5
  db 20,$7C
  !gs5
  db 12,$76
  !f5
  db 20,$7C
  !g5
  db 12,$76
  !gs5
  db 20,$7C
  !ds5
  db 12,$76
  !g5
  db 20,$7C
  !g5
  db 12,$76
  !ds5
  !loop : dw .sub4902 : db 1
  db 24,$7C
  !f5
  !g5
  !gs5
  db 24,$76
  !g5
  db 24,$7C
  !g5
  !f5
  !ds5
  !f5
  !loop : dw .sub4902 : db 1
  db 24,$7C
  !g5
  !ds5
  !c5
  !g5
  !c6
  !g5
  !e5
  db 12
  !c6
  !instr,!instr27
  !volume,245
  !vibrato,32,10,63
  !amplify,52
  !pan,9
  !toggleLegato
  db 3,$7A
  !as5
  db 3,$7C
  !c6
  db 3,$7D
  !cs6
  db 2,$7E
  !ds6
  !toggleLegato
  db 1
  !tie
  !pan,12
  !transpose,255
  !loop : dw .sub4873 : db 1
  !loop : dw .sub4881 : db 1
  !transpose,0
  !transpose,255
  !loop : dw .sub4873 : db 1
  !loop : dw .sub488E : db 1
  !transpose,0
  db 24,$7C
  !f6
  !g6
  !gs6
  db 24,$76
  !g6
  db 24,$7C
  !g6
  !f6
  !ds6
  db 48
  !c7
  db 24
  !as6
  !gs6
  !g6
  !f6
  !ds6
  !c6
  !as5
  db 12
  !gs5
  !gs5
  !as5
  !as5
  db 24
  !c6
  db 12,$76
  !as5
  !as5
  db 12,$7C
  !c6
  !c6
  !f6
  !f6
  db 24
  !g6
  db 96
  !a6
  !tie
  db 24
  !tie
  !end

.pattern0_4
  !remoteCode : dw .remoteCode4307 : db -1,0
  !remoteCode : dw .remoteCode430A : db 3,0
.pattern1_4:
  !remoteCode : dw .remoteCode4307 : db 0,0
  !remoteCode : dw .remoteCode430A : db 0,0
  !instr,!instr2B
  !volume,175
  !endVibrato
  !pan,10
  !toggleEcho
  !subloop,0
  !loop : dw .sub490E : db 1
  !loop : dw .sub4921 : db 1
  !subloop,1
  !toggleEcho
  !subloop,0
  !loop : dw .sub490E : db 1
  !loop : dw .sub4921 : db 1
  !subloop,2
  db 12,$4F
  !f4
  !f4
  !gs4
  !cs5
  !f4
  !gs4
  !cs5
  !f5
  !cs5
  !gs4
  !f4
  !f4
  !cs5
  !gs4
  !f4
  !cs5
  !loop : dw .sub4921 : db 1
  !instr,!instr2E
  !volume,200
  !vibrato,10,10,26
  !pan,11
  !remoteCode : dw .remoteCode4307 : db -1,0
  !remoteCode : dw .remoteCode430A : db 3,0
  db 96,$7F
  !c5
  !tie
  db 96
  !cs5
  !tie
  db 96
  !as4
  !tie
  !c5
  !rest
  db 96
  !c5
  !tie
  db 96
  !cs5
  !tie
  !c5
  !ds5
  db 96
  !f5
  !tie
  !remoteCode : dw .remoteCode4307 : db 0,0
  !remoteCode : dw .remoteCode430A : db 0,0
  !instr,!instr2F
  !volume,175
  !endVibrato
  db 48
  !f5
  db 24,$79
  !f5
  db 24,$7F
  !f5
  db 24,$79
  !f5
  db 24,$7F
  !f5
  db 24,$79
  !f5
  db 24,$7F
  !f5
  !subloop,0
  db 24,$79
  !f5
  db 24,$7F
  !f5
  !subloop,3
  db 48,$7F
  !ds5
  db 24,$79
  !ds5
  db 24,$7F
  !ds5
  db 24,$79
  !ds5
  db 24,$7F
  !ds5
  db 24,$79
  !ds5
  db 24,$7F
  !ds5
  db 24,$79
  !ds5
  db 24,$7F
  !f5
  db 24,$79
  !f5
  db 24,$7F
  !f5
  db 24,$79
  !f5
  db 24,$7F
  !ds5
  db 24,$79
  !ds5
  db 24,$7F
  !ds5
  !subloop,0
  db 24,$7F
  !d5
  db 24,$79
  !d5
  !subloop,3
  db 24,$7F
  !cs5
  db 24,$79
  !cs5
  db 24,$7F
  !cs5
  db 24,$79
  !cs5
  db 24,$7F
  !cs5
  db 24,$79
  !cs5
  db 24,$7F
  !cs5
  db 24,$79
  !cs5
  db 24,$7F
  !ds5
  db 24,$79
  !ds5
  db 24,$7F
  !ds5
  db 24,$79
  !ds5
  db 24,$7F
  !ds5
  db 24,$79
  !ds5
  db 24,$7F
  !ds5
  db 48
  !e5
  db 24,$79
  !e5
  db 24,$7F
  !e5
  db 24,$79
  !e5
  db 24,$7F
  !d5
  db 24,$79
  !d5
  db 24,$7F
  !e5
  db 24,$79
  !e5
  !instr,!instr2B
  !volume,175
  !endVibrato
  !pan,10
  !transpose,1
  !loop : dw .sub4934 : db 2
  !loop : dw .sub4991 : db 1
  !transpose,0
  db 12,$79
  !cs5
  !a4
  !instr,!instr30
  !volume,140
  !endVibrato
  !pan,11
  !loop : dw .sub49CD : db 1
  db 24,$76
  !e5
  !loop : dw .sub49CD : db 1
  !instr,!instr2B
  !volume,175
  !endVibrato
  !pan,10
  !transpose,1
  !subloop,0
  !loop : dw .sub490E : db 1
  !loop : dw .sub4921 : db 1
  !subloop,4
  !loop : dw .sub490E : db 1
  !transpose,0
  db 12,$4F
  !d4
  !fs4
  !a4
  !d4
  !fs4
  !a4
  !d4
  !a4
  db 96
  !rest
  !loop : dw .sub4934 : db 2
  !loop : dw .sub4991 : db 1
  !instr,!instr2E
  !volume,200
  !vibrato,10,10,26
  !pan,11
  !remoteCode : dw .remoteCode4307 : db -1,0
  !remoteCode : dw .remoteCode430A : db 3,0
  db 96,$7F
  !c5
  !tie
  !tie
  !tie
  db 96
  !as4
  !tie
  !tie
  !tie
  db 96
  !cs5
  !tie
  !tie
  !tie
  db 96
  !as4
  !tie
  !tie
  !tie
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
  db 96
  !cs5
  !tie
  !tie
  !tie
  db 96
  !as4
  !tie
  !c5
  !rest
  !loop : dw .sub49F9 : db 1
  !subloop,0
  db 24,$7F
  !f5
  db 8
  !rest
  !subloop,2
  !subloop,0
  db 24,$7F
  !ds5
  db 8
  !rest
  !subloop,2
  !loop : dw .sub49F9 : db 1
  db 96,$7F
  !c5
  !e5
  !loop : dw .sub49F9 : db 1
  db 96,$7F
  !c5
  !ds5
  !cs5
  !ds5
  !c5
  db 48
  !f5
  !ds5
  db 72
  !f5
  db 24
  !rest
  db 72
  !g5
  db 96
  !a5
  !tie
  db 24
  !tie
  !end

.pattern0_5
  !remoteCode : dw .remoteCode4307 : db -1,0
  !remoteCode : dw .remoteCode430A : db 3,0
.pattern1_5:
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,!instr2E
  !volume,200
  !vibrato,10,10,26
  !pan,13
  !loop : dw .sub4A4B : db 3
  db 96,$7E
  !f4
  !tie
  !tie
  !tie
  db 96
  !f4
  !tie
  !tie
  !tie
  db 96
  !ds4
  !tie
  !f4
  !rest
  db 96
  !f4
  !tie
  !tie
  !tie
  !ds4
  !g4
  db 96
  !gs4
  !tie
  !remoteCode : dw .remoteCode4307 : db 0,0
  !remoteCode : dw .remoteCode430A : db 0,0
  !instr,!instr2F
  !volume,175
  !endVibrato
  db 48
  !gs4
  !subloop,0
  db 24,$78
  !gs4
  db 24,$7E
  !gs4
  !subloop,6
  db 48,$7E
  !g4
  db 24,$78
  !g4
  !loop : dw .sub4A52 : db 6
  db 24,$7E
  !g4
  !loop : dw .sub4A52 : db 4
  !transpose,254
  !loop : dw .sub4A52 : db 4
  !transpose,0
  !loop : dw .sub4A52 : db 3
  db 24,$7E
  !g4
  db 48
  !g4
  db 24,$78
  !g4
  db 24,$7E
  !g4
  db 24,$78
  !g4
  db 24,$7E
  !fs4
  db 24,$78
  !fs4
  db 24,$7E
  !fs4
  db 24,$78
  !fs4
  !instr,!instr2E
  !volume,200
  !vibrato,10,10,26
  !remoteCode : dw .remoteCode4307 : db -1,0
  !remoteCode : dw .remoteCode430A : db 3,0
  !subloop,0
  db 96,$7E
  !fs4
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 96
  !e4
  !tie
  !tie
  !tie
  !subloop,1
  db 72,$7E
  !d4
  db 24
  !rest
  db 72
  !e4
  db 96
  !fs4
  !tie
  db 24
  !tie
  !remoteCode : dw .remoteCode4307 : db 0,0
  !remoteCode : dw .remoteCode430A : db 0,0
  !instr,!instr30
  !volume,140
  !endVibrato
  !subloop,0
  !loop : dw .sub4A59 : db 2
  !loop : dw .sub4A68 : db 2
  !transpose,2
  !loop : dw .sub4A68 : db 2
  !transpose,0
  !subloop,3
  !instr,!instr2E
  !volume,200
  !vibrato,10,10,26
  !remoteCode : dw .remoteCode4307 : db -1,0
  !remoteCode : dw .remoteCode430A : db 3,0
  !transpose,1
  !loop : dw .sub4A4B : db 3
  db 96,$7E
  !f4
  !tie
  !ds4
  !rest
  !transpose,0
  !subloop,0
  db 96,$7E
  !f4
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 96
  !ds4
  !tie
  !tie
  !tie
  !subloop,1
  db 72,$7E
  !f4
  db 24
  !rest
  db 72
  !g4
  db 96
  !gs4
  !tie
  db 24
  !tie
  db 96
  !f4
  !tie
  !tie
  !tie
  db 96
  !ds4
  !tie
  !tie
  !tie
  db 96
  !f4
  !tie
  !tie
  !tie
  db 96
  !ds4
  db 72
  !tie
  db 96
  !e4
  !tie
  db 24
  !tie
  db 96
  !f4
  !tie
  !tie
  !tie
  db 96
  !g4
  !tie
  !tie
  !tie
  db 96
  !f4
  !tie
  !tie
  !tie
  db 96
  !ds4
  !tie
  !tie
  !rest
  !loop : dw .sub4A75 : db 1
  !subloop,0
  db 24,$7E
  !gs4
  db 8
  !rest
  !subloop,2
  !subloop,0
  db 24,$7E
  !g4
  db 8
  !rest
  !subloop,2
  !loop : dw .sub4A75 : db 1
  db 96,$7E
  !ds4
  !g4
  !loop : dw .sub4A75 : db 1
  db 96,$7E
  !ds4
  db 48
  !gs4
  !g4
  db 96
  !f4
  !g4
  !ds4
  db 96
  !gs4
  db 72
  !tie
  db 24
  !rest
  db 72
  !as4
  db 96
  !c5
  !tie
  db 24
  !tie
  !end

.pattern0_6
  !endVibrato
.pattern1_6:
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  !loop : dw .sub4592 : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub4592 : db 1
  !subloop,0
  !loop : dw .sub4592 : db 2
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub4592 : db 1
  !subloop,2
  !subloop,0
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  !loop : dw .sub45A3 : db 15
  !subloop,2
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub45B9 : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub45B9 : db 1
  !subloop,0
  !loop : dw .sub4592 : db 1
  !loop : dw .sub45B9 : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub45B9 : db 1
  !subloop,1
  !loop : dw .sub4592 : db 1
  !loop : dw .sub45B9 : db 1
  !loop : dw .sub45D6 : db 2
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub45F8 : db 1
  db 12,$7F
  !c5
  db 12,$7D
  !c5
  db 24,$7F
  !c5
  !loop : dw .sub45B9 : db 1
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub45F8 : db 1
  !loop : dw .sub4641 : db 2
  !subloop,0
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  !loop : dw .sub466C : db 23
  !subloop,1
  !loop : dw .sub4685 : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub4592 : db 1
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  !loop : dw .sub4592 : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub4592 : db 1
  !subloop,0
  !loop : dw .sub4592 : db 2
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub4592 : db 1
  !subloop,6
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  !loop : dw .sub45A3 : db 15
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  !loop : dw .sub45A3 : db 13
  db 96,$7F
  !rest
  !subloop,0
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  !loop : dw .sub45A3 : db 23
  !subloop,1
  !loop : dw .sub4685 : db 1
  !loop : dw .sub45A3 : db 2
  !subloop,0
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  !loop : dw .sub45A3 : db 15
  !subloop,2
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  !loop : dw .sub45A3 : db 13
  db 96,$7F
  !rest
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  !loop : dw .sub4592 : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub4592 : db 1
  !subloop,0
  !loop : dw .sub4592 : db 2
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub4592 : db 1
  !subloop,1
  !instr,!instr21
  !volume,205
  !pan,10
  !subloop,0
  db 32,$7F
  !c5
  !subloop,5
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub45B9 : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub45B9 : db 1
  !subloop,0
  !loop : dw .sub4592 : db 1
  !loop : dw .sub45B9 : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub45B9 : db 1
  !subloop,2
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub46BC : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub45B9 : db 1
  !subloop,0
  !loop : dw .sub4592 : db 1
  !loop : dw .sub46BC : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub45B9 : db 1
  !subloop,2
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub46BC : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub45B9 : db 1
  !loop : dw .sub4592 : db 1
  !loop : dw .sub46BC : db 1
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub45B9 : db 1
  !loop : dw .sub45B9 : db 1
  !loop : dw .sub46BC : db 1
  !loop : dw .sub45D6 : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 24,$7F
  !c4
  !amplify,0
  !instr,!instr20
  !volume,195
  !pan,9
  !instr,!instr22
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 120
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  !loop : dw .sub45A3 : db 1
  !loop : dw .sub4592 : db 1
  !end

.pattern0_7
  !remoteCode : dw .remoteCode4307 : db -1,0
  !remoteCode : dw .remoteCode430A : db 3,0
.pattern1_7:
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,!instr2E
  !volume,200
  !vibrato,10,10,26
  !pan,8
  !loop : dw .sub4A05 : db 3
  db 96,$7E
  !gs4
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 96
  !g4
  !tie
  !gs4
  !rest
  db 96
  !gs4
  !tie
  !tie
  !tie
  !g4
  !as4
  db 96
  !c5
  !tie
  !remoteCode : dw .remoteCode4307 : db 0,0
  !remoteCode : dw .remoteCode430A : db 0,0
  !instr,!instr2F
  !volume,175
  !endVibrato
  db 48
  !c5
  db 24,$78
  !c5
  !loop : dw .sub4A0C : db 3
  !transpose,1
  !loop : dw .sub4A0C : db 3
  db 24,$7E
  !c5
  !transpose,254
  db 48
  !c5
  db 24,$78
  !c5
  !loop : dw .sub4A0C : db 3
  !transpose,0
  !loop : dw .sub4A0C : db 3
  db 24,$7E
  !c5
  !transpose,254
  !loop : dw .sub4A0C : db 4
  !transpose,252
  !loop : dw .sub4A0C : db 4
  !transpose,254
  !loop : dw .sub4A0C : db 3
  db 24,$7E
  !c5
  !transpose,0
  db 48
  !c5
  db 24,$78
  !c5
  !loop : dw .sub4A0C : db 1
  !transpose,253
  !loop : dw .sub4A0C : db 2
  !transpose,0
  !instr,!instr2E
  !volume,200
  !vibrato,10,10,26
  !remoteCode : dw .remoteCode4307 : db -1,0
  !remoteCode : dw .remoteCode430A : db 3,0
  !subloop,0
  db 96,$7E
  !a4
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 96
  !gs4
  !tie
  !tie
  !tie
  !subloop,1
  db 72,$7E
  !fs4
  db 24
  !rest
  db 72
  !gs4
  db 96
  !a4
  !tie
  db 24
  !tie
  !rest
  !instr,!instr30
  !volume,140
  !endVibrato
  !remoteCode : dw .remoteCode4307 : db 0,0
  !remoteCode : dw .remoteCode430A : db 0,0
  !subloop,0
  !loop : dw .sub4A13 : db 1
  db 24,$75
  !b4
  !subloop,2
  !loop : dw .sub4A13 : db 1
  !instr,!instr2E
  !volume,200
  !vibrato,10,10,26
  !remoteCode : dw .remoteCode4307 : db -1,0
  !remoteCode : dw .remoteCode430A : db 3,0
  !transpose,1
  !loop : dw .sub4A05 : db 3
  !transpose,0
  db 96,$7E
  !a4
  !tie
  db 84
  !tie
  !remoteCode : dw .remoteCode4307 : db 0,0
  !remoteCode : dw .remoteCode430A : db 0,0
  !instr,!instr28
  !volume,255
  !vibrato,32,10,63
  !pan,9
  !toggleLegato
  db 3
  !g6
  !gs6
  !a6
  db 2
  !as6
  !toggleLegato
  db 1
  !tie
  db 96,$7F
  !rest
  !instr,!instr2E
  !volume,200
  !vibrato,10,10,26
  !pan,8
  !remoteCode : dw .remoteCode4307 : db -1,0
  !remoteCode : dw .remoteCode430A : db 3,0
  !subloop,0
  db 96,$7F
  !gs4
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 96
  !g4
  !tie
  !tie
  !tie
  !subloop,1
  db 72,$7F
  !gs4
  db 24
  !rest
  db 72
  !as4
  db 96
  !c5
  !tie
  db 24
  !tie
  db 96
  !gs4
  !tie
  !tie
  !tie
  db 96
  !g4
  !tie
  !tie
  !tie
  db 96
  !gs4
  !tie
  db 96
  !as4
  !tie
  db 96
  !g4
  !tie
  !tie
  !tie
  db 96
  !gs4
  !tie
  !tie
  !tie
  db 96
  !as4
  !tie
  !tie
  !tie
  db 96
  !as4
  !tie
  db 96
  !gs4
  !tie
  db 96
  !g4
  !tie
  !tie
  !rest
  !loop : dw .sub4A3F : db 1
  !subloop,0
  db 24,$7F
  !c5
  db 8
  !rest
  !subloop,5
  !loop : dw .sub4A3F : db 1
  db 96,$7F
  !g4
  !c5
  !loop : dw .sub4A3F : db 1
  db 96,$7F
  !g4
  db 48
  !c5
  !as4
  db 96
  !gs4
  db 48
  !as4
  !c5
  db 96
  !g4
  !c5
  db 72
  !cs5
  db 24
  !rest
  db 72
  !ds5
  db 96
  !f5
  !tie
  db 24
  !tie
  !end

.sub430E
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub432F
  db 12,$7F
  !c4
  !instr,!instr20
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !end

.sub4357
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4379
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !end

.sub438D
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub43B5
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,225
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
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub43DA
  db 12,$7F
  !c4
  !instr,!instr20
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr21
  !volume,205
  !pan,10
  !amplify,0
  db 24
  !c5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4407
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub441A
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !end

.sub442F
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4442
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4465
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,205
  !pan,10
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4484
  db 12,$7F
  !c4
  !instr,!instr20
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub44B4
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub44D6
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub44F8
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,225
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
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub451D
  db 12,$7F
  !c4
  !instr,!instr20
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr21
  !volume,205
  !pan,10
  !amplify,0
  db 24
  !c5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !end

.sub454C
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub456D
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,225
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
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub46DD
  db 24,$7F
  !cs4
  !cs4
  !cs5
  db 12
  !cs4
  db 24
  !cs4
  db 12
  !cs4
  db 24
  !cs4
  !cs5
  !cs4
  !end

.sub46ED
  db 24,$7F
  !cs4
  !cs4
  !cs5
  db 12
  !cs4
  db 24
  !ds4
  db 12
  !ds4
  db 24
  !ds4
  !ds5
  !ds4
  !end

.sub46FD
  db 24,$7F
  !f4
  db 12
  !f5
  !f5
  !end

.sub4704
  db 24,$7F
  !f5
  db 12
  !c6
  db 12,$76
  !f5
  !end

.sub470D
  db 24,$7F
  !d5
  db 12
  !as5
  db 12,$76
  !d5
  !end

.sub4716
  db 12,$7F
  !f5
  !f5
  !c6
  db 12,$76
  !f5
  !end

.sub471F
  db 12,$7F
  !fs4
  !fs4
  !fs5
  !fs5
  !end

.sub4726
  db 24,$7F
  !fs4
  db 24,$78
  !fs4
  db 24,$7F
  !fs4
  db 24,$78
  !fs4
  db 24,$7F
  !fs4
  db 24,$78
  !fs4
  db 24,$7F
  !fs4
  db 24,$78
  !fs4
  db 24,$7F
  !d4
  db 24,$78
  !d4
  db 24,$7F
  !d4
  db 24,$78
  !d4
  db 24,$7F
  !e4
  db 24,$78
  !e4
  db 24,$7F
  !e4
  !end

.sub4754
  !subloop,0
  db 24,$7F
  !fs4
  !subloop,7
  !subloop,0
  db 24,$7F
  !d4
  !subloop,3
  db 24,$7F
  !e4
  !end

.sub4766
  db 24,$7F
  !cs4
  !cs5
  !end

.sub4592
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,205
  !pan,10
  !c5
  !instr,!instr20
  !volume,195
  !pan,9
  !end

.sub45A3
  db 12,$7F
  !c5
  db 12,$7D
  !c5
  !instr,!instr21
  !volume,205
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr20
  !volume,195
  !pan,9
  !end

.sub476B
  db 24,$7F
  !c6
  !ds6
  !f6
  db 24,$79
  !ds6
  !end

.sub4774
  db 24,$7F
  !c6
  !ds6
  !f6
  !c6
  !gs6
  db 6
  !g6
  !gs6
  db 12
  !g6
  db 24
  !f6
  !ds6
  !as5
  !c6
  !end

.sub4786
  db 24,$7F
  !fs6
  !gs6
  !a6
  db 24,$79
  !gs6
  db 24,$7F
  !gs6
  !fs6
  !e6
  !end

.sub4794
  db 96,$7F
  !fs6
  db 48
  !tie
  db 12
  !cs6
  !cs6
  !fs6
  !fs6
  !cs6
  !cs6
  !end

.sub47A1
  db 96,$7F
  !cs7
  db 48
  !tie
  db 24
  !b6
  !a6
  !gs6
  !end

.sub47AB
  db 48,$7F
  !cs7
  db 8
  !b6
  !a6
  !b6
  db 24
  !a6
  !b6
  !a6
  !gs6
  !fs6
  !e6
  !end

.sub47BA
  db 12,$7F
  !a6
  !a6
  !b6
  !b6
  db 24
  !cs7
  db 12,$79
  !b6
  !b6
  db 12,$7F
  !b6
  !b6
  !cs7
  !cs7
  !e7
  !e7
  db 96
  !fs7
  !tie
  db 24
  !tie
  !end

.sub47D4
  db 18,$7F
  !cs6
  !rest
  db 18,$7E
  !cs6
  !rest
  db 18,$7D
  !cs6
  !rest
  db 18,$7C
  !cs6
  !rest
  db 24,$7D
  !cs6
  db 24,$7E
  !cs6
  db 24,$7F
  !cs6
  db 12
  !a5
  !rest
  db 24
  !fs6
  !end

.sub47F3
  db 12,$7F
  !a5
  !rest
  db 24
  !gs6
  db 12
  !b5
  !rest
  db 24
  !a6
  db 12
  !cs6
  !rest
  !end

.sub4802
  db 24,$7F
  !c5
  !ds5
  !f5
  db 24,$79
  !ds5
  db 24,$7F
  !c5
  !ds5
  !f5
  !gs5
  db 24,$79
  !f5
  db 24,$7F
  !as5
  db 24,$79
  !gs5
  db 24,$7F
  !c6
  db 24,$79
  !as5
  db 24,$7F
  !cs6
  db 24,$79
  !c6
  db 96,$7F
  !c6
  db 48
  !tie
  db 24
  !as5
  db 24,$79
  !c6
  !end

.sub4830
  db 24,$7F
  !as4
  !c5
  db 12
  !cs5
  db 12,$79
  !c5
  !end

.sub483A
  db 36,$7F
  !cs5
  !f5
  db 24
  !gs5
  db 36
  !g5
  !end

.sub4843
  db 36,$7F
  !f5
  !g5
  db 24
  !gs5
  db 36
  !g5
  !gs5
  db 24
  !as5
  !end

.sub484F
  db 24,$7C
  !f5
  !g5
  !gs5
  db 24,$76
  !gs5
  !end

.sub4858
  db 24,$7C
  !gs5
  !as5
  !c6
  !gs5
  !c6
  db 6
  !as5
  !c6
  db 12
  !as5
  db 24
  !gs5
  !g5
  !g5
  !gs5
  !end

.sub486A
  db 24,$7C
  !gs5
  !as5
  !c6
  db 24,$76
  !as5
  !end

.sub4873
  db 24,$7C
  !a5
  !b5
  !cs6
  db 24,$76
  !b5
  db 24,$7C
  !b5
  !a5
  !gs5
  !end

.sub4881
  db 96,$7C
  !a5
  db 48
  !tie
  db 12
  !a5
  !a5
  !a5
  !a5
  !a5
  !a5
  !end

.sub488E
  db 96,$7C
  !fs6
  db 36
  !tie
  !pan,9
  !toggleLegato
  db 3,$7F
  !e6
  !fs6
  !gs6
  db 2
  !a6
  !toggleLegato
  db 1
  !tie
  !pan,12
  db 24,$7C
  !gs6
  !fs6
  !e6
  !end

.sub48AA
  db 48,$7C
  !a6
  db 24
  !gs6
  !fs6
  !gs6
  !fs6
  !e6
  !cs6
  !cs6
  !end

.sub48B6
  db 18,$7C
  !a5
  !rest
  db 18,$7B
  !a5
  !rest
  db 18,$7A
  !a5
  !rest
  db 18,$79
  !a5
  !rest
  db 24,$7A
  !a5
  db 24,$7B
  !a5
  !end

.sub48CD
  db 24,$7C
  !a5
  db 12
  !fs5
  !rest
  db 24
  !a5
  db 12
  !fs5
  !rest
  db 24
  !b5
  db 12
  !gs5
  !rest
  db 24
  !cs6
  db 12
  !a5
  !rest
  !end

.sub48E3
  db 24,$7C
  !fs5
  db 12
  !fs5
  !rest
  db 24
  !a5
  db 12
  !a5
  !rest
  !end

.sub48EF
  db 24,$7C
  !f4
  !gs4
  db 12
  !as4
  db 12,$76
  !gs4
  !end

.sub48F9
  db 36,$7C
  !gs4
  !cs5
  db 24
  !f5
  db 36
  !ds5
  !end

.sub4902
  db 36,$7C
  !cs5
  !ds5
  db 24
  !f5
  db 36
  !ds5
  !f5
  db 24
  !g5
  !end

.sub490E
  db 12,$4F
  !f4
  !f4
  !gs4
  !c5
  !f4
  !gs4
  !c5
  !f5
  !c5
  !gs4
  !f4
  !f4
  !c5
  !gs4
  !f4
  !c5
  !end

.sub4921
  db 12,$4F
  !cs4
  !f4
  !gs4
  !cs4
  !f4
  !gs4
  !cs4
  !gs4
  !ds4
  !g4
  !as4
  !ds4
  !g4
  !as4
  !ds4
  !as4
  !end

.sub4934
  !subloop,0
  db 12,$4F
  !f4
  !gs4
  !c5
  !f5
  !c5
  !gs4
  !subloop,2
  db 12,$4F
  !f4
  !c5
  !f5
  !c5
  !gs4
  !c5
  !f5
  !c5
  !gs5
  !c5
  !g5
  !c5
  !f5
  !c5
  !cs4
  !f4
  !gs4
  !cs5
  !gs4
  !f4
  !cs4
  !f4
  !gs4
  !cs5
  !gs4
  !f4
  !cs4
  !f4
  !gs4
  !cs5
  !f5
  !cs5
  !gs5
  !cs5
  !g5
  !cs5
  !f5
  !cs5
  !gs4
  !g4
  !f4
  !gs4
  !ds4
  !gs4
  !cs4
  !gs4
  !ds4
  !g4
  !as4
  !ds5
  !as4
  !g4
  !ds4
  !g4
  !as4
  !ds5
  !as4
  !g4
  !ds4
  !g4
  !as4
  !ds5
  !g5
  !gs5
  !as5
  !g5
  !ds5
  !g5
  !ds5
  !as4
  !ds5
  !as4
  !g4
  !as4
  !ds5
  !g5
  !gs5
  !as5
  !end

.sub4991
  !instr,!instr2C
  db 6,$7F
  !c3
  !cs3
  !ds3
  !f3
  !gs3
  !cs4
  !ds4
  !f4
  !gs4
  !cs5
  !f5
  !gs5
  db 6,$79
  !gs4
  !cs5
  !f5
  !gs5
  db 6,$7F
  !cs3
  !ds3
  !f3
  !g3
  !as3
  !ds4
  !f4
  !g4
  !as4
  !ds5
  !f5
  !g5
  !as5
  db 6,$79
  !ds5
  db 12,$7F
  !c3
  !f3
  !gs3
  !c4
  !f4
  !gs4
  !c5
  !f5
  !gs5
  !c6
  !gs5
  !f5
  !c5
  !gs4
  !f4
  !c4
  !gs3
  !end

.sub49CD
  db 24,$7F
  !fs5
  db 24,$79
  !fs5
  db 24,$7F
  !fs5
  db 24,$79
  !fs5
  db 24,$7F
  !fs5
  db 24,$79
  !fs5
  db 24,$7F
  !fs5
  !d5
  db 24,$79
  !d5
  db 24,$7F
  !d5
  db 24,$79
  !d5
  db 24,$7F
  !e5
  db 24,$79
  !e5
  db 24,$7F
  !e5
  db 24,$79
  !e5
  !end

.sub49F9
  db 96,$7F
  !cs5
  !ds5
  !c5
  db 48
  !f5
  !ds5
  db 96
  !cs5
  !ds5
  !end

.sub4A4B
  db 96,$7E
  !f4
  !tie
  !cs4
  !ds4
  !end

.sub4A52
  db 24,$7E
  !g4
  db 24,$78
  !g4
  !end

.sub4A59
  !pan,10
  db 24,$7E
  !fs4
  !pan,13
  !a4
  db 24,$78
  !a4
  db 24,$7E
  !a4
  !end

.sub4A68
  db 24,$7E
  !fs4
  !pan,10
  db 12
  !fs4
  db 12,$78
  !fs4
  !pan,13
  !end

.sub4A75
  db 96,$7E
  !f4
  !g4
  !ds4
  !gs4
  !f4
  !g4
  !end

.sub45B9
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 24,$7F
  !c4
  !amplify,0
  !instr,!instr21
  !volume,205
  !pan,10
  !c5
  !instr,!instr20
  !volume,195
  !pan,9
  !end

.sub45D6
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr20
  !volume,195
  !pan,9
  db 12,$7D
  !c5
  !instr,!instr21
  !volume,205
  !pan,10
  db 24,$7F
  !c5
  !end

.sub45F8
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 24,$7F
  !c4
  !amplify,0
  !instr,!instr20
  !volume,195
  !pan,9
  !c5
  db 12
  !c5
  db 12,$7D
  !c5
  db 24,$7F
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  !c4
  !amplify,0
  !instr,!instr20
  !volume,195
  !pan,9
  !c5
  !c5
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  !c4
  !amplify,0
  !instr,!instr20
  !volume,195
  !pan,9
  !c5
  !end

.sub4641
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr20
  !volume,195
  !pan,9
  db 12,$7D
  !c5
  !instr,!instr21
  !volume,205
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr20
  !volume,195
  !pan,9
  db 12,$7D
  !c5
  !end

.sub466C
  db 12,$7F
  !c5
  db 12,$7D
  !c5
  !instr,!instr21
  !volume,205
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr20
  !volume,195
  !pan,9
  db 12,$7D
  !c5
  !end

.sub4685
  !instr,!instr22
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 96,$7F
  !cs5
  db 72
  !cs5
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  db 84
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,195
  !pan,9
  db 12
  !c5
  !instr,!instr21
  !volume,205
  !pan,10
  db 24
  !c5
  !instr,!instr20
  !volume,195
  !pan,9
  !end

.sub46BC
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 24,$7F
  !c4
  !amplify,0
  !instr,!instr21
  !volume,205
  !pan,10
  db 12
  !c5
  !instr,!instr20
  !volume,195
  !pan,9
  db 12,$7D
  !c5
  !end

.sub4A05
  db 96,$7E
  !gs4
  !tie
  !f4
  !g4
  !end

.sub4A0C
  db 24,$7E
  !c5
  db 24,$78
  !c5
  !end

.sub4A13
  db 24,$7E
  !cs5
  db 24,$78
  !cs5
  db 24,$7E
  !cs5
  db 24,$78
  !cs5
  db 24,$7E
  !cs5
  db 24,$78
  !cs5
  db 24,$7E
  !cs5
  !a4
  db 24,$78
  !a4
  db 24,$7E
  !a4
  db 24,$78
  !a4
  db 24,$7E
  !b4
  db 24,$78
  !b4
  db 24,$7E
  !b4
  db 24,$78
  !b4
  !end

.sub4A3F
  db 96,$7F
  !gs4
  db 48
  !as4
  !c5
  db 96
  !g4
  !c5
  !gs4
  !as4
  !end

.remoteCode4307
  !restoreInstrument
  !end

.remoteCode430A
  !adsrGain,$7F,$F8
  !end

assert pc() <= $10000-(4*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
