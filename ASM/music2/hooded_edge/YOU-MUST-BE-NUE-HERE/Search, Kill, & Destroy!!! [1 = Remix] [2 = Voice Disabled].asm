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

!sample00 = $16
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

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample1D,$9F,$F5,$B8,$15,$00
  db !sample1E,$CF,$FA,$B8,$13,$00
  db !sample1F,$FF,$F2,$B8,$08,$A0
  db !sample20,$FF,$FB,$B8,$0B,$00
  db !sample20,$FF,$F4,$B8,$0A,$00
  db !sample21,$9F,$F2,$B8,$0A,$00
  db !sample21,$9F,$F3,$B8,$0A,$00
  db !sample14,$9F,$CF,$B8,$04,$00
  db !sample18,$FE,$EA,$B8,$04,$02
  db !sample15,$AF,$AF,$B8,$03,$00
  db !sample16,$8F,$2C,$B8,$05,$52
  db !sample17,$FC,$AA,$B8,$03,$CE
  db !sample18,$FE,$EA,$B8,$04,$02
  db !sample15,$AF,$EF,$B8,$03,$00
  db !sample19,$FF,$E0,$B8,$04,$01
  db !sample00,$FF,$ED,$B8,$06,$00
  db !sample1A,$FA,$E0,$B8,$01,$E8
  db !sample1B,$AF,$F2,$B8,$01,$74
  db !sample0C,$9E,$C7,$B8,$03,$00
  db !sample1C,$FF,$EC,$B8,$05,$C0
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample00,Sample00+36
  dw Sample0C,Sample0C+36
  dw Sample14,Sample14+585
  dw Sample15,Sample15+63
  dw Sample16,Sample16+9
  dw Sample17,Sample17+1683
  dw Sample18,Sample18+9
  dw Sample19,Sample19+27
  dw Sample1A,Sample1A+9
  dw Sample1B,Sample1B+1134
  dw Sample1C,Sample1C+1845
  dw Sample1D,Sample1D+909
  dw Sample1E,Sample1E+1584
  dw Sample1F,Sample1F+1809
  dw Sample20,Sample20+234
  dw Sample21,Sample21+909
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample00: incbin "00 SMW @0.brr":2..0
  Sample0C: incbin "0C SMW @13.brr":2..0
  Sample14: incbin "MM Piano Elec Piano 1.brr":2..0
  Sample15: incbin "08 SMW @6C.brr":2..0
  Sample16: incbin "S3 Bell.brr":2..0
  Sample17: incbin "S2 Synth Brass.brr":2..0
  Sample18: incbin "Chrono Pulse-Width Mod.brr":2..0
  Sample19: incbin "MM7 Pulse 50%.brr":2..0
  Sample1A: incbin "Wind String Ens.brr":2..0
  Sample1B: incbin "MM Piano Synth EP 2.brr":2..0
  Sample1C: incbin "S3 Slap Bass II.brr":2..0
  Sample1D: incbin "Yasui Snare.brr":2..0
  Sample1E: incbin "DR-880 Kick.brr":2..0
  Sample1F: incbin "R-8 Tom 2.brr":2..0
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
  !echo,%11100000,50,-51
  !echoParameters,5,160,0
  !setDPMiscCommand,!noteEndInTicks,1
  !musicVolume,100
  !subtranspose,0
  !endVibrato
  !amplify,63
  !tempo,69
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$77
  !c4
  db 24,$7B
  !c4
  !loop : dw .sub44BE : db 1
.pattern1_0:
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4523 : db 1
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4542 : db 1
  !subloop,0
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4566 : db 1
  !subloop,1
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
  !c4
  !c4
  !loop : dw .sub4579 : db 1
  db 24,$7F
  !c4
  db 12
  !c4
  !instr,!instr21
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !amplify,63
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !loop : dw .sub4594 : db 1
  !subloop,0
  !loop : dw .sub45AF : db 1
  !loop : dw .sub4594 : db 1
  !subloop,1
  !loop : dw .sub45AF : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12,$7F
  !c4
  !c4
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !subloop,0
  !loop : dw .sub45AF : db 1
  !loop : dw .sub4594 : db 1
  !subloop,2
  !loop : dw .sub45AF : db 1
  db 24,$7F
  !c4
  !loop : dw .sub4579 : db 1
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4566 : db 1
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
  !c4
  !c4
  !loop : dw .sub4542 : db 1
  db 12,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
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
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4542 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  db 12
  !c4
  !c4
  !loop : dw .sub45BC : db 1
  !loop : dw .sub4523 : db 1
  !loop : dw .sub4555 : db 6
  !loop : dw .sub45DA : db 1
  !subloop,0
  !loop : dw .sub4555 : db 7
  !loop : dw .sub45DA : db 1
  !subloop,1
  !loop : dw .sub4555 : db 3
  !loop : dw .sub45DA : db 1
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
  !c4
  db 72
  !rest
  db 6
  !c4
  !c4
  !c4
  !c4
  !subloop,0
  !loop : dw .sub45ED : db 1
  db 48,$7F
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
  !loop : dw .sub45ED : db 1
  db 36,$7F
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
  db 24
  !c4
  !subloop,1
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4523 : db 1
  db 12,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !loop : dw .sub4602 : db 2
  db 12,$7F
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !loop : dw .sub4602 : db 2
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4566 : db 1
  !loop : dw .sub4579 : db 1
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4566 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4566 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4566 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4566 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
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
  !loop : dw .sub4542 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  db 12
  !c4
  !c4
  !loop : dw .sub45BC : db 1
  db 24,$7F
  !c4
  !rest
  !instr,!instr21
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !amplify,63
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4617 : db 1
  db 24,$7F
  !c4
  db 48
  !rest
  !loop : dw .sub4617 : db 1
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !c5
  !amplify,63
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4668 : db 1
  !loop : dw .sub46AF : db 1
  !loop : dw .sub4668 : db 1
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub45DA : db 1
  !tempo,72
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !amplify,63
  !loop : dw .sub46BE : db 1
  !loop : dw .sub46E9 : db 1
  !subloop,0
  db 24,$7F
  !c4
  !rest
  !loop : dw .sub46BE : db 1
  !loop : dw .sub46E9 : db 1
  !subloop,1
  db 24,$7F
  !c4
  !rest
  !loop : dw .sub46BE : db 1
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
  db 6
  !c4
  !c4
  !c4
  !c4
  !tempo,71
  !loop : dw .sub44BE : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4566 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4555 : db 1
  db 12,$7F
  !c4
  !c4
  db 72
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4566 : db 1
  !subloop,0
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4542 : db 1
  !subloop,2
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 12
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4566 : db 1
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  db 12,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  db 12
  !c4
  !c4
  !loop : dw .sub4579 : db 1
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,6
  !loop : dw .sub4566 : db 1
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4566 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  !loop : dw .sub4702 : db 1
  db 24,$7F
  !c4
  !loop : dw .sub4702 : db 1
  db 12,$7F
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
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !c4
  db 12
  !c4
  !c4
  !loop : dw .sub45BC : db 1
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !c5
  !amplify,63
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4668 : db 1
  db 72,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !c4
  db 48
  !rest
  !loop : dw .sub4668 : db 1
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub45DA : db 1
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !amplify,63
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
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
  db 72
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !subloop,0
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
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
  db 48
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
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
  db 24
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
  !subloop,2
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
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
  db 6
  !c4
  !c4
  db 12
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4566 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4566 : db 1
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4566 : db 1
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
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4566 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4523 : db 1
  !subloop,0
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !subloop,2
  !loop : dw .sub4566 : db 1
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4542 : db 1
  !loop : dw .sub4555 : db 1
  !loop : dw .sub4566 : db 1
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
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
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
  !c4
  db 6
  !c4
  !c4
  !c4
  !c4
  !tempo,71
  !loop : dw .sub44BE : db 1
  !end

.pattern0_1
  !subtranspose,0
  !endVibrato
  !amplify,63
  db 12,$7F
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$79
  !c4
  db 12,$7D
  !c4
  !amplify,0
  !instr,!instr31
  !volume,215
  !subtranspose,63
  !loop : dw .sub48EE : db 1
.pattern1_1:
  !subloop,0
  !loop : dw .sub4901 : db 2
  !transpose,1
  !loop : dw .sub4901 : db 2
  !transpose,2
  !loop : dw .sub4901 : db 2
  !transpose,1
  !loop : dw .sub4901 : db 2
  !transpose,0
  !subloop,1
  !loop : dw .sub4908 : db 1
  db 24,$7F
  !ds5
  !ds5
  !ds5
  !loop : dw .sub4908 : db 1
  db 12,$7F
  !d6
  !d6
  !a5
  !a5
  !d5
  !d5
  !subloop,0
  !loop : dw .sub4901 : db 2
  !transpose,1
  !loop : dw .sub4901 : db 2
  !transpose,2
  !loop : dw .sub4901 : db 2
  !transpose,3
  !loop : dw .sub4901 : db 2
  !transpose,0
  !loop : dw .sub4901 : db 2
  !transpose,3
  !loop : dw .sub4901 : db 2
  !transpose,2
  !loop : dw .sub4901 : db 2
  !transpose,1
  !loop : dw .sub4901 : db 2
  !transpose,0
  !subloop,1
  !subloop,0
  !loop : dw .sub4901 : db 2
  !transpose,1
  !loop : dw .sub4901 : db 2
  !transpose,2
  !loop : dw .sub4901 : db 2
  !transpose,1
  !loop : dw .sub4901 : db 2
  !transpose,0
  !subloop,2
  !loop : dw .sub4901 : db 2
  !transpose,1
  !loop : dw .sub4901 : db 2
  !transpose,2
  !loop : dw .sub4901 : db 2
  !transpose,0
  db 96,$7F
  !rest
  !loop : dw .sub493D : db 1
  db 96,$7F
  !a4
  !loop : dw .sub493D : db 1
  db 24,$7F
  !a4
  db 12
  !d6
  !d6
  !as5
  !as5
  !d5
  !d5
  !loop : dw .sub4901 : db 2
  !transpose,1
  !loop : dw .sub4901 : db 2
  !transpose,2
  !loop : dw .sub4901 : db 2
  !transpose,3
  !loop : dw .sub4901 : db 2
  !transpose,0
  !loop : dw .sub4901 : db 2
  !transpose,3
  !loop : dw .sub4901 : db 2
  !transpose,2
  !loop : dw .sub4901 : db 2
  !transpose,1
  !loop : dw .sub4901 : db 2
  !transpose,0
  !loop : dw .sub4901 : db 2
  !transpose,1
  !loop : dw .sub4901 : db 2
  !transpose,2
  !loop : dw .sub4901 : db 2
  !transpose,3
  !loop : dw .sub4901 : db 2
  !transpose,0
  !loop : dw .sub4901 : db 2
  !transpose,3
  !loop : dw .sub4901 : db 2
  !transpose,2
  !loop : dw .sub4901 : db 2
  !transpose,0
  db 12,$7F
  !ds5
  !ds5
  !ds6
  !ds6
  !as5
  !as5
  !ds5
  !ds5
  !loop : dw .sub495F : db 1
  db 48,$7F
  !c5
  db 24
  !c5
  !c6
  !c5
  db 48
  !c5
  db 72
  !d5
  db 24
  !d5
  !d6
  db 48
  !d5
  !d5
  !d5
  db 24
  !d5
  !c5
  db 48
  !c5
  db 24
  !c5
  !loop : dw .sub495F : db 1
  db 24,$7F
  !c5
  !c5
  !c6
  !g5
  db 48
  !f5
  db 24
  !e5
  db 72
  !d5
  db 96
  !d5
  db 24
  !d5
  db 72
  !d5
  db 24
  !d5
  !cs5
  db 48
  !cs5
  db 24
  !cs5
  !loop : dw .sub4969 : db 1
  db 48,$7F
  !a4
  db 24
  !a4
  !loop : dw .sub4969 : db 1
  db 24,$7F
  !a4
  !a4
  !a4
  !loop : dw .sub498D : db 2
  !transpose,254
  !loop : dw .sub498D : db 2
  !transpose,253
  !loop : dw .sub498D : db 2
  !transpose,252
  !loop : dw .sub498D : db 1
  !transpose,0
  !loop : dw .sub4994 : db 1
  !transpose,0
  !loop : dw .sub498D : db 2
  !transpose,254
  !loop : dw .sub498D : db 2
  !transpose,253
  !loop : dw .sub498D : db 2
  !transpose,252
  !loop : dw .sub498D : db 1
  !transpose,0
  !loop : dw .sub4994 : db 1
  !transpose,253
  !loop : dw .sub48EE : db 1
  !transpose,0
  !transpose,253
  !loop : dw .sub4901 : db 2
  !transpose,254
  !loop : dw .sub4901 : db 2
  !transpose,255
  !loop : dw .sub4901 : db 2
  !transpose,254
  !loop : dw .sub4901 : db 2
  !transpose,253
  !loop : dw .sub4901 : db 2
  !transpose,254
  !loop : dw .sub4901 : db 2
  !transpose,255
  !loop : dw .sub4901 : db 2
  db 96,$7F
  !rest
  !transpose,0
  !loop : dw .sub499B : db 2
  !transpose,1
  !loop : dw .sub499B : db 2
  !transpose,2
  !loop : dw .sub499B : db 2
  !transpose,3
  !loop : dw .sub499B : db 2
  !transpose,0
  !loop : dw .sub499B : db 2
  !transpose,3
  !loop : dw .sub499B : db 2
  !transpose,2
  !loop : dw .sub499B : db 2
  !transpose,1
  !loop : dw .sub499B : db 2
  !transpose,0
  !loop : dw .sub499B : db 2
  !transpose,1
  !loop : dw .sub499B : db 2
  !transpose,2
  !loop : dw .sub499B : db 2
  !transpose,3
  !loop : dw .sub499B : db 2
  !transpose,0
  !loop : dw .sub499B : db 2
  !transpose,3
  !loop : dw .sub499B : db 2
  !transpose,2
  !loop : dw .sub499B : db 2
  !transpose,0
  db 24,$7F
  !c5
  db 12
  !b5
  !b5
  !fs5
  !fs5
  !b4
  !b4
  !subloop,0
  !transpose,253
  !loop : dw .sub4901 : db 2
  !transpose,254
  !loop : dw .sub4901 : db 2
  !transpose,255
  !loop : dw .sub4901 : db 2
  !transpose,0
  !loop : dw .sub4901 : db 2
  !transpose,253
  !loop : dw .sub4901 : db 2
  !transpose,0
  !loop : dw .sub4901 : db 2
  !transpose,255
  !loop : dw .sub4901 : db 2
  !transpose,254
  !loop : dw .sub4901 : db 2
  !subloop,1
  !transpose,0
  !loop : dw .sub498D : db 2
  !transpose,254
  !loop : dw .sub498D : db 2
  !transpose,253
  !loop : dw .sub498D : db 2
  !transpose,252
  !loop : dw .sub498D : db 1
  !transpose,0
  !loop : dw .sub4994 : db 1
  !loop : dw .sub498D : db 2
  !transpose,254
  !loop : dw .sub498D : db 2
  !transpose,253
  !loop : dw .sub498D : db 2
  !transpose,252
  !loop : dw .sub498D : db 1
  !transpose,0
  !loop : dw .sub4994 : db 1
  !loop : dw .sub498D : db 2
  !transpose,254
  !loop : dw .sub498D : db 2
  !transpose,253
  !loop : dw .sub498D : db 2
  !transpose,252
  !loop : dw .sub498D : db 1
  !transpose,0
  !loop : dw .sub4994 : db 1
  !loop : dw .sub498D : db 2
  !transpose,254
  !loop : dw .sub498D : db 2
  !transpose,253
  !loop : dw .sub498D : db 2
  !transpose,252
  !loop : dw .sub498D : db 1
  !transpose,0
  db 24,$7F
  !a4
  db 12
  !d6
  !d6
  !a5
  !a5
  !d5
  !d5
  !subloop,0
  !loop : dw .sub49A2 : db 4
  !transpose,254
  !loop : dw .sub49A2 : db 4
  !transpose,253
  !loop : dw .sub49A2 : db 4
  !transpose,252
  !loop : dw .sub49A2 : db 2
  !transpose,254
  !loop : dw .sub49A2 : db 2
  !transpose,0
  !subloop,3
  !loop : dw .sub48EE : db 1
  !end

.pattern0_2
  !subtranspose,0
  !endVibrato
  !amplify,63
  !instr,!instr1E
  !volume,255
  !pan,10
  db 18,$7F
  !rest
  db 24,$7A
  !c4
  db 6,$7E
  !c4
  !toggleEcho
  !amplify,0
  !instr,!instr25
  !volume,255
  !vibrato,24,12,47
  !subtranspose,63
  !subloop,0
  !loop : dw .sub4717 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4725 : db 1
  !loop : dw .sub471E : db 1
  !subloop,1
.pattern1_2:
  !subloop,0
  !loop : dw .sub4717 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4725 : db 1
  !loop : dw .sub471E : db 1
  !subloop,1
  !loop : dw .sub49A9 : db 4
  !subloop,0
  !loop : dw .sub4717 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4725 : db 1
  !loop : dw .sub471E : db 1
  !subloop,2
  !loop : dw .sub4717 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4725 : db 1
  !loop : dw .sub49BC : db 1
  !instr,!instr26
  !volume,245
  !vibrato,24,12,47
  !pan,9
  db 24,$7F
  !d5
  db 6,$79
  !g4
  !a4
  !b4
  !c5
  !loop : dw .sub49D2 : db 1
  db 96,$7F
  !a5
  db 24
  !d5
  db 24,$79
  !a5
  !loop : dw .sub49D2 : db 1
  db 72,$7F
  !a5
  !instr,!instr27
  !volume,255
  !vibrato,24,12,47
  !amplify,47
  !pan,10
  db 6
  !g5
  !a5
  !b5
  !c6
  !loop : dw .sub49A9 : db 2
  !amplify,0
  !instr,!instr28
  !volume,230
  !vibrato,24,10,50
  !pan,10
  db 96,$7D
  !as5
  !tie
  db 96,$7E
  !c6
  db 64
  !tie
  db 8,$7F
  !d6
  !e6
  db 16
  !f6
  !loop : dw .sub4A1E : db 1
  db 24,$7F
  !f6
  !e6
  db 72
  !g6
  !a6
  db 24
  !e6
  !f6
  db 33
  !d6
  db 38
  !c6
  db 89
  !a5
  db 16
  !a5
  !b5
  !loop : dw .sub4A44 : db 3
  !loop : dw .sub4A4D : db 1
  !loop : dw .sub4A44 : db 1
  !loop : dw .sub4A62 : db 1
  db 64,$7F
  !d6
  db 16
  !a5
  !b5
  !loop : dw .sub4A44 : db 3
  !loop : dw .sub4A4D : db 1
  !loop : dw .sub4A70 : db 1
  db 24,$7F
  !d5
  !e5
  !fs5
  !b5
  !rest
  !instr,!instr29
  !volume,255
  !vibrato,22,10,47
  !amplify,95
  !remoteCode : dw .remoteCode44B7 : db -1,0
  !remoteCode : dw .remoteCode44BA : db 3,0
  !transpose,253
  !loop : dw .sub4A84 : db 6
  db 24,$7F
  !g5
  !a5
  !d6
  !amplify,0
  !remoteCode : dw .remoteCode44B7 : db 0,0
  !remoteCode : dw .remoteCode44BA : db 0,0
  !instr,!instr25
  !volume,255
  !vibrato,24,12,47
  !loop : dw .sub471E : db 1
  !loop : dw .sub4717 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4725 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4717 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4725 : db 1
  !loop : dw .sub49BC : db 1
  !instr,!instr25
  !volume,255
  !vibrato,24,12,47
  !pan,10
  !transpose,229
  !loop : dw .sub49A9 : db 2
  !transpose,241
  !loop : dw .sub49A9 : db 2
  !transpose,0
  !instr,!instr28
  !volume,230
  !vibrato,24,10,50
  !loop : dw .sub4A44 : db 3
  !loop : dw .sub4A4D : db 1
  !loop : dw .sub4A44 : db 1
  !loop : dw .sub4A62 : db 1
  db 64,$7F
  !d6
  db 16
  !a5
  !b5
  !loop : dw .sub4A44 : db 3
  !loop : dw .sub4A4D : db 1
  !loop : dw .sub4A70 : db 1
  db 24,$7F
  !c6
  !d6
  !e6
  !g6
  !instr,!instr26
  !volume,245
  !vibrato,24,12,47
  !pan,9
  !loop : dw .sub4A8B : db 3
  !loop : dw .sub4A98 : db 1
  !loop : dw .sub4A8B : db 1
  !loop : dw .sub4AB2 : db 1
  db 96,$7F
  !f6
  !loop : dw .sub4A8B : db 3
  !loop : dw .sub4A98 : db 1
  db 72,$7F
  !e6
  db 24,$79
  !e6
  db 36,$7F
  !e6
  !d6
  db 48
  !a6
  db 96
  !e6
  db 48
  !tie
  !d6
  db 24
  !e6
  !f6
  !a6
  !f5
  !g5
  !a5
  !d6
  db 24,$79
  !d6
  !instr,!instr29
  !volume,255
  !vibrato,22,10,47
  !amplify,95
  !pan,10
  !remoteCode : dw .remoteCode44B7 : db -1,0
  !remoteCode : dw .remoteCode44BA : db 3,0
  !loop : dw .sub4A84 : db 6
  db 24,$7F
  !g5
  !a5
  !d6
  !amplify,0
  !remoteCode : dw .remoteCode44B7 : db 0,0
  !remoteCode : dw .remoteCode44BA : db 0,0
  !instr,!instr25
  !volume,255
  !vibrato,24,12,47
  !loop : dw .sub471E : db 1
  !end

.pattern0_3
  !subtranspose,0
  !endVibrato
  !amplify,63
  db 6,$7F
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$78
  !c4
  db 18,$7C
  !c4
  !toggleEcho
  !amplify,0
  !subloop,0
  db 96,$7F
  !rest
  !subloop,6
  !instr,!instr2A
  !volume,205
  !vibrato,24,10,50
  !subtranspose,63
  !transpose,12
  !loop : dw .sub471E : db 1
.pattern1_3:
  !subloop,0
  !loop : dw .sub4717 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4725 : db 1
  !loop : dw .sub471E : db 1
  !subloop,1
  !transpose,0
  db 24,$7F
  !rest
  !instr,!instr2F
  !volume,200
  !vibrato,0,10,28
  !pan,8
  !loop : dw .sub4AC0 : db 1
  db 48,$7F
  !fs5
  !loop : dw .sub4AC0 : db 1
  db 24,$7F
  !fs5
  !loop : dw .sub4AD2 : db 1
  db 24,$7F
  !rest
  !instr,!instr2B
  !volume,255
  !vibrato,24,10,50
  !pan,9
  !subloop,0
  db 24,$7F
  !d6
  !loop : dw .sub4B50 : db 1
  db 24,$7F
  !e6
  !loop : dw .sub4B50 : db 1
  !subloop,1
  db 24,$7F
  !d6
  !loop : dw .sub4B50 : db 1
  db 24,$7F
  !e6
  !g6
  !a6
  !loop : dw .sub4B64 : db 1
  !instr,!instr26
  !volume,245
  !vibrato,24,12,47
  !pan,12
  db 24,$7D
  !f5
  !rest
  !loop : dw .sub4B7A : db 1
  db 24,$7D
  !g5
  db 24,$77
  !a5
  db 24,$7D
  !gs5
  db 24,$77
  !g5
  db 48,$7D
  !f5
  db 96
  !fs5
  db 24
  !f5
  db 24,$77
  !fs5
  !loop : dw .sub4B7A : db 1
  db 24,$7D
  !f6
  db 24,$77
  !a5
  db 24,$7D
  !ds6
  db 24,$77
  !f6
  db 48,$7D
  !cs6
  db 96
  !d6
  !loop : dw .sub4AD2 : db 1
  db 36,$7D
  !rest
  !instr,!instr28
  !volume,230
  !vibrato,24,10,50
  !volume,160
  !pan,10
  !endVibrato
  !loop : dw .sub4A1E : db 1
  db 12,$7D
  !f6
  !instr,!instr28
  !volume,230
  !vibrato,24,10,50
  db 72,$7D
  !e6
  !fs6
  db 24
  !c6
  !d6
  db 33
  !a5
  db 38
  !a5
  db 121
  !fs5
  db 4,$7F
  !rest
  !instr,!instr28
  !volume,230
  !vibrato,24,10,50
  !volume,160
  !pan,10
  !endVibrato
  db 16
  !a5
  !b5
  !loop : dw .sub4A44 : db 3
  !loop : dw .sub4A4D : db 1
  !loop : dw .sub4A44 : db 1
  !loop : dw .sub4A62 : db 1
  db 28,$7F
  !d6
  !instr,!instr2D
  !volume,255
  !vibrato,22,10,47
  !remoteCode : dw .remoteCode44B7 : db -1,0
  !remoteCode : dw .remoteCode44BA : db 3,0
  db 16
  !a5
  !b5
  !loop : dw .sub4BB7 : db 3
  !loop : dw .sub4BC1 : db 1
  db 24,$7F
  !d5
  !e5
  !fs5
  !b5
  db 72
  !rest
  !instr,!instr29
  !volume,255
  !vibrato,22,10,47
  !amplify,95
  !volume,180
  !pan,10
  !endVibrato
  !transpose,253
  !loop : dw .sub4A84 : db 6
  db 24,$7F
  !g5
  !amplify,0
  !remoteCode : dw .remoteCode44B7 : db 0,0
  !remoteCode : dw .remoteCode44BA : db 0,0
  !instr,!instr2A
  !volume,205
  !vibrato,24,10,50
  !pan,10
  !transpose,9
  !loop : dw .sub471E : db 1
  !loop : dw .sub4717 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4725 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4717 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4725 : db 1
  !transpose,253
  !loop : dw .sub4B64 : db 1
  !instr,!instr28
  !volume,230
  !vibrato,24,10,50
  !volume,210
  !pan,10
  !loop : dw .sub49A9 : db 2
  !loop : dw .sub4AD2 : db 1
  !transpose,0
  !instr,!instr28
  !volume,230
  !vibrato,24,10,50
  !volume,160
  !pan,10
  !endVibrato
  !pan,10
  db 12,$7F
  !b4
  db 24
  !fs5
  !loop : dw .sub4A44 : db 1
  !loop : dw .sub4A4D : db 1
  !loop : dw .sub4A44 : db 1
  !loop : dw .sub4A62 : db 1
  db 28,$7F
  !d5
  !instr,!instr2D
  !volume,255
  !vibrato,22,10,47
  !remoteCode : dw .remoteCode44B7 : db -1,0
  !remoteCode : dw .remoteCode44BA : db 3,0
  db 16
  !a5
  !b5
  !loop : dw .sub4BB7 : db 3
  !loop : dw .sub4BC1 : db 1
  db 24,$7F
  !c6
  !d6
  !e6
  !g6
  !remoteCode : dw .remoteCode44B7 : db 0,0
  !remoteCode : dw .remoteCode44BA : db 0,0
  db 18
  !rest
  !instr,!instr26
  !volume,245
  !vibrato,24,12,47
  !volume,160
  !pan,10
  !endVibrato
  db 6
  !g5
  !a5
  !b5
  !c6
  !loop : dw .sub4A8B : db 3
  !loop : dw .sub4A98 : db 1
  !loop : dw .sub4A8B : db 1
  !loop : dw .sub4AB2 : db 1
  db 6,$7F
  !f6
  !instr,!instr26
  !volume,245
  !vibrato,24,12,47
  !pan,11
  db 12,$7B
  !c5
  !d5
  !f5
  !g5
  !loop : dw .sub4BEB : db 1
  db 24,$7B
  !c6
  !loop : dw .sub4BEB : db 1
  db 24,$7B
  !d6
  !loop : dw .sub4BEB : db 1
  db 24,$7B
  !e6
  db 96
  !a5
  !tie
  db 24,$75
  !a5
  db 48,$7B
  !a5
  db 24,$75
  !a5
  db 36,$7B
  !a5
  !g5
  db 24
  !c6
  !loop : dw .sub4BEB : db 1
  db 48,$7B
  !d6
  db 96
  !a5
  db 48
  !tie
  !g5
  db 24
  !a5
  !as5
  !d6
  !d5
  !e5
  !f5
  !a5
  db 72
  !rest
  !instr,!instr29
  !volume,255
  !vibrato,22,10,47
  !amplify,95
  !volume,180
  !pan,10
  !endVibrato
  !remoteCode : dw .remoteCode44B7 : db -1,0
  !remoteCode : dw .remoteCode44BA : db 3,0
  !loop : dw .sub4A84 : db 6
  db 24,$7F
  !g5
  !amplify,0
  !remoteCode : dw .remoteCode44B7 : db 0,0
  !remoteCode : dw .remoteCode44BA : db 0,0
  !instr,!instr2A
  !volume,205
  !vibrato,24,10,50
  !transpose,12
  !loop : dw .sub471E : db 1
  !end

.pattern0_4
  db 48,$7F
  !rest
  !subtranspose,0
  !endVibrato
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub4848 : db 7
  db 24,$7F
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !loop : dw .sub4899 : db 1
  !toggleEcho
  !subtranspose,63
.pattern1_4:
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,13
  !subtranspose,63
  !loop : dw .sub4BF6 : db 2
  db 24,$7F
  !rest
  !instr,!instr2F
  !volume,200
  !vibrato,0,10,28
  !pan,12
  !loop : dw .sub4BFD : db 1
  db 48,$7F
  !ds5
  !loop : dw .sub4BFD : db 1
  db 24,$7F
  !ds5
  !loop : dw .sub4C0F : db 1
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,13
  !loop : dw .sub4BF6 : db 3
  db 96,$7F
  !d5
  !ds5
  !e5
  db 72
  !rest
  !instr,!instr26
  !volume,245
  !vibrato,24,12,47
  !pan,9
  db 6
  !g4
  !a4
  !b4
  !c5
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,13
  !loop : dw .sub4C7B : db 1
  db 72,$7F
  !ds5
  db 24
  !rest
  !loop : dw .sub4C7B : db 1
  db 96,$7F
  !ds5
  !loop : dw .sub4C0F : db 1
  !instr,!instr30
  !volume,200
  !vibrato,0,10,31
  !pan,13
  !loop : dw .sub4C99 : db 1
  db 96,$7F
  !g5
  !loop : dw .sub4C99 : db 1
  db 96,$7F
  !gs5
  !subloop,0
  db 96,$7F
  !fs5
  !tie
  db 96
  !fs5
  !tie
  db 96
  !e5
  !tie
  !d5
  !e5
  !subloop,1
  !subloop,0
  !loop : dw .sub4CA5 : db 8
  db 48,$7F
  !e5
  !e5
  !e5
  !e5
  !d5
  !d5
  !e5
  !e5
  !subloop,1
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
  !volume,170
  !endVibrato
  !transpose,9
  !loop : dw .sub4CA9 : db 1
  !loop : dw .sub4CB0 : db 1
  !loop : dw .sub4CB7 : db 2
  !transpose,253
  !loop : dw .sub4C0F : db 1
  !transpose,0
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,13
  !subloop,0
  db 96,$7F
  !d5
  !tie
  db 96
  !cs5
  !tie
  !tie
  !tie
  !d5
  !e5
  !subloop,3
  !subloop,0
  db 96,$7F
  !f5
  !tie
  db 96
  !e5
  !tie
  !tie
  !tie
  !d5
  !e5
  !subloop,3
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

.pattern0_5
  db 48,$7F
  !rest
  !loop : dw .sub4D08 : db 1
.pattern1_5:
  !amplify,0
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,11
  !subtranspose,63
  !loop : dw .sub4CA9 : db 2
  !loop : dw .sub4CB7 : db 4
  !loop : dw .sub4CA9 : db 3
  !loop : dw .sub4CB0 : db 1
  !loop : dw .sub4D22 : db 1
  db 72,$7F
  !fs4
  db 24
  !rest
  !loop : dw .sub4D22 : db 1
  db 96,$7F
  !fs4
  !loop : dw .sub4CB7 : db 2
  !instr,!instr30
  !volume,200
  !vibrato,0,10,31
  !endVibrato
  !loop : dw .sub4D40 : db 1
  db 96,$7F
  !c5
  !loop : dw .sub4D40 : db 1
  db 96,$7F
  !cs5
  !subloop,0
  db 96,$7F
  !b4
  !tie
  db 96
  !a4
  !tie
  db 96
  !gs4
  !tie
  !g4
  !a4
  !subloop,1
  !subloop,0
  db 48,$7F
  !b4
  !b4
  !b4
  !b4
  !a4
  !a4
  !a4
  !a4
  !gs4
  !gs4
  !gs4
  !gs4
  !g4
  !g4
  !a4
  !a4
  !subloop,1
  !loop : dw .sub4D08 : db 1
  !amplify,0
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,11
  !subtranspose,63
  !transpose,253
  !loop : dw .sub4CC2 : db 1
  !loop : dw .sub4CD3 : db 1
  !subloop,0
  !loop : dw .sub4CC9 : db 1
  db 96,$7F
  !as4
  !subloop,3
  !transpose,0
  !subloop,0
  db 96,$7F
  !fs4
  !tie
  !tie
  !tie
  db 96
  !e4
  !tie
  !g4
  !a4
  !subloop,2
  db 96,$7F
  !fs4
  !tie
  !tie
  !tie
  db 96
  !e4
  !tie
  !g4
  db 96
  !a4
  !tie
  !tie
  !tie
  !tie
  db 96
  !g4
  !tie
  !f4
  !g4
  !subloop,0
  db 96,$7F
  !a4
  !tie
  !tie
  !tie
  db 96
  !g4
  !tie
  !f4
  !g4
  !subloop,2
  !loop : dw .sub4D08 : db 1
  !end

.pattern0_6
  db 48,$7F
  !rest
  !subtranspose,63
  db 28
  !rest
  !instr,!instr25
  !volume,255
  !vibrato,24,12,47
  !volume,170
  !pan,10
  !endVibrato
  !subtranspose,63
  !loop : dw .sub4717 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4725 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4717 : db 1
  !loop : dw .sub471E : db 1
  !loop : dw .sub4725 : db 1
  db 24,$7F
  !ds5
  !g5
  db 20
  !a5
  !toggleEcho
  !subtranspose,0
  !endVibrato
.pattern1_6:
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  db 12,$7F
  !c5
  !c5
  !instr,!instr20
  !volume,255
  !pan,13
  !d6
  db 6
  !d6
  !pan,12
  !tie
  db 12
  !d6
  !pan,11
  !b5
  !pan,9
  !gs5
  !pan,7
  !f5
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4771 : db 1
  !loop : dw .sub4784 : db 1
  !subloop,0
  !loop : dw .sub4797 : db 1
  !loop : dw .sub4771 : db 2
  !loop : dw .sub4784 : db 1
  !loop : dw .sub4771 : db 3
  !loop : dw .sub4784 : db 1
  !subloop,2
  !loop : dw .sub4797 : db 1
  !loop : dw .sub4771 : db 2
  !instr,!instr22
  !volume,196
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !instr,!instr20
  !volume,255
  !pan,13
  !d6
  db 6
  !d6
  !pan,12
  !tie
  db 12
  !d6
  !pan,11
  !b5
  !pan,9
  !gs5
  !pan,7
  !f5
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 3
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub472C : db 2
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !instr,!instr22
  !volume,196
  !pan,10
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !subloop,0
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub4752 : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 1
  !subloop,1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 3
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 3
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  db 96,$7F
  !rest
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,196
  !pan,10
  !loop : dw .sub47B6 : db 5
  !loop : dw .sub47C7 : db 1
  !loop : dw .sub47B6 : db 7
  !loop : dw .sub47C7 : db 1
  !loop : dw .sub47B6 : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !subloop,0
  !loop : dw .sub4771 : db 1
  !loop : dw .sub4797 : db 1
  !subloop,5
  !loop : dw .sub4771 : db 1
  !loop : dw .sub47DE : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 3
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub472C : db 2
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 2
  !subloop,0
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub4752 : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 1
  !subloop,1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 96,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  db 24
  !c5
  !rest
  !c5
  !rest
  !subloop,0
  !loop : dw .sub47FD : db 1
  db 24,$7F
  !rest
  !loop : dw .sub4819 : db 4
  !subloop,2
  !loop : dw .sub47FD : db 1
  db 24,$7F
  !c5
  !loop : dw .sub481E : db 1
  !loop : dw .sub4848 : db 1
  !subloop,0
  !loop : dw .sub485B : db 1
  !loop : dw .sub4848 : db 3
  !subloop,2
  !loop : dw .sub485B : db 1
  db 24,$7F
  !c5
  !c5
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub4848 : db 1
  !subloop,0
  !loop : dw .sub487A : db 1
  !loop : dw .sub4848 : db 3
  !subloop,2
  !loop : dw .sub487A : db 1
  !loop : dw .sub4848 : db 1
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub4848 : db 7
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub4899 : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub473F : db 1
  !subloop,0
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !subloop,1
  !loop : dw .sub472C : db 2
  db 96,$7F
  !rest
  !loop : dw .sub48AC : db 1
  !loop : dw .sub472C : db 1
  db 12,$7F
  !c5
  !c5
  !loop : dw .sub4784 : db 2
  !loop : dw .sub48CF : db 1
  !loop : dw .sub4784 : db 5
  !loop : dw .sub4784 : db 2
  !loop : dw .sub48CF : db 1
  !loop : dw .sub4784 : db 2
  !loop : dw .sub48AC : db 1
  !loop : dw .sub472C : db 1
  db 12,$7F
  !c5
  !c5
  !loop : dw .sub4784 : db 2
  !loop : dw .sub48CF : db 1
  !loop : dw .sub4784 : db 5
  !loop : dw .sub4784 : db 2
  !loop : dw .sub48CF : db 1
  !instr,!instr22
  !volume,196
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr20
  !volume,255
  !pan,13
  !d6
  !d6
  !pan,12
  !d6
  !d6
  !pan,11
  !b5
  !pan,9
  !gs5
  !pan,7
  !f5
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 3
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !subloop,0
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub4752 : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 1
  !subloop,1
  !loop : dw .sub481E : db 1
  !subloop,0
  !loop : dw .sub4848 : db 1
  !loop : dw .sub485B : db 1
  !loop : dw .sub4848 : db 2
  !subloop,2
  !loop : dw .sub4848 : db 1
  !loop : dw .sub485B : db 1
  db 24,$7F
  !c5
  !c5
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub4848 : db 1
  !subloop,0
  !loop : dw .sub487A : db 1
  !loop : dw .sub4848 : db 1
  !loop : dw .sub4848 : db 2
  !subloop,2
  !loop : dw .sub487A : db 1
  db 24,$7F
  !c5
  !c5
  !instr,!instr22
  !volume,196
  !pan,10
  !c5
  !instr,!instr20
  !volume,255
  !pan,13
  db 12
  !d6
  db 6
  !d6
  !pan,12
  !tie
  db 12
  !d6
  !pan,11
  !b5
  !pan,9
  !a5
  !pan,7
  !g5
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 3
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub473F : db 1
  !subloop,0
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !subloop,1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  db 12,$7F
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !instr,!instr22
  !volume,196
  !pan,10
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !loop : dw .sub473F : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 2
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 3
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub472C : db 1
  !subloop,0
  !loop : dw .sub472C : db 1
  !loop : dw .sub473F : db 1
  !loop : dw .sub472C : db 1
  !loop : dw .sub4752 : db 1
  !subloop,2
  !loop : dw .sub47DE : db 1
  !instr,!instr21
  !volume,195
  !pan,9
  !loop : dw .sub4848 : db 7
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub4899 : db 1
  !end

.pattern0_7
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !subtranspose,63
.pattern1_7:
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,7
  !loop : dw .sub4CC2 : db 2
  !subloop,0
  !loop : dw .sub4CC9 : db 1
  db 96,$7F
  !as4
  !subloop,3
  !loop : dw .sub4CC2 : db 3
  !loop : dw .sub4CD3 : db 1
  !loop : dw .sub4CDA : db 1
  db 72,$7F
  !as4
  db 24
  !rest
  !loop : dw .sub4CDA : db 1
  db 96,$7F
  !as4
  !subloop,0
  !loop : dw .sub4CC9 : db 1
  db 96,$7F
  !as4
  !subloop,1
  !instr,!instr30
  !volume,200
  !vibrato,0,10,31
  db 96,$7F
  !d5
  !tie
  db 96
  !e5
  !tie
  db 96
  !f5
  !tie
  !f5
  !e5
  db 96
  !d5
  !tie
  db 96
  !e5
  !tie
  db 96
  !fs5
  !tie
  !fs5
  !e5
  !subloop,0
  db 96,$7F
  !d5
  !tie
  db 96
  !cs5
  !tie
  db 96
  !cs5
  !tie
  !b4
  !cs5
  !subloop,1
  !subloop,0
  db 48,$7F
  !d5
  !d5
  !d5
  !d5
  !loop : dw .sub4CF8 : db 8
  db 48,$7F
  !b4
  !b4
  !cs5
  !cs5
  !subloop,1
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
  !volume,170
  !endVibrato
  !transpose,253
  !loop : dw .sub4BF6 : db 1
  !transpose,0
  db 96,$7F
  !b4
  !c5
  !cs5
  !rest
  !transpose,2
  !subloop,0
  !loop : dw .sub4CC9 : db 1
  db 96,$7F
  !as4
  !subloop,2
  !loop : dw .sub4CC9 : db 1
  db 64,$7F
  !as4
  !transpose,0
  !instr,!instr28
  !volume,230
  !vibrato,24,10,50
  !pan,10
  db 16,$7D
  !a5
  db 16,$7E
  !b5
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,7
  !subloop,0
  !loop : dw .sub4CFC : db 1
  db 96,$7F
  !cs5
  !subloop,2
  !loop : dw .sub4CFC : db 1
  db 48,$7F
  !cs5
  !instr,!instr2A
  !volume,205
  !vibrato,24,10,50
  !pan,9
  db 12
  !g5
  !a5
  !c6
  !d6
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,7
  !subloop,0
  db 96,$7F
  !d5
  !tie
  db 96
  !c5
  !tie
  db 96
  !b4
  !tie
  !as4
  !c5
  !subloop,3
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

.sub44BE
  db 72,$7F
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
  db 96
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
  db 48
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
  db 96
  !c4
  db 48
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
  !tempo,71
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
  !c4
  !c4
  !c4
  !c4
  !end

.sub4523
  db 12,$7F
  !c4
  !instr,!instr21
  !volume,195
  !pan,9
  !amplify,0
  !c5
  !amplify,63
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4542
  db 12,$7F
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

.sub4555
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4566
  db 12,$7F
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

.sub4579
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12,$7F
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

.sub4594
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12,$7F
  !c4
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

.sub45AF
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !end

.sub45BC
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 6
  !c4
  !c4
  db 12
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub45DA
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
  !end

.sub45ED
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !c4
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !end

.sub4602
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
  db 48
  !c4
  !end

.sub4617
  db 24,$7F
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
  !rest
  !c4
  db 48
  !rest
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
  !c4
  db 48
  !rest
  db 24
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
  !rest
  !c4
  !c4
  !rest
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
  !end

.sub4668
  db 24,$7F
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
  !rest
  !c4
  db 48
  !rest
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
  !c4
  db 48
  !rest
  db 24
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
  !rest
  !c4
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  !end

.sub46AF
  db 72,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !c4
  db 48
  !rest
  !end

.sub46BE
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48,$7F
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
  db 72
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
  !end

.sub46E9
  !instr,!instr1F
  !volume,225
  !pan,10
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

.sub4702
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
  !c4
  !c4
  !end

.sub48EE
  db 96,$7F
  !d5
  !ds5
  !e5
  !ds5
  !d5
  !ds5
  !e5
  db 24
  !ds5
  db 12
  !d6
  !d6
  !a5
  !a5
  !d5
  !d5
  !end

.sub4901
  db 12,$7F
  !d5
  !d5
  !d6
  !d5
  !end

.sub4908
  !subloop,0
  db 24,$7F
  !d5
  !subloop,3
  !subloop,0
  db 24,$7F
  !ds5
  !subloop,3
  !subloop,0
  db 24,$7F
  !e5
  !subloop,3
  !subloop,0
  db 24,$7F
  !f5
  !subloop,3
  !subloop,0
  db 24,$7F
  !d5
  !subloop,3
  !subloop,0
  db 24,$7F
  !f5
  !subloop,3
  !subloop,0
  db 24,$7F
  !e5
  !subloop,3
  db 24,$7F
  !ds5
  !end

.sub493D
  !subloop,0
  db 48,$7F
  !d5
  db 48,$78
  !d5
  !subloop,2
  db 48,$7F
  !d5
  !a4
  !d5
  db 48,$78
  !d5
  db 48,$7F
  !d5
  !a4
  db 36
  !c5
  db 12,$78
  !c5
  db 36,$7F
  !as4
  db 12,$78
  !as4
  !end

.sub495F
  db 72,$7F
  !as4
  db 24
  !as4
  !as5
  db 48
  !as4
  !c5
  !end

.sub4969
  db 72,$7F
  !b4
  db 24
  !b4
  !fs5
  db 48
  !b4
  db 24
  !b4
  db 48
  !a4
  db 24
  !a4
  !a4
  !fs5
  db 48
  !a4
  db 24
  !a4
  db 72
  !gs4
  db 24
  !gs4
  !e5
  db 48
  !gs4
  db 24
  !gs4
  db 48
  !g4
  db 24
  !g4
  !g4
  !e5
  !end

.sub498D
  db 24,$7F
  !b4
  !b4
  !b5
  !b4
  !end

.sub4994
  db 24,$7F
  !a4
  !a5
  !a4
  !a5
  !end

.sub499B
  db 24,$7F
  !b4
  db 12
  !b4
  !b4
  !end

.sub49A2
  db 24,$7F
  !d5
  db 12
  !d6
  !d6
  !end

.sub4717
  db 24,$7F
  !d5
  !g5
  !a5
  !d6
  !end

.sub471E
  db 24,$7F
  !ds5
  !g5
  !a5
  !d6
  !end

.sub4725
  db 24,$7F
  !e5
  !g5
  !a5
  !d6
  !end

.sub49A9
  db 48,$7F
  !d6
  !a6
  !gs6
  !e6
  !g6
  !f6
  !e6
  !ds6
  !d6
  !a6
  !e6
  !c7
  !b6
  !gs6
  db 96
  !a6
  !end

.sub49BC
  !instr,!instr2C
  !volume,185
  !endVibrato
  !pan,9
  db 12,$7D
  !ds6
  !rest
  db 12,$7E
  !g6
  !rest
  db 12,$7F
  !a6
  !rest
  !d7
  !rest
  !end

.sub49D2
  db 24,$7F
  !a5
  db 24,$79
  !d5
  db 24,$7F
  !gs5
  db 24,$79
  !a5
  db 24,$7F
  !e5
  db 24,$79
  !gs5
  db 24,$7F
  !g5
  db 24,$79
  !e5
  db 24,$7F
  !f5
  db 24,$79
  !g5
  db 24,$7F
  !e5
  db 24,$79
  !f5
  db 24,$7F
  !ds5
  db 24,$79
  !e5
  db 24,$7F
  !d5
  db 24,$79
  !ds5
  db 24,$7F
  !a5
  db 24,$79
  !d5
  db 24,$7F
  !e5
  db 24,$79
  !a5
  db 24,$7F
  !c6
  db 24,$79
  !e5
  db 24,$7F
  !b5
  db 24,$79
  !c6
  db 48,$7F
  !gs5
  !end

.sub4A1E
  db 24,$7F
  !f6
  !d6
  !e6
  !f6
  !d6
  !e6
  !f6
  !d6
  db 48
  !a6
  !c7
  db 24
  !d7
  !a6
  !e7
  !a6
  db 96
  !f7
  db 16
  !f7
  db 24
  !e7
  !d7
  db 32
  !c7
  db 36
  !g6
  db 24
  !c7
  db 20
  !a6
  db 16
  !c7
  db 48
  !g6
  !end

.sub4A44
  db 96,$7F
  !cs6
  db 36
  !cs6
  !b5
  db 24
  !fs6
  !end

.sub4A4D
  db 12,$7F
  !b5
  db 36
  !cs6
  db 24
  !b5
  !cs6
  !d6
  !cs6
  !d6
  db 48
  !cs6
  db 72
  !cs6
  db 36
  !cs6
  !b5
  db 24
  !fs6
  !end

.sub4A62
  db 72,$7F
  !cs6
  db 24
  !fs6
  db 16
  !fs6
  !e6
  db 32
  !cs6
  !b5
  db 96
  !cs6
  !end

.sub4A70
  db 96,$7F
  !cs6
  db 36
  !cs6
  !b5
  db 42
  !fs6
  db 6
  !b5
  db 96
  !cs6
  db 48
  !tie
  !b5
  db 24
  !cs6
  !d6
  !fs6
  !end

.sub4A84
  db 24,$7F
  !g5
  !a5
  !d6
  !rest
  !end

.sub4A8B
  db 72,$7F
  !e6
  db 24,$79
  !e6
  db 36,$7F
  !e6
  !d6
  db 24
  !a6
  !end

.sub4A98
  db 48,$7F
  !e6
  db 24
  !d6
  !e6
  !f6
  !e6
  !f6
  !e6
  db 24,$79
  !f6
  db 48,$7F
  !e6
  db 24,$79
  !e6
  db 36,$7F
  !e6
  !d6
  db 24
  !a6
  !end

.sub4AB2
  db 72,$7F
  !e6
  db 24
  !a6
  db 16
  !a6
  !g6
  db 32
  !e6
  !d6
  db 96
  !e6
  !end

.sub4AC0
  db 48,$7F
  !f5
  !f5
  !fs5
  !fs5
  !gs5
  !gs5
  !a5
  !a5
  !f5
  !f5
  !a5
  !a5
  !gs5
  !gs5
  !fs5
  !end

.sub4AD2
  !instr,!instr2A
  !volume,205
  !vibrato,24,10,50
  !pan,11
  !vibrato,10,10,18
  !subloop,0
  db 36,$7B
  !d6
  db 3,$7B
  !d6
  db 3,$7C
  !e6
  db 3,$7D
  !f6
  db 3,$7E
  !g6
  db 36,$7F
  !a6
  db 12
  !rest
  !subloop,2
  db 24,$7B
  !d6
  db 3,$7B
  !e6
  db 3,$7C
  !f6
  db 3,$7D
  !g6
  db 3,$7E
  !a6
  db 12,$7F
  !b6
  db 48
  !c7
  db 96
  !d7
  db 48,$79
  !d7
  db 24,$7F
  !c7
  db 24,$79
  !c7
  db 24,$7F
  !b6
  db 24,$79
  !b6
  db 48,$7F
  !gs6
  db 84
  !a6
  db 6
  !gs6
  !g6
  db 48
  !f6
  db 48,$79
  !f6
  db 24,$76
  !f6
  db 24,$7F
  !f6
  !g6
  !a6
  db 60
  !as6
  db 36,$79
  !as6
  db 96,$7F
  !ds7
  db 60
  !d7
  db 36,$79
  !d7
  db 96,$7F
  !f7
  !e7
  !ds7
  db 96
  !d7
  !tie
  !tie
  db 72
  !tie
  !adsrGain,$7F,$F4
  db 24
  !tie
  !end

.sub4B50
  db 24,$7F
  !g6
  !a6
  db 24,$79
  !g6
  !pan,11
  db 24,$7F
  !ds6
  !g6
  !a6
  db 24,$79
  !g6
  !pan,9
  !end

.sub4B64
  !instr,!instr2C
  !volume,185
  !endVibrato
  !pan,12
  db 12,$7B
  !as5
  !rest
  db 12,$7C
  !d6
  !rest
  db 12,$7D
  !e6
  !rest
  !a6
  !rest
  !end

.sub4B7A
  db 24,$7D
  !d6
  db 24,$77
  !f5
  db 24,$7D
  !cs6
  db 24,$77
  !d6
  db 24,$7D
  !a5
  db 24,$77
  !cs6
  db 24,$7D
  !c6
  db 24,$77
  !a5
  db 24,$7D
  !as5
  db 24,$77
  !c6
  db 24,$7D
  !a5
  db 24,$77
  !as5
  db 24,$7D
  !g5
  db 24,$77
  !a5
  db 24,$7D
  !f5
  db 24,$77
  !g5
  db 24,$7D
  !d6
  db 24,$77
  !f5
  db 24,$7D
  !a5
  db 24,$77
  !d6
  !end

.sub4BB7
  db 48,$7F
  !cs6
  !rest
  db 36
  !cs6
  !b5
  db 24
  !fs6
  !end

.sub4BC1
  db 12,$7F
  !b5
  db 36
  !cs6
  db 24
  !b5
  !cs6
  !d6
  !cs6
  !d6
  !cs6
  !rest
  db 48
  !cs6
  db 24
  !rest
  db 36
  !cs6
  !b5
  db 24
  !fs6
  db 48
  !cs6
  !rest
  db 36
  !cs6
  !b5
  db 42
  !fs6
  db 6
  !b5
  db 96
  !cs6
  db 48
  !tie
  !b5
  db 24
  !cs6
  !d6
  !fs6
  !end

.sub4BEB
  db 72,$7B
  !a5
  db 24,$75
  !a5
  db 36,$7B
  !a5
  !g5
  !end

.sub4848
  db 24,$7F
  !c5
  !c5
  !instr,!instr22
  !volume,196
  !pan,10
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !end

.sub4899
  !instr,!instr20
  !volume,255
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

.sub4BF6
  db 96,$7F
  !d5
  !ds5
  !e5
  !ds5
  !end

.sub4BFD
  db 48,$7F
  !d5
  !d5
  !ds5
  !ds5
  !e5
  !e5
  !f5
  !f5
  !d5
  !d5
  !f5
  !f5
  !e5
  !e5
  !ds5
  !end

.sub4C0F
  !instr,!instr2A
  !volume,205
  !vibrato,24,10,50
  !pan,8
  !vibrato,10,10,18
  !subloop,0
  db 36,$79
  !a5
  db 3
  !a5
  db 3,$7A
  !b5
  db 3,$7B
  !c6
  db 3,$7C
  !d6
  db 36,$7D
  !e6
  db 12
  !rest
  !subloop,2
  db 36,$79
  !a5
  db 3
  !c6
  db 3,$7A
  !d6
  db 3,$7B
  !e6
  db 3,$7C
  !f6
  db 48,$7D
  !g6
  db 96
  !a6
  db 48,$77
  !a6
  db 24,$7D
  !g6
  db 24,$77
  !g6
  db 24,$7D
  !fs6
  db 24,$77
  !fs6
  db 48,$7D
  !ds6
  db 96
  !f6
  db 48
  !c6
  db 48,$77
  !c6
  db 24,$74
  !c6
  db 24,$7D
  !c6
  !d6
  !e6
  db 60
  !f6
  db 36,$77
  !f6
  db 96,$7D
  !as6
  db 60
  !a6
  db 36,$77
  !a6
  db 96,$7D
  !a6
  !gs6
  !g6
  !end

.sub4C7B
  db 72,$7F
  !d5
  db 24
  !rest
  db 72
  !ds5
  db 24
  !rest
  db 72
  !e5
  db 24
  !rest
  db 72
  !f5
  db 24
  !rest
  db 72
  !d5
  db 24
  !rest
  db 72
  !f5
  db 24
  !rest
  db 72
  !e5
  db 24
  !rest
  !end

.sub4C99
  db 96,$7F
  !f5
  !tie
  db 96
  !g5
  !tie
  db 96
  !a5
  !tie
  !a5
  !end

.sub4CA5
  db 48,$7F
  !fs5
  !end

.sub4CA9
  db 96,$7F
  !f4
  !g4
  !gs4
  !g4
  !end

.sub4CB0
  db 96,$7F
  !f4
  !g4
  !gs4
  !rest
  !end

.sub4CB7
  db 96,$7F
  !f4
  !fs4
  !gs4
  !a4
  !f4
  !a4
  !gs4
  !fs4
  !end

.sub4D08
  !subtranspose,0
  !endVibrato
  !instr,!instr23
  !volume,255
  !pan,10
  !amplify,223
  db 96,$7F
  !cs5
  !tie
  db 96
  !rest
  !tie
  db 96
  !cs5
  !tie
  db 96
  !cs5
  !tie
  !end

.sub4D22
  db 72,$7F
  !f4
  db 24
  !rest
  db 72
  !fs4
  db 24
  !rest
  db 72
  !gs4
  db 24
  !rest
  db 72
  !a4
  db 24
  !rest
  db 72
  !f4
  db 24
  !rest
  db 72
  !a4
  db 24
  !rest
  db 72
  !gs4
  db 24
  !rest
  !end

.sub4D40
  db 96,$7F
  !as4
  !tie
  db 96
  !c5
  !tie
  db 96
  !d5
  !tie
  !d5
  !end

.sub4CC2
  db 96,$7F
  !a4
  !as4
  !b4
  !as4
  !end

.sub4CD3
  db 96,$7F
  !a4
  !as4
  !b4
  !rest
  !end

.sub4CC9
  db 96,$7F
  !a4
  !as4
  !b4
  !c5
  !a4
  !c5
  !b4
  !end

.sub472C
  db 12,$7F
  !c5
  !c5
  !instr,!instr22
  !volume,196
  !pan,10
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !end

.sub473F
  db 12,$7F
  !c5
  !c5
  !instr,!instr22
  !volume,196
  !pan,10
  db 24
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub4752
  db 12,$7F
  !c5
  !c5
  !instr,!instr22
  !volume,196
  !pan,10
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub4771
  !instr,!instr22
  !volume,196
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  db 12
  !c5
  !c5
  !end

.sub4784
  !instr,!instr22
  !volume,196
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !c5
  !c5
  !end

.sub4797
  !instr,!instr22
  !volume,196
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  db 12
  !c4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !end

.sub47B6
  !instr,!instr22
  !volume,196
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !end

.sub47C7
  !instr,!instr22
  !volume,196
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !end

.sub47DE
  !instr,!instr20
  !volume,255
  !pan,13
  db 12,$7F
  !d6
  !pan,12
  !d6
  !pan,11
  !b5
  !pan,10
  !b5
  !pan,9
  !gs5
  !pan,8
  !gs5
  !pan,7
  !f5
  !pan,6
  !f5
  !end

.sub47FD
  db 24,$7F
  !c5
  !rest
  !c5
  !rest
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !end

.sub4819
  db 24,$7F
  !c5
  !rest
  !end

.sub481E
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 72,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,195
  !pan,9
  db 24
  !c5
  !instr,!instr22
  !volume,196
  !pan,10
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !end

.sub485B
  db 24,$7F
  !c5
  !c5
  !instr,!instr22
  !volume,196
  !pan,10
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !instr,!instr21
  !volume,195
  !pan,9
  !end

.sub487A
  db 24,$7F
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !instr,!instr22
  !volume,196
  !pan,10
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !end

.sub48AC
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,196
  !pan,10
  db 12
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !end

.sub48CF
  !instr,!instr22
  !volume,196
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,195
  !pan,9
  !c5
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !end

.sub4CDA
  db 72,$7F
  !a4
  db 24
  !rest
  db 72
  !as4
  db 24
  !rest
  db 72
  !b4
  db 24
  !rest
  db 72
  !c5
  db 24
  !rest
  db 72
  !a4
  db 24
  !rest
  db 72
  !c5
  db 24
  !rest
  db 72
  !b4
  db 24
  !rest
  !end

.sub4CF8
  db 48,$7F
  !cs5
  !end

.sub4CFC
  db 96,$7F
  !b4
  !tie
  db 96
  !a4
  !tie
  db 96
  !gs4
  !tie
  !b4
  !end

.remoteCode44B7
  !restoreInstrument
  !end

.remoteCode44BA
  !adsrGain,$7F,$F8
  !end

assert pc() <= $10000-(5*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
