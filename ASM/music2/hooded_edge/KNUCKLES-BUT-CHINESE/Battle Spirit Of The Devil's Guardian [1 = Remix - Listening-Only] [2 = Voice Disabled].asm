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
!instr32 = $2A
!instr33 = $2B
!instr34 = $2C

!sample01 = $16
!sample0C = $17
!sample14 = $18
!sample15 = $19
!sample16 = $1A
!sample17 = $1B
!sample18 = $1C
!sample19 = $1D
!sample1A = $1E
!sample1B = $1F
!sample1C = $20
!sample1D = $21
!sample1E = $22
!sample1F = $23
!sample20 = $24
!sample21 = $25
!sample22 = $26
!sample23 = $27
!sample24 = $28

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample1F,$9F,$F4,$B8,$14,$A0
  db !sample20,$CF,$F9,$B8,$13,$00
  db !sample21,$FF,$F8,$B8,$0A,$00
  db !sample22,$FF,$F2,$B8,$07,$A0
  db !sample23,$FF,$FB,$B8,$0A,$00
  db !sample23,$FE,$FA,$B8,$09,$D0
  db !sample23,$FF,$F5,$B8,$09,$50
  db !sample24,$9F,$F2,$B8,$0A,$00
  db !sample24,$9F,$F3,$B8,$0A,$00
  db !sample14,$FF,$F0,$B8,$02,$71
  db !sample15,$AF,$4D,$B8,$06,$00
  db !sample16,$FF,$EC,$B8,$03,$00
  db !sample17,$FF,$EC,$B8,$02,$00
  db !sample01,$FF,$EA,$B8,$03,$00
  db !sample18,$FF,$A0,$B8,$06,$00
  db !sample19,$FF,$EC,$B8,$04,$00
  db !sample0C,$FF,$EF,$B8,$06,$00
  db !sample1A,$FF,$EF,$B8,$05,$40
  db !sample1B,$BF,$EF,$B8,$03,$01
  db !sample1C,$FA,$E0,$B8,$03,$C0
  db !sample1D,$EF,$C0,$B8,$04,$00
  db !sample01,$FB,$E0,$B8,$03,$00
  db !sample1E,$AF,$AC,$B8,$05,$C0
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample01,Sample01+36
  dw Sample0C,Sample0C+36
  dw Sample14,Sample14+36
  dw Sample15,Sample15+36
  dw Sample16,Sample16+1683
  dw Sample17,Sample17+405
  dw Sample18,Sample18+9
  dw Sample19,Sample19+1620
  dw Sample1A,Sample1A+396
  dw Sample1B,Sample1B+54
  dw Sample1C,Sample1C+9
  dw Sample1D,Sample1D+54
  dw Sample1E,Sample1E+1845
  dw Sample1F,Sample1F+909
  dw Sample20,Sample20+2034
  dw Sample21,Sample21+0
  dw Sample22,Sample22+1809
  dw Sample23,Sample23+2025
  dw Sample24,Sample24+909
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample01: incbin "01 SMW @1.brr":2..0
  Sample0C: incbin "0C SMW @13.brr":2..0
  Sample14: incbin "SOI Fat Punch Alt (Small).brr":2..0
  Sample15: incbin "SOI FM Elec Piano 2.brr":2..0
  Sample16: incbin "DKNI4 Synth Brass.brr":2..0
  Sample17: incbin "SOI Loud Lead.brr":2..0
  Sample18: incbin "SOI Pulse 50% O4 High.brr":2..0
  Sample19: incbin "SOI Piano Med 2.brr":2..0
  Sample1A: incbin "02 SMW @2+3.brr":2..0
  Sample1B: incbin "Aquarius Lead.brr":2..0
  Sample1C: incbin "Sawtooth X.brr":2..0
  Sample1D: incbin "EB Elec Piano.brr":2..0
  Sample1E: incbin "S3 Slap Bass II.brr":2..0
  Sample1F: incbin "Yasui Snare.brr":2..0
  Sample20: incbin "DR-660 Kick.brr":2..0
  Sample21: incbin "XR-10 Clap.brr":2..0
  Sample22: incbin "R-8 Tom 2.brr":2..0
  Sample23: incbin "MM7 Hi-Hat 1.brr":2..0
  Sample24: incbin "R-8 Crash Cym.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

FirFilters:
  db $FF,$08,$17,$24,$24,$17,$08,$FF

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2B59

Tracker2B59:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern0_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !echo,%11110100,50,50
  !setEchoFirFilters : dw FirFilters
  !echoParameters,5,170,0
  !setDPMiscCommand,!noteEndInTicks,1
  !musicVolume,120
  !tempo,62
  !subtranspose,0
  !endVibrato
  !amplify,66
.pattern1_0:
  !subloop,0
  db 96,$7F
  !rest
  !subloop,5
  !instr,!instr1F
  !volume,225
  !pan,10
  !subloop,0
  db 36,$7F
  !c4
  !c4
  db 24
  !c4
  !instr,!instr20
  !volume,255
  !pan,10
  !amplify,207
  !c4
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !subloop,1
  db 36,$7F
  !c4
  !c4
  !instr,!instr20
  !volume,255
  !pan,10
  !amplify,207
  db 24
  !c4
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr20
  !volume,255
  !pan,10
  !amplify,207
  !c4
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  db 36
  !c4
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
  !loop : dw .sub48EF : db 1
  !loop : dw .sub4924 : db 1
  !loop : dw .sub493A : db 1
  !loop : dw .sub4950 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  db 12
  !c4
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
  !c4
  !loop : dw .sub48EF : db 1
  !loop : dw .sub4924 : db 1
  !loop : dw .sub493A : db 1
  !loop : dw .sub4950 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  db 24
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
  !subloop,0
  !loop : dw .sub496A : db 1
  !loop : dw .sub4990 : db 1
  db 12,$7F
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub49AD : db 1
  !loop : dw .sub4990 : db 1
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49D8 : db 1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49EE : db 1
  !subloop,2
  !loop : dw .sub496A : db 1
  !loop : dw .sub4990 : db 1
  db 12,$7F
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub49AD : db 1
  !loop : dw .sub4990 : db 1
  db 12,$7F
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49D8 : db 1
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
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
  db 24
  !c4
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4A12 : db 1
  !loop : dw .sub4A3B : db 1
  !subloop,0
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49D8 : db 1
  !subloop,1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49EE : db 1
  !loop : dw .sub4A12 : db 1
  !loop : dw .sub4A3B : db 1
  !subloop,0
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49D8 : db 1
  !subloop,1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub4A4F : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4A12 : db 1
  !loop : dw .sub4A3B : db 1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49D8 : db 1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub4A3B : db 1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49EE : db 1
  !loop : dw .sub4A12 : db 1
  !loop : dw .sub4A3B : db 1
  !subloop,0
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49D8 : db 1
  !subloop,1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub4A4F : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12,$7F
  !c4
  !instr,!instr22
  !volume,204
  !pan,9
  !amplify,0
  !c5
  !instr,!instr24
  !volume,208
  !pan,10
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !subloop,0
  db 48,$7F
  !c4
  db 36
  !c4
  !instr,!instr20
  !volume,255
  !pan,10
  !amplify,207
  db 12
  !c4
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !instr,!instr20
  !volume,255
  !pan,10
  !amplify,207
  !c4
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  db 48
  !c4
  !subloop,3
  db 48,$7F
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
  db 24
  !c4
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub48EF : db 1
  !loop : dw .sub4924 : db 1
  !loop : dw .sub493A : db 1
  !loop : dw .sub4950 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  db 12
  !c4
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
  !c4
  !loop : dw .sub48EF : db 1
  !loop : dw .sub4924 : db 1
  !loop : dw .sub493A : db 1
  db 12,$7F
  !c4
  db 24
  !c4
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
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !c4
  db 72
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
  db 24
  !c4
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub48EF : db 1
  !loop : dw .sub4924 : db 1
  !loop : dw .sub493A : db 1
  !loop : dw .sub49D8 : db 1
  !loop : dw .sub4A6C : db 1
  !loop : dw .sub4924 : db 1
  !loop : dw .sub493A : db 1
  !loop : dw .sub49EE : db 1
  !loop : dw .sub48EF : db 1
  !loop : dw .sub4924 : db 1
  !loop : dw .sub493A : db 1
  !loop : dw .sub49D8 : db 1
  !loop : dw .sub4A6C : db 1
  !loop : dw .sub4924 : db 1
  !loop : dw .sub493A : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
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
  !loop : dw .sub4A81 : db 1
  db 36,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !loop : dw .sub4A3B : db 1
  !loop : dw .sub493A : db 1
  !loop : dw .sub49D8 : db 1
  !loop : dw .sub493A : db 1
  !loop : dw .sub4A3B : db 1
  !loop : dw .sub493A : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36,$7F
  !c4
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4A81 : db 1
  db 36,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !loop : dw .sub4A3B : db 1
  !loop : dw .sub493A : db 1
  !loop : dw .sub49D8 : db 1
  !loop : dw .sub4A81 : db 1
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr22
  !volume,204
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
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
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 60
  !c4
  !instr,!instr1F
  !volume,225
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
  !volume,225
  !pan,10
  !c4
  !instr,!instr23
  !volume,206
  !pan,11
  !amplify,0
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr22
  !volume,204
  !pan,9
  !amplify,0
  !c5
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
  !c4
  db 48
  !c4
  !loop : dw .sub4AA0 : db 1
  !loop : dw .sub49D8 : db 1
  !loop : dw .sub4AA0 : db 1
  db 36,$7F
  !c4
  db 48
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4AA0 : db 1
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
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
  !loop : dw .sub4AB2 : db 1
  !loop : dw .sub4A3B : db 1
  !loop : dw .sub493A : db 1
  !loop : dw .sub49D8 : db 1
  !loop : dw .sub4AB2 : db 1
  db 12,$7F
  !c4
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  db 36
  !c4
  !c4
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
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
  !loop : dw .sub4A12 : db 1
  !loop : dw .sub4A3B : db 1
  !subloop,0
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49D8 : db 1
  !subloop,1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49EE : db 1
  !loop : dw .sub4A12 : db 1
  !loop : dw .sub4A3B : db 1
  !subloop,0
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49D8 : db 1
  !subloop,1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub4A4F : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4A12 : db 1
  !loop : dw .sub4A3B : db 1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49D8 : db 1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub4A3B : db 1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49EE : db 1
  !loop : dw .sub4A12 : db 1
  !loop : dw .sub4A3B : db 1
  !subloop,0
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub49D8 : db 1
  !subloop,1
  !loop : dw .sub49C1 : db 1
  !loop : dw .sub4A4F : db 1
  db 24,$7F
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
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  !instr,!instr22
  !volume,204
  !pan,9
  !amplify,0
  db 12
  !c5
  !amplify,66
  !instr,!instr24
  !volume,208
  !pan,10
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr22
  !volume,204
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
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
  db 96
  !c4
  db 60
  !tie
  !end

.pattern0_1
  !subtranspose,63
  !subloop,0
  db 96,$7F
  !rest
  !subloop,10
  db 48,$7F
  !rest
  !instr,!instr34
  !volume,255
  !pan,10
  !tremolo,0,16,22
  !amplify,63
  !d6
  !pitchSlide,13,34 : !d4
  !loop : dw .sub4D47 : db 1
  db 24,$7F
  !e4
  db 12
  !e4
  db 24
  !e5
  db 12
  !fs4
  !fs4
  db 24
  !fs4
  !fs5
  db 12
  !fs4
  db 24
  !fs4
  db 12
  !cs5
  !fs5
  !cs5
  !loop : dw .sub4D47 : db 1
  db 24,$7F
  !gs4
  db 12
  !gs4
  db 24
  !gs5
  db 12
  !as4
  !as4
  db 24
  !as5
  !loop : dw .sub4D6B : db 2
  !loop : dw .sub4D72 : db 1
  !loop : dw .sub4D97 : db 1
  !transpose,1
  !loop : dw .sub4D97 : db 1
  !transpose,0
  !loop : dw .sub4DA0 : db 2
  !loop : dw .sub4D6B : db 2
  !loop : dw .sub4D72 : db 1
  !loop : dw .sub4D97 : db 1
  !transpose,254
  !loop : dw .sub4D97 : db 1
  !transpose,252
  !loop : dw .sub4DA0 : db 4
  !transpose,0
  !loop : dw .sub4D72 : db 1
  !loop : dw .sub4D97 : db 1
  !transpose,1
  !loop : dw .sub4D97 : db 1
  !transpose,0
  !loop : dw .sub4DA0 : db 2
  !loop : dw .sub4D6B : db 2
  !loop : dw .sub4D72 : db 1
  !loop : dw .sub4D97 : db 1
  !transpose,1
  !loop : dw .sub4D97 : db 1
  !transpose,0
  !loop : dw .sub4DA0 : db 2
  db 24,$7F
  !as4
  db 8
  !e6
  db 4
  !rest
  db 8
  !e6
  db 4
  !rest
  db 8
  !b5
  db 4
  !rest
  db 8
  !b5
  db 4
  !rest
  db 8
  !e5
  db 4
  !rest
  db 8
  !e5
  db 4
  !rest
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,249
  !loop : dw .sub4DA7 : db 2
  !transpose,251
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,0
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,249
  !loop : dw .sub4DA7 : db 2
  !transpose,251
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,0
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,249
  !loop : dw .sub4DA7 : db 2
  !transpose,251
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,0
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,249
  !loop : dw .sub4DA7 : db 2
  !transpose,251
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !loop : dw .sub4DAE : db 1
  !subloop,0
  db 24,$7F
  !e4
  db 12,$07
  !e4
  db 24,$7F
  !e4
  db 12,$07
  !e4
  db 24,$7F
  !e4
  db 12,$07
  !e4
  db 24,$7F
  !e4
  db 12,$07
  !e4
  db 24,$7F
  !e4
  !e4
  !subloop,1
  !subloop,0
  !loop : dw .sub4DCE : db 1
  !transpose,254
  !subloop,1
  !transpose,0
  db 24,$7F
  !c4
  db 12,$07
  !c4
  db 24,$7F
  !c4
  db 12,$07
  !c4
  db 24,$7F
  !cs5
  db 12,$07
  !cs5
  db 24,$7F
  !cs4
  db 12,$07
  !cs4
  !transpose,255
  !loop : dw .sub4DCE : db 1
  !transpose,0
  !loop : dw .sub4DE7 : db 1
  db 72,$7F
  !as4
  !as4
  !loop : dw .sub4DE7 : db 1
  db 60,$7F
  !as4
  db 12
  !fs5
  !as5
  !fs5
  !loop : dw .sub4D6B : db 1
  !loop : dw .sub4DF0 : db 1
  !loop : dw .sub4DFC : db 1
  !loop : dw .sub4E08 : db 1
  !loop : dw .sub4DA7 : db 1
  !loop : dw .sub4DF0 : db 1
  !transpose,1
  !loop : dw .sub4DFC : db 1
  !transpose,0
  !loop : dw .sub4E08 : db 1
  !loop : dw .sub4DA7 : db 1
  !loop : dw .sub4DF0 : db 1
  !transpose,254
  !loop : dw .sub4DFC : db 1
  !transpose,251
  !loop : dw .sub4E08 : db 1
  !loop : dw .sub4DA7 : db 1
  !transpose,0
  !subloop,0
  !loop : dw .sub4DF0 : db 1
  !loop : dw .sub4DFC : db 1
  !loop : dw .sub4E08 : db 1
  !loop : dw .sub4DA7 : db 1
  !subloop,1
  !loop : dw .sub4DF0 : db 1
  !transpose,1
  !loop : dw .sub4DFC : db 1
  !transpose,0
  !loop : dw .sub4E08 : db 1
  !loop : dw .sub4DA7 : db 1
  !loop : dw .sub4DF0 : db 1
  !transpose,254
  !loop : dw .sub4DFC : db 1
  !transpose,251
  !loop : dw .sub4E08 : db 1
  !loop : dw .sub4DA7 : db 1
  !transpose,0
  !loop : dw .sub4DF0 : db 1
  !loop : dw .sub4DFC : db 1
  db 24,$7F
  !b4
  db 12
  !b5
  db 24
  !b4
  db 12
  !b4
  !b5
  db 108
  !b4
  db 36
  !g4
  !g4
  db 120
  !a4
  db 36
  !a4
  !e5
  db 120
  !d5
  db 36
  !g4
  !g4
  db 120
  !a4
  db 36
  !a4
  !e5
  !d5
  !a4
  db 24
  !a4
  db 12
  !a5
  !a4
  !loop : dw .sub4E18 : db 1
  db 12,$7F
  !g4
  !g4
  !g5
  db 24
  !a4
  db 12
  !a4
  !a5
  !a4
  !loop : dw .sub4E1F : db 1
  !transpose,251
  !loop : dw .sub4DA7 : db 1
  db 12,$7F
  !b4
  !b4
  !b5
  !transpose,0
  db 24
  !b4
  db 12
  !b4
  !b5
  !b4
  !loop : dw .sub4DA7 : db 1
  !transpose,1
  !loop : dw .sub4DA7 : db 1
  db 12,$7F
  !b4
  !b4
  !b5
  db 24
  !b4
  db 12
  !b4
  !b5
  !b4
  !loop : dw .sub4DA7 : db 1
  !transpose,0
  db 24,$7F
  !b4
  db 12,$78
  !b4
  db 24,$7D
  !b4
  db 12,$76
  !b4
  db 24,$7B
  !b4
  db 12,$74
  !b4
  db 12,$78
  !b4
  db 12,$7B
  !b5
  db 12,$7C
  !b4
  db 12,$7D
  !b4
  !b4
  db 12,$7E
  !b5
  !b4
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,249
  !loop : dw .sub4DA7 : db 2
  !transpose,251
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,0
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,249
  !loop : dw .sub4DA7 : db 2
  !transpose,251
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,0
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,249
  !loop : dw .sub4DA7 : db 2
  !transpose,251
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,0
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !transpose,254
  !loop : dw .sub4DA7 : db 2
  !transpose,249
  !loop : dw .sub4DA7 : db 2
  !transpose,251
  !loop : dw .sub4DA7 : db 2
  !transpose,252
  !loop : dw .sub4DA7 : db 2
  !loop : dw .sub4DAE : db 1
  db 24,$7F
  !gs4
  db 12,$07
  !gs4
  db 24,$7F
  !gs4
  db 12,$07
  !gs4
  db 120,$7F
  !gs4
  db 96
  !fs4
  !adsrGain,$7F,$F1
  !tie
  !end

.pattern0_2
  !subtranspose,63
.pattern1_2:
  !instr,!instr27
  !volume,255
  !endVibrato
  !tremolo,0,16,22
  !amplify,36
  !pan,9
  !subloop,0
  !loop : dw .sub4E26 : db 1
  !loop : dw .sub4E47 : db 1
  !loop : dw .sub4E26 : db 1
  db 12,$7D
  !gs3
  !cs4
  !f4
  !gs4
  !b4
  !f5
  !as3
  !cs4
  !fs4
  !as4
  !cs5
  !fs5
  !as5
  !cs6
  !fs5
  !cs5
  !as4
  !fs4
  !subloop,1
  db 12,$77
  !as4
  !fs4
  !amplify,0
  !instr,!instr28
  !volume,240
  !vibrato,22,10,47
  !tremolo,0,18,8
  !pan,9
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48E3 : db 3,0
  !loop : dw .sub4E5C : db 1
  db 12,$7F
  !d4
  !gs4
  !b4
  !gs4
  !b4
  db 24
  !e5
  db 3
  !f5
  db 21
  !fs5
  db 12
  !fs5
  db 24
  !cs5
  db 12
  !cs5
  db 24
  !b4
  db 48
  !as4
  db 12
  !fs4
  !fs4
  !as4
  !cs5
  db 24
  !rest
  !loop : dw .sub4E5C : db 1
  db 12,$7F
  !f4
  !gs4
  db 24
  !f4
  db 12
  !f4
  db 24
  !d4
  db 12
  !cs4
  !d4
  !cs4
  !b3
  !cs4
  !d4
  !e4
  db 108
  !fs4
  db 24
  !rest
  !tremolo,0,0,0
  !instr,!instr29
  !volume,255
  !vibrato,32,10,63
  !amplify,74
  !pan,10
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48E7 : db 3,0
  !loop : dw .sub4E87 : db 1
  !loop : dw .sub4EB0 : db 1
  !loop : dw .sub4E87 : db 1
  !loop : dw .sub4EC5 : db 1
  db 60,$7F
  !fs5
  db 48
  !rest
  !amplify,0
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48E7 : db 0,0
  !instr,!instr2A
  !volume,255
  !vibrato,32,10,68
  !amplify,18
  !pan,9
  !loop : dw .sub4ED3 : db 1
  !loop : dw .sub4EDF : db 1
  !loop : dw .sub4F24 : db 1
  !loop : dw .sub4ED3 : db 1
  !loop : dw .sub4F39 : db 1
  db 12,$7F
  !a4
  !b4
  !cs5
  !loop : dw .sub4ED3 : db 1
  !loop : dw .sub4EDF : db 1
  !loop : dw .sub4F8A : db 1
  !loop : dw .sub4ED3 : db 1
  !loop : dw .sub4F39 : db 1
  db 12,$7F
  !a4
  !b4
  !cs5
  !slideIn,0,10,4
  db 96
  !b4
  !tie
  !tie
  !tie
  !slideIn,0,0,0
  !amplify,0
  !instr,!instr2B
  !volume,255
  !endVibrato
  !amplify,63
  !loop : dw .sub4F94 : db 1
  db 12,$7F
  !fs5
  !ds5
  !b4
  !amplify,0
  !instr,!instr2C
  !volume,230
  !endVibrato
  !tremolo,0,16,22
  !pan,11
  !toggleEcho
  !loop : dw .sub4FC4 : db 1
  !loop : dw .sub4FE5 : db 1
  !loop : dw .sub4FC4 : db 1
  !loop : dw .sub4FFA : db 1
  db 12,$3B
  !cs6
  !fs5
  !cs5
  !as4
  !fs4
  !toggleEcho
  !tremolo,0,0,0
  !instr,!instr2D
  !volume,255
  !vibrato,22,11,63
  !amplify,47
  !pan,9
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48DF : db 3,0
  db 60,$7F
  !b4
  db 12
  !rest
  db 2
  !as5
  db 22
  !b5
  db 30
  !a5
  db 6
  !rest
  db 20
  !d6
  db 16
  !rest
  db 24
  !cs6
  db 16
  !a5
  db 8
  !rest
  db 16
  !fs5
  db 8
  !rest
  !a5
  db 4
  !rest
  db 8
  !a5
  db 16
  !rest
  db 84
  !b5
  db 12
  !fs4
  !a4
  db 60
  !b4
  db 12
  !rest
  db 2
  !as5
  db 22
  !b5
  db 16
  !as5
  db 20
  !rest
  db 24
  !b5
  db 12
  !rest
  db 24
  !cs6
  db 120
  !fs5
  db 12
  !a4
  !b4
  !d5
  !e5
  !d5
  !a4
  db 60
  !b4
  db 12
  !rest
  db 2
  !as5
  db 22
  !b5
  db 30
  !a5
  db 6
  !rest
  db 24
  !b5
  db 12
  !rest
  db 24
  !cs6
  db 18
  !d6
  db 6
  !rest
  db 18
  !fs5
  db 6
  !rest
  db 8
  !cs6
  db 4
  !rest
  db 8
  !cs6
  db 16
  !rest
  db 54
  !d6
  db 3
  !d6
  !ds6
  db 48
  !e6
  db 24
  !fs6
  db 18
  !b5
  db 30
  !rest
  db 12
  !cs6
  !d6
  db 16
  !cs6
  db 20
  !rest
  db 16
  !a5
  db 20
  !rest
  db 16
  !fs5
  db 8
  !rest
  db 16
  !a5
  db 8
  !rest
  db 16
  !fs5
  db 8
  !rest
  !a5
  db 4
  !rest
  db 8
  !a5
  db 16
  !rest
  db 84
  !b5
  db 12
  !a4
  !loop : dw .sub500A : db 1
  db 30,$7F
  !cs6
  db 6
  !rest
  db 20
  !fs6
  db 16
  !rest
  db 24
  !e6
  db 16
  !cs6
  db 8
  !rest
  db 16
  !a5
  db 8
  !rest
  !cs6
  db 4
  !rest
  db 8
  !cs6
  db 16
  !rest
  db 84
  !d6
  db 12
  !a4
  !loop : dw .sub500A : db 1
  db 16,$7F
  !cs6
  db 20
  !rest
  db 24
  !d6
  db 12
  !rest
  db 24
  !e6
  db 120
  !b5
  db 12
  !cs5
  !e5
  !fs5
  !g5
  !fs5
  !loop : dw .sub500A : db 1
  db 30,$7F
  !cs6
  db 6
  !rest
  db 24
  !d6
  db 12
  !rest
  db 24
  !e6
  db 18
  !fs6
  db 6
  !rest
  db 18
  !a5
  db 6
  !rest
  db 8
  !e6
  db 4
  !rest
  db 8
  !e6
  db 16
  !rest
  db 60
  !fs6
  db 48
  !e6
  db 2
  !c6
  db 34
  !cs6
  db 36
  !b5
  db 24
  !fs6
  !e6
  db 12
  !a6
  db 24
  !cs6
  !d6
  db 12
  !e6
  !cs6
  !d6
  !cs6
  !d6
  !cs6
  !a5
  !fs5
  db 60
  !b5
  db 6
  !a5
  !fs5
  db 6,$7E
  !e5
  !d5
  db 6,$7D
  !b4
  !fs4
  db 6,$7C
  !d4
  db 6,$7B
  !b3
  !amplify,0
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48DF : db 0,0
  !instr,!instr2E
  !volume,255
  !vibrato,22,10,47
  !tremolo,0,8,24
  !amplify,63
  !pan,10
  !loop : dw .sub5016 : db 1
  db 36,$7F
  !cs6
  !a6
  !e6
  db 24
  !fs6
  !a6
  !tremolo,0,0,0
  !amplify,0
  !instr,!instr30
  !volume,170
  !vibrato,22,10,47
  !pan,11
  !subloop,0
  db 12,$7F
  !b5
  !d6
  !fs6
  !a6
  !b6
  !a6
  !fs6
  !d6
  !subloop,2
  db 12,$7F
  !e7
  !d7
  !cs7
  !a6
  !e6
  !d6
  !cs6
  !a5
  !c6
  !e6
  !g6
  !b6
  !c7
  !b6
  !g6
  !e6
  !e7
  !c7
  !b6
  !g6
  !c7
  !b6
  !g6
  !e6
  db 24
  !b5
  db 12,$79
  !b5
  db 24,$7B
  !b5
  db 12,$75
  !b5
  db 24,$78
  !b5
  !instr,!instr2C
  !volume,230
  !endVibrato
  !tremolo,0,16,22
  !volume,180
  !tremolo,0,0,0
  !pan,12
  db 6,$7F
  !b6
  !a6
  !g6
  !fs6
  !pan,11
  !e6
  !d6
  !cs6
  !pan,10
  db 6,$7E
  !b5
  !a5
  !g5
  !pan,9
  db 6,$7D
  !fs5
  !e5
  db 6,$7C
  !d5
  !pan,8
  db 6,$7B
  !cs5
  db 6,$7A
  !a4
  db 6,$79
  !fs4
  !instr,!instr2A
  !volume,255
  !vibrato,32,10,68
  !amplify,18
  !pan,9
  !loop : dw .sub4ED3 : db 1
  !loop : dw .sub4EDF : db 1
  !loop : dw .sub4F24 : db 1
  !loop : dw .sub4ED3 : db 1
  !loop : dw .sub4F39 : db 1
  db 12,$7F
  !e5
  !fs5
  !a5
  !transpose,12
  !loop : dw .sub4ED3 : db 1
  !loop : dw .sub4EDF : db 1
  !loop : dw .sub4F8A : db 1
  !transpose,12
  !loop : dw .sub4ED3 : db 1
  !loop : dw .sub4F39 : db 1
  !transpose,0
  db 12,$7F
  !a5
  !b5
  !cs6
  !slideIn,0,10,4
  db 24
  !b5
  !slideIn,0,0,0
  db 12,$79
  !b5
  db 24,$7F
  !b5
  db 12,$79
  !b5
  db 36,$7F
  !b5
  db 12
  !a5
  !b5
  !d6
  !e6
  !d6
  !fs6
  !a6
  db 24
  !b6
  db 12,$79
  !b6
  db 60,$7F
  !b6
  !adsrGain,$7F,$F1
  db 96
  !tie
  !end

.pattern0_3
  !toggleEcho
.pattern1_3:
  !toggleEcho
  !amplify,0
  !subtranspose,0
  !endVibrato
  !subloop,0
  db 96,$7F
  !rest
  !subloop,5
  db 24,$7F
  !rest
  !instr,!instr23
  !volume,206
  !pan,11
  !subloop,0
  db 36,$7F
  !c5
  !c5
  !instr,!instr24
  !volume,208
  !pan,10
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !subloop,2
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,255
  !pan,10
  !pan,13
  db 8
  !d6
  !d6
  !d6
  !pan,12
  db 12
  !b5
  !pan,11
  !b5
  !pan,10
  !gs5
  !pan,9
  !gs5
  !pan,8
  !f5
  !pan,7
  !d5
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,204
  !pan,9
  !loop : dw .sub4AE1 : db 1
  !loop : dw .sub4AF8 : db 1
  !loop : dw .sub4B53 : db 3
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,204
  !pan,9
  !subloop,0
  db 12,$7F
  !c5
  !subloop,6
  !instr,!instr23
  !volume,206
  !pan,11
  db 12,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !loop : dw .sub4AF8 : db 1
  !loop : dw .sub4B53 : db 1
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,255
  !pan,10
  !pan,13
  !d6
  !pan,12
  !d6
  !b5
  !pan,11
  !b5
  !pan,10
  !gs5
  !pan,9
  !f5
  !pan,7
  !d5
  !subloop,0
  !loop : dw .sub4B66 : db 1
  !loop : dw .sub4B53 : db 2
  !loop : dw .sub4AE1 : db 1
  !loop : dw .sub4B53 : db 2
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub4B91 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub4BB0 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4B53 : db 2
  !subloop,2
  !loop : dw .sub4B66 : db 1
  !loop : dw .sub4B53 : db 2
  !loop : dw .sub4AE1 : db 1
  !loop : dw .sub4B53 : db 2
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub4B91 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub4BB0 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !instr,!instr24
  !volume,208
  !pan,10
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  !c4
  !amplify,0
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !instr,!instr21
  !volume,255
  !pan,10
  !pan,13
  !d6
  !pan,12
  !d6
  !pan,11
  !d6
  !pan,10
  !d6
  !pan,9
  !b5
  !pan,8
  !gs5
  !pan,7
  !f5
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !subloop,0
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4BC3 : db 1
  !loop : dw .sub4BD0 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !subloop,2
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4BC3 : db 1
  !loop : dw .sub4BD0 : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !subloop,0
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4BC3 : db 1
  !loop : dw .sub4BD0 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !subloop,2
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4BC3 : db 1
  !loop : dw .sub4BEF : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !subloop,0
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4BC3 : db 1
  !loop : dw .sub4BD0 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !subloop,2
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4BC3 : db 1
  !loop : dw .sub4BD0 : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !subloop,0
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4BC3 : db 1
  !loop : dw .sub4BD0 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !subloop,2
  !instr,!instr24
  !volume,208
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !loop : dw .sub4C04 : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,204
  !pan,9
  db 12
  !c5
  !loop : dw .sub4C27 : db 3
  !loop : dw .sub4BB0 : db 1
  !subloop,0
  !loop : dw .sub4C27 : db 4
  !loop : dw .sub4BB0 : db 1
  !subloop,2
  !loop : dw .sub4C27 : db 2
  !loop : dw .sub4C39 : db 1
  !loop : dw .sub4C5A : db 1
  !subloop,0
  db 12,$7F
  !c5
  !subloop,5
  !instr,!instr24
  !volume,208
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  db 12
  !c5
  !c5
  !instr,!instr24
  !volume,208
  !pan,10
  db 24
  !c5
  !loop : dw .sub4C5A : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 60,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,255
  !pan,10
  !pan,13
  db 12
  !d6
  !pan,12
  db 24
  !d6
  !pan,11
  db 12
  !b5
  !pan,10
  !gs5
  !pan,9
  !gs5
  !pan,8
  !f5
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,204
  !pan,9
  !loop : dw .sub4CC9 : db 1
  !subloop,0
  !loop : dw .sub4CDC : db 1
  !loop : dw .sub4CC9 : db 3
  !subloop,2
  !loop : dw .sub4CDC : db 1
  !loop : dw .sub4CC9 : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,204
  !pan,9
  !loop : dw .sub4CC9 : db 1
  !subloop,0
  !loop : dw .sub4CDC : db 1
  !loop : dw .sub4CC9 : db 3
  !subloop,2
  !loop : dw .sub4C39 : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !subloop,0
  !loop : dw .sub4BB0 : db 2
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !subloop,1
  !loop : dw .sub4BB0 : db 2
  !loop : dw .sub4C27 : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 12,$7F
  !c4
  !amplify,0
  !loop : dw .sub4BD0 : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !loop : dw .sub4BB0 : db 2
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4BB0 : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr24
  !volume,208
  !pan,10
  db 12
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  !c4
  !amplify,0
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4C27 : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 60,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4BEF : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 72,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr24
  !volume,208
  !pan,10
  db 24
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !loop : dw .sub4CF5 : db 1
  !loop : dw .sub4B53 : db 1
  !instr,!instr23
  !volume,206
  !pan,11
  db 12,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !loop : dw .sub4B53 : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !loop : dw .sub4B53 : db 1
  !loop : dw .sub4CF5 : db 1
  !loop : dw .sub4B53 : db 1
  !instr,!instr23
  !volume,206
  !pan,11
  db 12,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !instr,!instr21
  !volume,255
  !pan,10
  !pan,13
  !d6
  !d6
  !pan,12
  !d6
  !pan,11
  !b5
  !pan,9
  !gs5
  !pan,7
  !f5
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,204
  !pan,9
  !loop : dw .sub4D34 : db 5
  !loop : dw .sub4B53 : db 2
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,204
  !pan,9
  !loop : dw .sub4D34 : db 3
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 96,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4C39 : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !subloop,0
  !loop : dw .sub4BB0 : db 2
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !subloop,2
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !subloop,0
  !loop : dw .sub4BB0 : db 2
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !subloop,1
  !loop : dw .sub4BB0 : db 2
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BEF : db 1
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !subloop,0
  !loop : dw .sub4BB0 : db 2
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !subloop,2
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4BB0 : db 1
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !subloop,0
  !loop : dw .sub4BB0 : db 2
  !loop : dw .sub4B91 : db 1
  !loop : dw .sub4BD0 : db 1
  !subloop,1
  !loop : dw .sub4BB0 : db 1
  !instr,!instr24
  !volume,208
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !loop : dw .sub4C04 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 36,$7F
  !cs5
  !cs5
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  db 72
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,204
  !pan,9
  !loop : dw .sub4CC9 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 36,$7F
  !cs5
  db 96
  !cs5
  db 60
  !tie
  !end

.pattern0_4
  !subtranspose,63
.pattern1_4:
  db 30,$7F
  !rest
  !instr,!instr27
  !volume,255
  !endVibrato
  !tremolo,0,16,22
  !amplify,36
  !adsrGain,$7C,$EA
  !volume,140
  !pan,10
  !toggleEcho
  !loop : dw .sub4E26 : db 1
  !loop : dw .sub4E47 : db 1
  !loop : dw .sub4E26 : db 1
  db 12,$7D
  !gs3
  !cs4
  !f4
  !gs4
  !b4
  !f5
  !as3
  !cs4
  !fs4
  !as4
  !cs5
  !fs5
  !as5
  !cs6
  db 18
  !fs5
  !subtranspose,63
  !toggleEcho
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !pan,10
  !subloop,0
  db 96,$7F
  !d5
  db 48
  !e5
  db 72
  !cs5
  !d5
  db 96
  !b4
  db 48
  !tie
  db 96
  !cs5
  db 48
  !tie
  !subloop,1
  !subloop,0
  db 96,$7F
  !d5
  db 48
  !tie
  !e5
  db 96
  !cs5
  db 48
  !tie
  !d5
  db 96
  !b4
  !tie
  db 96
  !cs5
  !tie
  !subloop,3
  !subloop,0
  !loop : dw .sub5141 : db 1
  db 96,$7F
  !cs5
  !loop : dw .sub5141 : db 1
  db 96,$7F
  !e5
  !subloop,1
  !instr,!instr32
  !volume,165
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48EB : db 3,0
  !subloop,0
  !loop : dw .sub514B : db 4
  db 12,$7F
  !e5
  !rest
  !e5
  !rest
  !subloop,1
  !loop : dw .sub514B : db 4
  !subloop,0
  db 12,$7F
  !d5
  db 24
  !rest
  !subloop,3
  db 12,$7F
  !c5
  db 24
  !rest
  db 12
  !c5
  db 24
  !rest
  db 12
  !cs5
  db 24
  !rest
  db 12
  !cs5
  db 24
  !rest
  !subloop,0
  db 12,$7F
  !ds5
  db 24
  !rest
  !subloop,3
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48EB : db 0,0
  !instr,!instr2F
  !volume,225
  !vibrato,32,10,30
  !pan,14
  !loop : dw .sub5151 : db 1
  !pan,6
  !loop : dw .sub5168 : db 1
  db 96,$7F
  !d6
  !tie
  !tie
  db 12
  !tie
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !pan,10
  !loop : dw .sub5179 : db 1
  db 96,$7F
  !d5
  !tie
  db 96
  !b4
  !tie
  db 96
  !cs5
  !tie
  !b4
  !cs5
  db 96
  !d5
  !tie
  !loop : dw .sub5179 : db 1
  db 96,$7F
  !d5
  !tie
  !tie
  !tie
  db 96
  !cs5
  !tie
  !b4
  !cs5
  db 96
  !d5
  db 48
  !tie
  !adsrGain,$7F,$F2
  !tie
  !instr,!instr33
  !volume,175
  !vibrato,10,8,42
  !pan,13
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48EB : db 3,0
  db 72
  !b4
  db 120
  !cs5
  db 72
  !a4
  db 120
  !a4
  db 72
  !b4
  db 120
  !cs5
  db 36
  !a4
  !e5
  db 120
  !d5
  db 84
  !d5
  db 108
  !e5
  db 84
  !cs5
  db 108
  !d5
  db 96
  !e5
  !tie
  db 24
  !ds5
  db 12
  !rest
  db 24,$7D
  !ds5
  db 12
  !rest
  db 24,$7B
  !ds5
  db 12
  !rest
  db 24,$07
  !ds5
  db 12
  !rest
  db 24,$75
  !ds5
  db 12
  !rest
  db 12,$72
  !ds5
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48EB : db 0,0
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !pan,10
  !subloop,0
  !loop : dw .sub5141 : db 1
  db 96,$7F
  !cs5
  !loop : dw .sub5141 : db 1
  db 96,$7F
  !e5
  !subloop,1
  db 24,$7F
  !e5
  db 12,$79
  !e5
  db 24,$7F
  !e5
  db 12,$79
  !e5
  db 120,$7F
  !e5
  db 96
  !fs5
  !adsrGain,$7F,$F1
  !tie
  !end

.pattern0_5
  !subtranspose,63
.pattern1_5:
  !subloop,0
  db 96,$7F
  !rest
  !subloop,11
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !pan,13
  db 96,$7F
  !b4
  db 48
  !cs5
  db 72
  !a4
  !b4
  db 96
  !g4
  db 48
  !tie
  db 96
  !as4
  db 48
  !tie
  db 96
  !b4
  db 48
  !cs5
  db 72
  !a4
  !b4
  !g4
  !gs4
  db 96
  !as4
  db 48
  !tie
  !subloop,0
  db 96,$7F
  !b4
  !tie
  db 96
  !a4
  !tie
  !g4
  !gs4
  db 96
  !as4
  !tie
  !subloop,3
  !subloop,0
  !loop : dw .sub5183 : db 1
  db 96,$7F
  !a4
  !loop : dw .sub5183 : db 1
  db 96,$7F
  !cs5
  !subloop,1
  !instr,!instr32
  !volume,165
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48EB : db 3,0
  !subloop,0
  !loop : dw .sub518D : db 4
  db 12,$7F
  !b4
  !rest
  !b4
  !rest
  !subloop,1
  db 12,$7F
  !b4
  db 24
  !rest
  db 12
  !b4
  db 24
  !rest
  db 12
  !c5
  db 24
  !rest
  db 12
  !c5
  db 24
  !rest
  db 12
  !a4
  db 24
  !rest
  db 12
  !a4
  db 24
  !rest
  db 12
  !b4
  db 24
  !rest
  db 12
  !b4
  db 24
  !rest
  db 12
  !g4
  db 24
  !rest
  db 12
  !g4
  db 24
  !rest
  db 12
  !as4
  db 24
  !rest
  db 12
  !as4
  db 24
  !rest
  !loop : dw .sub518D : db 4
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48EB : db 0,0
  db 36,$7F
  !rest
  !instr,!instr2F
  !volume,225
  !vibrato,32,10,30
  !volume,150
  !pan,10
  !endVibrato
  !subtranspose,81
  !pan,11
  !loop : dw .sub5151 : db 1
  !pan,9
  !loop : dw .sub5168 : db 1
  db 96,$7F
  !d6
  !tie
  db 48
  !tie
  !subtranspose,63
  !instr,!instr2D
  !volume,255
  !vibrato,22,11,63
  !amplify,47
  !pan,9
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48DF : db 3,0
  db 12
  !fs4
  !a4
  !amplify,0
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48DF : db 0,0
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !pan,13
  !loop : dw .sub5193 : db 1
  db 96,$7F
  !b4
  !tie
  db 96
  !g4
  !tie
  db 96
  !a4
  !tie
  !g4
  !a4
  db 96
  !b4
  !tie
  !loop : dw .sub5193 : db 1
  db 96,$7F
  !b4
  !tie
  !tie
  !tie
  db 96
  !a4
  !tie
  !g4
  !a4
  db 96
  !b4
  db 48
  !tie
  !adsrGain,$7F,$F2
  !tie
  !instr,!instr33
  !volume,175
  !vibrato,10,8,42
  !pan,7
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48EB : db 3,0
  db 72
  !g4
  db 120
  !a4
  db 72
  !e4
  db 120
  !fs4
  db 72
  !g4
  db 120
  !a4
  db 36
  !fs4
  !cs5
  db 120
  !b4
  db 84
  !b4
  db 108
  !cs5
  db 84
  !a4
  db 108
  !b4
  db 96
  !c5
  !tie
  db 24
  !b4
  db 12
  !rest
  db 24,$7D
  !b4
  db 12
  !rest
  db 24,$7B
  !b4
  db 12
  !rest
  db 24,$07
  !b4
  db 12
  !rest
  db 24,$75
  !b4
  db 12
  !rest
  db 12,$72
  !b4
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48EB : db 0,0
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !pan,13
  !subloop,0
  !loop : dw .sub5183 : db 1
  db 96,$7F
  !a4
  !loop : dw .sub5183 : db 1
  db 96,$7F
  !cs5
  !subloop,1
  db 24,$7F
  !b4
  db 12,$79
  !b4
  db 24,$7F
  !b4
  db 12,$79
  !b4
  db 120,$7F
  !b4
  db 96
  !d5
  !adsrGain,$7F,$F1
  !tie
  !end

.pattern0_6
  !subtranspose,63
.pattern1_6:
  !subloop,0
  db 96,$7F
  !rest
  !subloop,11
  db 30,$7F
  !rest
  !instr,!instr27
  !volume,255
  !endVibrato
  !tremolo,0,16,22
  !amplify,36
  !adsrGain,$7C,$EA
  !volume,140
  !pan,10
  !toggleEcho
  !loop : dw .sub4E26 : db 1
  db 12,$7D
  !g3
  !b3
  !e4
  !g4
  !b4
  !e5
  !fs3
  !as3
  !cs4
  !fs4
  !as4
  !cs5
  !fs5
  !cs5
  !as4
  db 6
  !cs4
  !subtranspose,63
  !toggleEcho
  !volume,255
  !pan,11
  db 12,$7A
  !fs4
  !b4
  !d5
  !fs5
  !b5
  !d6
  !g4
  !b4
  !d5
  !g5
  !b5
  !e6
  !cs4
  !e4
  !a4
  !e5
  !a5
  !cs6
  !cs4
  !fs4
  !a4
  !e5
  !a5
  !d6
  !b3
  !d4
  !g4
  !b4
  !g5
  !b5
  !cs4
  !f4
  !gs4
  !b4
  !f5
  !cs6
  !cs4
  !fs4
  !as4
  !cs5
  !fs5
  !as5
  !cs6
  !fs6
  !as5
  !fs5
  !cs5
  !as4
  db 12,$74
  !cs5
  !as4
  !amplify,0
  !instr,!instr28
  !volume,240
  !vibrato,22,10,47
  !tremolo,0,18,8
  !pan,11
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48E3 : db 3,0
  !loop : dw .sub5039 : db 1
  db 12,$7F
  !d4
  !gs4
  !b4
  !gs4
  !b4
  db 24
  !e5
  db 3
  !f5
  db 21
  !fs5
  db 12
  !fs5
  db 24
  !cs5
  db 12
  !cs5
  db 24
  !b4
  db 12
  !as4
  !subtranspose,63
  !volume,240
  db 12,$7C
  !cs4
  !cs4
  !fs4
  !as4
  db 24
  !rest
  !loop : dw .sub5039 : db 1
  db 12,$7F
  !f4
  !gs4
  db 24
  !f4
  db 12
  !f4
  db 24
  !d4
  db 12
  !cs4
  !d4
  !cs4
  !b3
  !cs4
  !d4
  !e4
  db 72
  !fs4
  !rest
  !tremolo,0,0,0
  !instr,!instr29
  !volume,255
  !vibrato,32,10,63
  !amplify,74
  !volume,170
  !pan,11
  !subtranspose,81
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48E7 : db 3,0
  !loop : dw .sub4E87 : db 1
  !loop : dw .sub4EB0 : db 1
  !loop : dw .sub4E87 : db 1
  !loop : dw .sub4EC5 : db 1
  db 12,$7F
  !fs5
  !subtranspose,63
  !amplify,0
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48E7 : db 0,0
  !loop : dw .sub5066 : db 1
  db 48,$7F
  !rest
  !pan,11
  !loop : dw .sub508A : db 1
  !loop : dw .sub5096 : db 1
  !loop : dw .sub508A : db 1
  !loop : dw .sub50EC : db 1
  !slideIn,0,10,4
  db 96,$7C
  !e4
  !tie
  !tie
  !tie
  !slideIn,0,0,0
  !amplify,0
  db 36
  !rest
  !instr,!instr2B
  !volume,255
  !endVibrato
  !amplify,63
  !volume,180
  !pan,10
  !subtranspose,81
  !loop : dw .sub4F94 : db 1
  !amplify,0
  !subtranspose,63
  !subloop,0
  db 96,$7C
  !rest
  !subloop,5
  !instr,!instr2C
  !volume,230
  !endVibrato
  !tremolo,0,16,22
  !pan,9
  !toggleEcho
  db 12,$38
  !fs4
  !b4
  !d5
  !fs5
  !b5
  !d6
  !g4
  !b4
  !d5
  !g5
  !b5
  !e6
  !cs4
  !e4
  !a4
  !e5
  !a5
  !cs6
  !cs4
  !fs4
  !a4
  !e5
  !a5
  !d6
  !b3
  !d4
  !g4
  !b4
  !g5
  !b5
  !cs4
  !f4
  !gs4
  !b4
  !f5
  !cs6
  !cs4
  !fs4
  !as4
  !cs5
  !fs5
  !as5
  !cs6
  !fs6
  !as5
  !fs5
  !cs5
  !as4
  !toggleEcho
  !tremolo,0,0,0
  !instr,!instr2D
  !volume,255
  !vibrato,22,11,63
  !amplify,47
  !pan,11
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48DF : db 3,0
  db 60,$7C
  !g4
  db 12
  !rest
  db 24
  !g5
  db 30
  !fs5
  db 6
  !rest
  db 20
  !b5
  db 16
  !rest
  db 24
  !a5
  db 16
  !fs5
  db 8
  !rest
  db 16
  !d5
  db 8
  !rest
  !e5
  db 4
  !rest
  db 8
  !e5
  db 16
  !rest
  db 84
  !fs5
  db 12
  !d4
  !fs4
  db 60
  !g4
  db 12
  !rest
  db 24
  !g5
  db 16
  !fs5
  db 20
  !rest
  db 24
  !fs5
  db 12
  !rest
  db 24
  !as5
  db 120
  !d5
  db 72
  !rest
  db 60
  !g4
  db 12
  !rest
  db 24
  !g5
  db 30
  !fs5
  db 6
  !rest
  db 24
  !g5
  db 12
  !rest
  db 24
  !a5
  db 18
  !b5
  db 6
  !rest
  db 18
  !d5
  db 6
  !rest
  db 8
  !a5
  db 4
  !rest
  db 8
  !a5
  db 16
  !rest
  db 54
  !b5
  db 3
  !b5
  !c6
  db 48
  !cs6
  db 24
  !d6
  db 18
  !g5
  db 30
  !rest
  db 12
  !a5
  !b5
  db 16
  !a5
  db 20
  !rest
  db 16
  !fs5
  db 20
  !rest
  db 16
  !d5
  db 8
  !rest
  db 16
  !e5
  db 8
  !rest
  db 16
  !a4
  db 8
  !rest
  !cs5
  db 4
  !rest
  db 8
  !cs5
  db 16
  !rest
  db 84
  !d5
  db 12
  !fs4
  !loop : dw .sub5137 : db 1
  db 30,$7C
  !a5
  db 6
  !rest
  db 20
  !d6
  db 16
  !rest
  db 24
  !cs6
  db 16
  !a5
  db 8
  !rest
  db 16
  !fs5
  db 8
  !rest
  !a5
  db 4
  !rest
  db 8
  !a5
  db 16
  !rest
  db 84
  !b5
  db 12
  !fs4
  !loop : dw .sub5137 : db 1
  db 16,$7C
  !as5
  db 20
  !rest
  db 24
  !b5
  db 12
  !rest
  db 24
  !cs6
  db 120
  !fs5
  db 12
  !a4
  !b4
  !d5
  !e5
  !d5
  !loop : dw .sub5137 : db 1
  db 30,$7C
  !a5
  db 6
  !rest
  db 24
  !b5
  db 12
  !rest
  db 24
  !cs6
  db 18
  !d6
  db 6
  !rest
  db 18
  !fs5
  db 6
  !rest
  db 8
  !cs6
  db 4
  !rest
  db 8
  !cs6
  db 16
  !rest
  db 60
  !d6
  db 48
  !cs6
  db 36
  !a5
  !g5
  db 24
  !d6
  !cs6
  db 12
  !fs6
  db 24
  !a5
  !b5
  db 12
  !cs6
  !a5
  !b5
  !a5
  !b5
  !a5
  !fs5
  !d5
  db 60
  !fs5
  db 48
  !rest
  !amplify,0
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48DF : db 0,0
  db 36
  !rest
  !instr,!instr2E
  !volume,255
  !vibrato,22,10,47
  !tremolo,0,8,24
  !amplify,63
  !volume,175
  !pan,10
  !subtranspose,81
  !loop : dw .sub5016 : db 1
  db 24,$7F
  !cs6
  !tremolo,0,0,0
  !amplify,0
  !subtranspose,63
  !instr,!instr30
  !volume,170
  !vibrato,22,10,47
  !pan,11
  db 6,$78
  !b3
  db 6,$79
  !cs4
  db 6,$7A
  !d4
  db 6,$7B
  !fs4
  !b4
  db 6,$7C
  !cs5
  !d5
  !fs5
  db 6,$7D
  !b5
  !cs6
  !d6
  !fs6
  db 6,$7E
  !b6
  !cs7
  !d7
  !fs7
  !instr,!instr2E
  !volume,255
  !vibrato,22,10,47
  !tremolo,0,8,24
  !amplify,63
  !pan,10
  db 96,$7F
  !b6
  !tie
  !tie
  !tie
  !tremolo,0,0,0
  !amplify,0
  !instr,!instr30
  !volume,170
  !vibrato,22,10,47
  !pan,9
  db 12,$7C
  !g5
  !c6
  !e6
  !g6
  !g6
  !e6
  !c6
  !g5
  !subloop,0
  db 12,$7C
  !g6
  !e6
  !c6
  !g5
  !subloop,1
  db 12,$7C
  !ds7
  !b6
  !fs6
  !b6
  !ds6
  !fs6
  db 12,$7B
  !b5
  !ds6
  db 12,$7A
  !ds6
  db 12,$77
  !b5
  db 12,$74
  !fs5
  db 12,$71
  !ds5
  !loop : dw .sub5066 : db 1
  !instr,!instr2A
  !volume,255
  !vibrato,32,10,68
  !amplify,18
  !pan,11
  db 12,$78
  !b4
  db 12,$79
  !cs5
  db 12,$7A
  !d5
  db 12,$7B
  !e5
  !transpose,12
  !loop : dw .sub508A : db 1
  !loop : dw .sub5096 : db 1
  !loop : dw .sub508A : db 1
  !loop : dw .sub50EC : db 1
  !transpose,0
  db 24,$7C
  !fs5
  db 12,$76
  !fs5
  db 24,$7C
  !fs5
  db 12,$76
  !fs5
  db 72,$7C
  !fs5
  db 12
  !b5
  !b5
  !d6
  !e6
  !slideIn,0,10,4
  db 24
  !fs6
  !slideIn,0,0,0
  db 12,$76
  !fs6
  db 36,$7C
  !fs6
  !amplify,0
  !instr,!instr27
  !volume,255
  !endVibrato
  !tremolo,0,16,22
  !amplify,36
  !pan,9
  db 12,$7F
  !d5
  !b4
  db 12,$7E
  !fs4
  !fs5
  !e5
  !b4
  db 12,$7D
  !cs5
  !d5
  !b4
  !a4
  !end

.pattern0_7
  !subtranspose,63
.pattern1_7:
  !subloop,0
  db 96,$7F
  !rest
  !subloop,11
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !pan,7
  db 96,$7F
  !fs4
  db 48
  !g4
  db 96
  !fs4
  db 48
  !tie
  db 72
  !d4
  !e4
  db 96
  !fs4
  !tie
  db 48
  !tie
  !g4
  db 96
  !fs4
  db 48
  !tie
  db 72
  !d4
  !e4
  db 96
  !fs4
  db 48
  !tie
  db 96
  !fs4
  !tie
  !tie
  !tie
  !subloop,0
  db 96,$7F
  !e4
  !f4
  db 96
  !fs4
  !tie
  !tie
  !tie
  !tie
  !tie
  !subloop,2
  db 96,$7F
  !e4
  !f4
  db 96
  !fs4
  !tie
  !loop : dw .sub519D : db 2
  !instr,!instr32
  !volume,165
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48EB : db 3,0
  !subloop,0
  !loop : dw .sub51B1 : db 4
  db 12,$7F
  !g4
  !rest
  !g4
  !rest
  !subloop,1
  !loop : dw .sub51B1 : db 4
  !subloop,0
  db 12,$7F
  !fs4
  db 24
  !rest
  !subloop,3
  db 12,$7F
  !e4
  db 24
  !rest
  db 12
  !e4
  db 24
  !rest
  db 12
  !fs4
  db 24
  !rest
  db 12
  !fs4
  db 24
  !rest
  !subloop,0
  db 12,$7F
  !fs4
  db 24
  !rest
  !subloop,3
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48DF : db 0,0
  db 36,$7F
  !rest
  !instr,!instr2C
  !volume,230
  !endVibrato
  !tremolo,0,16,22
  !volume,160
  !pan,10
  !loop : dw .sub4FC4 : db 1
  !loop : dw .sub4FE5 : db 1
  !loop : dw .sub4FC4 : db 1
  !loop : dw .sub4FFA : db 1
  !tremolo,0,0,0
  !instr,!instr2D
  !volume,255
  !vibrato,22,11,63
  !amplify,47
  !pan,11
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48DF : db 3,0
  db 12,$7C
  !d4
  !fs4
  !amplify,0
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48DF : db 0,0
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !pan,7
  !loop : dw .sub51B7 : db 1
  !loop : dw .sub51BF : db 1
  db 96,$7F
  !d4
  !tie
  db 96
  !fs4
  db 48
  !tie
  !e4
  !loop : dw .sub51B7 : db 1
  !loop : dw .sub51B7 : db 1
  !loop : dw .sub51BF : db 1
  db 96,$7F
  !g4
  !tie
  db 96
  !fs4
  db 48
  !tie
  !e4
  db 96
  !d4
  !e4
  db 96
  !fs4
  db 48
  !tie
  !adsrGain,$7F,$F2
  !tie
  !instr,!instr33
  !volume,175
  !vibrato,10,8,42
  !pan,10
  !remoteCode : dw .remoteCode48DC : db -1,0
  !remoteCode : dw .remoteCode48EB : db 3,0
  db 72
  !d4
  db 120
  !e4
  db 72
  !cs4
  db 120
  !d4
  db 72
  !e4
  db 120
  !fs4
  db 36
  !d4
  !a4
  db 120
  !fs4
  db 84
  !g4
  db 108
  !a4
  db 96
  !fs4
  !tie
  db 96
  !g4
  !tie
  db 24
  !fs4
  db 12
  !rest
  db 24,$7D
  !fs4
  db 12
  !rest
  db 24,$7B
  !fs4
  db 12
  !rest
  db 24,$07
  !fs4
  db 12
  !rest
  db 24,$75
  !fs4
  db 12
  !rest
  db 12,$72
  !fs4
  !remoteCode : dw .remoteCode48DC : db 0,0
  !remoteCode : dw .remoteCode48EB : db 0,0
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !pan,7
  !loop : dw .sub519D : db 2
  db 24,$7F
  !gs4
  db 12,$79
  !gs4
  db 24,$7F
  !gs4
  db 12,$79
  !gs4
  db 120,$7F
  !gs4
  db 96
  !b4
  !adsrGain,$7F,$F1
  !tie
  !end

.sub48EF
  db 12,$7F
  !c4
  !instr,!instr22
  !volume,204
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr22
  !volume,204
  !pan,9
  !amplify,0
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
  db 24
  !c4
  !end

.sub4924
  db 12,$7F
  !c4
  db 24
  !c4
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

.sub493A
  db 36,$7F
  !c4
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !end

.sub4950
  db 12,$7F
  !c4
  db 24
  !c4
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
  db 36
  !c4
  db 12
  !c4
  !end

.sub496A
  db 12,$7F
  !c4
  !instr,!instr22
  !volume,204
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4990
  db 12,$7F
  !c4
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
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !end

.sub49AD
  db 24,$7F
  !c4
  db 12
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub49C1
  db 24,$7F
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !end

.sub49D8
  db 12,$7F
  !c4
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub49EE
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4A12
  db 12,$7F
  !c4
  !instr,!instr22
  !volume,204
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !end

.sub4A3B
  db 12,$7F
  !c4
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

.sub4A4F
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 24
  !c4
  db 12
  !c4
  !end

.sub4A6C
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !end

.sub4A81
  db 12,$7F
  !c4
  !instr,!instr22
  !volume,204
  !pan,9
  !amplify,0
  !c5
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !end

.sub4AA0
  db 36,$7F
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

.sub4AB2
  db 12,$7F
  !c4
  !instr,!instr22
  !volume,204
  !pan,9
  !amplify,0
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !end

.sub4D47
  db 12,$7F
  !b4
  !b4
  db 24
  !b4
  !b5
  db 12
  !b4
  db 24
  !cs5
  db 12
  !cs5
  db 24
  !cs6
  db 12
  !a4
  !a4
  db 24
  !a4
  !a5
  db 12
  !a4
  !a4
  !b4
  !fs5
  !b5
  !fs5
  !g4
  !g4
  db 24
  !g4
  !g5
  db 12
  !g4
  !end

.sub4D6B
  db 12,$7F
  !as4
  !fs5
  !as5
  !fs5
  !end

.sub4D72
  !subloop,0
  db 12,$7F
  !b4
  db 24
  !b5
  !subloop,2
  db 12,$7F
  !b4
  !b5
  !e5
  db 24
  !b4
  !b5
  !subloop,0
  db 12,$7F
  !a4
  db 24
  !a5
  !subloop,2
  db 12,$7F
  !a4
  !a5
  !d5
  db 24
  !a4
  db 12
  !a5
  !a5
  !end

.sub4D97
  db 24,$7F
  !g4
  !g5
  !g4
  db 12
  !g5
  !g5
  !end

.sub4DA0
  db 24,$7F
  !as4
  db 12
  !as5
  !as5
  !end

.sub4DA7
  db 12,$7F
  !b4
  !b4
  !b5
  !b4
  !end

.sub4DAE
  !transpose,0
  db 12,$7F
  !a4
  !a4
  db 8
  !a5
  db 4
  !rest
  db 8
  !a5
  db 4
  !rest
  db 8
  !e5
  db 4
  !rest
  db 8
  !e5
  db 4
  !rest
  db 8
  !a4
  db 4
  !rest
  db 8
  !a4
  db 4
  !rest
  !end

.sub4DCE
  db 24,$7F
  !e4
  db 12,$07
  !e4
  db 24,$7F
  !e4
  db 12,$07
  !e4
  db 24,$7F
  !e5
  db 12,$07
  !e5
  db 24,$7F
  !e4
  db 12,$07
  !e4
  !end

.sub4DE7
  db 72,$7F
  !b4
  !a4
  !fs4
  !a4
  !g4
  !gs4
  !end

.sub4DF0
  db 24,$7F
  !g4
  db 12
  !g5
  db 24
  !g4
  db 12
  !g4
  db 24
  !g5
  !end

.sub4DFC
  db 24,$7F
  !a4
  db 12
  !a5
  db 24
  !a4
  db 12
  !a4
  !a5
  !a4
  !end

.sub4E08
  db 24,$7F
  !b4
  db 12
  !b5
  db 24
  !b4
  db 12
  !b4
  db 24
  !b5
  !b4
  db 12
  !b5
  !b4
  !end

.sub4E18
  db 12,$7F
  !g4
  !g4
  !g5
  !g4
  !end

.sub4E1F
  db 12,$7F
  !a4
  !a4
  !a5
  !a4
  !end

.sub4E26
  db 12,$7D
  !b3
  !d4
  !fs4
  !b4
  !d5
  !fs5
  !b3
  !d4
  !g4
  !b4
  !d5
  !g5
  !a3
  !cs4
  !e4
  !a4
  !cs5
  !e5
  !a3
  !cs4
  !fs4
  !a4
  !cs5
  !fs5
  !g3
  !b3
  !d4
  !g4
  !b4
  !d5
  !end

.sub4E47
  db 12,$7D
  !g3
  !b3
  !e4
  !g4
  !b4
  !e5
  !fs3
  !as3
  !cs4
  !fs4
  !as4
  !cs5
  !fs5
  !cs5
  !as4
  !cs4
  !as3
  !fs3
  !end

.sub4E5C
  db 3,$7F
  !cs5
  db 9
  !d5
  db 12
  !rest
  !d5
  !rest
  !fs4
  !rest
  !cs5
  !rest
  !cs5
  !rest
  db 24
  !e4
  !b4
  !rest
  db 12
  !d5
  !rest
  !d5
  !rest
  !e4
  !rest
  !cs5
  !rest
  !cs5
  !rest
  db 48
  !d4
  db 24
  !rest
  db 12
  !b3
  !g3
  !b3
  !d4
  !b3
  !d4
  !gs4
  !end

.sub4E87
  db 24,$7F
  !b5
  !pitchSlide,0,10 : !d6
  db 12
  !tie
  db 36
  !fs5
  !cs6
  !e5
  db 24
  !b5
  !rest
  !b5
  !pitchSlide,0,10 : !d6
  db 12
  !tie
  db 36
  !e5
  !cs6
  db 60
  !d5
  db 24
  !rest
  !gs4
  !pitchSlide,0,10 : !b4
  db 12
  !tie
  db 36
  !d5
  !gs5
  !end

.sub4EB0
  db 36,$7F
  !b5
  db 24
  !e6
  !ds6
  !pitchSlide,0,10 : !fs6
  db 12
  !tie
  db 36
  !cs6
  db 24
  !b5
  db 96
  !as5
  db 24
  !rest
  !end

.sub4EC5
  db 36,$7F
  !f5
  db 24
  !d5
  db 12
  !cs5
  !d5
  !cs5
  !b4
  !cs5
  !d5
  !e5
  !end

.sub4ED3
  db 12,$7F
  !b4
  !fs4
  !cs5
  !a4
  !d5
  !b4
  !e5
  db 48
  !fs5
  !end

.sub4EDF
  db 12,$79
  !fs5
  !slideIn,0,10,4
  db 24,$7F
  !b5
  !slideIn,0,0,0
  db 12,$79
  !b5
  db 60,$7F
  !b5
  db 12
  !a5
  !b5
  db 12,$79
  !b5
  !slideIn,0,10,4
  db 84,$7F
  !fs5
  !slideIn,0,0,0
  db 24,$79
  !fs5
  db 12,$7F
  !e5
  !b4
  !fs5
  db 60
  !b4
  db 12
  !e5
  !fs5
  db 12,$79
  !fs5
  db 60,$7F
  !b4
  !slideIn,0,10,4
  db 48
  !b4
  !slideIn,0,0,0
  db 12
  !b4
  !end

.sub4F24
  db 12,$7F
  !cs5
  db 12,$79
  !cs5
  !slideIn,0,10,4
  db 84,$7F
  !cs5
  !slideIn,0,0,0
  db 24,$79
  !cs5
  !end

.sub4F39
  !slideIn,0,10,4
  db 24,$7F
  !b5
  !slideIn,0,0,0
  db 12
  !fs5
  !cs6
  !fs5
  !d6
  !b5
  !fs5
  db 24
  !cs6
  db 12
  !b5
  !a5
  !fs5
  !b5
  !a5
  !fs5
  !slideIn,0,10,4
  db 24
  !cs6
  !slideIn,0,0,0
  db 12
  !d6
  db 24
  !e6
  db 12
  !fs6
  !d6
  !b5
  !e6
  !cs6
  !a5
  !cs6
  !d6
  !cs6
  !a5
  !fs5
  !b5
  !e5
  !fs5
  !a5
  !slideIn,0,10,4
  db 24
  !d6
  !slideIn,0,0,0
  db 12
  !fs5
  !cs6
  !e5
  !b5
  !d5
  !a5
  !cs5
  !d5
  !e5
  !b4
  !cs5
  !d5
  !end

.sub4F8A
  db 12,$7F
  !a4
  !b4
  db 84
  !cs5
  db 24,$79
  !cs5
  !end

.sub4F94
  db 12,$7F
  !e4
  !g4
  !b4
  !e5
  !g5
  !b5
  !e4
  !g4
  !c5
  !e5
  !g5
  !c6
  !d4
  !fs4
  !a4
  !d5
  !fs5
  !a5
  !d4
  !fs4
  !b4
  !d5
  !fs5
  !b5
  !c4
  !e4
  !g4
  !c5
  !e5
  !g5
  !cs4
  !fs4
  !as4
  !cs5
  !e5
  !as5
  !ds4
  !fs4
  !b4
  !ds5
  !fs5
  !b5
  !ds6
  !fs6
  !b5
  !end

.sub4FC4
  db 12,$3B
  !b3
  !d4
  !fs4
  !b4
  !d5
  !fs5
  !b3
  !d4
  !g4
  !b4
  !d5
  !g5
  !a3
  !cs4
  !e4
  !a4
  !cs5
  !e5
  !a3
  !cs4
  !fs4
  !a4
  !cs5
  !fs5
  !g3
  !b3
  !d4
  !g4
  !b4
  !d5
  !end

.sub4FE5
  db 12,$3B
  !g3
  !b3
  !e4
  !g4
  !b4
  !e5
  !fs3
  !as3
  !cs4
  !fs4
  !as4
  !cs5
  !fs5
  !cs5
  !as4
  !cs4
  !as3
  !fs3
  !end

.sub4FFA
  db 12,$3B
  !gs3
  !cs4
  !f4
  !gs4
  !b4
  !f5
  !as3
  !cs4
  !fs4
  !as4
  !cs5
  !fs5
  !as5
  !end

.sub500A
  db 12,$7F
  !cs5
  db 60
  !d5
  db 12
  !rest
  db 2
  !cs6
  db 22
  !d6
  !end

.sub5016
  db 36,$7F
  !cs5
  !b4
  !d5
  !cs5
  db 24
  !d5
  !e5
  db 36
  !a4
  !e4
  !d4
  db 12
  !cs4
  !d4
  db 60
  !a4
  db 36
  !cs5
  db 24
  !b4
  db 12
  !e5
  db 36
  !a5
  db 24
  !fs5
  !cs6
  !b5
  db 12
  !a5
  db 36
  !e6
  !end

.sub4AE1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !end

.sub4AF8
  db 12,$7F
  !c5
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  !c4
  !amplify,0
  !instr,!instr22
  !volume,204
  !pan,9
  !subloop,0
  db 12,$7F
  !c5
  !subloop,7
  !instr,!instr23
  !volume,206
  !pan,11
  db 12,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !subloop,0
  db 12,$7F
  !c5
  !subloop,5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !c5
  !c5
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !end

.sub4B53
  db 12,$7F
  !c5
  !c5
  !instr,!instr24
  !volume,208
  !pan,10
  db 24
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !end

.sub4B66
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,204
  !pan,9
  db 12
  !c5
  !c5
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !end

.sub4B91
  !instr,!instr24
  !volume,208
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !end

.sub4BB0
  !instr,!instr24
  !volume,208
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !c5
  !c5
  !end

.sub4BC3
  db 12,$7F
  !c5
  !c5
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !end

.sub4BD0
  !instr,!instr24
  !volume,208
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !end

.sub4BEF
  !instr,!instr21
  !volume,255
  !pan,10
  !pan,13
  db 12,$7F
  !d6
  !pan,11
  !b5
  !pan,9
  !gs5
  !pan,7
  !f5
  !end

.sub4C04
  !instr,!instr21
  !volume,255
  !pan,10
  !pan,13
  db 8,$7F
  !d6
  !d6
  !d6
  !pan,12
  db 12
  !d6
  !d6
  !pan,11
  !b5
  !b5
  !pan,10
  !gs5
  !pan,9
  !gs5
  !pan,8
  !f5
  !pan,7
  !d5
  !end

.sub4C27
  !instr,!instr24
  !volume,208
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !c5
  !end

.sub4C39
  !instr,!instr21
  !volume,255
  !pan,10
  !pan,13
  db 8,$7F
  !d6
  !d6
  !d6
  !pan,12
  db 12
  !b5
  !pan,11
  !b5
  !pan,10
  !gs5
  !pan,9
  !gs5
  !pan,8
  !f5
  !pan,7
  !d5
  !end

.sub4C5A
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,204
  !pan,9
  !subloop,0
  db 12,$7F
  !c5
  !subloop,9
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr22
  !volume,204
  !pan,9
  !subloop,0
  db 12,$7F
  !c5
  !subloop,7
  !instr,!instr23
  !volume,206
  !pan,11
  db 12,$7F
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !subloop,0
  db 12,$7F
  !c5
  !subloop,5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr22
  !volume,204
  !pan,9
  !subloop,0
  db 12,$7F
  !c5
  !subloop,4
  !end

.sub4CC9
  db 12,$7F
  !c5
  !c5
  !instr,!instr24
  !volume,208
  !pan,10
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !end

.sub4CDC
  db 12,$7F
  !c5
  !c5
  !instr,!instr24
  !volume,208
  !pan,10
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !end

.sub4CF5
  db 12,$7F
  !c5
  !c5
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !end

.sub4D34
  db 12,$7F
  !c5
  !c5
  !instr,!instr23
  !volume,206
  !pan,11
  !c5
  !instr,!instr22
  !volume,204
  !pan,9
  !c5
  !end

.sub5141
  db 96,$7F
  !d5
  !cs5
  !b4
  !cs5
  !b4
  !cs5
  !d5
  !end

.sub514B
  db 12,$7F
  !e5
  db 24
  !rest
  !end

.sub5151
  db 72,$7F
  !b4
  db 24
  !b5
  db 36
  !a5
  !d6
  db 24
  !cs6
  !a5
  !fs5
  db 12
  !a5
  db 24
  !a5
  db 96
  !b5
  !tie
  !tie
  db 12
  !tie
  !end

.sub5168
  db 72,$7F
  !b4
  db 24
  !b5
  db 36
  !a5
  !b5
  db 24
  !cs6
  !d6
  !fs5
  db 12
  !cs6
  db 24
  !cs6
  !end

.sub5179
  db 96,$7F
  !b4
  !cs5
  db 96
  !d5
  !tie
  !e5
  !cs5
  !end

.sub5183
  db 96,$7F
  !b4
  !a4
  !g4
  !a4
  !g4
  !a4
  !b4
  !end

.sub518D
  db 12,$7F
  !b4
  db 24
  !rest
  !end

.sub5193
  db 96,$7F
  !g4
  !a4
  db 96
  !b4
  !tie
  !tie
  !as4
  !end

.sub5039
  db 12,$7C
  !b4
  !rest
  !b4
  !rest
  !d4
  !rest
  !a4
  !rest
  !a4
  !rest
  db 24
  !b3
  !fs4
  !rest
  db 12
  !b4
  !rest
  !b4
  !rest
  !cs4
  !rest
  !a4
  !rest
  !a4
  !rest
  db 48
  !a3
  db 60
  !rest
  !volume,170
  !pan,11
  db 12,$7F
  !b3
  !g3
  !b3
  !d4
  !b3
  !d4
  !gs4
  !end

.sub5066
  !instr,!instr2A
  !volume,255
  !vibrato,32,10,68
  !amplify,18
  !pan,9
  db 12,$7C
  !fs5
  db 12,$7D
  !e5
  db 12,$7E
  !d5
  db 12,$7F
  !cs5
  !subloop,0
  db 96,$7F
  !rest
  !subloop,14
  db 48,$7F
  !rest
  !end

.sub508A
  db 12,$7C
  !fs4
  !cs4
  !a4
  !e4
  !b4
  !fs4
  !cs5
  db 48
  !d5
  !end

.sub5096
  db 12,$76
  !d5
  !slideIn,0,10,4
  db 24,$7C
  !fs5
  !slideIn,0,0,0
  db 12,$76
  !fs5
  db 60,$7C
  !fs5
  db 12
  !fs5
  !fs5
  db 12,$76
  !fs5
  !slideIn,0,10,4
  db 84,$7C
  !d5
  !slideIn,0,0,0
  db 24,$76
  !d5
  db 12,$7C
  !cs5
  !fs4
  !d5
  db 60
  !fs4
  db 12
  !cs5
  !d5
  db 12,$76
  !d5
  db 60,$7C
  !fs4
  !slideIn,0,10,4
  db 48
  !fs4
  !slideIn,0,0,0
  db 12
  !fs4
  !fs4
  !fs4
  !slideIn,0,10,4
  db 60
  !a4
  !slideIn,0,0,0
  db 12
  !fs5
  !e5
  !d5
  !cs5
  !end

.sub50EC
  !slideIn,0,10,4
  db 24,$7C
  !fs5
  !slideIn,0,0,0
  db 12
  !d5
  !a5
  !d5
  !b5
  !fs5
  !d5
  db 24
  !a5
  db 12
  !fs5
  !fs5
  !d5
  !fs5
  !fs5
  !d5
  !slideIn,0,10,4
  db 24
  !a5
  !slideIn,0,0,0
  db 12
  !b5
  db 24
  !cs6
  db 12
  !d6
  !b5
  !fs5
  !cs6
  !a5
  !fs5
  !a5
  !b5
  !a5
  !fs5
  !d5
  !fs5
  !cs5
  !d5
  !fs5
  !b5
  !a5
  !d5
  !a5
  !cs5
  !fs5
  !b4
  !fs5
  !a4
  !b4
  !cs5
  !fs4
  !a4
  !b4
  !fs4
  !fs4
  !a4
  !end

.sub5137
  db 12,$7C
  !a4
  db 60
  !b4
  db 12
  !rest
  db 24
  !b5
  !end

.sub519D
  db 96,$7F
  !fs4
  !e4
  !d4
  !fs4
  !e4
  !fs4
  !g4
  !e4
  !fs4
  !e4
  !d4
  db 96
  !e4
  !tie
  !fs4
  !g4
  !a4
  !end

.sub51B1
  db 12,$7F
  !g4
  db 24
  !rest
  !end

.sub51B7
  db 96,$7F
  !d4
  !e4
  db 96
  !fs4
  !tie
  !end

.sub51BF
  db 96,$7F
  !g4
  !e4
  db 96
  !fs4
  !tie
  !end

.remoteCode48DC
  !restoreInstrument
  !end

.remoteCode48E3
  !adsrGain,$7F,$F4
  !end

.remoteCode48E7
  !adsrGain,$7F,$F6
  !end

.remoteCode48DF
  !adsrGain,$7F,$F7
  !end

.remoteCode48EB
  !adsrGain,$7F,$F5
  !end

assert pc() <= $10000-(5*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
