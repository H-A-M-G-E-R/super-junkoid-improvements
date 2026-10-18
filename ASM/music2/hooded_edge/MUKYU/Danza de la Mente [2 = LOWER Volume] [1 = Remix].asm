; Echo delay has been lowered fron 6 to 5.
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
!instr28 = $20 ; the problematic instrument
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

!sample01 = $16
!sample02 = $17
!sample08 = $18
!sample10 = $19
!sample12 = $1A
!sample14 = $1B
!sample15 = $1C
!sample16 = $1D
!sample18 = $1E
!sample19 = $1F
!sample1A = $20
!sample1B = $21
!sample1C = $22
!sample1D = $23
!sample1E = $24
!sample1F = $25
!sample20 = $26
!sample21 = $27

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample14,$9F,$F4,$B8,$14,$40
  db !sample15,$CF,$F9,$B8,$13,$00
  db !sample16,$FF,$E0,$B8,$15,$C0
  db !sample10,$FF,$F4,$B8,$07,$20
  db !sample18,$FF,$FA,$B8,$0B,$00
  db !sample18,$FF,$F4,$B8,$0A,$A0
  db !sample19,$9F,$F3,$B8,$05,$90
  db !sample19,$9F,$F1,$B8,$05,$90
  db !sample1A,$FE,$E0,$B8,$07,$F6
  db !sample1B,$FF,$ED,$B8,$02,$00
  db !sample1C,$FF,$ED,$B8,$07,$82
  db !sample1D,$AF,$AE,$B8,$03,$FE
  db !sample08,$FF,$E8,$B8,$03,$00
  db !sample1E,$FF,$E6,$B8,$02,$00
  db !sample02,$AD,$2F,$B8,$03,$00
  db !sample12,$FF,$F0,$7F,$01,$E4
  db !sample1F,$FF,$EF,$B8,$04,$01
  db !sample1F,$AF,$C6,$B8,$04,$01
  db !sample20,$FA,$E0,$B8,$04,$0C
  db !sample01,$FE,$F0,$B8,$03,$00
  db !sample21,$8F,$C5,$B8,$03,$16
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample01,Sample01+9
  dw Sample02,Sample02+108
  dw Sample08,Sample08+9
  dw Sample10_17,Sample10_17+0
  dw Sample12,Sample12+0
  dw Sample14,Sample14+459
  dw Sample15,Sample15+2034
  dw Sample16,Sample16+0
  dw Sample18,Sample18+909
  dw Sample19,Sample19+2160
  dw Sample1A,Sample1A+27
  dw Sample1B,Sample1B+2691
  dw Sample1C,Sample1C+3573
  dw Sample1D,Sample1D+18
  dw Sample1E,Sample1E+27
  dw Sample1F,Sample1F+27
  dw Sample20,Sample20+27
  dw Sample21,Sample21+1602
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample01: incbin "01 SMW @1.brr":2..0
  Sample02: incbin "02 SMW @2.brr":2..0
  Sample08: incbin "08 SMW @6.brr":2..0
  Sample10_17: incbin "CRONO Bongo.brr":2..0
  Sample12: incbin "12 SMW @15.brr":2..0
  Sample14: incbin "XR-10 Snare.brr":2..0
  Sample15: incbin "DR-660 Kick.brr":2..0
  Sample16: incbin "RS3 Conga.brr":2..0
  Sample18: incbin "Ultima Hi-Hat.brr":2..0
  Sample19: incbin "XG Crash Cym.brr":2..0
  Sample1A: incbin "RUDRA Rock Organ.brr":2..0
  Sample1B: incbin "M1 Piano o4 f+ to o6 a.brr":2..0
  Sample1C: incbin "CRONO Alto Sax.brr":2..0
  Sample1D: incbin "RUDRA Elec Piano 2.brr":2..0
  Sample1E: incbin "SOI Filtered Square.brr":2..0
  Sample1F: incbin "MM7 Elec Piano.brr":2..0
  Sample20: incbin "ST3 Warm Pad.brr":2..0
  Sample21: incbin "CRONO Elec Bass.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2A54

Tracker2A54:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !musicTranspose,255
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%10111000,54,-55
  ;!echoParameters,6,192,0
  !echoParameters,5,192,0
  ;!addmusicFA,127,1 amk109hotpatch
  !musicVolume,115
  !tempo,43
  !subtranspose,0
  !endVibrato
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  !amplify,255
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12
  !cs4
  !instr,!instr20
  !volume,185
  !pan,12
  !cs4
  !instr,!instr21
  !volume,185
  !pan,8
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 24
  !cs4
  db 6
  !cs4
  !cs4
  db 12
  !cs4
.pattern1_0:
  !instr,!instr1F
  !volume,185
  !pan,10
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3A40 : db 1
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3A76 : db 1
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3A40 : db 1
  !loop : dw .sub3A12 : db 1
  !instr,!instr1E
  !volume,220
  !pan,10
  db 12,$7F
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 6
  !cs4
  !cs4
  !cs4
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3A40 : db 1
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3A76 : db 1
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3A40 : db 1
  !loop : dw .sub3A12 : db 1
  !instr,!instr1E
  !volume,220
  !pan,10
  db 84,$7F
  !cs4
  db 6
  !cs4
  !cs4
  db 12
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !subloop,0
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3AA7 : db 1
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3AE4 : db 1
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3B29 : db 1
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3AE4 : db 1
  !subloop,1
  !subloop,0
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3A40 : db 1
  db 12,$7F
  !cs4
  !instr,!instr20
  !volume,185
  !pan,12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr21
  !volume,185
  !pan,8
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 24
  !cs4
  db 12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 6
  !cs4
  !cs4
  db 12
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !subloop,1
  !subloop,0
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3AA7 : db 1
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3AE4 : db 1
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3B29 : db 1
  !loop : dw .sub3A12 : db 1
  !loop : dw .sub3AE4 : db 1
  !subloop,1
  !loop : dw .sub3B5C : db 1
  !loop : dw .sub3BB9 : db 1
  !loop : dw .sub3B5C : db 1
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12,$7F
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 72
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 6
  !cs4
  !cs4
  db 12
  !cs4
  !subloop,0
  !loop : dw .sub3BD7 : db 1
  !instr,!instr1F
  !volume,185
  !pan,10
  db 24,$7F
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 24
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12
  !cs4
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 6
  !cs4
  !cs4
  db 12
  !cs4
  !subloop,2
  !loop : dw .sub3C28 : db 1
  !loop : dw .sub3B5C : db 1
  !loop : dw .sub3BB9 : db 1
  !subloop,0
  !loop : dw .sub3C79 : db 1
  !instr,!instr21
  !volume,185
  !pan,8
  db 12,$7F
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !loop : dw .sub3C79 : db 1
  !instr,!instr1E
  !volume,220
  !pan,10
  db 12,$7F
  !cs4
  db 6
  !cs4
  !cs4
  !subloop,15
  !amplify,0
  db 15,$7F
  !rest
  !instr,!instr27
  !vibrato,22,10,47
  !volume,165
  !pan,10
  !subtranspose,209
  !toggleEcho
  !transpose,2
  !subtranspose,191
  db 6
  !cs5
  !loop : dw .sub3C98 : db 1
  !loop : dw .sub3CA6 : db 1
  !loop : dw .sub3CBC : db 1
  !loop : dw .sub3CCC : db 1
  !loop : dw .sub3C98 : db 1
  !loop : dw .sub3CDE : db 1
  !loop : dw .sub3CBC : db 1
  db 6,$7F
  !fs5
  db 57
  !g5
  !subtranspose,191
  !transpose,0
  !toggleEcho
  !amplify,255
  !subtranspose,0
  !endVibrato
  !instr,!instr1F
  !volume,185
  !pan,10
  db 24
  !cs4
  db 12
  !cs4
  db 24
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 12
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  db 6
  !cs4
  !cs4
  !end

.pattern0_1
  !subtranspose,191
  db 96,$7F
  !rest
  !tie
  !tie
  db 48
  !tie
  !instr,!instr32
  !volume,255
  !pan,10
  !amplify,26
  db 36
  !gs4
  db 108
  !gs4
  db 24
  !a4
  db 36
  !gs4
  db 60
  !gs4
  !subtranspose,0
  !endVibrato
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,239
  !toggleEcho
  db 96
  !d5
  !amplify,0
  !toggleEcho
  !subtranspose,191
  !instr,!instr32
  !volume,255
  !pan,10
  !amplify,26
.pattern1_1:
  !transpose,0
  !loop : dw .sub3D68 : db 1
  !loop : dw .sub3D6F : db 1
  !transpose,252
  !loop : dw .sub3D68 : db 1
  !transpose,0
  !loop : dw .sub3D6F : db 1
  !loop : dw .sub3D68 : db 1
  !loop : dw .sub3D6F : db 1
  !transpose,252
  !loop : dw .sub3D68 : db 1
  !loop : dw .sub3D78 : db 1
  !loop : dw .sub3D68 : db 1
  !loop : dw .sub3D6F : db 1
  !transpose,252
  !loop : dw .sub3D68 : db 1
  !transpose,0
  !loop : dw .sub3D6F : db 1
  !loop : dw .sub3D68 : db 1
  !loop : dw .sub3D6F : db 1
  !transpose,252
  !loop : dw .sub3D68 : db 1
  !transpose,0
  db 12,$7F
  !g4
  !adsrGain,$7F,$F8
  db 96
  !tie
  !instr,!instr32
  !subloop,0
  !loop : dw .sub3D84 : db 1
  db 12,$7F
  !fs4
  !fs5
  !transpose,252
  !loop : dw .sub3D84 : db 1
  !loop : dw .sub3D8E : db 1
  !transpose,249
  !loop : dw .sub3D84 : db 1
  !transpose,0
  db 12,$7F
  !e4
  !e5
  !transpose,251
  !loop : dw .sub3D84 : db 1
  !loop : dw .sub3D8E : db 1
  !transpose,0
  !subloop,1
  !subloop,0
  !loop : dw .sub3D68 : db 1
  !loop : dw .sub3D6F : db 1
  !transpose,252
  !loop : dw .sub3D68 : db 1
  !loop : dw .sub3D78 : db 1
  !subloop,1
  !subloop,0
  !loop : dw .sub3D84 : db 1
  db 12,$7F
  !fs4
  !fs5
  !transpose,252
  !loop : dw .sub3D84 : db 1
  !loop : dw .sub3D8E : db 1
  !transpose,249
  !loop : dw .sub3D84 : db 1
  !transpose,0
  db 12,$7F
  !e4
  !e5
  !transpose,251
  !loop : dw .sub3D84 : db 1
  !loop : dw .sub3D8E : db 1
  !transpose,0
  !subloop,1
  !loop : dw .sub3D95 : db 1
  db 24,$7F
  !fs4
  !fs4
  db 36
  !fs4
  !loop : dw .sub3D95 : db 1
  db 12,$7F
  !fs4
  !adsrGain,$7F,$F8
  db 96
  !tie
  !instr,!instr32
  !subloop,0
  !loop : dw .sub3DA3 : db 1
  db 24,$7F
  !ds4
  !ds4
  !ds4
  db 12
  !ds4
  db 24
  !gs4
  !gs4
  !fs4
  !fs4
  db 12
  !fs4
  !subloop,2
  !loop : dw .sub3DA3 : db 1
  db 48,$7F
  !g4
  !g4
  !g4
  db 24
  !g4
  db 48
  !g4
  !g4
  !g4
  db 24
  !g4
  !loop : dw .sub3DB2 : db 2
  !transpose,0
  db 120,$7F
  !as4
  db 48
  !gs4
  db 96
  !fs4
  db 48
  !tie
  !gs4
  db 120
  !ds4
  db 48
  !fs4
  db 96
  !f4
  db 48
  !tie
  db 24
  !f4
  !gs4
  !loop : dw .sub3DD6 : db 1
  db 12,$7F
  !gs4
  !gs4
  !transpose,252
  !loop : dw .sub3DD6 : db 1
  db 12,$7F
  !as4
  !as4
  db 24
  !as4
  !transpose,249
  !loop : dw .sub3DD6 : db 1
  !transpose,0
  db 12,$7F
  !fs4
  !fs4
  db 36
  !f4
  !f4
  !f4
  db 24
  !f4
  db 12
  !f5
  !transpose,253
  !loop : dw .sub3D8E : db 1
  !end

.pattern0_2
  !subtranspose,0
  !endVibrato
  db 96,$7F
  !rest
  !tie
  !tie
  db 48
  !tie
  !instr,!instr22
  !volume,195
  !pan,10
  !subloop,0
  db 24,$7F
  !cs5
  !subloop,6
  !loop : dw .sub3D0F : db 8
  db 24,$7F
  !cs5
  !cs5
  !loop : dw .sub3D0F : db 4
  !toggleEcho
.pattern1_2:
  !transpose,0
  !subtranspose,0
  !endVibrato
  !toggleEcho
  !instr,!instr22
  !volume,195
  !pan,10
  !loop : dw .sub3D0F : db 56
  !toggleEcho
  !subtranspose,191
  !instr,!instr26
  !volume,225
  !vibrato,10,12,84
  !pan,10
  !loop : dw .sub3DE0 : db 1
  db 12,$7F
  !tie
  db 36
  !gs4
  db 24
  !as4
  !loop : dw .sub3DE0 : db 1
  !adsrGain,$7F,$F8
  db 90,$7F
  !tie
  !loop : dw .sub3DF0 : db 1
  !loop : dw .sub3C98 : db 1
  !loop : dw .sub3CA6 : db 1
  !loop : dw .sub3CBC : db 1
  !loop : dw .sub3CCC : db 1
  !loop : dw .sub3C98 : db 1
  !loop : dw .sub3CA6 : db 1
  !loop : dw .sub3CBC : db 1
  !loop : dw .sub3DFE : db 1
  !instr,!instr2D
  !volume,255
  !pan,138
  !amplify,255
  !endVibrato
  !subloop,0
  db 36,$7F
  !gs5
  db 96
  !gs5
  db 36
  !tie
  !subloop,2
  db 36,$7F
  !gs5
  db 126
  !gs5
  !amplify,0
  !loop : dw .sub3DF0 : db 1
  !loop : dw .sub3C98 : db 1
  !loop : dw .sub3CA6 : db 1
  !loop : dw .sub3CBC : db 1
  !loop : dw .sub3CCC : db 1
  !loop : dw .sub3C98 : db 1
  !loop : dw .sub3CDE : db 1
  !loop : dw .sub3CBC : db 1
  !loop : dw .sub3DFE : db 1
  !subtranspose,0
  !endVibrato
  !subloop,0
  !loop : dw .sub3CF5 : db 1
  !loop : dw .sub3D55 : db 2
  !loop : dw .sub3D44 : db 1
  !toggleEcho
  !subloop,2
  !loop : dw .sub3CF5 : db 1
  !loop : dw .sub3D44 : db 1
  db 12,$7F
  !cs5
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,239
  !toggleEcho
  db 84
  !d5
  !amplify,0
  !toggleEcho
  !loop : dw .sub3D44 : db 1
  !toggleEcho
  !subtranspose,191
  !instr,!instr29
  !volume,230
  !vibrato,16,11,68
  !pan,9
  !volume,230
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0A : db 3,0
  !loop : dw .sub3E10 : db 1
  db 36,$7F
  !gs5
  db 6
  !gs5
  !gs5
  db 12
  !g5
  !gs5
  !as5
  db 36
  !cs5
  !pitchSlide,0,10 : !ds5
  db 24
  !cs5
  db 12
  !ds5
  !g5
  db 24
  !a5
  !pitchSlide,0,10 : !b5
  db 36
  !as5
  db 6
  !b5
  !b5
  db 12
  !as5
  !b5
  !cs6
  db 36
  !cs6
  !pitchSlide,0,10 : !ds6
  db 24
  !cs6
  db 12
  !ds6
  !fs6
  db 24
  !fs6
  !pitchSlide,0,10 : !gs6
  db 36
  !as6
  db 6
  !as6
  !as6
  db 12
  !gs6
  !as6
  !b6
  db 36
  !b6
  !pitchSlide,0,10 : !cs7
  db 24
  !g6
  db 12
  !gs6
  !as6
  !b6
  db 24
  !as6
  db 12
  !gs6
  db 24
  !ds6
  db 36
  !b5
  db 12
  !rest
  !loop : dw .sub3E10 : db 1
  db 12,$7F
  !as5
  db 24
  !gs5
  db 12
  !g5
  !gs5
  !as5
  !rest
  db 36
  !cs5
  !pitchSlide,0,10 : !ds5
  db 12
  !cs5
  !ds5
  !g5
  !as5
  db 24
  !a5
  !pitchSlide,0,10 : !b5
  db 12
  !as5
  db 24
  !b5
  db 12
  !as5
  !b5
  !cs6
  !rest
  db 36
  !cs6
  !pitchSlide,0,10 : !ds6
  db 12
  !cs6
  !ds6
  !fs6
  !gs6
  db 24
  !gs6
  !pitchSlide,0,10 : !as6
  db 12
  !gs6
  db 24
  !as6
  db 12
  !gs6
  !as6
  !b6
  db 72
  !as6
  !pitchSlide,0,10 : !cs7
  !g6
  db 24
  !d6
  !pitchSlide,0,8 : !g6
  db 48
  !g6
  !g6
  !g6
  db 24
  !g6
  !instr,!instr2A
  !vibrato,8,12,50
  !volume,255
  !amplify,63
  !subloop,0
  !loop : dw .sub3E20 : db 3
  db 24,$7F
  !gs5
  !pitchSlide,0,10 : !cs6
  db 6
  !b5
  !rest
  db 30
  !b5
  db 6
  !rest
  db 12
  !fs5
  !pitchSlide,0,6 : !as5
  !rest
  !as5
  !rest
  db 6
  !as5
  !rest
  !as5
  !as5
  !loop : dw .sub3E20 : db 3
  db 24,$7F
  !gs5
  !pitchSlide,0,10 : !cs6
  db 6
  !b5
  !rest
  db 24
  !cs6
  db 6
  !ds6
  !rest
  db 12
  !as5
  !rest
  !as5
  !rest
  db 6
  !as5
  !as5
  !b5
  !c6
  !transpose,2
  !subloop,1
  !amplify,0
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0A : db 0,0
  !instr,!instr27
  !vibrato,22,10,47
  !pan,9
  !volume,245
  !loop : dw .sub3C98 : db 1
  !loop : dw .sub3CA6 : db 1
  !loop : dw .sub3CBC : db 1
  !loop : dw .sub3CCC : db 1
  !loop : dw .sub3C98 : db 1
  !loop : dw .sub3CDE : db 1
  !loop : dw .sub3CBC : db 1
  !loop : dw .sub3DFE : db 1
  !end

.pattern0_3
  !subtranspose,191
  !instr,!instr2F
  !volume,190
  !vibrato,10,10,47
  !pan,10
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0E : db 3,0
  !transpose,249
  !subloop,0
  !loop : dw .sub3E3B : db 1
  !loop : dw .sub3E45 : db 1
  !subloop,2
  !loop : dw .sub3E3B : db 1
  db 12,$7F
  !ds5
  db 96
  !rest
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0E : db 0,0
.pattern1_3:
  !transpose,0
  !instr,!instr2B
  !volume,150
  !endVibrato
  !pan,10
  !subloop,0
  !loop : dw .sub3E52 : db 1
  !loop : dw .sub3E60 : db 1
  !subloop,6
  !loop : dw .sub3E52 : db 1
  !instr,!instr2C
  !volume,205
  !pan,10
  db 12,$7F
  !ds6
  !gs6
  !ds7
  !ds6
  !gs6
  !ds7
  !gs6
  !instr,!instr22
  !volume,195
  !pan,10
  !subtranspose,0
  !endVibrato
  !toggleEcho
  !subloop,0
  !loop : dw .sub3D0F : db 11
  !loop : dw .sub3D13 : db 1
  !loop : dw .sub3D0F : db 8
  !loop : dw .sub3D2B : db 1
  !loop : dw .sub3D0F : db 4
  !subloop,1
  !toggleEcho
  !subtranspose,191
  !instr,!instr2B
  !volume,150
  !endVibrato
  !pan,10
  !subloop,0
  !loop : dw .sub3E52 : db 1
  !loop : dw .sub3E60 : db 1
  !loop : dw .sub3E52 : db 1
  !loop : dw .sub3E60 : db 1
  db 12,$2F
  !ds7
  !gs6
  !subloop,1
  !instr,!instr28
  !vibrato,22,10,54
  !volume,255
  !loop : dw .sub3E68 : db 2
  !dynamicPan,0,0
  !instr,!instr27
  !vibrato,22,10,47
  !pan,11
  !volume,210
  !loop : dw .sub3EA7 : db 1
  db 12,$7F
  !as5
  !e5
  db 84
  !b5
  db 24
  !b5
  db 12
  !gs5
  !e5
  !b5
  !as5
  !fs5
  db 24
  !ds5
  !e5
  db 12
  !gs5
  db 24
  !fs5
  !ds5
  db 36
  !b4
  db 24
  !e5
  db 12
  !ds5
  !cs5
  db 84
  !as4
  db 24
  !ds5
  db 12
  !as4
  !g4
  !as4
  !g4
  !g4
  !g4
  !as4
  !loop : dw .sub3EA7 : db 1
  !loop : dw .sub3EB5 : db 1
  !instr,!instr28
  !vibrato,22,10,54
  !volume,170
  !dynamicVolume,208,255
  !loop : dw .sub3E68 : db 2
  db 24,$7F
  !tie
  !dynamicVolume,0,0
  !dynamicPan,0,0
  !instr,!instr2E
  !volume,215
  !endVibrato
  !subloop,0
  !pan,9
  !dynamicPan,79,11
  db 12,$7F
  !gs4
  !b4
  !e5
  !gs5
  !e5
  !b4
  !gs4
  !b4
  !pan,11
  !dynamicPan,79,7
  !as4
  !cs5
  !fs5
  !as5
  !fs5
  !cs5
  !as4
  !cs5
  !loop : dw .sub3EDF : db 1
  db 12,$7F
  !as4
  !pan,11
  !dynamicPan,79,7
  !cs5
  !gs5
  !as5
  !b5
  !ds6
  !b5
  !as5
  !gs5
  !ds5
  !subloop,1
  !dynamicPan,0,0
  db 12,$7F
  !rest
  !instr,!instr29
  !volume,230
  !vibrato,16,11,68
  !pan,11
  !volume,205
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0A : db 3,0
  db 36
  !a5
  !pitchSlide,0,10 : !b5
  db 24
  !as5
  !gs5
  !e5
  !pitchSlide,0,10 : !fs5
  db 12
  !fs5
  db 24
  !e5
  db 12
  !ds5
  !e5
  !fs5
  !rest
  db 36
  !gs4
  !pitchSlide,0,10 : !as4
  db 12
  !as4
  !as4
  !ds5
  !g5
  db 24
  !fs5
  !pitchSlide,0,10 : !gs5
  db 12
  !fs5
  db 24
  !gs5
  db 12
  !fs5
  !gs5
  !as5
  !rest
  db 36
  !a5
  !pitchSlide,0,10 : !b5
  db 12
  !as5
  !b5
  !ds6
  !e6
  db 24
  !e6
  !pitchSlide,0,10 : !fs6
  db 12
  !e6
  db 24
  !fs6
  db 12,$7E
  !e6
  db 12,$7D
  !fs6
  db 12,$7C
  !gs6
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0A : db 0,0
  !instr,!instr2E
  !volume,215
  !endVibrato
  !subloop,0
  !loop : dw .sub3EDF : db 1
  db 12,$7F
  !as4
  !cs5
  !loop : dw .sub3EDF : db 1
  !subloop,1
  !dynamicPan,0,0
  !instr,!instr2A
  !vibrato,8,12,50
  !volume,250
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0A : db 3,0
  !subloop,0
  !loop : dw .sub3EED : db 3
  db 24,$7F
  !f5
  !pitchSlide,0,10 : !as5
  db 6
  !gs5
  !rest
  db 30
  !gs5
  db 6
  !rest
  db 12
  !d5
  !pitchSlide,0,6 : !fs5
  !rest
  !fs5
  !rest
  db 6
  !fs5
  !rest
  !fs5
  !fs5
  !loop : dw .sub3EED : db 3
  db 24,$7F
  !f5
  !pitchSlide,0,10 : !as5
  db 6
  !gs5
  !rest
  db 24
  !as5
  db 6
  !b5
  !rest
  db 12
  !g5
  !rest
  !g5
  !rest
  db 6
  !g5
  !g5
  !gs5
  !a5
  !transpose,2
  !subloop,1
  !transpose,0
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0A : db 0,0
  !instr,!instr30
  !vibrato,0,12,30
  !pan,10
  !volume,170
  !loop : dw .sub3F08 : db 1
  db 96,$7F
  !a4
  db 48
  !tie
  !a4
  !instr,!instr27
  !vibrato,22,10,47
  !pan,11
  !volume,210
  !transpose,2
  !loop : dw .sub3EA7 : db 1
  !loop : dw .sub3EB5 : db 1
  !end

.pattern0_4
  !subtranspose,191
  !instr,!instr2F
  !volume,190
  !vibrato,10,10,47
  !pan,13
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0E : db 3,0
  !subloop,0
  !loop : dw .sub3E3B : db 1
  !loop : dw .sub3E45 : db 1
  !subloop,2
  !loop : dw .sub3E3B : db 1
  db 12,$7F
  !ds5
  db 96
  !rest
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0E : db 0,0
.pattern1_4:
  !instr,!instr2F
  !volume,190
  !vibrato,10,10,47
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0E : db 3,0
  !subloop,0
  !loop : dw .sub3E3B : db 1
  !loop : dw .sub3F17 : db 1
  !transpose,252
  !loop : dw .sub3E3B : db 1
  !transpose,0
  !loop : dw .sub3F17 : db 1
  !subloop,2
  !loop : dw .sub3E3B : db 1
  !loop : dw .sub3F17 : db 1
  !transpose,252
  !loop : dw .sub3E3B : db 1
  !transpose,0
  db 12,$7F
  !cs5
  db 108
  !rest
  !pan,7
  !loop : dw .sub3F24 : db 1
  db 96,$7F
  !ds5
  db 36
  !tie
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  !loop : dw .sub3F40 : db 1
  db 96,$7F
  !ds5
  db 84
  !tie
  !pan,13
  !loop : dw .sub3E3B : db 1
  !loop : dw .sub3F17 : db 1
  !transpose,252
  !loop : dw .sub3E3B : db 1
  !transpose,0
  !loop : dw .sub3F17 : db 1
  !loop : dw .sub3E3B : db 1
  !loop : dw .sub3F17 : db 1
  !transpose,252
  !loop : dw .sub3E3B : db 1
  !transpose,0
  !loop : dw .sub3F17 : db 1
  db 12,$7F
  !rest
  !pan,7
  !loop : dw .sub3F5C : db 1
  db 96,$7F
  !ds5
  db 36
  !tie
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  !loop : dw .sub3F78 : db 1
  db 96,$7F
  !ds5
  db 84
  !tie
  db 72
  !rest
  db 96
  !ds5
  db 84
  !ds5
  !cs5
  db 72
  !rest
  db 96
  !ds5
  db 84
  !ds5
  db 12
  !cs5
  db 96
  !rest
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0E : db 0,0
  !instr,!instr30
  !vibrato,0,12,30
  !pan,13
  !volume,170
  !subloop,0
  db 84,$7F
  !e5
  db 108
  !fs5
  db 84
  !ds5
  db 48
  !gs5
  db 60
  !fs5
  !subloop,2
  db 84,$7F
  !e5
  db 108
  !fs5
  !instr,!instr30
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0E : db 3,0
  !loop : dw .sub3F94 : db 2
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0E : db 0,0
  !instr,!instr31
  !volume,215
  !vibrato,10,10,47
  !subloop,0
  !loop : dw .sub3F9E : db 4
  !loop : dw .sub3FA7 : db 3
  db 36,$7F
  !e5
  !e5
  db 24
  !g5
  !g5
  !g5
  !transpose,2
  !subloop,1
  !transpose,0
  !instr,!instr30
  !vibrato,0,12,30
  !volume,170
  !loop : dw .sub3FB0 : db 1
  db 48,$7F
  !f5
  !loop : dw .sub3FB0 : db 1
  db 48,$7F
  !tie
  !end

.pattern0_5
  !subtranspose,191
  !instr,!instr2F
  !volume,190
  !vibrato,10,10,47
  !pan,7
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0E : db 3,0
  !transpose,252
  !subloop,0
  !loop : dw .sub3E3B : db 1
  db 12,$7F
  !ds5
  !rest
  db 6
  !ds5
  !rest
  db 12
  !ds5
  !rest
  db 24
  !f5
  !subloop,2
  !loop : dw .sub3E3B : db 1
  db 12,$7F
  !ds5
  db 96
  !rest
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0E : db 0,0
.pattern1_5:
  !instr,!instr2F
  !volume,190
  !vibrato,10,10,47
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0E : db 3,0
  !subloop,0
  !transpose,252
  !loop : dw .sub3E3B : db 1
  !transpose,253
  !loop : dw .sub3F17 : db 1
  !transpose,0
  !transpose,249
  !loop : dw .sub3E3B : db 1
  !transpose,0
  !transpose,253
  !loop : dw .sub3F17 : db 1
  !transpose,0
  !subloop,2
  !transpose,252
  !loop : dw .sub3E3B : db 1
  !transpose,253
  !loop : dw .sub3F17 : db 1
  !transpose,0
  !transpose,249
  !loop : dw .sub3E3B : db 1
  !transpose,0
  !transpose,0
  db 12,$7F
  !as4
  db 102
  !rest
  !pan,10
  !loop : dw .sub3FC3 : db 1
  db 96,$7F
  !as4
  db 42
  !tie
  db 6
  !rest
  db 42
  !as4
  db 6
  !rest
  !loop : dw .sub3FC3 : db 1
  db 96,$7F
  !as4
  db 90
  !tie
  !subloop,0
  !transpose,252
  !loop : dw .sub3E3B : db 1
  !transpose,253
  !loop : dw .sub3F17 : db 1
  !transpose,0
  !transpose,249
  !loop : dw .sub3E3B : db 1
  !transpose,0
  !transpose,253
  !loop : dw .sub3F17 : db 1
  !transpose,0
  !subloop,1
  db 6,$7F
  !rest
  !pan,10
  !loop : dw .sub3FC3 : db 1
  db 96,$7F
  !as4
  db 42
  !tie
  db 6
  !rest
  db 42
  !as4
  db 6
  !rest
  !loop : dw .sub3FC3 : db 1
  db 96,$7F
  !as4
  db 90
  !tie
  db 36
  !rest
  db 96
  !b4
  db 36
  !tie
  db 84
  !b4
  !as4
  db 36
  !rest
  db 96
  !b4
  db 36
  !tie
  db 84
  !b4
  db 12
  !as4
  db 96
  !rest
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0E : db 0,0
  !instr,!instr30
  !vibrato,0,12,30
  !pan,7
  !volume,170
  !subloop,0
  db 84,$7F
  !b4
  db 108
  !cs5
  db 84
  !as4
  db 48
  !ds5
  db 60
  !cs5
  !subloop,2
  db 84,$7F
  !b4
  db 108
  !cs5
  !instr,!instr30
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0E : db 3,0
  !transpose,252
  !loop : dw .sub3F94 : db 2
  !transpose,0
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0E : db 0,0
  !instr,!instr31
  !volume,215
  !vibrato,10,10,47
  !subloop,0
  !loop : dw .sub3FDF : db 7
  !loop : dw .sub3FE8 : db 1
  !transpose,2
  !subloop,1
  !transpose,0
  !instr,!instr30
  !vibrato,0,12,30
  !volume,170
  !loop : dw .sub3FF1 : db 1
  db 48,$7F
  !c5
  !loop : dw .sub3FF1 : db 1
  db 48,$7F
  !tie
  !end

.pattern0_6
  !subtranspose,0
  !endVibrato
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
.pattern1_6:
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,239
  !toggleEcho
  db 96
  !d5
  !tie
  !amplify,0
  db 96
  !rest
  !tie
  !tie
  !tie
  db 84
  !tie
  !instr,!instr26
  !volume,225
  !vibrato,10,12,84
  !pan,10
  !subtranspose,191
  db 6
  !a4
  !as4
  !subtranspose,0
  !endVibrato
  !loop : dw .sub3CF5 : db 1
  !loop : dw .sub3D0F : db 45
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,239
  !toggleEcho
  db 84,$7F
  !d5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,195
  !pan,10
  !loop : dw .sub3D0F : db 2
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,239
  !toggleEcho
  db 36,$7F
  !d5
  !amplify,0
  !subtranspose,191
  !instr,!instr27
  !vibrato,22,10,47
  !volume,165
  !pan,10
  !subtranspose,209
  !subtranspose,191
  db 3
  !ds5
  db 12
  !gs5
  db 24
  !as5
  !ds5
  !b5
  db 12
  !ds5
  !b5
  !gs5
  !loop : dw .sub3CA6 : db 1
  !loop : dw .sub3CBC : db 1
  db 78,$7F
  !ds5
  db 6
  !fs5
  db 24
  !g5
  db 12
  !ds5
  !as4
  !cs5
  !b4
  !as4
  db 9
  !b4
  !subtranspose,191
  !subtranspose,0
  !endVibrato
  !loop : dw .sub3CF5 : db 1
  !loop : dw .sub3D0F : db 7
  !loop : dw .sub3D13 : db 1
  !loop : dw .sub3D0F : db 8
  !loop : dw .sub3D2B : db 1
  !loop : dw .sub3D0F : db 15
  !loop : dw .sub3D13 : db 1
  !loop : dw .sub3D0F : db 8
  !loop : dw .sub3D2B : db 1
  !loop : dw .sub3D0F : db 4
  !subloop,0
  !toggleEcho
  !loop : dw .sub3CF5 : db 1
  !loop : dw .sub3D0F : db 24
  !subloop,1
  !subloop,0
  !toggleEcho
  !loop : dw .sub3CF5 : db 1
  !loop : dw .sub3D0F : db 7
  !loop : dw .sub3D13 : db 1
  !loop : dw .sub3D0F : db 8
  !loop : dw .sub3D2B : db 1
  !loop : dw .sub3D0F : db 15
  !loop : dw .sub3D13 : db 1
  !loop : dw .sub3D0F : db 8
  !loop : dw .sub3D2B : db 1
  !loop : dw .sub3D0F : db 4
  !subloop,1
  !instr,!instr27
  !vibrato,22,10,47
  !pan,9
  !volume,245
  !subtranspose,191
  !toggleEcho
  db 96,$7F
  !gs5
  !tie
  !tie
  db 72
  !tie
  db 96
  !rest
  !tie
  !tie
  db 12
  !tie
  !instr,!instr29
  !volume,230
  !vibrato,16,11,68
  !volume,230
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0A : db 3,0
  db 12,$7D
  !as5
  db 12,$7E
  !b5
  db 12,$7F
  !cs6
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0A : db 0,0
  !subtranspose,0
  !endVibrato
  !subloop,0
  !loop : dw .sub3CF5 : db 1
  !loop : dw .sub3D44 : db 14
  !toggleEcho
  !subloop,2
  !loop : dw .sub3CF5 : db 1
  !loop : dw .sub3D44 : db 6
  !subloop,0
  !toggleEcho
  !loop : dw .sub3CF5 : db 1
  !loop : dw .sub3D55 : db 2
  !loop : dw .sub3D44 : db 1
  !subloop,1
  !subloop,0
  !toggleEcho
  !loop : dw .sub3CF5 : db 1
  !loop : dw .sub3D0F : db 44
  !subloop,3
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,239
  !toggleEcho
  db 96,$7F
  !d5
  db 72
  !tie
  !amplify,0
  !toggleEcho
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  db 72
  !tie
  !instr,!instr22
  !volume,195
  !pan,10
  !loop : dw .sub3D0F : db 60
  !end

.pattern0_7
  !subtranspose,191
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
.pattern1_7:
  !instr,!instr2F
  !volume,190
  !vibrato,10,10,47
  !pan,10
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0E : db 3,0
  !transpose,249
  !loop : dw .sub3E3B : db 1
  !transpose,0
  !loop : dw .sub4004 : db 1
  !loop : dw .sub4011 : db 1
  !loop : dw .sub4004 : db 1
  !transpose,249
  !loop : dw .sub3E3B : db 1
  !transpose,0
  !loop : dw .sub4004 : db 1
  !loop : dw .sub401B : db 1
  !transpose,1
  !loop : dw .sub4004 : db 1
  !transpose,0
  !transpose,249
  !loop : dw .sub3E3B : db 1
  !transpose,0
  !loop : dw .sub4004 : db 1
  !loop : dw .sub4025 : db 1
  !loop : dw .sub4004 : db 1
  !transpose,249
  !loop : dw .sub3E3B : db 1
  !transpose,0
  !loop : dw .sub4004 : db 1
  !loop : dw .sub402F : db 1
  db 12,$7F
  !g4
  db 96
  !rest
  !pan,13
  !loop : dw .sub4039 : db 1
  db 48,$7F
  !g4
  !loop : dw .sub4039 : db 1
  db 48,$7F
  !tie
  !pan,10
  !subloop,0
  !transpose,249
  !loop : dw .sub3E3B : db 1
  !transpose,0
  !loop : dw .sub4004 : db 1
  !loop : dw .sub404C : db 1
  !transpose,1
  !loop : dw .sub4004 : db 1
  !transpose,0
  !subloop,1
  !pan,13
  !loop : dw .sub4039 : db 1
  db 48,$7F
  !g4
  !loop : dw .sub4039 : db 1
  db 48,$7F
  !tie
  !loop : dw .sub4056 : db 1
  db 72,$7F
  !tie
  !loop : dw .sub4056 : db 1
  db 96,$7F
  !rest
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0E : db 0,0
  !instr,!instr30
  !vibrato,0,12,30
  !pan,10
  !volume,170
  !subloop,0
  db 84,$7F
  !gs4
  db 108
  !as4
  db 84
  !g4
  db 48
  !b4
  db 60
  !as4
  !subloop,2
  db 84,$7F
  !gs4
  db 108
  !as4
  !instr,!instr30
  !remoteCode : dw .remoteCode3A07 : db -1,0
  !remoteCode : dw .remoteCode3A0E : db 3,0
  !transpose,247
  !loop : dw .sub3F94 : db 1
  db 24,$7F
  !g5
  !rest
  !g5
  !rest
  !g5
  !rest
  db 8
  !g5
  !transpose,0
  !remoteCode : dw .remoteCode3A07 : db 0,0
  !remoteCode : dw .remoteCode3A0E : db 0,0
  !instr,!instr2A
  !vibrato,8,12,50
  !pan,9
  !volume,255
  !amplify,63
  !toggleLegato
  db 4,$7B
  !b4
  db 4,$7C
  !d5
  db 4,$7D
  !f5
  db 2,$7E
  !gs5
  !toggleLegato
  !tie
  !amplify,0
  !instr,!instr31
  !volume,215
  !vibrato,10,10,47
  !pan,10
  !subloop,0
  !loop : dw .sub4060 : db 7
  !loop : dw .sub4069 : db 1
  !transpose,2
  !subloop,1
  !transpose,0
  db 24,$7F
  !rest
  !instr,!instr30
  !vibrato,0,12,30
  !volume,140
  !subtranspose,209
  !loop : dw .sub3FB0 : db 1
  db 24,$7F
  !f4
  !subtranspose,191
  !volume,170
  !loop : dw .sub3F08 : db 1
  db 96,$7F
  !a4
  !tie
  !end

.sub3A12
  db 12,$7F
  !cs4
  !instr,!instr20
  !volume,185
  !pan,12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr21
  !volume,185
  !pan,8
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !end

.sub3A40
  !instr,!instr20
  !volume,185
  !pan,12
  db 12,$7F
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr21
  !volume,185
  !pan,8
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 6
  !cs4
  !cs4
  !end

.sub3A76
  !instr,!instr20
  !volume,185
  !pan,12
  db 12,$7F
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 6
  !cs4
  !cs4
  db 12
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !end

.sub3AA7
  !instr,!instr1E
  !volume,220
  !pan,10
  db 12,$7F
  !cs4
  !instr,!instr20
  !volume,185
  !pan,12
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr22
  !volume,195
  !pan,10
  !amplify,0
  !cs5
  !amplify,255
  !instr,!instr1E
  !volume,220
  !pan,10
  db 6
  !cs4
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12
  !cs4
  !end

.sub3AE4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 12,$7F
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr20
  !volume,185
  !pan,12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 6
  !cs4
  !cs4
  db 12
  !cs4
  !instr,!instr21
  !volume,185
  !pan,8
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !end

.sub3B29
  !instr,!instr1E
  !volume,220
  !pan,10
  db 12,$7F
  !cs4
  !instr,!instr20
  !volume,185
  !pan,12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 6
  !cs4
  !cs4
  db 12
  !cs4
  !instr,!instr21
  !volume,185
  !pan,8
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 6
  !cs4
  !cs4
  !end

.sub3B5C
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12,$7F
  !cs4
  !instr,!instr22
  !volume,195
  !pan,10
  !amplify,0
  !cs5
  !cs5
  !amplify,255
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 36
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12
  !cs4
  db 24
  !cs4
  db 6
  !cs4
  !cs4
  db 12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 24
  !cs4
  db 12
  !cs4
  !instr,!instr22
  !volume,195
  !pan,10
  !amplify,0
  !cs5
  !cs5
  !amplify,255
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 24
  !cs4
  !end

.sub3BB9
  db 12,$7F
  !tie
  !instr,!instr1F
  !volume,185
  !pan,10
  db 24
  !cs4
  db 12
  !cs4
  db 6
  !cs4
  !cs4
  db 12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 6
  !cs4
  !cs4
  db 12
  !cs4
  !end

.sub3BD7
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12,$7F
  !cs4
  !instr,!instr22
  !volume,195
  !pan,10
  !amplify,0
  !cs5
  !amplify,255
  !instr,!instr1E
  !volume,220
  !pan,10
  db 24
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12
  !cs4
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 24
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 12
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 24
  !cs4
  db 12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 24
  !cs4
  !end

.sub3C28
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12,$7F
  !cs4
  !instr,!instr22
  !volume,195
  !pan,10
  !amplify,0
  !cs5
  !amplify,255
  !instr,!instr1E
  !volume,220
  !pan,10
  db 24
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12
  !cs4
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 24
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 12
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  db 24
  !cs4
  db 12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  db 24
  !cs4
  !end

.sub3C79
  !instr,!instr1F
  !volume,185
  !pan,10
  db 12,$7F
  !cs4
  !instr,!instr20
  !volume,185
  !pan,12
  !cs4
  !instr,!instr1E
  !volume,220
  !pan,10
  !cs4
  !instr,!instr1F
  !volume,185
  !pan,10
  !cs4
  !end

.sub3C98
  db 24,$7F
  !ds5
  db 12
  !gs5
  db 24
  !as5
  !ds5
  !b5
  db 12
  !ds5
  !b5
  !gs5
  !end

.sub3CA6
  db 12,$7F
  !cs6
  !gs5
  db 6
  !d6
  db 72
  !ds6
  db 6
  !d6
  db 24
  !ds6
  db 12
  !b5
  !gs5
  !ds6
  !cs6
  !as5
  db 24
  !fs5
  !gs5
  !end

.sub3CBC
  db 12,$7F
  !b5
  db 24
  !as5
  !fs5
  db 30
  !ds5
  db 6
  !g5
  db 24
  !gs5
  db 12
  !fs5
  !e5
  !end

.sub3CCC
  db 78,$7F
  !ds5
  db 6
  !fs5
  db 24
  !g5
  db 12
  !ds5
  !as4
  !cs5
  !b4
  !as4
  !b4
  db 6
  !cs5
  !d5
  !end

.sub3CDE
  db 12,$7F
  !ds6
  !b5
  db 6
  !ds6
  db 72
  !e6
  db 6
  !ds6
  db 24
  !e6
  db 12
  !cs6
  !gs5
  !e6
  !ds6
  !cs6
  !e5
  !fs5
  !gs5
  !ds5
  !end

.sub3D68
  db 36,$7F
  !gs4
  db 24
  !gs5
  !gs4
  !end

.sub3D6F
  db 24,$7F
  !fs4
  db 12
  !cs5
  db 24
  !fs4
  !fs5
  !end

.sub3D78
  !transpose,0
  db 24,$7F
  !g4
  db 12
  !cs5
  db 24
  !g4
  !g5
  !end

.sub3D84
  db 36,$7F
  !gs4
  !gs5
  !gs4
  db 24
  !gs4
  db 12
  !gs5
  !end

.sub3D8E
  db 12,$7F
  !gs4
  !gs4
  db 24
  !gs5
  !end

.sub3D95
  db 36,$7F
  !gs4
  db 48
  !gs4
  db 24
  !gs4
  !gs4
  db 36
  !gs4
  !e4
  db 48
  !e4
  !end

.sub3DA3
  db 24,$7F
  !e4
  !e4
  !e4
  db 12
  !e4
  db 24
  !fs4
  !fs4
  !fs4
  !fs4
  db 12
  !fs4
  !end

.sub3DB2
  !subloop,0
  db 36,$7F
  !gs4
  !gs4
  db 24
  !fs4
  !fs4
  !fs4
  !subloop,3
  !subloop,0
  db 36,$7F
  !e4
  !e4
  db 24
  !ds4
  !ds4
  !ds4
  !subloop,2
  db 36,$7F
  !e4
  !e4
  db 24
  !g4
  !g4
  !g4
  !transpose,2
  !end

.sub3DD6
  db 36,$7F
  !as4
  !as4
  !as4
  db 24
  !as4
  db 12
  !as4
  !end

.sub3D0F
  db 12,$7F
  !cs5
  !end

.sub3DE0
  db 36,$7F
  !b4
  !cs5
  db 60
  !ds5
  db 24
  !cs5
  db 12
  !b4
  db 36
  !gs4
  !ds4
  db 24
  !as4
  !end

.sub3DF0
  !instr,!instr27
  !vibrato,22,10,47
  !pan,9
  !volume,245
  db 6,$7F
  !cs5
  !end

.sub3DFE
  db 6,$7F
  !fs5
  db 72
  !g5
  db 6
  !fs5
  db 24
  !g5
  db 12
  !ds5
  !g5
  !ds5
  !as5
  !g5
  !ds5
  !as5
  !end

.sub3CF5
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,239
  db 36,$7F
  !d5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,195
  !pan,10
  db 12
  !cs5
  !end

.sub3D55
  !instr,!instr23
  !volume,195
  !pan,11
  db 12,$7F
  !cs5
  !instr,!instr22
  !volume,195
  !pan,10
  !cs5
  !cs5
  !cs5
  !end

.sub3D44
  !instr,!instr23
  !volume,195
  !pan,11
  db 12,$7F
  !cs5
  !instr,!instr22
  !volume,195
  !pan,10
  !cs5
  !end

.sub3E10
  db 36,$7F
  !cs6
  !pitchSlide,0,10 : !ds6
  db 24
  !cs6
  !b5
  !gs5
  !pitchSlide,0,10 : !as5
  !end

.sub3E20
  db 24,$7F
  !gs5
  !pitchSlide,0,10 : !b5
  db 12
  !rest
  db 24
  !b5
  db 12
  !rest
  !fs5
  !pitchSlide,0,6 : !as5
  !rest
  !as5
  !rest
  db 6
  !as5
  !rest
  !as5
  !as5
  !end

.sub3E3B
  db 24,$7F
  !ds5
  db 12
  !rest
  !ds5
  !rest
  !ds5
  !rest
  !end

.sub3E45
  db 12,$7F
  !ds5
  !rest
  db 6
  !ds5
  !rest
  db 12
  !ds5
  !rest
  db 24
  !e5
  !end

.sub3E52
  db 12,$2F
  !gs6
  !ds6
  !ds7
  !gs6
  !ds6
  !gs6
  !ds7
  !gs6
  db 12,$2A
  !gs6
  !end

.sub3E60
  db 12,$2F
  !ds6
  !gs6
  !ds7
  !ds6
  !gs6
  !end

.sub3D13
  !instr,!instr1F
  !volume,185
  !pan,10
  !amplify,255
  db 12,$7F
  !cs4
  !amplify,0
  !instr,!instr22
  !volume,195
  !pan,10
  !cs5
  !cs5
  !end

.sub3D2B
  db 12,$7F
  !cs5
  !instr,!instr1E
  !volume,220
  !pan,10
  !amplify,255
  !cs4
  !amplify,0
  !instr,!instr22
  !volume,195
  !pan,10
  !cs5
  !cs5
  !end

.sub3E68
  !pan,9
  !dynamicPan,79,11
  db 24,$7F
  !f5
  !pitchSlide,0,8 : !as5
  db 12
  !ds5
  db 24
  !b5
  !ds5
  !pan,11
  !dynamicPan,79,7
  !a5
  !pitchSlide,0,8 : !cs6
  db 12
  !ds5
  db 24
  !cs6
  !b5
  !pan,9
  !dynamicPan,79,11
  !f5
  !pitchSlide,0,8 : !as5
  db 12
  !e5
  db 24
  !b5
  !e5
  !pan,11
  !dynamicPan,79,7
  !a5
  !pitchSlide,0,8 : !cs6
  db 12
  !e5
  db 24
  !cs6
  !b5
  !end

.sub3EA7
  db 24,$7F
  !b4
  db 12
  !ds5
  db 24
  !fs5
  !b4
  !gs5
  db 12
  !b4
  !gs5
  !e5
  !end

.sub3EB5
  db 12,$7F
  !b5
  !gs5
  db 84
  !cs6
  db 24
  !cs6
  db 12
  !as5
  !e5
  !cs6
  !b5
  !as5
  !cs5
  !ds5
  !e5
  !b4
  !gs5
  db 24
  !fs5
  !ds5
  db 36
  !b4
  db 24
  !e5
  db 12
  !ds5
  !cs5
  db 84
  !ds5
  db 24
  !ds5
  db 12
  !as4
  !ds5
  !as4
  !g5
  !ds5
  !as4
  !g5
  !end

.sub3EDF
  !pan,9
  !dynamicPan,79,11
  db 12,$7F
  !as4
  !cs5
  !g5
  !as5
  !g5
  !cs5
  !end

.sub3EED
  db 24,$7F
  !f5
  !pitchSlide,0,10 : !gs5
  db 12
  !rest
  db 24
  !gs5
  db 12
  !rest
  !d5
  !pitchSlide,0,6 : !fs5
  !rest
  !fs5
  !rest
  db 6
  !fs5
  !rest
  !fs5
  !fs5
  !end

.sub3F08
  db 120,$7F
  !as4
  db 48
  !gs4
  db 96
  !fs4
  db 48
  !tie
  !gs4
  db 120
  !fs4
  db 48
  !gs4
  !end

.sub3F17
  db 12,$7F
  !cs5
  !rest
  db 6
  !cs5
  !rest
  db 12
  !cs5
  !rest
  db 24
  !cs5
  !end

.sub3F24
  db 108,$7F
  !ds5
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  db 96
  !b4
  db 36
  !tie
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  db 108
  !cs5
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  !end

.sub3F40
  db 108,$7F
  !ds5
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  db 96
  !b4
  db 36
  !tie
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  db 108
  !cs5
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  !end

.sub3F5C
  db 108,$7F
  !ds5
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  db 96
  !b4
  db 36
  !tie
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  db 108
  !cs5
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  !end

.sub3F78
  db 108,$7F
  !ds5
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  db 96
  !b4
  db 36
  !tie
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  db 108
  !cs5
  db 12
  !rest
  db 36
  !cs5
  db 12
  !rest
  !end

.sub3F94
  db 24,$7F
  !g5
  !rest
  !g5
  !rest
  !g5
  !rest
  !g5
  !end

.sub3F9E
  db 36,$7F
  !ds5
  !ds5
  db 24
  !cs5
  !cs5
  !cs5
  !end

.sub3FA7
  db 36,$7F
  !e5
  !e5
  db 24
  !ds5
  !ds5
  !ds5
  !end

.sub3FB0
  db 120,$7F
  !f5
  db 48
  !ds5
  db 96
  !cs5
  db 48
  !tie
  !ds5
  db 120
  !ds5
  db 48
  !ds5
  db 96
  !f5
  db 48
  !tie
  !end

.sub3FC3
  db 114,$7F
  !b4
  db 6
  !rest
  db 42
  !as4
  db 6
  !rest
  db 96
  !gs4
  db 42
  !tie
  db 6
  !rest
  db 42
  !as4
  db 6
  !rest
  db 114
  !gs4
  db 6
  !rest
  db 42
  !as4
  db 6
  !rest
  !end

.sub3FDF
  db 36,$7F
  !b4
  !b4
  db 24
  !as4
  !as4
  !as4
  !end

.sub3FE8
  db 36,$7F
  !b4
  !b4
  db 24
  !cs5
  !cs5
  !cs5
  !end

.sub3FF1
  db 120,$7F
  !cs5
  db 48
  !c5
  db 96
  !as4
  db 48
  !tie
  !c5
  db 120
  !as4
  db 48
  !c5
  db 96
  !c5
  db 48
  !tie
  !end

.sub4004
  db 12,$7F
  !fs4
  !rest
  db 6
  !fs4
  !rest
  db 12
  !fs4
  !rest
  db 24
  !fs4
  !end

.sub4011
  db 24,$7F
  !e4
  db 12
  !rest
  !e4
  !rest
  !e4
  !rest
  !end

.sub401B
  db 24,$7F
  !e4
  db 12
  !rest
  !e4
  !rest
  !e4
  !rest
  !end

.sub4025
  db 24,$7F
  !e4
  db 12
  !rest
  !e4
  !rest
  !e4
  !rest
  !end

.sub402F
  db 24,$7F
  !e4
  db 12
  !rest
  !e4
  !rest
  !e4
  !rest
  !end

.sub4039
  db 120,$7F
  !gs4
  db 48
  !fs4
  db 96
  !e4
  db 48
  !tie
  !fs4
  db 120
  !e4
  db 48
  !fs4
  db 96
  !g4
  db 48
  !tie
  !end

.sub404C
  db 24,$7F
  !e4
  db 12
  !rest
  !e4
  !rest
  !e4
  !rest
  !end

.sub4056
  db 96,$7F
  !gs4
  db 72
  !tie
  db 84
  !gs4
  db 12
  !fs4
  !end

.sub4060
  db 36,$7F
  !gs4
  !gs4
  db 24
  !fs4
  !fs4
  !fs4
  !end

.sub4069
  db 36,$7F
  !gs4
  !gs4
  db 24
  !as4
  !as4
  !as4
  !end

.remoteCode3A07
  !restoreInstrument
  !end

.remoteCode3A0A
  !adsrGain,$7F,$F5
  !end

.remoteCode3A0E
  !adsrGain,$7F,$F7
  !end

;assert pc() <= $10000-(6*$800)
assert pc() <= $10000-(5*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
