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
!instr35 = $2D
!instr36 = $2E
!instr37 = $2F

!sample00 = $16
!sample08 = $17
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
!sample25 = $29

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample20,$9F,$F4,$B8,$15,$00
  db !sample21,$CF,$F9,$B8,$13,$00
  db !sample22,$FF,$F5,$B8,$08,$00
  db !sample23,$FF,$FA,$B8,$0A,$00
  db !sample23,$FF,$F9,$B8,$0A,$A0
  db !sample23,$FF,$F5,$B8,$09,$A0
  db !sample23,$FF,$F5,$B8,$0C,$40
  db !sample24,$9F,$F3,$B8,$0A,$00
  db !sample24,$9F,$F2,$B8,$0A,$00
  db !sample00,$00,$00,$7F,$06,$00
  db !sample25,$00,$00,$7F,$03,$20
  db !sample14,$9F,$CE,$B8,$03,$FC
  db !sample15,$FF,$EC,$B8,$03,$C0
  db !sample16,$AF,$AA,$B8,$03,$00
  db !sample08,$AF,$AA,$B8,$03,$00
  db !sample17,$8F,$AA,$B8,$04,$00
  db !sample18,$8F,$8A,$B8,$04,$02
  db !sample19,$BF,$B0,$B8,$03,$00
  db !sample1A,$AF,$AC,$B8,$03,$01
  db !sample1E,$EF,$AF,$B8,$06,$FC
  db !sample1B,$FF,$E0,$B8,$04,$00
  db !sample1C,$FA,$E0,$B8,$03,$00
  db !sample1D,$FE,$E0,$B8,$04,$02
  db !sample1E,$9F,$D0,$B8,$06,$FC
  db !sample1E,$FF,$EA,$B8,$06,$FC
  db !sample1F,$BF,$AC,$B8,$05,$C0
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample00,Sample00+36
  dw Sample08,Sample08+36
  dw Sample14,Sample14+846
  dw Sample15,Sample15+441
  dw Sample16,Sample16+1683
  dw Sample17,Sample17+288
  dw Sample18,Sample18+27
  dw Sample19,Sample19+279
  dw Sample1A,Sample1A+54
  dw Sample1B,Sample1B+27
  dw Sample1C,Sample1C+513
  dw Sample1D,Sample1D+9
  dw Sample1E,Sample1E+2088
  dw Sample1F,Sample1F+1845
  dw Sample20,Sample20+909
  dw Sample21,Sample21+2034
  dw Sample22,Sample22+684
  dw Sample23,Sample23+234
  dw Sample24,Sample24+909
  dw Sample25,Sample25+54
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample00: incbin "00 SMW @0.brr":2..0
  Sample08: incbin "08 SMW @6.brr":2..0
  Sample14: incbin "SOM Elec Piano.brr":2..0
  Sample15: incbin "PM Overdrive.brr":2..0
  Sample16: incbin "DKNI4 Synth Brass.brr":2..0
  Sample17: incbin "SOI HardSync 1 Alt (Small).brr":2..0
  Sample18: incbin "MM7 Sawtooth.brr":2..0
  Sample19: incbin "SOI Spicy Guitar.brr":2..0
  Sample1A: incbin "Aquarius Lead.brr":2..0
  Sample1B: incbin "KMT Square 50%.brr":2..0
  Sample1C: incbin "MMX1 String Ens.brr":2..0
  Sample1D: incbin "CRONO Pulse-Width Mod.brr":2..0
  Sample1E: incbin "VCR7 Nylon Guitar (Low).brr":2..0
  Sample1F: incbin "S3 Slap Bass II.brr":2..0
  Sample20: incbin "Yasui Snare.brr":2..0
  Sample21: incbin "DR-660 Kick.brr":2..0
  Sample22: incbin "S-550 LA Tom.brr":2..0
  Sample23: incbin "TR-909 Hi-Hat.brr":2..0
  Sample24: incbin "R-8 Crash Cym.brr":2..0
  Sample25: incbin "MMX1 Technology Noise.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2A50

Tracker2A50:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%10111100,55,-56
  !echoParameters,5,186,0
  ;!addmusicFA,127,1 amk109hotpatch
  !musicVolume,125
  !tempo,72
  !subtranspose,0
  !endVibrato
  !amplify,66
  db 48,$7F
  !rest
  !instr,!instr1F
  !volume,225
  !pan,10
  !subloop,0
  db 24,$7F
  !c4
  db 96
  !rest
  db 72
  !tie
  !subloop,2
  db 24,$7F
  !c4
  db 96
  !rest
  db 48
  !tie
  db 24
  !c4
  db 72
  !rest
  !loop : dw .sub42EB : db 1
  db 72,$7F
  !rest
  db 24
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
  db 48
  !rest
  db 24
  !c4
  !loop : dw .sub42EB : db 1
  db 24,$7F
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
  db 12
  !c4
  !c4
  !loop : dw .sub4300 : db 1
.pattern1_0:
  !subloop,0
  !loop : dw .sub4315 : db 1
  !loop : dw .sub4347 : db 2
  !loop : dw .sub436A : db 1
  !loop : dw .sub4376 : db 1
  !loop : dw .sub4315 : db 1
  !loop : dw .sub4347 : db 2
  !loop : dw .sub436A : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
  !c4
  !c4
  !loop : dw .sub4300 : db 1
  !subloop,1
  !loop : dw .sub4386 : db 2
  !loop : dw .sub4399 : db 1
  !loop : dw .sub4386 : db 2
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
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
  !c4
  db 12
  !c4
  !c4
  !loop : dw .sub43BC : db 1
  !loop : dw .sub4386 : db 1
  !loop : dw .sub4399 : db 1
  !loop : dw .sub4386 : db 2
  !instr,!instr1F
  !volume,225
  !pan,10
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
  db 12
  !c4
  !c4
  !c4
  !c4
  !loop : dw .sub43BC : db 1
  !loop : dw .sub43DD : db 1
  !loop : dw .sub4386 : db 1
  !loop : dw .sub43DD : db 1
  !loop : dw .sub43BC : db 1
  !loop : dw .sub43DD : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
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
  db 12
  !c4
  !instr,!instr21
  !volume,185
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  db 24
  !c4
  !loop : dw .sub43BC : db 1
  !loop : dw .sub43DD : db 1
  !loop : dw .sub4386 : db 1
  !loop : dw .sub43DD : db 1
  !loop : dw .sub43BC : db 1
  !loop : dw .sub43DD : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
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
  !c4
  db 96
  !rest
  !instr,!instr1F
  !volume,225
  !pan,10
  !subloop,0
  db 24,$7F
  !c4
  db 96
  !rest
  db 72
  !tie
  !subloop,2
  !subloop,0
  db 24,$7F
  !c4
  db 72
  !rest
  !subloop,7
  db 24,$7F
  !c4
  !rest
  !c4
  !rest
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
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !instr,!instr21
  !volume,185
  !pan,9
  !amplify,0
  !c5
  !amplify,66
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
  !loop : dw .sub43F0 : db 1
  !loop : dw .sub4413 : db 1
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !rest
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !loop : dw .sub43F0 : db 2
  !loop : dw .sub4413 : db 1
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
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !loop : dw .sub4300 : db 1
  !loop : dw .sub4315 : db 1
  !loop : dw .sub4347 : db 2
  !loop : dw .sub436A : db 1
  !loop : dw .sub4376 : db 1
  !loop : dw .sub4315 : db 1
  !loop : dw .sub443C : db 1
  !loop : dw .sub43DD : db 1
  !instr,!instr21
  !volume,185
  !pan,9
  !loop : dw .sub444E : db 1
  !loop : dw .sub43DD : db 1
  !instr,!instr21
  !volume,185
  !pan,9
  !loop : dw .sub4475 : db 1
  !loop : dw .sub4300 : db 1
  !loop : dw .sub4315 : db 1
  !loop : dw .sub443C : db 1
  !loop : dw .sub43DD : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  !loop : dw .sub444E : db 1
  !loop : dw .sub43DD : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  !amplify,0
  db 24,$7F
  !c5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  !loop : dw .sub436A : db 1
  !loop : dw .sub4376 : db 1
  !loop : dw .sub4315 : db 1
  !loop : dw .sub443C : db 1
  !loop : dw .sub43DD : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  !loop : dw .sub444E : db 1
  !loop : dw .sub43DD : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  !loop : dw .sub4475 : db 1
  !loop : dw .sub4300 : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,185
  !pan,9
  !amplify,0
  db 12
  !c5
  !c5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  !loop : dw .sub4497 : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !rest
  !subloop,0
  !loop : dw .sub4497 : db 2
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !loop : dw .sub4497 : db 2
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !rest
  !subloop,2
  !loop : dw .sub4497 : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  !loop : dw .sub4300 : db 1
  !end

.pattern0_1
  !subtranspose,79
  db 36,$7F
  !rest
  !instr,!instr29
  !vibrato,36,6,47
  !volume,175
  !endVibrato
  !loop : dw .sub45CD : db 1
  !loop : dw .sub45DE : db 1
  db 12,$7F
  !e5
  !instr,!instr37
  !volume,250
  !pan,10
  !endVibrato
  !amplify,42
  db 96
  !cs5
  db 72
  !tie
  db 24
  !cs5
  db 96
  !b4
  db 48
  !tie
  !b4
  db 96
  !as4
  db 72
  !tie
  db 24
  !as4
  !a4
  db 24,$78
  !a4
  db 24,$7F
  !a4
  db 24,$78
  !a4
  db 24,$7F
  !b4
  db 24,$78
  !b4
  db 12,$7F
  !cs6
  !cs6
  !gs5
  !gs5
  !b4
  !b4
.pattern1_1:
  !loop : dw .sub45EB : db 1
  !loop : dw .sub45F2 : db 1
  !loop : dw .sub45F9 : db 1
  !transpose,252
  !loop : dw .sub45EB : db 1
  !transpose,0
  db 24,$7F
  !b4
  !fs5
  db 12
  !ds5
  !ds5
  db 24
  !b4
  !loop : dw .sub45EB : db 1
  !loop : dw .sub45F2 : db 1
  !loop : dw .sub45F9 : db 1
  !transpose,252
  !loop : dw .sub45EB : db 1
  !transpose,0
  db 12,$7F
  !b4
  !ds5
  !fs5
  !b5
  !cs6
  !a5
  !fs5
  !ds5
  !loop : dw .sub460C : db 1
  !loop : dw .sub4613 : db 1
  !transpose,254
  !loop : dw .sub460C : db 1
  !loop : dw .sub461A : db 1
  !transpose,253
  !loop : dw .sub460C : db 1
  !loop : dw .sub4621 : db 1
  db 24,$7F
  !b5
  db 12
  !fs5
  !ds5
  db 24
  !b4
  !loop : dw .sub460C : db 1
  !loop : dw .sub4613 : db 1
  !transpose,254
  !loop : dw .sub460C : db 1
  !loop : dw .sub461A : db 1
  !transpose,253
  !loop : dw .sub460C : db 1
  !loop : dw .sub4621 : db 1
  db 12,$7F
  !cs6
  !cs6
  !gs5
  !gs5
  !b4
  !b4
  !loop : dw .sub45EB : db 1
  !transpose,2
  !loop : dw .sub45EB : db 1
  !transpose,4
  !loop : dw .sub45EB : db 1
  !loop : dw .sub4632 : db 1
  !loop : dw .sub45EB : db 1
  !transpose,2
  !loop : dw .sub45EB : db 1
  !transpose,4
  !loop : dw .sub45EB : db 1
  !transpose,0
  db 24,$7F
  !gs5
  !f5
  !c6
  !f5
  !loop : dw .sub45EB : db 1
  !transpose,2
  !loop : dw .sub45EB : db 1
  !transpose,4
  !loop : dw .sub45EB : db 1
  !loop : dw .sub4632 : db 1
  db 24,$7F
  !as4
  !as4
  !gs5
  !cs5
  !c5
  !c5
  !as5
  !ds5
  !f5
  !f5
  !b5
  !e5
  !ds5
  db 12
  !f6
  !f6
  !c6
  !c6
  !f5
  !f5
  !loop : dw .sub463C : db 1
  !transpose,2
  !loop : dw .sub4646 : db 1
  !transpose,4
  !loop : dw .sub463C : db 1
  db 12,$7F
  !cs5
  !cs5
  db 24
  !cs5
  !cs6
  !gs5
  !transpose,253
  !loop : dw .sub463C : db 1
  !loop : dw .sub464F : db 1
  db 24,$7F
  !ds5
  !f5
  !loop : dw .sub465A : db 1
  db 12,$7F
  !f5
  db 24
  !f5
  !f6
  db 12
  !f5
  !f5
  db 24
  !f6
  !loop : dw .sub463C : db 1
  !transpose,2
  !loop : dw .sub4646 : db 1
  !transpose,255
  !loop : dw .sub463C : db 1
  !loop : dw .sub464F : db 1
  db 24,$7F
  !as5
  !transpose,253
  !loop : dw .sub463C : db 1
  !transpose,0
  db 12,$7F
  !c5
  !c5
  db 24
  !g5
  db 12
  !c6
  !c6
  db 24
  !ds5
  !loop : dw .sub465A : db 1
  db 12,$7F
  !f5
  db 24
  !f6
  !transpose,0
  db 96
  !rest
  !loop : dw .sub4663 : db 2
  !loop : dw .sub4683 : db 1
  !transpose,3
  !loop : dw .sub4683 : db 1
  !loop : dw .sub4694 : db 1
  db 24,$7F
  !ds5
  !gs5
  db 12
  !gs5
  !gs5
  db 24
  !ds5
  !gs5
  !ds5
  !loop : dw .sub4683 : db 1
  !transpose,3
  !loop : dw .sub4683 : db 1
  !loop : dw .sub4694 : db 1
  db 24,$7F
  !ds6
  !gs5
  db 12
  !gs5
  !gs5
  !b5
  !b5
  !gs5
  !gs5
  !b4
  !b4
  !loop : dw .sub463C : db 1
  !loop : dw .sub4646 : db 1
  !transpose,3
  !loop : dw .sub463C : db 1
  !loop : dw .sub46AC : db 1
  !transpose,253
  !loop : dw .sub463C : db 1
  !loop : dw .sub4646 : db 1
  !transpose,251
  !loop : dw .sub463C : db 1
  !transpose,0
  db 12,$7F
  !b4
  !b4
  db 24
  !b5
  !b4
  !b5
  !loop : dw .sub463C : db 1
  !loop : dw .sub4646 : db 1
  !transpose,3
  !loop : dw .sub463C : db 1
  !loop : dw .sub46AC : db 1
  !transpose,253
  !loop : dw .sub463C : db 1
  !loop : dw .sub4646 : db 1
  !transpose,254
  !loop : dw .sub463C : db 1
  !transpose,0
  db 12,$7F
  !cs5
  !cs5
  !cs6
  !cs6
  !gs5
  !gs5
  !cs5
  !cs5
  !subloop,0
  db 72,$7F
  !a4
  db 24
  !b4
  db 24,$78
  !b4
  db 24,$7F
  !b4
  db 24,$78
  !b4
  db 24,$7F
  !cs5
  db 24,$78
  !cs5
  !transpose,0
  !instr,!instr32
  !volume,140
  !endVibrato
  !pan,10
  !toggleEcho
  !loop : dw .sub46B8 : db 1
  !toggleEcho
  !instr,!instr37
  !volume,250
  !pan,10
  !endVibrato
  !amplify,42
  !subloop,2
  db 72,$7F
  !a4
  db 24
  !b4
  db 24,$78
  !b4
  db 48,$7F
  !cs5
  db 96
  !d5
  db 48
  !tie
  db 12
  !cs6
  !cs6
  !gs5
  !gs5
  !cs5
  !cs5
  !end

.pattern0_2
  !subtranspose,79
  !instr,!instr29
  !vibrato,36,6,47
  !volume,255
  !amplify,47
  !pan,11
  !loop : dw .sub45CD : db 1
  !pan,9
  !loop : dw .sub45DE : db 1
  db 24,$7F
  !e5
  !pan,10
  !fs5
  !pan,11
  db 72
  !gs5
  db 48
  !e6
  !ds6
  db 24
  !cs6
  !pan,9
  db 72
  !b5
  db 48
  !fs6
  !e6
  db 24
  !ds6
  !pan,11
  db 72
  !as5
  db 48
  !gs6
  !fs6
  db 24
  !b6
  !pan,9
  db 48
  !cs7
  db 24
  !gs5
  !e6
  !fs6
  db 12
  !ds6
  !fs5
  !pan,10
  !e5
  !ds5
  !loop : dw .sub46D1 : db 1
.pattern1_2:
  !loop : dw .sub46E7 : db 1
  db 48,$7F
  !f5
  !pitchSlide,0,12 : !gs5
  db 24
  !c5
  !pitchSlide,0,10 : !e5
  !e6
  !e5
  !ds6
  !cs6
  !gs5
  db 48
  !gs5
  !pitchSlide,0,12 : !b5
  db 24
  !ds5
  !pitchSlide,0,10 : !fs5
  !fs6
  !fs5
  !e6
  !fs5
  !cs6
  db 48
  !g5
  !pitchSlide,0,12 : !as5
  db 24
  !e5
  !pitchSlide,0,10 : !fs5
  !gs6
  !fs5
  !fs6
  !fs5
  !b6
  db 48
  !as6
  !pitchSlide,0,12 : !cs7
  db 24
  !gs5
  !e6
  !fs6
  db 12
  !ds6
  !fs5
  !e5
  !ds5
  !e5
  !gs5
  !e5
  !fs5
  !loop : dw .sub46E7 : db 1
  db 48,$7F
  !f5
  !pitchSlide,0,12 : !gs5
  db 24
  !tie
  !c6
  !pitchSlide,0,11 : !ds6
  !e6
  !ds6
  !cs6
  !gs5
  db 48
  !gs5
  !pitchSlide,0,12 : !b5
  db 24
  !tie
  !cs6
  !pitchSlide,0,11 : !e6
  !fs6
  !e6
  !ds6
  !cs6
  db 48
  !g5
  !pitchSlide,0,12 : !as5
  db 24
  !as5
  !ds6
  !pitchSlide,0,11 : !fs6
  !gs6
  !fs6
  !b6
  db 24,$79
  !b6
  db 48,$7F
  !as6
  !pitchSlide,0,13 : !cs7
  !tie
  db 96
  !c7
  !adsrGain,$7F,$F4
  db 24
  !tie
  !instr,!instr2B
  !volume,255
  !vibrato,36,9,56
  !amplify,63
  !remoteCode : dw .remoteCode42DC : db -1,0
  !remoteCode : dw .remoteCode42DF : db 3,0
  db 72
  !gs6
  db 24
  !rest
  !loop : dw .sub4726 : db 1
  !loop : dw .sub473B : db 1
  !loop : dw .sub474A : db 1
  !loop : dw .sub475C : db 1
  db 72,$7F
  !f6
  db 12
  !rest
  !toggleLegato
  db 3
  !a5
  !b5
  !cs6
  !toggleLegato
  !ds6
  db 24
  !f6
  !gs6
  !c7
  !f6
  !ds6
  !g6
  db 12
  !as6
  !as6
  db 24
  !ds6
  db 48
  !f6
  !e6
  !ds6
  db 24
  !f6
  !pitchSlide,0,10 : !gs6
  !g6
  db 72
  !gs6
  db 24
  !rest
  !loop : dw .sub4726 : db 1
  !loop : dw .sub473B : db 1
  !loop : dw .sub474A : db 1
  db 24,$7F
  !as5
  db 48
  !c6
  db 24
  !ds6
  !pitchSlide,0,12 : !gs6
  !gs6
  !g6
  db 72
  !gs6
  db 24
  !rest
  !loop : dw .sub4726 : db 1
  db 72,$7F
  !f6
  db 12
  !rest
  !toggleLegato
  db 3
  !e5
  !fs5
  !gs5
  !toggleLegato
  !as5
  db 24
  !c6
  !gs5
  !c6
  !ds6
  !c6
  !ds6
  db 12
  !g6
  !f6
  db 24
  !ds6
  db 48
  !ds6
  !pitchSlide,0,12 : !f6
  !tie
  !amplify,0
  !remoteCode : dw .remoteCode42DC : db 0,0
  !remoteCode : dw .remoteCode42DF : db 0,0
  !pan,138
  !subtranspose,0
  !endVibrato
  !instr,!instr27
  !volume,220
  !vibrato,0,47,255
  !volume,230
  !dynamicVolume,255,31
  db 96
  !c7
  !pitchSlide,0,79 : !f4
  !dynamicVolume,0,0
  !dynamicPan,0,0
  !instr,!instr21
  !volume,185
  !pan,9
  !endVibrato
  !toggleEcho
  !subloop,0
  !loop : dw .sub456A : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !loop : dw .sub456A : db 1
  db 24,$7C
  !c5
  !subloop,2
  !loop : dw .sub456A : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !loop : dw .sub4598 : db 1
  db 24,$7F
  !c5
  !instr,!instr23
  !volume,185
  !pan,11
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !c5
  !instr,!instr23
  !volume,185
  !pan,11
  !c5
  !toggleEcho
  !instr,!instr2C
  !volume,255
  !vibrato,32,6,47
  !amplify,31
  !pan,11
  !subtranspose,79
  !loop : dw .sub477E : db 1
  db 24,$7F
  !b5
  !cs6
  db 24,$79
  !cs6
  db 24,$7F
  !cs6
  db 24,$79
  !cs6
  db 24,$7F
  !a5
  !pitchSlide,0,12 : !cs6
  !b5
  !gs5
  !subloop,0
  db 24,$7F
  !g5
  db 24,$79
  !g5
  !subloop,3
  db 24,$7F
  !fs5
  db 24,$79
  !fs5
  db 24,$7F
  !fs5
  db 36
  !e5
  db 12,$79
  !e5
  db 24,$7F
  !gs5
  !a5
  !pitchSlide,0,12 : !cs6
  !b5
  !loop : dw .sub477E : db 1
  db 24,$7F
  !e6
  !e6
  !e6
  !b5
  db 24,$79
  !b5
  db 24,$7F
  !gs5
  !pitchSlide,0,12 : !b5
  !cs6
  !e6
  !fs6
  db 24,$79
  !fs6
  db 24,$7F
  !e6
  db 24,$79
  !e6
  db 24,$7F
  !fs6
  db 24,$79
  !fs6
  db 24,$7F
  !e6
  db 24,$79
  !e6
  db 24,$7F
  !cs6
  !pitchSlide,0,12 : !fs6
  db 24,$79
  !fs6
  db 24,$7F
  !fs6
  db 96
  !gs6
  db 24,$79
  !gs6
  !instr,!instr2A
  !volume,255
  !vibrato,36,8,52
  !amplify,47
  !pan,10
  !loop : dw .sub4791 : db 1
  db 48,$7F
  !ds6
  !pitchSlide,0,12 : !gs6
  !loop : dw .sub47A8 : db 1
  db 24,$79
  !fs6
  db 24,$7F
  !e6
  db 24,$79
  !e6
  db 24,$7F
  !fs6
  db 24,$79
  !fs6
  db 24,$7F
  !e6
  !pitchSlide,0,8 : !gs6
  !gs6
  !fs6
  db 48
  !fs6
  !pitchSlide,0,14 : !gs6
  !tie
  db 24,$79
  !gs6
  db 48,$7F
  !gs5
  !pitchSlide,0,12 : !cs6
  !loop : dw .sub47BE : db 1
  db 24,$79
  !b5
  db 24,$7F
  !gs5
  !pitchSlide,0,12 : !cs6
  db 24,$79
  !cs6
  db 24,$7F
  !ds6
  db 24,$79
  !ds6
  db 24,$7F
  !e6
  db 24,$79
  !e6
  db 24,$7F
  !fs6
  db 24,$79
  !fs6
  db 12,$7F
  !gs6
  db 12,$79
  !gs6
  db 24,$7F
  !gs6
  !a6
  !gs6
  db 24,$79
  !gs6
  db 24,$7F
  !ds6
  !pitchSlide,0,12 : !gs6
  !fs6
  !e6
  !loop : dw .sub4791 : db 1
  db 24,$7F
  !fs6
  !pitchSlide,0,12 : !b6
  db 12
  !b6
  db 12,$79
  !b6
  !loop : dw .sub47A8 : db 1
  db 24,$7F
  !e6
  db 24,$79
  !e6
  db 12,$7F
  !e6
  db 12,$79
  !e6
  db 24,$7F
  !fs6
  !e6
  db 12
  !gs6
  db 12,$79
  !gs6
  db 12,$7F
  !gs6
  !gs6
  db 24
  !fs6
  db 48
  !fs6
  !pitchSlide,0,14 : !gs6
  !tie
  db 24,$79
  !gs6
  db 24,$7F
  !gs5
  !pitchSlide,0,12 : !cs6
  !cs6
  !loop : dw .sub47BE : db 1
  db 48,$7F
  !gs5
  !pitchSlide,0,12 : !cs6
  db 24
  !gs5
  !ds6
  !gs5
  !e6
  !gs5
  !fs6
  !gs5
  db 12
  !gs6
  !gs6
  db 12,$79
  !gs6
  db 12,$7F
  !gs6
  db 24
  !a6
  !gs6
  db 24,$79
  !gs6
  db 24,$7F
  !gs5
  !pitchSlide,0,12 : !b5
  db 24,$79
  !b5
  db 48,$7F
  !b5
  !pitchSlide,0,14 : !cs6
  db 96
  !tie
  !tie
  db 72
  !tie
  !adsrGain,$7F,$F1
  db 96
  !tie
  !subtranspose,0
  !endVibrato
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  db 96
  !cs5
  !tie
  !tie
  !tie
  db 96
  !cs5
  !tie
  !tie
  !tie
  db 96
  !cs5
  db 72
  !tie
  db 96
  !cs5
  db 72
  !tie
  !amplify,0
  !subtranspose,79
  !loop : dw .sub46D1 : db 1
  !end

.pattern0_3
  !subtranspose,79
  db 48,$7F
  !rest
  !instr,!instr32
  !volume,140
  !endVibrato
  !pan,10
  !transpose,249
  !loop : dw .sub46B8 : db 1
  db 12,$7B
  !fs5
  !rest
  !transpose,247
  !loop : dw .sub46B8 : db 1
  db 12,$7B
  !gs5
  !rest
  !transpose,246
  !loop : dw .sub46B8 : db 1
  db 12,$7B
  !g5
  !rest
  !transpose,249
  !loop : dw .sub47DA : db 1
  !transpose,0
  !instr,!instr33
  !volume,185
  !endVibrato
  !pan,7
  db 96,$7F
  !e4
  db 72
  !tie
  db 24
  !e4
  db 96
  !ds4
  db 48
  !tie
  !ds4
  db 96
  !ds4
  db 72
  !tie
  db 24
  !ds4
  !cs4
  db 24,$79
  !cs4
  db 24,$7F
  !cs4
  db 24,$79
  !cs4
  db 24,$7F
  !ds4
  db 24,$79
  !ds4
  db 24,$7F
  !ds4
  db 24,$79
  !ds4
  db 24,$7F
  !ds4
.pattern1_3:
  !instr,!instr2F
  !volume,235
  !endVibrato
  !pan,11
  db 24
  !cs4
  !gs4
  !ds5
  !e5
  !ds5
  !gs4
  !e4
  db 48
  !b3
  db 24
  !gs4
  !b4
  !ds5
  !b4
  !fs4
  !ds4
  db 48
  !as3
  db 24
  !fs4
  !as4
  !ds5
  !fs5
  !e5
  !ds5
  db 48
  !a3
  db 24
  !e4
  !a4
  !cs5
  !b3
  !ds4
  db 12
  !gs4
  !b4
  !fs4
  !gs4
  db 24
  !cs3
  !gs3
  !e4
  !fs4
  !gs4
  !e4
  !ds4
  db 48
  !e3
  db 24
  !b3
  !ds4
  !e4
  !b4
  !ds5
  !b4
  db 48
  !fs3
  db 24
  !as3
  !ds4
  !fs4
  !as4
  !ds5
  !as4
  db 48
  !a3
  db 24
  !e4
  !a4
  !cs5
  db 48
  !b3
  db 12
  !gs4
  !b4
  !fs4
  !gs4
  !instr,!instr2A
  !volume,255
  !vibrato,36,8,52
  !amplify,47
  !pan,11
  db 48,$7B
  !cs5
  !pitchSlide,0,12 : !e5
  !a5
  !pitchSlide,0,12 : !cs6
  !b5
  db 24
  !gs5
  db 48
  !ds5
  !pitchSlide,0,12 : !fs5
  db 24
  !tie
  db 48
  !b5
  !pitchSlide,0,12 : !ds6
  !cs6
  db 24
  !b5
  db 48
  !ds5
  !pitchSlide,0,12 : !fs5
  db 24
  !fs5
  db 48
  !c6
  !pitchSlide,0,12 : !e6
  !ds6
  db 24
  !cs6
  db 48
  !gs5
  !pitchSlide,0,12 : !b5
  db 24
  !cs6
  !b5
  !a5
  !fs5
  !ds5
  !fs5
  db 48
  !cs5
  !pitchSlide,0,12 : !e5
  db 24
  !tie
  !gs5
  !pitchSlide,0,11 : !b5
  !cs6
  !b5
  !gs5
  !e5
  db 48
  !ds5
  !pitchSlide,0,12 : !fs5
  db 24
  !tie
  !as5
  !pitchSlide,0,11 : !cs6
  !ds6
  !cs6
  !b5
  !as5
  db 48
  !ds5
  !pitchSlide,0,12 : !fs5
  db 24
  !fs5
  !c6
  !pitchSlide,0,11 : !ds6
  !e6
  !ds6
  !gs6
  db 24,$75
  !gs6
  db 48,$7B
  !f6
  !pitchSlide,0,13 : !gs6
  !tie
  !gs6
  !instr,!instr2B
  !volume,255
  !vibrato,36,9,56
  !amplify,63
  !pan,9
  !remoteCode : dw .remoteCode42DC : db -1,0
  !remoteCode : dw .remoteCode42DF : db 3,0
  db 24,$7F
  !c6
  !f6
  !pitchSlide,0,10 : !gs6
  !g6
  !amplify,0
  !remoteCode : dw .remoteCode42DC : db 0,0
  !remoteCode : dw .remoteCode42DF : db 0,0
  !subtranspose,0
  !endVibrato
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  db 60
  !cs5
  !amplify,0
  !subtranspose,79
  !instr,!instr2B
  !volume,160
  !endVibrato
  !toggleEcho
  db 48
  !gs6
  db 24
  !rest
  !loop : dw .sub4726 : db 1
  !loop : dw .sub473B : db 1
  !loop : dw .sub474A : db 1
  !loop : dw .sub475C : db 1
  db 48,$7F
  !f6
  !toggleEcho
  !volume,255
  !vibrato,36,9,56
  !amplify,63
  !pan,11
  !remoteCode : dw .remoteCode42DC : db -1,0
  !remoteCode : dw .remoteCode42DF : db 3,0
  !toggleLegato
  db 3,$7C
  !cs6
  !ds6
  !f6
  !toggleLegato
  !g6
  db 24
  !gs6
  !c7
  !ds7
  !gs6
  !g6
  !as6
  !cs7
  !g6
  db 96
  !gs6
  db 24
  !rest
  !pan,9
  db 24,$7F
  !c6
  !pan,11
  db 24,$7C
  !d6
  !pitchSlide,0,10 : !f6
  !loop : dw .sub47F3 : db 1
  db 24,$7C
  !c6
  db 72
  !gs5
  db 12
  !rest
  !toggleLegato
  db 3
  !e5
  !fs5
  !gs5
  !toggleLegato
  !as5
  db 24
  !c6
  !f6
  !gs6
  db 48
  !c6
  db 24
  !c6
  !c6
  !c6
  db 48
  !f5
  !pitchSlide,0,12 : !gs5
  db 24
  !g5
  db 48
  !gs5
  db 24
  !c6
  !pitchSlide,0,12 : !f6
  !f6
  !loop : dw .sub47F3 : db 1
  db 24,$7C
  !as5
  db 72
  !c6
  db 12
  !rest
  !toggleLegato
  db 3
  !b4
  !cs5
  !ds5
  !toggleLegato
  !f5
  db 24
  !gs5
  !f5
  !gs5
  !as5
  !g5
  !as5
  !ds6
  !as5
  db 48
  !as5
  !pitchSlide,0,12 : !c6
  !tie
  !amplify,0
  !remoteCode : dw .remoteCode42DC : db 0,0
  !remoteCode : dw .remoteCode42DF : db 0,0
  db 96
  !rest
  !vibrato,22,6,23
  !pan,10
  !instr,!instr36
  !volume,220
  !transpose,244
  !loop : dw .sub4663 : db 1
  !transpose,0
  !instr,!instr30
  !volume,150
  !vibrato,36,6,26
  !pan,9
  db 48,$7F
  !e5
  db 120
  !gs5
  db 72
  !ds5
  db 120
  !b5
  db 72
  !fs5
  db 48
  !as5
  !fs5
  db 24
  !e5
  db 48
  !fs5
  db 24
  !gs5
  !fs5
  !e5
  db 48
  !ds5
  !e5
  !e5
  db 120
  !gs5
  db 72
  !ds5
  db 120
  !b5
  db 72
  !fs5
  db 48
  !as5
  !fs5
  !e5
  !e6
  db 24
  !e6
  db 48
  !fs6
  !instr,!instr2A
  !volume,255
  !vibrato,36,8,52
  !amplify,47
  !pan,10
  db 24,$7D
  !ds6
  !pitchSlide,0,10 : !gs6
  db 24,$7E
  !fs6
  db 24,$7F
  !e6
  !amplify,0
  !instr,!instr2F
  !volume,235
  !endVibrato
  !pan,11
  !loop : dw .sub480D : db 1
  db 24,$7F
  !b4
  !gs4
  !fs4
  !e4
  !loop : dw .sub480D : db 1
  db 24,$7F
  !c5
  !gs4
  !fs4
  !e4
  !amplify,0
  !instr,!instr31
  !volume,235
  !vibrato,36,6,47
  !pan,9
  db 48
  !gs5
  !e6
  !ds6
  db 24
  !cs6
  db 72
  !b5
  db 48
  !fs6
  !e6
  db 24
  !ds6
  db 72
  !as5
  db 48
  !gs6
  !fs6
  db 24
  !e6
  db 48
  !ds6
  db 24
  !e6
  !ds6
  !cs6
  !b5
  !fs5
  !b5
  db 48
  !gs5
  db 24
  !e5
  !e6
  !e5
  !ds6
  !cs6
  !gs5
  db 48
  !b5
  db 24
  !fs5
  !fs6
  !fs5
  !e6
  !fs5
  !b5
  db 48
  !as5
  db 24
  !fs5
  !gs6
  !fs5
  !fs6
  !fs5
  !b6
  db 48
  !cs7
  db 24
  !gs5
  !e6
  !fs6
  db 12
  !ds6
  !fs5
  !e5
  !ds5
  db 24
  !e5
  !fs5
  !pan,8
  !remoteCode : dw .remoteCode42DC : db -1,0
  !remoteCode : dw .remoteCode42E7 : db 3,0
  !loop : dw .sub482C : db 1
  !loop : dw .sub484C : db 1
  !loop : dw .sub4862 : db 1
  db 60,$7F
  !b5
  db 12
  !rest
  !pan,12
  !loop : dw .sub482C : db 1
  db 24,$7F
  !cs5
  !b4
  db 24,$79
  !b4
  db 24,$7F
  !d5
  db 24,$79
  !d5
  db 24,$7F
  !cs5
  db 24,$79
  !cs5
  !pan,9
  !loop : dw .sub4862 : db 1
  db 60,$7F
  !fs6
  db 12
  !rest
  !pan,8
  !loop : dw .sub482C : db 1
  !loop : dw .sub484C : db 1
  !loop : dw .sub4862 : db 1
  db 60,$7F
  !b5
  db 12
  !rest
  !pan,12
  !loop : dw .sub482C : db 1
  db 24,$7F
  !b4
  !cs5
  db 24,$79
  !cs5
  db 48,$7F
  !e5
  !e5
  !pitchSlide,0,14 : !fs5
  db 120
  !tie
  !adsrGain,$7F,$F2
  db 48
  !tie
  !end

.pattern0_4
  !subtranspose,79
  db 48,$7F
  !rest
  !instr,!instr32
  !volume,140
  !endVibrato
  !pan,12
  !loop : dw .sub46B8 : db 1
  !pan,11
  db 12,$7B
  !fs5
  !rest
  !transpose,254
  !pan,8
  !loop : dw .sub46B8 : db 1
  !pan,9
  db 12,$7B
  !gs5
  !rest
  !pan,12
  !loop : dw .sub46B8 : db 1
  !pan,11
  db 12,$7B
  !fs5
  !rest
  !transpose,0
  !pan,8
  !loop : dw .sub47DA : db 1
  !instr,!instr33
  !volume,185
  !endVibrato
  !pan,10
  db 96,$7F
  !cs5
  db 72
  !tie
  db 24
  !cs5
  db 96
  !b4
  db 48
  !tie
  !b4
  db 96
  !as4
  db 72
  !tie
  db 24
  !as4
  !a4
  db 24,$79
  !a4
  db 24,$7F
  !a4
  db 24,$79
  !a4
  db 24,$7F
  !b4
  db 24,$79
  !b4
  db 24,$7F
  !b4
  db 24,$79
  !b4
  db 24,$7F
  !b4
.pattern1_4:
  !amplify,0
  !instr,!instr33
  !volume,185
  !endVibrato
  !pan,10
  !loop : dw .sub487B : db 1
  db 72,$7F
  !fs5
  db 48
  !ds5
  !loop : dw .sub487B : db 1
  db 120,$7F
  !fs5
  !instr,!instr34
  !volume,162
  !endVibrato
  !pan,13
  db 48
  !cs5
  !loop : dw .sub4897 : db 1
  !loop : dw .sub48AA : db 1
  !loop : dw .sub4897 : db 1
  db 48,$7F
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
  db 24,$79
  !f5
  db 48,$7F
  !cs5
  !loop : dw .sub4897 : db 1
  !loop : dw .sub48AA : db 1
  !loop : dw .sub4897 : db 1
  db 48,$7F
  !f5
  db 24,$79
  !f5
  db 24,$7F
  !e5
  db 24,$79
  !e5
  db 24,$7F
  !ds5
  db 24,$79
  !ds5
  db 24,$7F
  !d5
  db 24,$79
  !d5
  !loop : dw .sub48C4 : db 1
  db 96,$7F
  !f5
  !tie
  !loop : dw .sub48C4 : db 1
  db 96,$7F
  !f5
  db 120
  !rest
  !vibrato,22,6,23
  !volume,200
  !pan,12
  !instr,!instr35
  !remoteCode : dw .remoteCode42DC : db -1,0
  !remoteCode : dw .remoteCode42E3 : db 3,0
  !loop : dw .sub48D3 : db 1
  db 12,$7F
  !gs4
  db 24
  !rest
  !loop : dw .sub48D3 : db 1
  db 12,$7F
  !gs4
  !remoteCode : dw .remoteCode42DC : db 0,0
  !remoteCode : dw .remoteCode42E3 : db 0,0
  !instr,!instr33
  !volume,185
  !endVibrato
  !pan,13
  !loop : dw .sub4903 : db 1
  db 96,$7F
  !e5
  !tie
  db 96
  !cs5
  !tie
  db 96
  !ds5
  !tie
  !loop : dw .sub4903 : db 1
  db 96,$7F
  !cs5
  !tie
  db 96
  !ds5
  !tie
  !tie
  !fs5
  !pan,12
  !remoteCode : dw .remoteCode42DC : db -1,0
  !remoteCode : dw .remoteCode42E7 : db 3,0
  !loop : dw .sub4914 : db 1
  !loop : dw .sub4934 : db 1
  !loop : dw .sub494A : db 1
  db 60,$7F
  !fs5
  db 12
  !rest
  !loop : dw .sub4914 : db 1
  db 24,$7F
  !gs4
  !fs4
  db 24,$79
  !fs4
  db 24,$7F
  !a4
  db 24,$79
  !a4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  !pan,11
  !loop : dw .sub494A : db 1
  db 60,$7F
  !cs6
  db 12
  !rest
  !loop : dw .sub4914 : db 1
  !loop : dw .sub4934 : db 1
  !loop : dw .sub494A : db 1
  db 60,$7F
  !fs5
  db 12
  !rest
  !loop : dw .sub4914 : db 1
  db 24,$7F
  !fs4
  !gs4
  db 24,$79
  !gs4
  db 48,$7F
  !cs5
  !b4
  !pitchSlide,0,14 : !d5
  db 120
  !tie
  !adsrGain,$7F,$F2
  db 48
  !tie
  !end

.pattern0_5
  !subtranspose,79
  db 48,$7F
  !rest
  !instr,!instr32
  !volume,140
  !endVibrato
  !transpose,252
  !pan,8
  !loop : dw .sub46B8 : db 1
  !pan,9
  db 12,$7B
  !g5
  !rest
  !transpose,251
  !pan,12
  !loop : dw .sub46B8 : db 1
  !pan,11
  db 12,$7B
  !gs5
  !rest
  !pan,8
  !loop : dw .sub46B8 : db 1
  !pan,9
  db 12,$7B
  !fs5
  !rest
  !transpose,253
  !pan,12
  !loop : dw .sub47DA : db 1
  !transpose,0
  !instr,!instr33
  !volume,185
  !endVibrato
  !pan,13
  db 96,$7F
  !gs4
  db 72
  !tie
  db 24
  !gs4
  db 96
  !fs4
  db 48
  !tie
  !fs4
  db 96
  !fs4
  db 72
  !tie
  db 24
  !fs4
  !e4
  db 24,$79
  !e4
  db 24,$7F
  !e4
  db 24,$79
  !e4
  db 24,$7F
  !fs4
  !pan,138
  !subtranspose,0
  !endVibrato
  !instr,!instr27
  !volume,220
  !vibrato,0,47,255
  db 96
  !c4
  !pitchSlide,4,79 : !c7
.pattern1_5:
  !amplify,0
  !instr,!instr33
  !volume,185
  !endVibrato
  !pan,13
  !subtranspose,79
  !loop : dw .sub4963 : db 1
  db 72,$7F
  !ds5
  db 48
  !b4
  !loop : dw .sub4963 : db 1
  db 120,$7F
  !ds5
  !instr,!instr34
  !volume,162
  !endVibrato
  !pan,7
  !loop : dw .sub4986 : db 1
  !subloop,0
  db 24,$7F
  !c5
  db 24,$79
  !c5
  !subloop,2
  !loop : dw .sub4986 : db 1
  db 24,$7F
  !b4
  db 24,$79
  !b4
  db 24,$7F
  !as4
  db 24,$79
  !as4
  db 24,$7F
  !a4
  db 24,$79
  !a4
  !loop : dw .sub49C4 : db 1
  db 96,$7F
  !c5
  !tie
  db 24
  !tie
  db 36
  !cs5
  !c5
  !loop : dw .sub49C4 : db 1
  db 96,$7F
  !c5
  !tie
  db 96
  !rest
  db 48
  !tie
  !vibrato,22,6,23
  !volume,200
  !pan,8
  !instr,!instr35
  !remoteCode : dw .remoteCode42DC : db -1,0
  !remoteCode : dw .remoteCode42E3 : db 3,0
  !loop : dw .sub49D1 : db 1
  db 48,$7F
  !ds4
  !rest
  !loop : dw .sub49D1 : db 1
  db 48,$7F
  !ds4
  !remoteCode : dw .remoteCode42DC : db 0,0
  !remoteCode : dw .remoteCode42E3 : db 0,0
  !instr,!instr33
  !volume,185
  !endVibrato
  !pan,7
  !loop : dw .sub49FF : db 1
  db 96,$7F
  !gs4
  !tie
  db 96
  !cs5
  !tie
  db 96
  !as4
  !tie
  db 96
  !b4
  !tie
  !loop : dw .sub49FF : db 1
  db 96,$7F
  !gs4
  !tie
  !tie
  !tie
  db 96
  !as4
  !tie
  !b4
  !ds5
  !loop : dw .sub4A0D : db 1
  !loop : dw .sub4A1D : db 1
  !loop : dw .sub46B8 : db 1
  !transpose,0
  !loop : dw .sub4A0D : db 1
  db 24,$7F
  !a4
  db 24,$79
  !a4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  !instr,!instr32
  !volume,140
  !endVibrato
  !pan,12
  !transpose,252
  !loop : dw .sub46B8 : db 1
  !transpose,0
  !loop : dw .sub4A0D : db 1
  !loop : dw .sub4A1D : db 1
  !loop : dw .sub46B8 : db 1
  !transpose,0
  !instr,!instr34
  !volume,162
  !endVibrato
  !pan,11
  db 48,$7F
  !gs4
  db 24
  !fs4
  !gs4
  db 24,$79
  !gs4
  db 48,$7F
  !gs4
  !fs4
  !pitchSlide,0,13 : !a4
  db 120
  !tie
  !adsrGain,$7F,$F2
  db 48
  !tie
  !end

.pattern0_6
  !subtranspose,0
  !endVibrato
  db 48,$7F
  !rest
  !instr,!instr21
  !volume,185
  !pan,9
  !subloop,0
  db 24,$7F
  !c5
  db 24,$7C
  !c5
  !subloop,29
  !loop : dw .sub44A9 : db 1
.pattern1_6:
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub44DF : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub4521 : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub44DF : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub4521 : db 1
  !loop : dw .sub4538 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub44DF : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub4521 : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub44DF : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub4521 : db 1
  !loop : dw .sub454E : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub44F2 : db 1
  !subloop,0
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub44F2 : db 1
  !subloop,1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub4538 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub44F2 : db 1
  !subloop,0
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub44F2 : db 1
  !subloop,1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44C6 : db 1
  !instr,!instr20
  !volume,255
  !pan,10
  !pan,7
  db 12,$7F
  !d6
  !pan,8
  !d6
  !pan,9
  !b5
  !pan,10
  !b5
  !pan,11
  !gs5
  !pan,12
  !gs5
  !pan,13
  !f5
  !pan,14
  !f5
  !subloop,0
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44F2 : db 1
  !subloop,2
  !loop : dw .sub4563 : db 2
  !loop : dw .sub44F2 : db 1
  !subloop,0
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44F2 : db 1
  !subloop,2
  !loop : dw .sub4563 : db 2
  !loop : dw .sub454E : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4563 : db 2
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44A9 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub454E : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4538 : db 1
  db 96,$7F
  !rest
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  db 60
  !cs5
  !amplify,0
  !toggleEcho
  !subtranspose,79
  !vibrato,22,6,23
  !volume,140
  !instr,!instr35
  !endVibrato
  !subtranspose,79
  !remoteCode : dw .remoteCode42DC : db -1,0
  !remoteCode : dw .remoteCode42E3 : db 3,0
  db 24
  !gs4
  !ds5
  !e5
  !ds5
  !gs4
  !e4
  db 48
  !b3
  db 24
  !gs4
  !b4
  !ds5
  !b4
  !fs4
  !ds4
  db 48
  !as3
  db 24
  !fs4
  !as4
  !ds5
  !fs5
  !e5
  !ds5
  db 48
  !a3
  db 24
  !e4
  !a4
  db 48
  !cs5
  db 24
  !ds4
  db 12
  !gs4
  !b4
  !fs4
  !gs4
  db 24
  !cs3
  !gs3
  !e4
  !fs4
  !gs4
  !e4
  !ds4
  db 48
  !e3
  db 24
  !b3
  !ds4
  !e4
  !b4
  !ds5
  !b4
  db 48
  !fs3
  db 24
  !as3
  !ds4
  !fs4
  !as4
  !ds5
  !as4
  db 48
  !a3
  db 24
  !e4
  !a4
  db 12
  !cs5
  !remoteCode : dw .remoteCode42DC : db 0,0
  !remoteCode : dw .remoteCode42E3 : db 0,0
  !instr,!instr2C
  !volume,255
  !vibrato,32,6,47
  !amplify,31
  !pan,11
  db 24,$7F
  !gs5
  !a5
  !pitchSlide,0,12 : !cs6
  !b5
  !subtranspose,0
  !endVibrato
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,185
  !pan,10
  db 24
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  db 24,$7C
  !c5
  db 24,$7F
  !c5
  !instr,!instr22
  !volume,185
  !pan,10
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !c5
  db 24,$7C
  !c5
  !subloop,0
  !loop : dw .sub456A : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !loop : dw .sub456A : db 1
  db 24,$7C
  !c5
  !subloop,1
  !subloop,0
  !loop : dw .sub456A : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !subloop,1
  !loop : dw .sub4598 : db 1
  db 12,$7F
  !c5
  !instr,!instr20
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
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !subloop,0
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub44DF : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !subloop,2
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub4521 : db 1
  !loop : dw .sub4538 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub44DF : db 1
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4511 : db 1
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub44DF : db 1
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub44DF : db 1
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 1
  !loop : dw .sub4521 : db 1
  !loop : dw .sub454E : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub4538 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub44F2 : db 1
  !loop : dw .sub4538 : db 1
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 2
  !loop : dw .sub44F2 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub44C6 : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  !loop : dw .sub44A9 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr23
  !volume,185
  !pan,11
  db 24
  !c5
  !loop : dw .sub4511 : db 1
  !loop : dw .sub45B5 : db 1
  !subloop,0
  !loop : dw .sub4511 : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !c5
  !loop : dw .sub4538 : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !c5
  !loop : dw .sub4511 : db 1
  !instr,!instr23
  !volume,185
  !pan,11
  db 24,$7F
  !c5
  !loop : dw .sub4511 : db 1
  !loop : dw .sub45B5 : db 1
  !subloop,2
  !instr,!instr20
  !volume,255
  !pan,10
  !pan,14
  db 12,$7F
  !d6
  !d6
  !pan,13
  !d6
  !d6
  !pan,12
  !b5
  !b5
  !pan,11
  !b5
  !b5
  !pan,10
  !gs5
  !gs5
  !pan,9
  !gs5
  !gs5
  !pan,8
  !f5
  !f5
  !pan,7
  !f5
  !f5
  !end

.pattern0_7
  !subtranspose,0
  !endVibrato
  db 48,$7F
  !rest
  !instr,!instr26
  !volume,255
  !pan,10
  !amplify,223
  db 96
  !cs5
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 72
  !tie
  !subloop,0
  db 96,$7F
  !cs5
  !tie
  !subloop,2
  db 96,$7F
  !cs5
  db 72
  !tie
  !amplify,0
  !instr,!instr29
  !vibrato,36,6,47
  !volume,255
  !amplify,47
  !subtranspose,79
  !pan,10
  db 12
  !e5
  !pan,11
  db 12,$7E
  !ds5
  db 12,$7D
  !fs5
  db 12,$7C
  !ds5
  !amplify,0
.pattern1_7:
  !instr,!instr33
  !volume,185
  !endVibrato
  !pan,7
  !subtranspose,79
  !loop : dw .sub4A34 : db 1
  db 48,$7F
  !b4
  !instr,!instr2A
  !volume,255
  !vibrato,36,8,52
  !amplify,47
  !pan,11
  db 12,$79
  !cs5
  db 12,$7A
  !b4
  !cs5
  db 12,$7B
  !e5
  !cs5
  !ds5
  !amplify,0
  !instr,!instr33
  !volume,185
  !endVibrato
  !pan,7
  !loop : dw .sub4A34 : db 1
  db 120,$7F
  !b4
  !instr,!instr34
  !volume,162
  !endVibrato
  !pan,10
  db 48
  !f4
  !loop : dw .sub4A4E : db 1
  !loop : dw .sub4A61 : db 1
  !loop : dw .sub4A4E : db 1
  db 48,$7F
  !gs4
  db 24,$79
  !gs4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  db 48,$7F
  !f4
  !loop : dw .sub4A4E : db 1
  !loop : dw .sub4A61 : db 1
  !loop : dw .sub4A4E : db 1
  db 48,$7F
  !gs4
  db 24,$79
  !gs4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  db 24,$7F
  !g4
  db 24,$79
  !g4
  db 24,$7F
  !fs4
  db 24,$79
  !fs4
  !loop : dw .sub4A7B : db 1
  db 96,$7F
  !gs4
  !tie
  !loop : dw .sub4A7B : db 1
  db 96,$7F
  !gs4
  db 96
  !rest
  db 48
  !tie
  !subtranspose,0
  !endVibrato
  !instr,!instr24
  !volume,125
  !subloop,0
  !pan,9
  db 72,$7F
  !c5
  !pan,11
  db 120
  !c5
  !subloop,6
  !pan,9
  db 72,$7F
  !c5
  !pan,11
  db 24
  !c5
  !instr,!instr30
  !volume,150
  !vibrato,36,6,26
  !pan,9
  !subtranspose,79
  db 24,$7F
  !cs5
  !ds5
  !vibrato,22,6,23
  !pan,10
  !instr,!instr36
  !volume,220
  !subtranspose,79
  !transpose,244
  !loop : dw .sub4663 : db 1
  !transpose,0
  !loop : dw .sub4A8A : db 1
  db 96,$7F
  !e4
  !tie
  db 96
  !gs4
  !tie
  db 96
  !fs4
  !tie
  db 96
  !gs4
  db 48
  !tie
  !instr,!instr31
  !volume,235
  !vibrato,36,6,47
  !pan,9
  db 24
  !e5
  !fs5
  !loop : dw .sub4A8A : db 1
  db 96,$7F
  !e4
  !tie
  !tie
  !tie
  db 96
  !fs4
  !tie
  !gs4
  !b4
  !loop : dw .sub4A9F : db 1
  !loop : dw .sub4AAF : db 1
  !loop : dw .sub46B8 : db 1
  !transpose,0
  !loop : dw .sub4A9F : db 1
  db 24,$7F
  !fs4
  db 24,$79
  !fs4
  db 24,$7F
  !e4
  db 24,$79
  !e4
  !instr,!instr32
  !volume,140
  !endVibrato
  !pan,8
  !transpose,249
  !loop : dw .sub46B8 : db 1
  !transpose,0
  !loop : dw .sub4A9F : db 1
  !loop : dw .sub4AAF : db 1
  !loop : dw .sub46B8 : db 1
  !transpose,0
  !instr,!instr34
  !volume,162
  !endVibrato
  !pan,9
  db 48,$7F
  !e4
  db 24
  !ds4
  !e4
  db 24,$79
  !e4
  db 48,$7F
  !e4
  db 24
  !fs4
  !instr,!instr28
  !volume,230
  !pan,138
  !subtranspose,0
  !endVibrato
  !ds5
  !as4
  db 24,$7A
  !gs4
  !g4
  db 24,$78
  !f4
  db 24,$77
  !ds4
  db 24,$76
  !d4
  db 24,$74
  !as3
  !end

.sub42EB
  db 24,$7F
  !rest
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !rest
  !end

.sub4300
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
  !end

.sub4315
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,185
  !pan,9
  !amplify,0
  db 12
  !c5
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
  !c4
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 72
  !c4
  !end

.sub4347
  !instr,!instr1F
  !volume,225
  !pan,10
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
  db 72
  !c4
  !end

.sub436A
  db 24,$7F
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !end

.sub4376
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 12
  !c4
  !c4
  db 24
  !c4
  !end

.sub4386
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !end

.sub4399
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
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

.sub43BC
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,185
  !pan,9
  !amplify,0
  db 12
  !c5
  !c5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !end

.sub43DD
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
  !end

.sub43F0
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
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
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !end

.sub4413
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
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
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !end

.sub443C
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !end

.sub444E
  !amplify,0
  db 24,$7F
  !c5
  !amplify,66
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !instr,!instr21
  !volume,185
  !pan,9
  !amplify,0
  !c5
  !amplify,66
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !end

.sub4475
  !amplify,0
  db 24,$7F
  !c5
  !amplify,66
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
  db 12
  !c4
  !c4
  !end

.sub4497
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !end

.sub45CD
  db 24,$7D
  !e5
  db 24,$7E
  !fs5
  db 48,$7F
  !gs5
  !e6
  !ds6
  db 24
  !cs6
  db 96
  !b5
  !tie
  !end

.sub45DE
  db 72,$7F
  !as5
  db 48
  !gs6
  !fs6
  db 24
  !e6
  db 96
  !ds6
  db 48
  !tie
  !end

.sub45EB
  db 24,$7F
  !cs5
  !cs5
  !gs5
  !cs5
  !end

.sub45F2
  db 24,$7F
  !cs5
  !cs5
  !gs5
  !b4
  !end

.sub45F9
  db 24,$7F
  !b4
  !b4
  !gs5
  !b4
  !b4
  !b4
  !gs5
  !as4
  !as4
  !as4
  !fs5
  !as4
  !as4
  !fs5
  !as4
  !a4
  !end

.sub460C
  db 24,$7F
  !cs5
  !cs5
  !cs6
  !cs5
  !end

.sub4613
  db 24,$7F
  !cs5
  !cs6
  !cs5
  !b4
  !end

.sub461A
  db 24,$7F
  !cs5
  !cs6
  !cs5
  !c5
  !end

.sub4621
  db 24,$7F
  !cs5
  !cs6
  !cs5
  !c6
  !transpose,0
  !a4
  !a4
  !a5
  !b4
  db 12
  !b4
  !b4
  !end

.sub4632
  !transpose,0
  db 24,$7F
  !f5
  !f5
  !c6
  !as5
  !end

.sub463C
  db 24,$7F
  !cs5
  db 12
  !cs5
  !cs5
  db 24
  !cs6
  !cs5
  !end

.sub4646
  db 12,$7F
  !cs5
  !cs5
  db 24
  !cs5
  !cs6
  !cs5
  !end

.sub464F
  !transpose,0
  db 12,$7F
  !c5
  !c5
  db 24
  !c5
  !c6
  !end

.sub465A
  db 12,$7F
  !f5
  !f5
  db 24
  !f6
  db 12
  !c6
  !end

.sub4663
  db 96,$7F
  !cs5
  db 72
  !tie
  db 96
  !b4
  !tie
  db 96
  !as4
  !tie
  db 96
  !a4
  db 72
  !tie
  db 48
  !fs4
  db 96
  !cs4
  db 72
  !tie
  db 96
  !e4
  !tie
  db 96
  !fs4
  !tie
  db 120
  !a4
  db 96
  !b4
  !end

.sub4683
  db 24,$7F
  !cs5
  db 12
  !cs5
  !cs5
  db 24
  !gs5
  !cs5
  db 12
  !cs5
  !cs5
  db 24
  !cs5
  !gs5
  !cs5
  !end

.sub4694
  !transpose,0
  db 24,$7F
  !fs5
  db 12
  !fs5
  !fs5
  db 24
  !as5
  !fs5
  db 12
  !fs5
  !fs5
  db 24
  !fs5
  !as5
  !fs5
  !gs5
  db 12
  !gs5
  !gs5
  !end

.sub46AC
  !transpose,0
  db 12,$7F
  !e5
  !e5
  db 24
  !e5
  !e6
  !b5
  !end

.sub46B8
  db 12,$7F
  !gs5
  !rest
  db 12,$79
  !gs5
  !rest
  !gs5
  !rest
  db 12,$7F
  !gs5
  !rest
  db 12,$79
  !gs5
  !rest
  !gs5
  !rest
  db 12,$7F
  !gs5
  !rest
  !end

.sub46D1
  !instr,!instr2A
  !volume,255
  !vibrato,36,8,52
  !amplify,47
  !pan,9
  db 12,$7E
  !cs5
  !ds5
  db 12,$7F
  !e5
  !fs5
  !end

.sub46E7
  db 48,$7F
  !f5
  !pitchSlide,0,12 : !gs5
  !c6
  !pitchSlide,0,12 : !e6
  !ds6
  db 24
  !cs6
  db 48
  !gs5
  !pitchSlide,0,12 : !b5
  db 24
  !tie
  db 48
  !d6
  !pitchSlide,0,12 : !fs6
  !e6
  db 24
  !ds6
  db 48
  !g5
  !pitchSlide,0,12 : !as5
  db 24
  !as5
  db 48
  !e6
  !pitchSlide,0,12 : !gs6
  !fs6
  db 24
  !e6
  db 48
  !c6
  !pitchSlide,0,12 : !ds6
  db 24
  !e6
  !ds6
  !cs6
  !b5
  !fs5
  !b5
  !end

.sub4726
  db 48,$7F
  !fs6
  !pitchSlide,0,11 : !gs6
  db 12
  !tie
  !rest
  db 48
  !ds6
  !pitchSlide,0,13 : !gs6
  db 24
  !g6
  !f6
  !ds6
  !end

.sub473B
  db 72,$7F
  !c6
  db 12
  !rest
  !toggleLegato
  db 3
  !a5
  !b5
  !cs6
  !toggleLegato
  !ds6
  !end

.sub474A
  db 24,$7F
  !f6
  !gs6
  !c7
  db 48
  !f6
  db 24
  !f6
  !ds6
  !f6
  db 48
  !a5
  !pitchSlide,0,12 : !c6
  !end

.sub475C
  db 24,$7F
  !as5
  db 48
  !gs5
  !g5
  !cs6
  !pitchSlide,0,13 : !f6
  db 24
  !c6
  !ds6
  db 36
  !f6
  db 12
  !rest
  db 24
  !c6
  !f6
  !g6
  !fs6
  !pitchSlide,0,12 : !gs6
  !g6
  db 12
  !f6
  !f6
  db 24
  !ds6
  !end

.sub456A
  db 24,$7F
  !c5
  db 24,$7C
  !c5
  !instr,!instr22
  !volume,185
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  db 24,$7C
  !c5
  db 24,$7F
  !c5
  !instr,!instr22
  !volume,185
  !pan,10
  db 24,$7C
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  db 24,$7F
  !c5
  !end

.sub4598
  db 24,$7F
  !c5
  db 24,$7C
  !c5
  !instr,!instr22
  !volume,185
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr23
  !volume,185
  !pan,11
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !end

.sub477E
  db 48,$7F
  !cs6
  db 24
  !b5
  !cs6
  db 24,$79
  !cs6
  db 24,$7F
  !a5
  !pitchSlide,0,12 : !cs6
  !b5
  !gs5
  !end

.sub4791
  db 48,$7F
  !ds6
  !pitchSlide,0,12 : !gs6
  db 24
  !fs6
  !gs6
  db 24,$79
  !gs6
  db 24,$7F
  !ds6
  !pitchSlide,0,10 : !gs6
  !fs6
  !e6
  !end

.sub47A8
  db 24,$7F
  !b6
  db 96
  !gs6
  db 24,$79
  !gs6
  db 24,$7F
  !cs6
  !pitchSlide,0,12 : !fs6
  db 24,$79
  !fs6
  db 24,$7F
  !fs6
  !end

.sub47BE
  db 24,$7F
  !b5
  !cs6
  db 24,$79
  !cs6
  db 24,$7F
  !b5
  !cs6
  !ds6
  db 48
  !d6
  !pitchSlide,0,13 : !e6
  db 24
  !ds6
  !cs6
  db 24,$79
  !cs6
  db 48,$7F
  !b5
  !end

.sub47DA
  db 12,$7F
  !e5
  !rest
  db 12,$79
  !e5
  !rest
  !e5
  !rest
  db 12,$7F
  !fs5
  !rest
  db 12,$79
  !fs5
  !rest
  !fs5
  !rest
  db 12,$7F
  !fs5
  !rest
  !end

.sub47F3
  db 24,$7C
  !ds6
  db 72
  !f6
  db 24
  !rest
  db 48
  !ds6
  !pitchSlide,0,11 : !f6
  db 12
  !tie
  !rest
  db 48
  !c6
  !pitchSlide,0,13 : !f6
  db 24
  !ds6
  !c6
  !end

.sub480D
  db 24,$7F
  !cs4
  !cs4
  !e4
  !cs4
  !fs4
  !cs4
  !e4
  !cs4
  !e4
  !e4
  !fs4
  !e4
  !gs4
  !e4
  !fs4
  !e4
  !fs4
  !fs4
  !gs4
  !fs4
  !a4
  !fs4
  !gs4
  !fs4
  !gs4
  !gs4
  !b4
  !gs4
  !end

.sub482C
  !amplify,0
  !remoteCode : dw .remoteCode42DC : db 0,0
  !remoteCode : dw .remoteCode42E7 : db 0,0
  !instr,!instr2D
  !volume,240
  !vibrato,50,7,50
  db 24,$7F
  !as4
  !pitchSlide,0,10 : !cs5
  db 12
  !cs5
  !cs5
  !end

.sub484C
  db 24,$7F
  !cs5
  !b4
  db 24,$79
  !b4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  db 24,$7F
  !cs5
  db 24,$79
  !cs5
  !pan,11
  !end

.sub4862
  !instr,!instr2E
  !volume,215
  !vibrato,36,9,50
  !remoteCode : dw .remoteCode42DC : db -1,0
  !remoteCode : dw .remoteCode42E7 : db 3,0
  db 24,$7F
  !cs6
  !rest
  !e6
  !rest
  !end

.sub487B
  db 96,$7F
  !cs5
  db 72
  !tie
  db 96
  !ds5
  !tie
  db 96
  !cs5
  !tie
  !tie
  db 120
  !ds5
  db 96
  !e5
  db 72
  !tie
  db 120
  !ds5
  db 96
  !cs5
  !tie
  db 72
  !tie
  db 96
  !e5
  !end

.sub4897
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
  !end

.sub48AA
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
  !cs5
  !end

.sub48C4
  db 96,$7F
  !cs5
  db 72
  !ds5
  db 96
  !f5
  db 48
  !tie
  db 72
  !ds5
  db 96
  !cs5
  !ds5
  !end

.sub48D3
  db 48,$7F
  !gs4
  !e5
  !gs4
  !rest
  !gs4
  !ds5
  !fs4
  !rest
  !fs4
  !ds5
  !e5
  !rest
  !e4
  !cs5
  !ds4
  db 12
  !e3
  !pan,8
  !ds3
  db 24
  !rest
  !pan,12
  db 48
  !gs3
  !fs4
  !e4
  !rest
  !b3
  !e4
  !ds5
  !rest
  !as3
  !fs4
  !ds5
  !rest
  !e4
  !cs5
  db 24
  !rest
  db 12
  !gs4
  !b4
  !fs4
  !end

.sub4903
  db 96,$7F
  !cs5
  !tie
  db 96
  !e5
  !tie
  db 96
  !cs5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !b4
  !tie
  !end

.sub4914
  !amplify,0
  !remoteCode : dw .remoteCode42DC : db 0,0
  !remoteCode : dw .remoteCode42E7 : db 0,0
  !instr,!instr2D
  !volume,240
  !vibrato,50,7,50
  db 24,$7F
  !f4
  !pitchSlide,0,10 : !gs4
  db 12
  !gs4
  !gs4
  !end

.sub4934
  db 24,$7F
  !gs4
  !fs4
  db 24,$79
  !fs4
  db 24,$7F
  !ds4
  db 24,$79
  !ds4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  !pan,9
  !end

.sub494A
  !instr,!instr2E
  !volume,215
  !vibrato,36,9,50
  !remoteCode : dw .remoteCode42DC : db -1,0
  !remoteCode : dw .remoteCode42E7 : db 3,0
  db 24,$7F
  !gs5
  !rest
  !b5
  !rest
  !end

.sub4963
  db 96,$7F
  !gs4
  db 72
  !tie
  db 96
  !b4
  db 48
  !tie
  !gs4
  db 96
  !as4
  db 48
  !tie
  !b4
  db 96
  !a4
  db 120
  !b4
  db 96
  !cs5
  db 72
  !tie
  db 120
  !b4
  db 72
  !gs4
  db 96
  !as4
  db 48
  !tie
  !b4
  db 96
  !cs5
  !end

.sub4986
  db 48,$7F
  !gs4
  db 24,$79
  !gs4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  db 24,$7F
  !as4
  db 24,$79
  !as4
  db 24,$7F
  !as4
  db 24,$79
  !as4
  !subloop,0
  db 24,$7F
  !c5
  db 24,$79
  !c5
  !subloop,2
  db 24,$7F
  !c5
  !as4
  db 24,$79
  !as4
  db 24,$7F
  !as4
  db 24,$79
  !as4
  db 24,$7F
  !c5
  db 24,$79
  !c5
  db 24,$7F
  !c5
  db 48
  !c5
  db 24,$79
  !c5
  !end

.sub49C4
  db 96,$7F
  !gs4
  db 72
  !as4
  db 96
  !c5
  !tie
  db 24
  !tie
  db 96
  !as4
  !end

.sub49D1
  db 48,$7F
  !ds5
  !ds5
  !e4
  !rest
  !b4
  !b4
  !ds4
  !rest
  !as4
  !fs5
  !ds5
  !rest
  !a4
  !b3
  db 12
  !gs4
  !pan,12
  !b4
  !pan,8
  !fs4
  !pan,12
  !gs4
  !pan,8
  db 48
  !cs4
  !e4
  !gs4
  !ds4
  !rest
  !ds4
  !b4
  !b4
  !rest
  !ds4
  !as4
  !as4
  !rest
  !a4
  !e5
  !end

.sub49FF
  db 96,$7F
  !gs4
  !tie
  db 96
  !b4
  !tie
  db 96
  !as4
  !tie
  db 96
  !b4
  !tie
  !end

.sub4A0D
  !instr,!instr34
  !volume,162
  !endVibrato
  !pan,11
  db 72,$7F
  !gs4
  db 24
  !fs4
  db 24,$79
  !fs4
  !end

.sub4A1D
  db 24,$7F
  !fs4
  db 24,$79
  !fs4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  !instr,!instr32
  !volume,140
  !endVibrato
  !pan,12
  !transpose,252
  !end

.sub44A9
  db 24,$7F
  !c5
  !instr,!instr20
  !volume,255
  !pan,10
  !pan,13
  db 12
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
  !f5
  !end

.sub44C6
  !instr,!instr23
  !volume,185
  !pan,11
.sub44DF:
  db 24,$7F
  !c5
  !instr,!instr22
  !volume,185
  !pan,10
  db 12
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !c5
  !end

.sub44F2
  !instr,!instr23
  !volume,185
  !pan,11
  db 24,$7F
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,66
  db 12
  !c4
  !amplify,0
  !instr,!instr21
  !volume,185
  !pan,9
  !c5
  !end

.sub4511
  !instr,!instr21
  !volume,185
  !pan,9
  db 24,$7F
  !c5
.sub4563:
  db 12,$7D
  !c5
  db 12,$7F
  !c5
  !end

.sub4521
  db 12,$7F
  !c5
  db 12,$7D
  !c5
  !instr,!instr22
  !volume,185
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !c5
  !end

.sub4538
  !instr,!instr23
  !volume,185
  !pan,11
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  db 12,$7D
  !c5
  db 12,$7F
  !c5
  !end

.sub454E
  !instr,!instr20
  !volume,255
  !pan,10
  !pan,7
  db 12,$7F
  !d6
  !pan,9
  !b5
  !pan,11
  !gs5
  !pan,13
  !f5
  !end

.sub45B5
  !instr,!instr21
  !volume,185
  !pan,9
  db 24,$7F
  !c5
  !instr,!instr23
  !volume,185
  !pan,11
  !c5
  !instr,!instr21
  !volume,185
  !pan,9
  !c5
  !end

.sub4A34
  db 96,$7F
  !e4
  db 72
  !tie
  db 96
  !fs4
  !tie
  !tie
  !tie
  !e4
  db 120
  !fs4
  db 96
  !gs4
  db 72
  !tie
  db 120
  !fs4
  db 72
  !e4
  db 96
  !fs4
  !tie
  !a4
  !end

.sub4A4E
  db 24,$79
  !f4
  db 24,$7F
  !f4
  db 24,$79
  !f4
  db 24,$7F
  !g4
  db 24,$79
  !g4
  db 24,$7F
  !g4
  !end

.sub4A61
  db 24,$79
  !g4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  db 24,$7F
  !gs4
  db 24,$79
  !gs4
  db 24,$7F
  !g4
  db 24,$79
  !g4
  db 24,$7F
  !g4
  !f4
  !end

.sub4A7B
  db 96,$7F
  !f4
  db 72
  !g4
  db 96
  !gs4
  db 48
  !tie
  db 72
  !g4
  db 96
  !f4
  !g4
  !end

.sub4A8A
  !instr,!instr33
  !volume,185
  !endVibrato
  !pan,10
  db 96,$7F
  !e4
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
  !end

.sub4A9F
  !instr,!instr34
  !volume,162
  !endVibrato
  !pan,9
  db 72,$7F
  !e4
  db 24
  !ds4
  db 24,$79
  !ds4
  !end

.sub4AAF
  db 24,$7F
  !ds4
  db 24,$79
  !ds4
  db 24,$7F
  !e4
  db 24,$79
  !e4
  !instr,!instr32
  !volume,140
  !endVibrato
  !pan,8
  !transpose,249
  !end

.remoteCode42DC
  !restoreInstrument
  !end

.remoteCode42DF
  !adsrGain,$7F,$F6
  !end

.remoteCode42E7
  !adsrGain,$7F,$F8
  !end

.remoteCode42E3
  !adsrGain,$7F,$F2
  !end

assert pc() <= $10000-(5*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
