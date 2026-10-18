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
  db !sample1D,$9F,$F5,$B8,$15,$00
  db !sample1E,$CF,$FA,$B8,$15,$00
  db !sample1F,$FF,$FB,$B8,$0A,$00
  db !sample1F,$FF,$F4,$B8,$0A,$00
  db !sample20,$9F,$F2,$B8,$0A,$00
  db !sample20,$9F,$F3,$B8,$0A,$00
  db !sample14,$FF,$E4,$B8,$04,$01
  db !sample15,$EE,$E4,$B8,$02,$A0
  db !sample16,$FC,$A6,$B8,$03,$CE
  db !sample17,$9F,$CA,$B8,$03,$00
  db !sample18,$FF,$E4,$B8,$08,$00
  db !sample19,$FB,$E5,$B8,$08,$00
  db !sample1A,$FD,$E0,$B8,$03,$D0
  db !sample1B,$FD,$E0,$B8,$03,$05
  db !sample1C,$FF,$E8,$B8,$05,$C0
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+27
  dw Sample15,Sample15+2502
  dw Sample16,Sample16+1683
  dw Sample17,Sample17+54
  dw Sample18,Sample18+3285
  dw Sample19,Sample19+567
  dw Sample1A,Sample1A+27
  dw Sample1B,Sample1B+27
  dw Sample1C,Sample1C+1845
  dw Sample1D,Sample1D+909
  dw Sample1E,Sample1E+1584
  dw Sample1F,Sample1F+2025
  dw Sample20,Sample20+909
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "MM7 Sawtooth.brr":2..0
  Sample15: incbin "XG Sawtooth.brr":2..0
  Sample16: incbin "S2 Synth Brass.brr":2..0
  Sample17: incbin "Some Organs.brr":2..0
  Sample18: incbin "Top Piano.brr":2..0
  Sample19: incbin "RS1 Oboe.brr":2..0
  Sample1A: incbin "BDH1 Saw Wave.brr":2..0
  Sample1B: incbin "Cool String Ens.brr":2..0
  Sample1C: incbin "S3 Slap Bass II.brr":2..0
  Sample1D: incbin "Yasui Snare.brr":2..0
  Sample1E: incbin "DR-880 Kick.brr":2..0
  Sample1F: incbin "MM7 Hi-Hat 1.brr":2..0
  Sample20: incbin "R-8 Crash Cym.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

FirFilters:
  db $FF,$08,$17,$24,$24,$17,$08,$FF

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
  !echo,%11111000,50,50
  !setEchoFirFilters : dw FirFilters
  !echoParameters,5,80,0
  !setDPMiscCommand,!noteEndInTicks,1
  !musicVolume,100
  !tempo,66
  !amplify,47
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 24,$7F
  !c4
  db 96
  !rest
  db 72
  !tie
  db 24
  !c4
  db 96
  !rest
  db 48
  !tie
  db 24
  !c4
  db 96
  !rest
  !tie
  !loop : dw .sub34A9 : db 2
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  db 12
  !c4
  !c4
  db 24
  !c4
.pattern1_0:
  !subloop,0
  !loop : dw .sub34C0 : db 14
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  db 12
  !c4
  !c4
  db 24
  !c4
  !loop : dw .sub34CE : db 6
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !loop : dw .sub34E2 : db 2
  !loop : dw .sub34F6 : db 30
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  db 12
  !c4
  !c4
  db 24
  !c4
  !loop : dw .sub34CE : db 7
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !c4
  !c4
  !loop : dw .sub34CE : db 5
  db 6,$7F
  !c4
  !c4
  !loop : dw .sub3504 : db 7
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 24
  !c4
  !rest
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  db 6
  !c4
  !c4
  !loop : dw .sub3508 : db 6
  !loop : dw .sub350C : db 3
  !loop : dw .sub3530 : db 1
  !loop : dw .sub350C : db 3
  !loop : dw .sub3554 : db 1
  !loop : dw .sub350C : db 3
  !loop : dw .sub3530 : db 1
  !loop : dw .sub350C : db 3
  !loop : dw .sub3554 : db 1
  !loop : dw .sub350C : db 3
  !loop : dw .sub3530 : db 1
  !loop : dw .sub350C : db 3
  !loop : dw .sub3554 : db 1
  !loop : dw .sub350C : db 3
  !loop : dw .sub3530 : db 1
  !loop : dw .sub350C : db 2
  !loop : dw .sub34E2 : db 3
  db 12,$7F
  !c4
  !c4
  !c4
  !c4
  !subloop,1
  !loop : dw .sub357A : db 3
  db 24,$7F
  !c4
  db 72
  !rest
  !loop : dw .sub358B : db 14
  !loop : dw .sub3590 : db 3
  db 12,$7F
  !c4
  !c4
  !c4
  !c4
  !subloop,0
  !loop : dw .sub350C : db 3
  !loop : dw .sub3530 : db 1
  !loop : dw .sub350C : db 3
  !loop : dw .sub3554 : db 1
  !subloop,2
  !loop : dw .sub350C : db 3
  !loop : dw .sub3530 : db 1
  !loop : dw .sub350C : db 2
  !loop : dw .sub34E2 : db 3
  db 12,$7F
  !c4
  !c4
  !c4
  !c4
  !end

.pattern0_1
  !toggleEcho
  !instr,!instr22
  !volume,255
  !pan,10
  !amplify,207
  db 96,$7F
  !cs5
  !tie
  db 96
  !cs5
  db 72
  !tie
  db 96
  !cs5
  !tie
  db 24
  !tie
  db 120
  !cs5
  !amplify,0
  !toggleEcho
  !volume,235
  !instr,!instr21
  !pan,10
  db 24
  !c5
  !rest
  !c5
.pattern1_1:
  !toggleEcho
  !loop : dw .sub35A2 : db 1
  !loop : dw .sub35C2 : db 14
  !loop : dw .sub35D1 : db 1
  !loop : dw .sub3600 : db 5
  !loop : dw .sub35C2 : db 4
  !toggleEcho
  !loop : dw .sub35A2 : db 1
  !loop : dw .sub35C2 : db 30
  !loop : dw .sub35D1 : db 1
  !loop : dw .sub3600 : db 12
  !loop : dw .sub362D : db 2
  !toggleEcho
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,207
  db 96,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !pan,9
  !loop : dw .sub364C : db 1
  !loop : dw .sub365B : db 1
  !loop : dw .sub367E : db 1
  !loop : dw .sub364C : db 30
  !loop : dw .sub367E : db 1
  !loop : dw .sub364C : db 29
  !loop : dw .sub365B : db 1
  !toggleEcho
  !loop : dw .sub35A2 : db 1
  !loop : dw .sub35C2 : db 14
  !loop : dw .sub35D1 : db 1
  !loop : dw .sub3600 : db 5
  !loop : dw .sub35C2 : db 4
  !toggleEcho
  !loop : dw .sub35A2 : db 1
  !loop : dw .sub35C2 : db 30
  !loop : dw .sub35D1 : db 1
  !loop : dw .sub3600 : db 12
  !loop : dw .sub362D : db 2
  !toggleEcho
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,207
  db 96,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !pan,9
  !loop : dw .sub364C : db 1
  !loop : dw .sub365B : db 1
  !loop : dw .sub367E : db 1
  !loop : dw .sub364C : db 30
  !loop : dw .sub367E : db 1
  !loop : dw .sub364C : db 29
  !loop : dw .sub365B : db 1
  !toggleEcho
  !instr,!instr22
  !volume,255
  !pan,10
  !amplify,207
  db 96,$7F
  !cs5
  !tie
  db 96
  !cs5
  !tie
  db 96
  !cs5
  !tie
  !cs5
  db 48
  !cs5
  !loop : dw .sub35A2 : db 1
  !loop : dw .sub35C2 : db 15
  !loop : dw .sub367E : db 1
  !loop : dw .sub364C : db 30
  !loop : dw .sub367E : db 1
  !loop : dw .sub364C : db 29
  !loop : dw .sub365B : db 1
  !end

.pattern0_2
  !instr,!instr2C
  !volume,215
  db 12,$7F
  !c6
  !g5
  !c5
  !f5
  !ds6
  !as5
  !ds5
  !g5
  !c6
  !g5
  !c5
  !f5
  !as5
  !g5
  !as4
  !f5
  !c6
  !f5
  !c5
  !gs5
  !ds6
  !as5
  !ds5
  !g5
  !c6
  !gs5
  !c5
  !f5
  !as5
  !e5
  !c6
  !a5
  !c5
  !f5
  !c5
  !f5
  !ds6
  !g5
  !ds5
  !as5
  !c6
  !as5
  !c5
  !a5
  !as5
  !e5
  !as5
  !g5
  !c5
  !f5
  !c6
  !c5
  !as4
  !ds5
  !as5
  !as4
  !c5
  !as4
  !gs5
  !c5
  !ds5
  !e5
  !g5
  !c6
.pattern1_2:
  !transpose,0
  !subloop,0
  !loop : dw .sub36A2 : db 4
  !loop : dw .sub36AD : db 4
  !loop : dw .sub36C3 : db 6
  !transpose,254
  !loop : dw .sub36C3 : db 2
  !transpose,253
  !loop : dw .sub36C3 : db 8
  !transpose,0
  !loop : dw .sub36C3 : db 6
  !transpose,254
  !loop : dw .sub36C3 : db 2
  !transpose,253
  !loop : dw .sub36C3 : db 8
  !transpose,0
  !transpose,252
  !loop : dw .sub36C3 : db 6
  !transpose,254
  !loop : dw .sub36C3 : db 2
  !transpose,0
  !loop : dw .sub36C3 : db 8
  !transpose,252
  !loop : dw .sub36C3 : db 6
  !transpose,254
  !loop : dw .sub36C3 : db 2
  !transpose,0
  !loop : dw .sub36CA : db 2
  db 12,$7F
  !e5
  !g5
  !c6
  !e6
  !c6
  !g5
  !e5
  !cs5
  db 120
  !rest
  !loop : dw .sub36D1 : db 1
  !loop : dw .sub36DA : db 4
  !loop : dw .sub36E1 : db 4
  !loop : dw .sub36E8 : db 8
  !loop : dw .sub36DA : db 4
  !loop : dw .sub36E1 : db 4
  !loop : dw .sub36E8 : db 8
  !loop : dw .sub36DA : db 4
  !loop : dw .sub36E1 : db 4
  !loop : dw .sub36EF : db 4
  !loop : dw .sub36F6 : db 4
  !loop : dw .sub36DA : db 4
  !loop : dw .sub36E1 : db 4
  !loop : dw .sub36FD : db 1
  !subloop,1
  db 96,$7F
  !d5
  !tie
  db 96
  !e5
  !tie
  db 96
  !fs5
  !tie
  !tie
  !tie
  !loop : dw .sub3720 : db 4
  !loop : dw .sub3725 : db 4
  !loop : dw .sub372A : db 6
  db 24,$7F
  !fs5
  !transpose,1
  !loop : dw .sub36D1 : db 1
  !subloop,0
  !loop : dw .sub36DA : db 4
  !loop : dw .sub36E1 : db 4
  !loop : dw .sub36E8 : db 8
  !subloop,1
  !loop : dw .sub36DA : db 4
  !loop : dw .sub36E1 : db 4
  !loop : dw .sub36EF : db 4
  !loop : dw .sub36F6 : db 4
  !loop : dw .sub36DA : db 4
  !loop : dw .sub36E1 : db 4
  !loop : dw .sub36FD : db 1
  !end

.pattern0_3
  !remoteCode : dw .remoteCode34A2 : db -1,0
  !remoteCode : dw .remoteCode34A5 : db 3,0
  !instr,!instr24
  !volume,215
  !vibrato,18,12,36
  !pan,9
  db 16,$7F
  !c6
  !gs5
  !f5
  !ds6
  !as5
  !g5
  !c6
  !gs5
  !f5
  !as5
  !g5
  !e5
  !c6
  !f5
  !gs5
  db 36
  !ds6
  db 24
  !f5
  db 12
  !c6
  !gs5
  !f5
  !e5
  !g5
  db 40
  !gs6
  db 16
  !f6
  !c6
  !g6
  !ds6
  !as5
  db 12
  !c6
  !gs6
  !g6
  !gs6
  !g6
  !f6
  !e6
  !c6
  !c6
  !f6
  db 24
  !c7
  db 12
  !as5
  !ds6
  db 24
  !as6
  db 12
  !gs5
  !as5
  db 24
  !gs6
  !toggleLegato
  db 12
  !g5
  !g6
  !f6
  !e6
.pattern1_3:
  !loop : dw .sub372F : db 1
  !instr,!instr27
  !volume,255
  !vibrato,10,10,28
  !loop : dw .sub374F : db 1
  db 24,$7F
  !g5
  !loop : dw .sub374F : db 1
  db 40,$7F
  !gs5
  db 16
  !f5
  !c5
  !g5
  !ds5
  !as4
  db 12
  !c5
  !gs5
  !g5
  !gs5
  !g5
  !toggleLegato
  db 4
  !f5
  !ds5
  !as4
  db 12
  !f4
  !f4
  !toggleLegato
  !c5
  !f5
  db 24
  !c6
  db 12
  !as4
  !ds5
  db 24
  !as5
  db 12
  !gs4
  !c5
  db 24
  !gs5
  db 12
  !g4
  !ds5
  db 24
  !g5
  !instr,!instr25
  !volume,255
  !vibrato,18,12,36
  !loop : dw .sub3759 : db 1
  db 96,$7F
  !d6
  !tie
  !d5
  !loop : dw .sub3759 : db 1
  db 96,$7F
  !d6
  !tie
  db 72
  !tie
  db 24
  !rest
  !loop : dw .sub3771 : db 1
  !loop : dw .sub3781 : db 1
  !loop : dw .sub3771 : db 1
  !loop : dw .sub3793 : db 1
  !instr,!instr26
  !amplify,68
  !loop : dw .sub37A2 : db 1
  !toggleLegato
  db 6,$7F
  !ds6
  !toggleLegato
  db 96
  !f6
  !tie
  !tie
  db 48
  !tie
  !loop : dw .sub37EB : db 1
  db 96,$7F
  !f7
  !tie
  !tie
  db 70
  !tie
  !loop : dw .sub383E : db 1
  !loop : dw .sub372F : db 1
  !instr,!instr28
  !volume,255
  !endVibrato
  !loop : dw .sub3853 : db 2
  !instr,!instr25
  !volume,255
  !vibrato,18,12,36
  !pan,9
  !loop : dw .sub3759 : db 1
  db 96,$7F
  !d6
  !tie
  !d5
  !loop : dw .sub3759 : db 1
  db 96,$7F
  !d6
  !tie
  db 72
  !tie
  db 24
  !rest
  !loop : dw .sub3771 : db 1
  !loop : dw .sub3781 : db 1
  !loop : dw .sub3771 : db 1
  !loop : dw .sub3793 : db 1
  !instr,!instr26
  !amplify,68
  !loop : dw .sub37A2 : db 1
  !toggleLegato
  db 6,$7F
  !ds6
  !toggleLegato
  db 96
  !f6
  !tie
  !tie
  db 48
  !tie
  !loop : dw .sub37EB : db 1
  db 96,$7F
  !f7
  !tie
  db 36
  !tie
  !instr,!instr25
  !volume,255
  !vibrato,18,12,36
  !transpose,1
  !loop : dw .sub37A2 : db 1
  db 24,$7F
  !f6
  db 96
  !c6
  !tie
  db 24
  !tie
  db 18
  !rest
  !instr,!instr26
  !amplify,68
  !loop : dw .sub37A2 : db 1
  !toggleLegato
  db 6,$7F
  !ds6
  !toggleLegato
  db 96
  !f6
  !tie
  !tie
  db 48
  !tie
  !loop : dw .sub37EB : db 1
  db 96,$7F
  !f7
  !tie
  !tie
  db 70
  !tie
  !transpose,0
  !loop : dw .sub383E : db 1
  !end

.pattern0_4
  !remoteCode : dw .remoteCode34A2 : db -1,0
  !remoteCode : dw .remoteCode34A5 : db 3,0
  !instr,!instr24
  !volume,215
  !vibrato,18,12,36
  !pan,12
  db 16,$7E
  !gs5
  !f5
  !c5
  !c6
  !g5
  !ds5
  !gs5
  !f5
  !c5
  !g5
  !e5
  !c5
  !gs5
  !c5
  !f5
  db 36
  !c6
  db 24
  !c5
  db 12
  !gs5
  !f5
  !c5
  !c5
  !e5
  db 40
  !f6
  db 16
  !c6
  !gs5
  !ds6
  !c6
  !g5
  db 12
  !gs5
  !f6
  !ds6
  !f6
  !ds6
  !c6
  !c6
  !gs5
  !gs5
  !c6
  db 24
  !gs6
  db 12
  !g5
  !as5
  db 24
  !g6
  db 12
  !f5
  !g5
  db 24
  !f6
  !toggleLegato
  db 12
  !ds5
  !ds6
  !as5
  !b5
.pattern1_4:
  !loop : dw .sub3896 : db 1
  !instr,!instr27
  !volume,255
  !vibrato,10,10,28
  !loop : dw .sub38B6 : db 1
  db 24,$7E
  !e5
  !loop : dw .sub38B6 : db 1
  !loop : dw .sub38C0 : db 1
  !instr,!instr25
  !volume,255
  !vibrato,18,12,36
  !loop : dw .sub38EE : db 1
  db 96,$7E
  !d5
  !tie
  !d4
  !loop : dw .sub38EE : db 1
  db 96,$7E
  !d5
  !tie
  db 72
  !tie
  db 24
  !rest
  !loop : dw .sub3906 : db 1
  !loop : dw .sub3916 : db 1
  !loop : dw .sub3906 : db 1
  !loop : dw .sub3928 : db 1
  !instr,!instr26
  !amplify,68
  !loop : dw .sub3937 : db 1
  !loop : dw .sub396B : db 1
  !loop : dw .sub398D : db 1
  db 96,$7E
  !gs6
  !tie
  !tie
  db 84
  !tie
  !instr,!instr24
  !volume,215
  !vibrato,18,12,36
  !amplify,0
  !toggleLegato
  db 4
  !fs6
  !e6
  !d6
  !loop : dw .sub3896 : db 1
  !instr,!instr28
  !volume,255
  !endVibrato
  !volume,175
  db 36,$7E
  !rest
  !loop : dw .sub3853 : db 1
  !pan,14
  db 12,$7E
  !f3
  !g3
  !pan,13
  !gs3
  !c4
  !pan,12
  !f4
  !g4
  !pan,11
  !gs4
  !c5
  !pan,10
  !e5
  !f5
  !pan,9
  !g5
  !as5
  !pan,8
  !g5
  !f5
  !pan,7
  !e5
  !as4
  !pan,6
  !f4
  !g4
  !pan,7
  !gs4
  !cs5
  !pan,8
  !f5
  !g5
  !pan,9
  !gs5
  !cs6
  !pan,10
  !e6
  !f6
  !pan,11
  !g6
  !as6
  !pan,12
  !g6
  !instr,!instr25
  !volume,255
  !vibrato,18,12,36
  !loop : dw .sub38EE : db 1
  db 96,$7E
  !d5
  !tie
  !d4
  !loop : dw .sub38EE : db 1
  db 96,$7E
  !d5
  !tie
  db 72
  !tie
  db 24
  !rest
  !loop : dw .sub3906 : db 1
  !loop : dw .sub3916 : db 1
  !loop : dw .sub3906 : db 1
  !loop : dw .sub3928 : db 1
  !instr,!instr26
  !amplify,68
  !loop : dw .sub3937 : db 1
  !loop : dw .sub396B : db 1
  !loop : dw .sub398D : db 1
  db 96,$7E
  !gs6
  !tie
  db 48
  !tie
  !instr,!instr25
  !volume,255
  !vibrato,18,12,36
  !transpose,1
  !loop : dw .sub3937 : db 1
  db 24,$7E
  !c6
  db 96
  !gs5
  !tie
  db 24
  !tie
  !rest
  !instr,!instr26
  !amplify,68
  !loop : dw .sub3937 : db 1
  !loop : dw .sub396B : db 1
  !loop : dw .sub398D : db 1
  db 96,$7E
  !gs6
  !tie
  !tie
  db 84
  !tie
  !transpose,0
  !instr,!instr24
  !volume,215
  !vibrato,18,12,36
  !amplify,0
  !toggleLegato
  db 4
  !fs6
  !e6
  !d6
  !end

.pattern0_5
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,!instr24
  !volume,215
  !vibrato,18,12,36
  !pan,9
  db 12,$7C
  !c5
  !f5
  db 24
  !c6
  db 12
  !as4
  !ds5
  db 24
  !as5
  db 12
  !gs4
  !as4
  db 24
  !gs5
  !toggleLegato
  db 12
  !g4
  !g5
  !f5
  !e5
  !toggleLegato
.pattern1_5:
  !pan,13
  !transpose,0
  !subloop,0
  !instr,!instr2A
  !volume,202
  db 96,$7C
  !c5
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
  !loop : dw .sub39C1 : db 2
  db 96,$7C
  !cs5
  !tie
  !tie
  !ds5
  db 96
  !f5
  !tie
  !tie
  !tie
  db 96
  !cs5
  !tie
  !tie
  !ds5
  db 96
  !e5
  !tie
  db 24
  !tie
  db 96
  !rest
  db 72
  !tie
  !instr,!instr2B
  !volume,200
  !loop : dw .sub39CD : db 2
  !loop : dw .sub39DA : db 1
  !loop : dw .sub39CD : db 1
  !subloop,1
  !transpose,1
  !loop : dw .sub39CD : db 4
  !loop : dw .sub39DA : db 1
  !loop : dw .sub39CD : db 1
  !end

.pattern0_6
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,!instr24
  !volume,215
  !vibrato,18,12,36
  !pan,12
  db 12,$7B
  !gs4
  !c5
  db 24
  !gs5
  db 12
  !g4
  !as4
  db 24
  !g5
  db 12
  !f4
  !g4
  db 24
  !f5
  !toggleLegato
  db 12
  !ds4
  !ds5
  !as4
  !b4
  !toggleLegato
.pattern1_6:
  !pan,7
  !transpose,0
  !loop : dw .sub39E8 : db 1
  !loop : dw .sub39FF : db 2
  db 96,$7C
  !gs4
  !tie
  !tie
  !as4
  db 96
  !c5
  !tie
  !tie
  !tie
  db 96
  !gs4
  !tie
  !tie
  !as4
  db 96
  !c5
  !tie
  db 24
  !tie
  db 96
  !rest
  db 72
  !tie
  !instr,!instr2B
  !volume,200
  !loop : dw .sub3A0B : db 2
  !loop : dw .sub3A18 : db 1
  !loop : dw .sub3A0B : db 1
  !loop : dw .sub39E8 : db 1
  !instr,!instr29
  !volume,255
  !vibrato,18,12,36
  !pan,8
  !remoteCode : dw .remoteCode34A2 : db -1,0
  !remoteCode : dw .remoteCode34A5 : db 3,0
  !loop : dw .sub3A25 : db 1
  db 18,$7F
  !ds5
  db 6
  !e5
  db 96
  !f5
  !tie
  !tie
  db 48
  !tie
  db 24
  !c5
  db 18
  !ds5
  !toggleLegato
  db 6
  !e5
  !toggleLegato
  !loop : dw .sub3A25 : db 1
  db 24,$7F
  !g5
  db 96
  !gs5
  !toggleLegato
  db 6
  !a5
  !toggleLegato
  db 90
  !as5
  !toggleLegato
  db 6
  !b5
  !toggleLegato
  db 96
  !c6
  db 42
  !tie
  !toggleLegato
  db 6
  !b5
  !toggleLegato
  db 42
  !c6
  db 96
  !cs6
  db 36
  !cs6
  !c6
  db 24
  !as5
  !toggleLegato
  db 6
  !a5
  !toggleLegato
  db 90
  !as5
  db 36
  !as5
  !gs5
  db 24
  !g5
  db 72
  !gs5
  !g5
  db 24
  !ds5
  !c5
  !toggleLegato
  db 6
  !ds5
  !e5
  !toggleLegato
  db 96
  !f5
  db 36
  !tie
  db 24
  !c5
  !ds5
  db 120
  !as4
  db 24
  !rest
  db 48
  !c5
  db 96
  !gs4
  db 36
  !g4
  !gs4
  db 24
  !as4
  db 96
  !c5
  !tie
  db 24
  !e5
  db 96
  !rest
  db 72
  !tie
  !remoteCode : dw .remoteCode34A2 : db 0,0
  !remoteCode : dw .remoteCode34A5 : db 0,0
  !instr,!instr2B
  !volume,200
  !pan,7
  !endVibrato
  !loop : dw .sub3A0B : db 2
  !loop : dw .sub3A18 : db 1
  !loop : dw .sub3A0B : db 1
  !instr,!instr29
  !volume,255
  !vibrato,18,12,36
  !pan,8
  !remoteCode : dw .remoteCode34A2 : db -1,0
  !remoteCode : dw .remoteCode34A5 : db 3,0
  db 96,$7E
  !fs6
  db 36
  !fs6
  !gs6
  db 24
  !a6
  db 96
  !cs6
  db 72
  !tie
  db 24
  !e6
  db 72
  !a5
  db 24
  !gs5
  db 36
  !gs5
  !a5
  db 24
  !cs6
  db 120
  !fs5
  !adsrGain,$7F,$F2
  db 48
  !tie
  db 24
  !rest
  !remoteCode : dw .remoteCode34A2 : db 0,0
  !remoteCode : dw .remoteCode34A5 : db 0,0
  !instr,!instr2B
  !volume,200
  !pan,7
  !transpose,1
  !endVibrato
  !loop : dw .sub3A0B : db 3
  !loop : dw .sub3A18 : db 1
  !loop : dw .sub3A0B : db 1
  !end

.pattern0_7
  !loop : dw .sub3A3A : db 8
.pattern1_7:
  !pan,11
  !transpose,0
  !loop : dw .sub3A3E : db 1
  !loop : dw .sub3A55 : db 2
  !loop : dw .sub3A61 : db 1
  !instr,!instr2B
  !volume,200
  !loop : dw .sub3A7B : db 2
  !loop : dw .sub3A88 : db 1
  !loop : dw .sub3A7B : db 1
  !loop : dw .sub3A3E : db 1
  !loop : dw .sub3A96 : db 2
  !loop : dw .sub3A61 : db 1
  !instr,!instr2B
  !volume,200
  !loop : dw .sub3A7B : db 2
  !loop : dw .sub3A88 : db 1
  !loop : dw .sub3A7B : db 1
  !pan,7
  !transpose,1
  !loop : dw .sub3A0B : db 1
  !pan,11
  !loop : dw .sub3A7B : db 3
  !loop : dw .sub3A88 : db 1
  !loop : dw .sub3A7B : db 1
  !end

.sub34A9
  db 24,$7F
  !c4
  !volume,235
  !instr,!instr21
  !pan,10
  !c5
  !amplify,0
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  !end

.sub34C0
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
.sub358B:
  db 24,$7F
  !c4
  !rest
  !end

.sub34CE
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  db 48
  !c4
  !end

.sub34E2
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !c4
  !c4
  !end

.sub34F6
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 24,$7F
  !c4
  !rest
  !end

.sub3504
  db 12,$7F
  !c4
  !end

.sub3508
  db 12,$7F
  !c4
  !end

.sub350C
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  db 24
  !c4
  !end

.sub3530
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !c4
  !end

.sub3554
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !c4
  !c4
  !end

.sub357A
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 24,$7F
  !c4
  db 96
  !rest
  db 72
  !tie
  !end

.sub3590
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !c4
  !end

.sub35A2
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,207
  db 60,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !volume,235
  !instr,!instr20
  !pan,9
  db 12
  !c5
  !instr,!instr21
  !pan,10
  db 24
  !c5
  !end

.sub35C2
  !instr,!instr20
  !pan,9
  db 12,$7F
  !c5
  !c5
  !instr,!instr21
  !pan,10
  db 24
  !c5
  !end

.sub35D1
  !toggleEcho
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,207
  db 48,$7F
  !cs5
  !toggleEcho
.sub362D:
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 12,$7D
  !c4
  !amplify,0
  !volume,235
  !instr,!instr20
  !pan,9
  db 12,$7F
  !c5
  !instr,!instr21
  !pan,10
  db 24
  !c5
  !end

.sub3600
  !instr,!instr20
  !pan,9
  db 12,$7F
  !c5
  !c5
  !instr,!instr21
  !pan,10
  db 24
  !c5
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 12,$7D
  !c4
  !amplify,0
  !volume,235
  !instr,!instr20
  !pan,9
  db 12,$7F
  !c5
  !instr,!instr21
  !pan,10
  db 24
  !c5
  !end

.sub364C
  db 12,$7F
  !c5
  !c5
  !instr,!instr21
  !pan,10
  !c5
  !instr,!instr20
  !pan,9
  !c5
  !end

.sub365B
  !instr,!instr1F
  !volume,245
  !pan,10
  !amplify,47
  db 12,$7D
  !c4
  !amplify,0
  !volume,235
  !instr,!instr20
  !pan,9
  db 12,$7F
  !c5
  !instr,!instr21
  !pan,10
  !c5
  !instr,!instr20
  !pan,9
  !c5
  !end

.sub367E
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
  !pan,9
  db 12
  !c5
  !instr,!instr21
  !pan,10
  !c5
  !instr,!instr20
  !pan,9
  !c5
  !end

.sub36A2
  db 24,$7F
  !f5
  !c6
  !ds5
  !as5
  !cs5
  !gs5
  !c5
  !g5
  !end

.sub36AD
  db 24,$7F
  !f5
  db 12
  !c6
  !c6
  db 24
  !ds5
  db 12
  !as5
  !as5
  db 24
  !cs5
  db 12
  !gs5
  !gs5
  db 24
  !c5
  db 12
  !g5
  !g5
  !end

.sub36C3
  db 24,$7F
  !f5
  db 12
  !c6
  !c6
  !end

.sub36CA
  db 24,$7F
  !e5
  db 12
  !c6
  !c6
  !end

.sub36D1
  db 12,$7F
  !c6
  !as5
  !gs5
  !g5
  !f5
  !ds5
  !end

.sub36DA
  db 12,$7F
  !cs5
  !f5
  !gs5
  !f5
  !end

.sub36E1
  db 12,$7F
  !ds5
  !g5
  !as5
  !g5
  !end

.sub36E8
  db 12,$7F
  !f5
  !gs5
  !c6
  !gs5
  !end

.sub36EF
  db 12,$7F
  !as4
  !d5
  !f5
  !d5
  !end

.sub36F6
  db 12,$7F
  !c5
  !e5
  !g5
  !e5
  !end

.sub36FD
  db 12,$7F
  !f5
  !c6
  !f6
  !c6
  !f5
  !gs5
  !c6
  !f6
  !gs6
  !f6
  !c6
  !gs5
  !c6
  !gs5
  !f5
  !c6
  !as5
  !c6
  !f6
  !c6
  !ds5
  !as5
  !ds6
  !as5
  !cs5
  !gs5
  !cs6
  !gs5
  !c5
  !g5
  !c6
  !g5
  !end

.sub3720
  db 24,$7F
  !d5
  !a5
  !end

.sub3725
  db 24,$7F
  !e5
  !b5
  !end

.sub372A
  db 24,$7F
  !fs5
  !cs6
  !end

.sub372F
  !toggleLegato
  db 96,$7F
  !f6
  !tie
  !tie
  db 72
  !tie
  !toggleLegato
  db 4
  !ds6
  !cs6
  !b5
  !a5
  !g5
  !fs5
  !toggleLegato
  db 96
  !f5
  !tie
  !tie
  db 72
  !tie
  !adsrGain,$7F,$F4
  db 24
  !tie
  !end

.sub374F
  db 24,$7F
  !f5
  !c6
  !ds5
  !as5
  !cs5
  !gs5
  !c5
  !end

.sub3759
  db 36,$7F
  !f5
  !f5
  db 24
  !gs5
  db 96
  !c6
  db 24
  !rest
  !f5
  !gs5
  !c6
  db 36
  !as5
  !g5
  db 24
  !ds5
  db 36
  !f5
  !f5
  db 24
  !a5
  !end

.sub3771
  db 36,$7F
  !cs6
  !cs6
  db 24
  !ds6
  db 96
  !f6
  db 24
  !rest
  !cs6
  !ds6
  !gs6
  db 36
  !g6
  !end

.sub3781
  db 36,$7F
  !ds6
  db 24
  !as5
  db 36
  !c6
  !c6
  db 24
  !g6
  db 96
  !gs6
  !tie
  db 72
  !tie
  db 24
  !rest
  !end

.sub3793
  db 36,$7F
  !gs6
  db 24
  !as6
  db 36
  !e6
  !e6
  db 24
  !g6
  db 120
  !c7
  db 18
  !rest
  !end

.sub37A2
  !toggleLegato
  db 6,$7F
  !e5
  !toggleLegato
  db 48
  !f5
  !g5
  !gs5
  !toggleLegato
  db 6
  !b5
  !toggleLegato
  db 66
  !c6
  db 24
  !as5
  db 36
  !as5
  !c6
  db 24
  !ds6
  db 72
  !c6
  db 24
  !as5
  db 36
  !as5
  !c6
  db 24
  !ds6
  db 72
  !gs5
  db 24
  !g5
  db 36
  !g5
  !gs5
  db 24
  !c6
  db 120
  !f5
  db 24
  !f5
  !g5
  !gs5
  !toggleLegato
  db 6
  !b5
  !toggleLegato
  db 66
  !c6
  db 24
  !as5
  db 36
  !as5
  !c6
  db 24
  !ds6
  db 72
  !c6
  db 24
  !as5
  db 36
  !as5
  !c6
  !end

.sub37EB
  !toggleLegato
  db 6,$7F
  !b5
  !toggleLegato
  db 36
  !c6
  db 24
  !g6
  !subloop,0
  db 72,$7F
  !gs6
  db 24
  !g6
  db 36
  !g6
  !gs6
  db 24
  !c7
  !subloop,1
  !toggleLegato
  db 6,$7F
  !e6
  !toggleLegato
  db 66
  !f6
  db 24
  !d6
  db 36
  !d6
  !e6
  db 24
  !f6
  db 36
  !e6
  !f6
  db 24
  !g6
  db 48
  !e6
  db 36
  !g6
  !toggleLegato
  db 6
  !fs6
  !g6
  !toggleLegato
  db 72
  !gs6
  db 24
  !g6
  db 36
  !g6
  !gs6
  db 24
  !c7
  db 72
  !gs6
  db 24
  !g6
  db 36
  !g6
  !gs6
  db 18
  !c7
  !toggleLegato
  db 6
  !ds7
  !e7
  !toggleLegato
  !end

.sub383E
  !instr,!instr24
  !volume,215
  !vibrato,18,12,36
  !amplify,0
  !toggleLegato
  db 4,$7F
  !ds7
  !cs7
  !b6
  !a6
  !g6
  !end

.sub3853
  !pan,14
  db 12,$7F
  !f3
  !g3
  !pan,13
  !gs3
  !c4
  !pan,12
  !f4
  !g4
  !pan,11
  !gs4
  !c5
  !pan,10
  !e5
  !f5
  !pan,9
  !g5
  !as5
  !pan,8
  !g5
  !f5
  !pan,7
  !e5
  !as4
  !pan,6
  !f4
  !g4
  !pan,7
  !gs4
  !cs5
  !pan,8
  !f5
  !g5
  !pan,9
  !gs5
  !cs6
  !pan,10
  !e6
  !f6
  !pan,11
  !g6
  !as6
  !pan,12
  !g6
  !e6
  !pan,13
  !as5
  !f5
  !end

.sub3896
  !toggleLegato
  db 96,$7E
  !c6
  !tie
  !tie
  db 72
  !tie
  !toggleLegato
  db 4
  !g5
  !fs5
  !e5
  !d5
  !c5
  !as4
  !toggleLegato
  db 96
  !gs4
  !tie
  !tie
  db 72
  !tie
  !adsrGain,$7F,$F4
  db 24
  !tie
  !end

.sub38B6
  db 24,$7E
  !c5
  !gs5
  !c5
  !g5
  !gs4
  !f5
  !gs4
  !end

.sub38C0
  db 40,$7E
  !f5
  db 16
  !c5
  !gs4
  !ds5
  !as4
  !g4
  db 12
  !g4
  !f5
  !ds5
  !f5
  !ds5
  !toggleLegato
  db 4
  !c5
  !c5
  !g4
  db 12
  !c4
  !g4
  !toggleLegato
  !g4
  !c5
  db 24
  !gs5
  db 12
  !g4
  !c5
  db 24
  !g5
  db 12
  !f4
  !gs4
  db 24
  !f5
  db 12
  !ds4
  !c5
  db 24
  !e5
  !end

.sub38EE
  db 36,$7E
  !f4
  !f4
  db 24
  !gs4
  db 96
  !c5
  db 24
  !rest
  !f4
  !gs4
  !c5
  db 36
  !as4
  !g4
  db 24
  !ds4
  db 36
  !f4
  !f4
  db 24
  !a4
  !end

.sub3906
  db 36,$7E
  !gs5
  !gs5
  db 24
  !c6
  db 96
  !cs6
  db 24
  !rest
  !as5
  !c6
  !f6
  db 36
  !ds6
  !end

.sub3916
  db 36,$7E
  !as5
  db 24
  !g5
  db 36
  !gs5
  !gs5
  db 24
  !ds6
  db 96
  !f6
  !tie
  db 72
  !tie
  db 24
  !rest
  !end

.sub3928
  db 36,$7E
  !f6
  db 24
  !g6
  db 36
  !c6
  !c6
  db 24
  !e6
  db 120
  !g6
  db 24
  !rest
  !end

.sub3937
  db 48,$7E
  !c5
  !ds5
  !f5
  !subloop,0
  db 72,$7E
  !gs5
  db 24
  !g5
  db 36
  !g5
  !gs5
  db 24
  !as5
  !subloop,1
  db 72,$7E
  !f5
  db 24
  !ds5
  db 36
  !ds5
  !f5
  db 24
  !gs5
  db 120
  !c5
  db 24
  !c5
  !ds5
  !f5
  db 72
  !gs5
  db 24
  !g5
  db 36
  !g5
  !gs5
  db 24
  !as5
  db 72
  !gs5
  db 24
  !g5
  db 36
  !g5
  !gs5
  !end

.sub396B
  db 24,$7E
  !c6
  !instr,!instr29
  !volume,255
  !vibrato,18,12,36
  !amplify,0
  db 36
  !c5
  !gs5
  db 24
  !c5
  db 36
  !g5
  !as4
  db 24
  !ds5
  db 120
  !f5
  db 12
  !rest
  !instr,!instr26
  !amplify,68
  !end

.sub398D
  db 36,$7E
  !g5
  db 24
  !ds6
  !subloop,0
  db 72,$7E
  !f6
  db 24
  !ds6
  db 36
  !ds6
  !f6
  db 24
  !gs6
  !subloop,1
  db 72,$7E
  !d6
  db 24
  !as5
  db 36
  !as5
  !c6
  db 24
  !c6
  db 36
  !c6
  !c6
  db 24
  !c6
  db 48
  !c6
  !c6
  !subloop,0
  db 72,$7E
  !f6
  db 24
  !ds6
  db 36
  !ds6
  !f6
  db 24
  !gs6
  !subloop,1
  !end

.sub39C1
  db 96,$7C
  !c5
  !tie
  !tie
  !ds5
  db 96
  !d5
  !tie
  !tie
  !tie
  !end

.sub39CD
  db 96,$7C
  !cs5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !f5
  !tie
  !tie
  !tie
  !end

.sub39DA
  db 96,$7C
  !cs5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !d5
  !tie
  db 96
  !e5
  !tie
  !end

.sub39E8
  !instr,!instr2A
  !volume,202
  db 96,$7C
  !gs4
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
  !end

.sub39FF
  db 96,$7C
  !gs4
  !tie
  !tie
  !as4
  db 96
  !a4
  !tie
  !tie
  !tie
  !end

.sub3A0B
  db 96,$7C
  !gs4
  !tie
  db 96
  !as4
  !tie
  db 96
  !c5
  !tie
  !tie
  !tie
  !end

.sub3A18
  db 96,$7C
  !gs4
  !tie
  db 96
  !as4
  !tie
  !tie
  !tie
  db 96
  !c5
  !tie
  !end

.sub3A25
  db 96,$7F
  !f5
  db 90
  !tie
  !toggleLegato
  db 6
  !e5
  !toggleLegato
  db 48
  !f5
  db 24
  !g5
  db 48
  !gs5
  db 24
  !g5
  !f5
  !end

.sub3A3A
  db 96,$7F
  !rest
  !end

.sub3A3E
  !instr,!instr2A
  !volume,202
  db 96,$7C
  !f4
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
  !end

.sub3A55
  db 96,$7C
  !f4
  !tie
  !tie
  !g4
  db 96
  !f4
  !tie
  !tie
  !tie
  !end

.sub3A61
  db 96,$7C
  !f4
  !tie
  !tie
  !g4
  db 96
  !gs4
  !tie
  !tie
  !tie
  db 96
  !f4
  !tie
  !tie
  db 96
  !g4
  !tie
  !tie
  db 24
  !tie
  db 96
  !rest
  db 72
  !tie
  !end

.sub3A7B
  db 96,$7C
  !f4
  !tie
  db 96
  !g4
  !tie
  db 96
  !gs4
  !tie
  !tie
  !tie
  !end

.sub3A88
  db 96,$7C
  !f4
  !tie
  db 96
  !g4
  !tie
  db 96
  !f4
  !tie
  db 96
  !g4
  !tie
  !end

.sub3A96
  db 96,$7C
  !gs4
  !tie
  !tie
  !g4
  db 96
  !f4
  !tie
  !tie
  !tie
  !end

.remoteCode34A2
  !restoreInstrument
  !end

.remoteCode34A5
  !adsrGain,$7F,$FA
  !end

assert pc() <= $10000-(5*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
