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
!instrGura = $2B

!sample0C = $16
!sample14 = $17
!sample15 = $18
!sample16 = $19
!sample17 = $1A
!sample18 = $1B
!sample19 = $1C
!sample1A = $1D
!sample1B = $1E
!sample1C = $1F
!sample1D = $20
!sample1E = $21
!sample1F = $22
!sample20 = $23
!sampleGura = $24

spcblock !sound2InstructionLists_low+$59-1 nspc
  db Sound59
endspcblock

spcblock !sound2InstructionLists_high+$59-1 nspc
  db Sound59>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample1D,$9F,$F4,$B8,$15,$40
  db !sample1E,$CF,$F8,$B8,$11,$00
  db !sample1D,$FF,$F1,$B8,$0A,$00
  db !sample1F,$FF,$FB,$B8,$0B,$00
  db !sample1F,$FF,$F4,$B8,$0A,$A0
  db !sample1F,$9F,$F4,$B8,$0A,$00
  db !sample20,$9F,$F2,$B8,$0A,$00
  db !sample20,$9F,$F3,$B8,$0A,$00
  db !sample14,$FF,$F0,$B8,$04,$00
  db !sample15,$AE,$EA,$B8,$02,$A0
  db !sample16,$CF,$AA,$B8,$03,$00
  db !sample17,$9F,$CC,$B8,$06,$00
  db !sample18,$FF,$CC,$B8,$06,$00
  db !sample19,$AF,$D0,$B8,$04,$02
  db !sample19,$AF,$D2,$B8,$04,$02
  db !sample1A,$FF,$E4,$B8,$02,$F0
  db !sample1B,$FA,$E0,$B8,$01,$E8
  db !sample0C,$F7,$E4,$B8,$03,$00
  db !sample1B,$F8,$E4,$B8,$01,$E8
  db !sample15,$F8,$E4,$B8,$01,$50
  db !sample1C,$FF,$EC,$B8,$05,$C0
  db !sampleGura,$FF,$E0,$80,$01,$EA
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample0C,Sample0C+36
  dw Sample14,Sample14+675
  dw Sample15,Sample15+2502
  dw Sample16,Sample16+1683
  dw Sample17,Sample17+945
  dw Sample18,Sample18+9
  dw Sample19,Sample19+27
  dw Sample1A,Sample1A+972
  dw Sample1B,Sample1B+9
  dw Sample1C,Sample1C+1845
  dw Sample1D,Sample1D+909
  dw Sample1E,Sample1E+1584
  dw Sample1F,Sample1F+234
  dw Sample20,Sample20+909
  dw SampleGura,SampleGura
endspcblock

pushpc
org !p_songSpecificData ; sample data
  Sample0C: skip filesize("0C SMW @13.brr")-2
  Sample15: skip filesize("XG Sawtooth.brr")-2
  Sample16: skip filesize("DKNI4 Synth Brass.brr")-2
  Sample18: skip filesize("SOI Pulse 25% O4 High.brr")-2
  Sample1B: skip filesize("Wind String Ens.brr")-2
  Sample1C: skip filesize("S3 Slap Bass II.brr")-2
  Sample1D: skip filesize("Yasui Snare.brr")-2
  Sample1E: skip filesize("DR-880 Kick.brr")-2
  Sample1F: skip filesize("TR-909 Hi-Hat.brr")-2
  Sample20: skip filesize("R-8 Crash Cym.brr")-2
  Sample14:
pullpc

spcblock Sample14 nspc
  incbin "Wind Glock.brr":2..0
  Sample17: incbin "JV1080 Creamy Guitar Lead.brr":2..0
  Sample19: incbin "Chrono Elec Piano 2.brr":2..0
  Sample1A: incbin "MMPRTM Dist Guitar.brr":2..0
  SampleGura: incbin "01_gura_mono.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

; Sound 59h: Ridley's roar
Sound59:
db $11 : dw .voice0
.voice0 : db !instrGura : !c5,$FF,$19, $FF ; length = ceil(0.4*1000/16)

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2B59

Tracker2B59:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !echo,%10111110,54,-55
  !echoParameters,5,160,0
  !setDPMiscCommand,!noteEndInTicks,1
  !musicVolume,120
  !tempo,73
  !endVibrato
  !amplify,70
  !subloop,0
  db 96,$7F
  !rest
  !subloop,30
  db 24,$7F
  !rest
  !instr,!instr1F
  !volume,218
  !pan,10
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4775 : db 1
.pattern1_0:
  !instr,!instr1F
  !volume,218
  !pan,10
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,1
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,218
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
  !volume,218
  !pan,10
  !loop : dw .sub478C : db 1
  !loop : dw .sub474D : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4775 : db 1
  !loop : dw .sub478C : db 1
  !loop : dw .sub474D : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,218
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
  !volume,218
  !pan,10
  !loop : dw .sub47B6 : db 1
  db 24,$7F
  !rest
  !c4
  !rest
  !c4
  !rest
  db 12
  !c4
  !c4
  db 24
  !c4
  !loop : dw .sub47B6 : db 1
  db 24,$7F
  !c4
  !loop : dw .sub47D1 : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4775 : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub4800 : db 2
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  db 12
  !c4
  !instr,!instr21
  !volume,170
  !pan,9
  !amplify,0
  db 12,$7D
  !c5
  !amplify,70
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,2
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4824 : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4839 : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  db 24,$7F
  !c4
  !c4
  !loop : dw .sub47D1 : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,2
  !loop : dw .sub484C : db 1
  !loop : dw .sub4824 : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4839 : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4861 : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub488F : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  db 12
  !c4
  !instr,!instr21
  !volume,170
  !pan,9
  !amplify,0
  db 12,$7D
  !c5
  !amplify,70
  !instr,!instr1F
  !volume,218
  !pan,10
  db 24,$7F
  !c4
  !c4
  !loop : dw .sub48B2 : db 1
  !loop : dw .sub478C : db 1
  !loop : dw .sub474D : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4775 : db 1
  !loop : dw .sub478C : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub478C : db 1
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  db 12
  !c4
  !instr,!instr21
  !volume,170
  !pan,9
  !amplify,0
  db 12,$7D
  !c5
  !amplify,70
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !c4
  !loop : dw .sub48D7 : db 1
  !instr,!instr1F
  !volume,218
  !pan,10
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4775 : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  db 24,$7F
  !c4
  db 12
  !c4
  !instr,!instr21
  !volume,170
  !pan,9
  !amplify,0
  !c5
  !amplify,70
  !loop : dw .sub48D7 : db 1
  !instr,!instr1F
  !volume,218
  !pan,10
  !loop : dw .sub478C : db 1
  !loop : dw .sub474D : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4775 : db 1
  !subloop,0
  !loop : dw .sub478C : db 1
  !loop : dw .sub474D : db 1
  !subloop,2
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  db 12
  !c4
  !instr,!instr21
  !volume,170
  !pan,9
  !amplify,0
  !c5
  !amplify,70
  !loop : dw .sub48D7 : db 1
  db 96,$7F
  !c4
  !tie
  !amplify,0
  !instr,!instr31
  !volume,220
  !pan,138
  !transpose,244
  !toggleEcho
  !loop : dw .sub4906 : db 1
  !toggleEcho
  !transpose,0
  !instr,!instr1F
  !volume,218
  !pan,10
  !amplify,70
  !endVibrato
  db 24,$7F
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4824 : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub4839 : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  db 24,$7F
  !c4
  db 12
  !c4
  !instr,!instr21
  !volume,170
  !pan,9
  !amplify,0
  !c5
  !amplify,70
  !loop : dw .sub47D1 : db 1
  !loop : dw .sub478C : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub478C : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub484C : db 1
  !loop : dw .sub4824 : db 1
  !loop : dw .sub478C : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub478C : db 1
  !loop : dw .sub4839 : db 1
  !loop : dw .sub478C : db 1
  !loop : dw .sub4861 : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub488F : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  db 24,$7F
  !c4
  db 12
  !c4
  !instr,!instr21
  !volume,170
  !pan,9
  !amplify,0
  !c5
  !amplify,70
  !loop : dw .sub48B2 : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,2
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4775 : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,1
  !loop : dw .sub4760 : db 1
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !subloop,0
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !subloop,2
  db 12,$7F
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !loop : dw .sub4727 : db 1
  !loop : dw .sub474D : db 1
  !subloop,0
  !loop : dw .sub4760 : db 1
  !loop : dw .sub474D : db 1
  !subloop,1
  !loop : dw .sub4760 : db 1
  !loop : dw .sub4775 : db 1
  !end

.pattern0_1
  !subloop,0
  db 96,$7F
  !rest
  !subloop,15
  !instr,!instr30
  !volume,220
  !pan,138
  !loop : dw .sub4A73 : db 1
  !toggleEcho
  !instr,!instr32
  !volume,235
  !pan,10
  !endVibrato
  !tremolo,0,16,22
  db 48,$7F
  !f6
  !pitchSlide,16,28 : !f5
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
.pattern1_1:
  !transpose,0
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,253
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 2
  !transpose,254
  !loop : dw .sub4A8C : db 1
  !transpose,0
  db 12,$7F
  !c6
  !c6
  !g5
  !ds5
  !transpose,252
  !loop : dw .sub4A8C : db 3
  !transpose,0
  !loop : dw .sub4A93 : db 1
  !transpose,254
  !loop : dw .sub4A8C : db 3
  !transpose,2
  !loop : dw .sub4A93 : db 1
  !transpose,0
  !loop : dw .sub4A8C : db 2
  !subloop,0
  !loop : dw .sub4A8C : db 1
  !transpose,4
  !loop : dw .sub4A93 : db 1
  !transpose,0
  !subloop,1
  !loop : dw .sub4A8C : db 1
  db 24,$7F
  !gs5
  db 12
  !f5
  !f5
  !transpose,252
  !loop : dw .sub4A8C : db 3
  !transpose,0
  !loop : dw .sub4A93 : db 1
  !transpose,254
  !loop : dw .sub4A8C : db 3
  !transpose,2
  !loop : dw .sub4A93 : db 1
  !transpose,0
  !loop : dw .sub4A8C : db 3
  !transpose,4
  !loop : dw .sub4A93 : db 1
  !transpose,0
  !loop : dw .sub4A8C : db 1
  !transpose,4
  !loop : dw .sub4A93 : db 3
  !transpose,0
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,0
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 2
  !transpose,254
  !loop : dw .sub4A8C : db 2
  !transpose,0
  !loop : dw .sub4A8C : db 2
  db 12,$7F
  !f6
  !f6
  !c6
  !c6
  !f5
  !f5
  !c5
  !c5
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,0
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,249
  !loop : dw .sub4A8C : db 2
  !transpose,251
  !loop : dw .sub4A8C : db 2
  !transpose,252
  !loop : dw .sub4A8C : db 2
  !transpose,0
  db 24,$7F
  !ds5
  db 12
  !c6
  !c6
  !g5
  !g5
  !ds5
  !ds5
  !subloop,0
  !loop : dw .sub4A9A : db 2
  !transpose,2
  !loop : dw .sub4A9A : db 2
  !transpose,4
  !loop : dw .sub4A9A : db 3
  !loop : dw .sub4AA6 : db 1
  !subloop,2
  !loop : dw .sub4A9A : db 2
  !transpose,2
  !loop : dw .sub4A9A : db 2
  !transpose,4
  !loop : dw .sub4A9A : db 1
  !loop : dw .sub4AB5 : db 1
  !loop : dw .sub4A8C : db 3
  !loop : dw .sub4AD5 : db 1
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 3
  !transpose,0
  !loop : dw .sub4ADC : db 1
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,0
  !loop : dw .sub4A8C : db 3
  !loop : dw .sub4AD5 : db 1
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 3
  !transpose,0
  !loop : dw .sub4ADC : db 1
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,251
  !loop : dw .sub4A8C : db 3
  !transpose,0
  db 24,$7F
  !c5
  db 12
  !f5
  !f5
  !loop : dw .sub4A8C : db 2
  !transpose,254
  !loop : dw .sub4A8C : db 2
  !transpose,252
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,251
  !loop : dw .sub4A8C : db 3
  !transpose,0
  db 24,$7F
  !c5
  db 12
  !ds5
  !ds5
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,0
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 4
  !transpose,251
  !loop : dw .sub4A8C : db 2
  !transpose,255
  !loop : dw .sub4A8C : db 2
  !transpose,0
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,249
  !loop : dw .sub4A8C : db 4
  !transpose,251
  !loop : dw .sub4A8C : db 2
  !transpose,254
  !loop : dw .sub4A8C : db 1
  !transpose,0
  !loop : dw .sub4AE3 : db 1
  !transpose,252
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,251
  !loop : dw .sub4A8C : db 4
  !transpose,0
  !loop : dw .sub4A8C : db 2
  !transpose,254
  !loop : dw .sub4A8C : db 2
  !transpose,252
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,251
  !loop : dw .sub4A8C : db 4
  !transpose,255
  !loop : dw .sub4A8C : db 4
  !transpose,0
  db 24,$78
  !e5
  db 24,$75
  !e5
  db 24,$72
  !e5
  db 120,$7F
  !rest
  !instr,!instr30
  !volume,220
  !pan,138
  !tremolo,0,0,0
  !toggleEcho
  !loop : dw .sub4906 : db 1
  db 48,$7F
  !rest
  !toggleEcho
  !instr,!instr32
  !volume,235
  !pan,10
  !endVibrato
  !tremolo,0,16,22
  !f6
  !pitchSlide,16,28 : !f5
  !subloop,0
  !loop : dw .sub4A9A : db 2
  !transpose,2
  !loop : dw .sub4A9A : db 2
  !transpose,4
  !loop : dw .sub4A9A : db 3
  !loop : dw .sub4AA6 : db 1
  !subloop,2
  !loop : dw .sub4A9A : db 2
  !transpose,2
  !loop : dw .sub4A9A : db 2
  !transpose,4
  !loop : dw .sub4A9A : db 1
  !loop : dw .sub4AB5 : db 1
  !loop : dw .sub4A8C : db 3
  !loop : dw .sub4AD5 : db 1
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 3
  !transpose,0
  !loop : dw .sub4ADC : db 1
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,0
  !loop : dw .sub4A8C : db 3
  !loop : dw .sub4AD5 : db 1
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 3
  !transpose,0
  !loop : dw .sub4ADC : db 1
  !transpose,254
  !loop : dw .sub4A8C : db 2
  !transpose,0
  db 24,$7F
  !ds5
  !c6
  db 12
  !c5
  !c5
  !g5
  !g5
  !transpose,0
  !loop : dw .sub4A9A : db 2
  !transpose,2
  !loop : dw .sub4A9A : db 2
  !transpose,255
  !loop : dw .sub4A9A : db 1
  !transpose,251
  !loop : dw .sub4A8C : db 1
  !transpose,0
  db 24,$7F
  !c6
  db 12
  !f5
  !f5
  !transpose,4
  !loop : dw .sub4A9A : db 1
  !transpose,2
  !loop : dw .sub4A9A : db 1
  !transpose,0
  !loop : dw .sub4A9A : db 2
  !transpose,2
  !loop : dw .sub4A9A : db 2
  !transpose,255
  !loop : dw .sub4A9A : db 1
  !transpose,251
  !loop : dw .sub4A8C : db 1
  !transpose,0
  db 24,$7F
  !c6
  db 12
  !ds5
  !ds5
  !transpose,2
  !loop : dw .sub4A9A : db 1
  !transpose,0
  db 24,$7F
  !ds5
  !ds6
  db 12
  !ds5
  !ds5
  !as5
  !c6
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !transpose,252
  !loop : dw .sub4A8C : db 4
  !transpose,254
  !loop : dw .sub4A8C : db 4
  !end

.pattern0_2
  !instr,!instr26
  !vibrato,34,10,47
  !volume,70
  !dynamicVolume,255,255
  !loop : dw .sub4AEA : db 2
  !loop : dw .sub4AF1 : db 1
  db 48,$7D
  !g6
  !f6
  !ds6
  !loop : dw .sub4AEA : db 2
  !loop : dw .sub4AF1 : db 1
  db 48,$7D
  !as6
  !gs6
  !g6
  !loop : dw .sub4AEA : db 2
  !loop : dw .sub4AF1 : db 1
  db 48,$7D
  !g6
  !f6
  !ds6
  !loop : dw .sub4AEA : db 2
  !loop : dw .sub4AF1 : db 1
  db 48,$7D
  !as6
  !gs6
  !adsrGain,$7F,$F6
  db 24
  !tie
  !instr,!instr26
  !rest
  !amplify,44
  !loop : dw .sub4AFB : db 2
  !loop : dw .sub4B06 : db 1
  !loop : dw .sub4B12 : db 1
.pattern1_2:
  !loop : dw .sub4AFB : db 2
  !loop : dw .sub4B06 : db 1
  !loop : dw .sub4B1C : db 1
  db 24,$7F
  !g6
  !as5
  !loop : dw .sub4AFB : db 2
  !loop : dw .sub4B06 : db 1
  !loop : dw .sub4B12 : db 1
  !loop : dw .sub4AFB : db 2
  !loop : dw .sub4B06 : db 1
  !loop : dw .sub4B1C : db 1
  db 24,$7F
  !g6
  !as5
  !dynamicVolume,0,0
  !instr,!instr27
  !volume,255
  !vibrato,32,10,47
  !tremolo,0,6,18
  !amplify,63
  !pan,9
  db 48
  !gs5
  !pitchSlide,0,10 : !as5
  !tie
  !loop : dw .sub4B24 : db 1
  db 24,$7F
  !as5
  !c6
  db 48
  !d6
  !pitchSlide,0,10 : !f6
  !c7
  !g6
  db 24
  !f6
  !gs6
  db 48
  !gs6
  !pitchSlide,0,10 : !as6
  !tie
  !loop : dw .sub4B41 : db 1
  db 48,$7F
  !d7
  !pitchSlide,0,10 : !f7
  db 96
  !tie
  db 24
  !f5
  !gs5
  db 48
  !gs5
  !pitchSlide,0,10 : !as5
  !tie
  db 72
  !g5
  db 48
  !b4
  !pitchSlide,0,11 : !ds5
  db 24
  !c5
  !ds5
  db 72
  !f5
  db 24
  !f5
  !gs5
  db 48
  !gs5
  !pitchSlide,0,10 : !as5
  db 24
  !as5
  db 48
  !as5
  !pitchSlide,0,10 : !c6
  db 24
  !ds6
  !c6
  db 48
  !d6
  !pitchSlide,0,10 : !f6
  !c7
  !gs6
  db 24
  !g6
  db 12
  !ds6
  !f6
  db 24
  !gs6
  db 48
  !gs6
  !pitchSlide,0,10 : !as6
  !tie
  db 72
  !g6
  db 48
  !b5
  !pitchSlide,0,11 : !ds6
  db 24
  !c6
  !ds6
  db 48
  !f6
  db 24
  !f6
  !gs6
  db 48
  !gs6
  !pitchSlide,0,10 : !as6
  !as6
  db 24
  !a6
  !pitchSlide,0,10 : !c7
  !ds7
  !c7
  !as6
  !c7
  db 48
  !d7
  !pitchSlide,0,10 : !f7
  db 24
  !tie
  db 12
  !g7
  !f7
  db 72
  !e7
  !adsrGain,$7F,$F6
  db 24
  !tie
  !instr,!instr28
  !volume,255
  !vibrato,34,8,52
  !tremolo,0,6,20
  !amplify,95
  !pan,8
  !loop : dw .sub4AFB : db 2
  !loop : dw .sub4B60 : db 1
  !loop : dw .sub4B12 : db 1
  !loop : dw .sub4AFB : db 1
  !loop : dw .sub4B70 : db 1
  !loop : dw .sub4B60 : db 1
  !loop : dw .sub4B1C : db 1
  db 24,$7F
  !g6
  !as5
  !loop : dw .sub4AFB : db 2
  !loop : dw .sub4B60 : db 1
  !loop : dw .sub4B12 : db 1
  !loop : dw .sub4AFB : db 1
  !loop : dw .sub4B70 : db 1
  !loop : dw .sub4B7E : db 1
  !loop : dw .sub4BB3 : db 1
  !loop : dw .sub4BD7 : db 1
  !loop : dw .sub4BB3 : db 1
  db 48,$7F
  !a5
  !pitchSlide,0,10 : !c6
  db 24
  !f5
  db 48
  !ds6
  !pitchSlide,0,12 : !f6
  !tie
  db 12
  !g6
  !f6
  db 72
  !e6
  db 12
  !c6
  !ds6
  !loop : dw .sub4BF5 : db 1
  !loop : dw .sub4C0B : db 1
  !loop : dw .sub4C1E : db 1
  !loop : dw .sub4C0B : db 1
  db 24,$7F
  !as5
  db 48
  !a5
  !pitchSlide,0,10 : !c6
  !as5
  !gs5
  !g5
  db 12
  !gs5
  !g5
  !amplify,0
  !instr,!instr2A
  !volume,245
  !vibrato,48,8,52
  !tremolo,0,6,18
  !volume,180
  !dynamicVolume,255,245
  db 24
  !d5
  !pitchSlide,0,8 : !f5
  !tie
  !b5
  db 48
  !c6
  db 24
  !d5
  !pitchSlide,0,8 : !f5
  !b5
  !c6
  db 24,$79
  !c6
  !loop : dw .sub4C4B : db 1
  !loop : dw .sub4C56 : db 1
  db 24,$7F
  !c6
  db 24,$79
  !c6
  db 24,$7F
  !c6
  !pitchSlide,0,8 : !ds6
  !loop : dw .sub4C6F : db 1
  db 48,$7F
  !e6
  !pitchSlide,26,22 : !e5
  db 24
  !d5
  !pitchSlide,0,8 : !f5
  !f5
  !b5
  db 48
  !c6
  db 24
  !d5
  !pitchSlide,0,8 : !f5
  !b5
  !c6
  db 24,$79
  !c6
  db 24,$7F
  !d5
  !pitchSlide,0,8 : !f5
  !b5
  db 48
  !c6
  !loop : dw .sub4C56 : db 1
  db 24,$7F
  !c6
  db 24,$79
  !c6
  db 12,$7F
  !ds6
  !ds6
  !loop : dw .sub4C6F : db 1
  db 48,$7F
  !e6
  !pitchSlide,26,22 : !e5
  db 120
  !rest
  !instr,!instr2B
  !volume,235
  !pan,10
  !vibrato,34,10,47
  !tremolo,0,6,18
  db 48
  !g5
  db 96
  !as5
  db 96
  !f5
  !tie
  db 72
  !tie
  db 48
  !g5
  db 72
  !g5
  db 96
  !g5
  db 96
  !f5
  db 48
  !tie
  !g5
  db 96
  !as5
  db 96
  !f5
  !tie
  db 72
  !f5
  db 48
  !gs5
  db 72
  !ds6
  db 96
  !c6
  db 96
  !c6
  db 48
  !tie
  !g5
  !ds5
  !c5
  db 72
  !gs5
  !cs5
  db 48
  !cs5
  db 72
  !as5
  db 96
  !ds5
  db 72
  !gs5
  !f5
  !c6
  db 120
  !ds6
  db 48
  !cs5
  db 72
  !cs5
  !gs5
  db 48
  !e5
  db 72
  !e5
  !c6
  !instr,!instr2C
  !loop : dw .sub4CBE : db 3
  db 48,$7F
  !f6
  !ds6
  !c6
  !as5
  !gs6
  !g6
  !adsrGain,$7F,$F6
  db 24
  !tie
  !instr,!instr28
  !volume,255
  !vibrato,34,8,52
  !tremolo,0,6,20
  !amplify,95
  !pan,8
  db 12
  !gs5
  !c6
  db 24
  !cs6
  !ds6
  !loop : dw .sub4AFB : db 2
  !loop : dw .sub4B60 : db 1
  !loop : dw .sub4B12 : db 1
  !loop : dw .sub4AFB : db 1
  !loop : dw .sub4B70 : db 1
  !loop : dw .sub4B60 : db 1
  !loop : dw .sub4B1C : db 1
  db 24,$7F
  !as6
  !ds6
  !loop : dw .sub4CC9 : db 2
  !loop : dw .sub4B60 : db 1
  db 24,$7F
  !c6
  !g6
  !as5
  !gs6
  !c6
  !as6
  !ds6
  !loop : dw .sub4CC9 : db 1
  db 24,$7F
  !c7
  db 12
  !gs6
  !gs6
  db 24
  !as6
  !g6
  !gs6
  !f6
  !g6
  !ds6
  !loop : dw .sub4B7E : db 1
  !loop : dw .sub4BB3 : db 1
  !loop : dw .sub4BD7 : db 1
  !loop : dw .sub4BB3 : db 1
  db 24,$7F
  !a5
  !pitchSlide,0,10 : !c6
  !gs5
  !as5
  db 48
  !d6
  !pitchSlide,0,12 : !f6
  !tie
  db 12
  !g6
  !f6
  db 72
  !e6
  !adsrGain,$7F,$F6
  db 24
  !tie
  !instr,!instr27
  !volume,255
  !vibrato,32,10,47
  !tremolo,0,6,18
  !amplify,63
  !loop : dw .sub4BF5 : db 1
  !loop : dw .sub4C0B : db 1
  !loop : dw .sub4C1E : db 1
  !loop : dw .sub4C0B : db 1
  db 24,$7F
  !as5
  db 48
  !a5
  !pitchSlide,0,10 : !c6
  !as5
  !a5
  !pitchSlide,0,10 : !c6
  db 72
  !ds6
  !amplify,0
  !tremolo,0,0,0
  !instr,!instr26
  !vibrato,34,10,47
  !amplify,44
  !pan,10
  !volume,180
  !dynamicVolume,255,245
  !loop : dw .sub4AFB : db 2
  !loop : dw .sub4B06 : db 1
  !loop : dw .sub4B12 : db 1
  !end

.pattern0_3
  !instr,!instr26
  !vibrato,34,10,47
  !volume,70
  !dynamicVolume,255,255
  db 24,$7D
  !rest
  !loop : dw .sub4CD4 : db 2
  !loop : dw .sub4CDB : db 1
  !loop : dw .sub4CD4 : db 3
  !loop : dw .sub4CDB : db 1
  db 48,$7D
  !c6
  !g6
  !c6
  !as5
  !loop : dw .sub4CD4 : db 2
  !loop : dw .sub4CDB : db 1
  !loop : dw .sub4CD4 : db 3
  !loop : dw .sub4CDB : db 1
  db 48,$7D
  !c6
  !g6
  db 24
  !c6
  !adsrGain,$7F,$F6
  !tie
  !rest
  !dynamicVolume,0,0
  !instr,!instr2D
  !volume,238
  !pan,138
  !endVibrato
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
.pattern1_3:
  !transpose,0
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,253
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 2
  !transpose,254
  !loop : dw .sub4CE2 : db 1
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,0
  !subloop,0
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !subloop,1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,0
  !subloop,0
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !subloop,1
  !endVibrato
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,232
  db 72,$7F
  !cs5
  !amplify,0
  !instr,!instr27
  !volume,255
  !vibrato,32,10,47
  !tremolo,0,6,18
  !amplify,63
  !volume,165
  !toggleEcho
  db 60
  !as5
  !loop : dw .sub4B24 : db 1
  db 12,$7F
  !as5
  !toggleEcho
  !volume,255
  !pan,11
  db 48,$7C
  !c6
  !g6
  db 96
  !ds6
  !tremolo,0,0,0
  !endVibrato
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,232
  db 72,$7F
  !cs5
  !amplify,0
  !instr,!instr27
  !volume,255
  !vibrato,32,10,47
  !tremolo,0,6,18
  !amplify,63
  !volume,165
  !toggleEcho
  db 60
  !as6
  !loop : dw .sub4B41 : db 1
  db 48,$7F
  !d7
  !pitchSlide,0,10 : !f7
  db 60
  !tie
  !toggleEcho
  !volume,255
  !pan,11
  db 24,$7C
  !c5
  !f5
  db 48
  !f5
  !pitchSlide,0,10 : !g5
  !tie
  db 72
  !ds5
  db 48
  !gs4
  !pitchSlide,0,11 : !c5
  db 24
  !gs4
  !c5
  db 72
  !c5
  db 24
  !cs5
  !f5
  db 48
  !ds5
  !pitchSlide,0,10 : !f5
  db 24
  !f5
  db 48
  !fs5
  !pitchSlide,0,10 : !gs5
  db 24
  !c6
  !gs5
  db 48
  !a5
  !pitchSlide,0,10 : !c6
  !g6
  !f6
  db 24
  !ds6
  db 12
  !c6
  !cs6
  db 24
  !f6
  db 48
  !f6
  !pitchSlide,0,10 : !g6
  !tie
  db 72
  !ds6
  db 48
  !gs5
  !pitchSlide,0,11 : !c6
  db 24
  !gs5
  !c6
  db 48
  !cs6
  db 24
  !cs6
  !f6
  db 48
  !ds6
  !pitchSlide,0,10 : !f6
  !f6
  db 24
  !f6
  !pitchSlide,0,10 : !gs6
  !c7
  !gs6
  !g6
  !gs6
  db 48
  !as6
  !pitchSlide,0,10 : !cs7
  db 24
  !tie
  db 12
  !ds7
  !cs7
  db 72
  !c7
  !instr,!instr28
  !volume,255
  !vibrato,34,8,52
  !tremolo,0,6,20
  !amplify,95
  !pan,12
  db 12,$7D
  !g5
  !as5
  !loop : dw .sub4CF0 : db 2
  !loop : dw .sub4CFB : db 1
  !loop : dw .sub4D0B : db 1
  !loop : dw .sub4CF0 : db 1
  !loop : dw .sub4D15 : db 1
  !loop : dw .sub4CFB : db 1
  !loop : dw .sub4D23 : db 1
  db 24,$7D
  !ds6
  !g5
  !loop : dw .sub4CF0 : db 2
  !loop : dw .sub4CFB : db 1
  !loop : dw .sub4D0B : db 1
  !loop : dw .sub4CF0 : db 1
  !loop : dw .sub4D15 : db 1
  !loop : dw .sub4D2B : db 1
  !loop : dw .sub4D61 : db 1
  !loop : dw .sub4D85 : db 1
  !loop : dw .sub4D61 : db 1
  db 48,$7C
  !d5
  !pitchSlide,0,10 : !f5
  db 24
  !c5
  !loop : dw .sub4DA3 : db 1
  db 12,$7C
  !f5
  !c6
  !loop : dw .sub4DB1 : db 1
  !loop : dw .sub4DC7 : db 1
  !loop : dw .sub4DDA : db 1
  !loop : dw .sub4DC7 : db 1
  db 24,$7C
  !g5
  db 48
  !f5
  !pitchSlide,0,10 : !gs5
  !g5
  db 48,$7B
  !f5
  db 72,$7A
  !ds5
  !pan,9
  db 96,$7F
  !f5
  !tie
  db 36
  !tie
  !adsrGain,$7F,$F6
  db 24
  !tie
  !amplify,0
  !instr,!instr2A
  !volume,245
  !vibrato,48,8,52
  !tremolo,0,6,18
  !volume,165
  !pan,10
  !toggleEcho
  !loop : dw .sub4C4B : db 1
  !loop : dw .sub4C56 : db 1
  db 12,$7F
  !c6
  !toggleEcho
  !volume,245
  !pan,11
  db 24,$7D
  !a5
  !pitchSlide,0,8 : !c6
  !loop : dw .sub4E07 : db 1
  db 24,$7D
  !a4
  !pitchSlide,0,8 : !cs5
  !cs5
  !gs5
  db 48
  !gs5
  db 24
  !a4
  !pitchSlide,0,8 : !cs5
  !gs5
  !gs5
  db 24,$77
  !gs5
  db 24,$7D
  !a4
  !pitchSlide,0,8 : !cs5
  !gs5
  db 48
  !gs5
  db 24
  !gs5
  !g5
  !f5
  db 12
  !g5
  !f5
  !g5
  !g5
  db 24
  !g5
  db 24,$77
  !g5
  db 24,$74
  !g5
  db 12,$7D
  !g5
  !f5
  !g5
  !g5
  db 24
  !g5
  db 24,$77
  !g5
  db 12,$7D
  !c6
  !c6
  !loop : dw .sub4E07 : db 1
  db 96,$7D
  !rest
  !instr,!instr2B
  !volume,235
  !pan,10
  !vibrato,34,10,47
  !tremolo,0,6,18
  db 48,$7F
  !f5
  !gs5
  db 96
  !c6
  !tie
  !tie
  db 72
  !f5
  !gs5
  !gs5
  db 96
  !ds5
  db 72
  !tie
  db 48
  !f5
  !gs5
  db 96
  !c6
  db 96
  !f5
  !tie
  db 24
  !tie
  db 48
  !f5
  db 72
  !as5
  !cs6
  db 96
  !as5
  db 72
  !tie
  db 48
  !gs5
  !f5
  !cs5
  db 72
  !cs5
  !gs5
  db 48
  !ds5
  db 72
  !ds5
  !as5
  !c6
  db 96
  !g5
  db 72
  !ds5
  !cs6
  db 96
  !c6
  db 48
  !c5
  db 72
  !gs5
  !as5
  db 48
  !ds5
  db 72
  !as5
  !ds6
  !loop : dw .sub4E5C : db 3
  !instr,!instr2C
  db 48,$7F
  !c6
  !as5
  !gs5
  !g5
  !c6
  db 24
  !c6
  !adsrGain,$7F,$F6
  !tie
  !instr,!instr28
  !volume,255
  !vibrato,34,8,52
  !tremolo,0,6,20
  !amplify,95
  !pan,12
  db 12,$7C
  !f5
  !gs5
  db 24
  !as5
  !c6
  !loop : dw .sub4CF0 : db 2
  !loop : dw .sub4CFB : db 1
  !loop : dw .sub4D0B : db 1
  !loop : dw .sub4CF0 : db 1
  !loop : dw .sub4D15 : db 1
  !loop : dw .sub4CFB : db 1
  !loop : dw .sub4D23 : db 1
  db 24,$7C
  !g6
  !c6
  !loop : dw .sub4E67 : db 1
  db 24,$7C
  !c6
  !loop : dw .sub4E73 : db 1
  !loop : dw .sub4CFB : db 1
  db 24,$7C
  !gs5
  !ds6
  !g5
  !f6
  !gs5
  !g6
  !c6
  !loop : dw .sub4E67 : db 1
  db 12,$7C
  !c6
  !c6
  !loop : dw .sub4E73 : db 1
  !loop : dw .sub4D2B : db 1
  !loop : dw .sub4D61 : db 1
  !loop : dw .sub4D85 : db 1
  !loop : dw .sub4D61 : db 1
  db 24,$7C
  !ds5
  !pitchSlide,0,10 : !f5
  !c5
  !f5
  !loop : dw .sub4DA3 : db 1
  !amplify,0
  !tremolo,0,0,0
  !instr,!instr27
  !volume,255
  !vibrato,32,10,47
  !tremolo,0,6,18
  !amplify,63
  db 12,$7C
  !f5
  !c6
  !loop : dw .sub4DB1 : db 1
  !loop : dw .sub4DC7 : db 1
  !loop : dw .sub4DDA : db 1
  !loop : dw .sub4DC7 : db 1
  db 24,$7C
  !g5
  db 48
  !f5
  !pitchSlide,0,10 : !gs5
  !g5
  !f5
  !pitchSlide,0,10 : !gs5
  db 72
  !as5
  !amplify,0
  !tremolo,0,0,0
  !instr,!instr2D
  !volume,238
  !pan,138
  !endVibrato
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !end

.pattern0_4
  !subloop,0
  db 96,$7F
  !rest
  !subloop,15
  !instr,!instr31
  !volume,220
  !pan,138
  !transpose,12
  !loop : dw .sub4A73 : db 1
  !transpose,0
  !instr,!instr2D
  !volume,238
  !pan,138
  !endVibrato
  db 48,$7F
  !c6
  !pitchSlide,16,28 : !c5
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,13
  !loop : dw .sub4E7C : db 1
.pattern1_4:
  !pan,13
  db 96,$7F
  !c5
  !tie
  db 96
  !as4
  !tie
  !tie
  !tie
  !gs4
  !as4
  !loop : dw .sub4E8A : db 1
  db 96,$7F
  !gs4
  !tie
  db 96
  !as4
  !tie
  !pan,10
  db 96
  !f5
  !tie
  !tie
  !tie
  !tie
  !tie
  db 96
  !ds5
  !tie
  db 96
  !cs5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !f5
  !tie
  db 96
  !ds5
  !tie
  !cs5
  !ds5
  db 96
  !f5
  !tie
  !instr,!instr2D
  !volume,238
  !pan,138
  !endVibrato
  !loop : dw .sub4CE2 : db 4
  !transpose,254
  !loop : dw .sub4CE2 : db 4
  !transpose,252
  !loop : dw .sub4CE2 : db 4
  !transpose,254
  !loop : dw .sub4CE2 : db 4
  !transpose,0
  !loop : dw .sub4CE2 : db 4
  !transpose,254
  !loop : dw .sub4CE2 : db 4
  !transpose,0
  db 12,$6F
  !f5
  !f5
  db 48,$7F
  !as4
  db 12,$6F
  !as4
  !c5
  !g5
  !g5
  db 48,$7F
  !c5
  db 12,$6F
  !c5
  !c5
  db 72,$7F
  !cs5
  db 12,$6F
  !ds5
  !ds5
  db 96,$7F
  !c6
  !pitchSlide,26,38 : !c5
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,10
  !loop : dw .sub4E97 : db 1
  !loop : dw .sub4EA4 : db 1
  !loop : dw .sub4E97 : db 1
  !loop : dw .sub4EB1 : db 1
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4ED7 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4EDE : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,0
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4ED7 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4EDE : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,251
  !loop : dw .sub4CE2 : db 3
  db 12,$6F
  !f5
  !f5
  !as5
  !as5
  !transpose,0
  !loop : dw .sub4CE2 : db 2
  !transpose,254
  !loop : dw .sub4CE2 : db 1
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,251
  !loop : dw .sub4CE2 : db 3
  db 12,$6F
  !f5
  !f5
  !gs5
  !gs5
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,0
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,251
  !loop : dw .sub4CE2 : db 2
  !transpose,255
  !loop : dw .sub4CE2 : db 1
  !loop : dw .sub4CE9 : db 1
  !transpose,0
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,249
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,251
  !loop : dw .sub4CE2 : db 2
  !transpose,254
  !loop : dw .sub4CE2 : db 1
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,251
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,0
  !loop : dw .sub4CE2 : db 2
  !transpose,254
  !loop : dw .sub4CE2 : db 1
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,251
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,255
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,0
  !endVibrato
  !toggleEcho
  !instr,!instr1F
  !volume,218
  !pan,10
  !amplify,70
  db 24,$7D
  !c4
  !amplify,0
  db 96
  !rest
  db 72
  !tie
  !toggleEcho
  !instr,!instr2F
  !volume,180
  !vibrato,12,8,76
  !pan,14
  !subloop,0
  db 96,$7F
  !c5
  !tie
  !tie
  !tie
  db 96
  !gs4
  !tie
  db 96
  !as4
  !tie
  !subloop,1
  db 96,$7F
  !cs5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !c5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !cs5
  !tie
  db 96
  !e5
  !tie
  db 96
  !f5
  !tie
  !tie
  !tie
  !adsrGain,$7F,$EF
  db 96
  !tie
  !tie
  !subloop,0
  db 96,$7F
  !rest
  !subloop,9
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,10
  !loop : dw .sub4E97 : db 1
  !loop : dw .sub4EA4 : db 1
  !loop : dw .sub4E97 : db 1
  !loop : dw .sub4EB1 : db 1
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4ED7 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4EDE : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,0
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4ED7 : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,252
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4EDE : db 1
  !transpose,254
  !loop : dw .sub4CE2 : db 3
  !loop : dw .sub4CE9 : db 1
  !transpose,0
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,10
  db 96,$7F
  !cs5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !c5
  db 72
  !tie
  db 120
  !f5
  db 96
  !ds5
  db 96
  !cs5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !c5
  db 72
  !tie
  db 96
  !ds5
  !tie
  db 24
  !tie
  !instr,!instr27
  !volume,255
  !vibrato,32,10,47
  !tremolo,0,6,18
  !amplify,63
  !pan,9
  db 48
  !d6
  !pitchSlide,0,10 : !f6
  db 96
  !tie
  !tie
  !tie
  db 48
  !tie
  !amplify,0
  !tremolo,0,0,0
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,10
  db 96
  !cs5
  !tie
  db 96
  !ds5
  !tie
  !end

.pattern0_5
  !subloop,0
  db 96,$7F
  !rest
  !subloop,15
  !instr,!instr31
  !volume,220
  !pan,138
  !loop : dw .sub4A73 : db 1
  db 48,$7F
  !rest
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,7
  !loop : dw .sub4F3A : db 1
.pattern1_5:
  db 96,$7F
  !gs4
  !tie
  db 96
  !g4
  !tie
  db 96
  !f4
  !tie
  !tie
  !g4
  !loop : dw .sub4F48 : db 1
  db 96,$7F
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
  !tie
  !tie
  !loop : dw .sub4F55 : db 1
  db 96,$7F
  !gs4
  !tie
  !tie
  !tie
  !loop : dw .sub4F55 : db 1
  db 96,$7F
  !gs4
  !g4
  !loop : dw .sub4F48 : db 1
  !loop : dw .sub4F68 : db 1
  !loop : dw .sub4F48 : db 1
  !loop : dw .sub4F75 : db 1
  !loop : dw .sub4F90 : db 2
  !loop : dw .sub4FA4 : db 1
  !loop : dw .sub4FC3 : db 2
  db 96,$7F
  !f4
  !tie
  db 96
  !g4
  !tie
  db 96
  !ds4
  !tie
  !gs4
  !g4
  db 96
  !f4
  !tie
  db 96
  !g4
  !tie
  db 96
  !ds4
  !tie
  db 96
  !g4
  !tie
  db 96
  !rest
  !tie
  !instr,!instr2F
  !volume,180
  !vibrato,12,8,76
  !pan,10
  !subloop,0
  db 96,$7F
  !f4
  !tie
  !tie
  !tie
  db 96
  !cs4
  !tie
  db 96
  !ds4
  !tie
  !subloop,1
  db 96,$7F
  !f4
  !tie
  db 96
  !g4
  !tie
  db 96
  !ds4
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
  db 96
  !gs4
  !tie
  !tie
  !tie
  !adsrGain,$7F,$EF
  db 96
  !tie
  !tie
  !subloop,0
  db 96,$7F
  !rest
  !subloop,9
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,7
  !loop : dw .sub4F48 : db 1
  !loop : dw .sub4F68 : db 1
  !loop : dw .sub4F48 : db 1
  !loop : dw .sub4F75 : db 1
  !loop : dw .sub4F90 : db 2
  !loop : dw .sub4FA4 : db 1
  !loop : dw .sub4F3A : db 1
  !end

.pattern0_6
  !endVibrato
  !subloop,0
  db 96,$7F
  !rest
  !subloop,31
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 6
  !loop : dw .sub4951 : db 1
  !loop : dw .sub493C : db 8
.pattern1_6:
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 6
  !loop : dw .sub4951 : db 1
  !loop : dw .sub493C : db 3
  !loop : dw .sub4951 : db 1
  !loop : dw .sub493C : db 1
  !loop : dw .sub4951 : db 1
  !loop : dw .sub493C : db 2
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4972 : db 6
  !loop : dw .sub498B : db 1
  !loop : dw .sub4972 : db 8
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4972 : db 6
  !loop : dw .sub498B : db 1
  !loop : dw .sub4972 : db 3
  !loop : dw .sub498B : db 1
  !loop : dw .sub4972 : db 1
  !loop : dw .sub498B : db 1
  !loop : dw .sub4972 : db 2
  !subloop,0
  !instr,!instr21
  !volume,170
  !pan,9
  db 12,$7F
  !c5
  db 12,$7D
  !c5
  !instr,!instr22
  !volume,166
  !pan,11
  db 24,$7F
  !c5
  !subloop,31
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 6
  !loop : dw .sub4951 : db 1
  !loop : dw .sub493C : db 8
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 6
  !loop : dw .sub4951 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4951 : db 1
  !loop : dw .sub49B6 : db 1
  !loop : dw .sub49E2 : db 1
  !loop : dw .sub4A03 : db 4
  !loop : dw .sub49E2 : db 2
  !loop : dw .sub4A03 : db 2
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr23
  !volume,185
  !pan,10
  !c5
  !c5
  db 24
  !c5
  !loop : dw .sub4A24 : db 1
  !loop : dw .sub493C : db 15
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 10
  !instr,!instr22
  !volume,166
  !pan,11
  db 24,$7F
  !c5
  !loop : dw .sub4A46 : db 1
  !loop : dw .sub4951 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4972 : db 15
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4972 : db 7
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4972 : db 2
  !instr,!instr22
  !volume,166
  !pan,11
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,170
  !pan,9
  db 12,$7D
  !c5
  !loop : dw .sub4A46 : db 1
  !loop : dw .sub498B : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !cs5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 6
  !loop : dw .sub4951 : db 1
  !loop : dw .sub493C : db 8
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 3
  !subloop,0
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 2
  !loop : dw .sub4951 : db 1
  !subloop,1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4951 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4972 : db 6
  !loop : dw .sub498B : db 1
  !loop : dw .sub4972 : db 8
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4972 : db 3
  !subloop,0
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4972 : db 2
  !loop : dw .sub498B : db 1
  !subloop,1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub498B : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !cs5
  db 96
  !cs5
  !tie
  !amplify,0
  !instr,!instr2F
  !volume,180
  !vibrato,12,8,76
  !pan,6
  !subloop,0
  db 96,$7F
  !gs4
  !tie
  !tie
  !tie
  db 96
  !f4
  !tie
  db 96
  !g4
  !tie
  !subloop,1
  db 96,$7F
  !gs4
  !tie
  db 96
  !as4
  !tie
  db 96
  !g4
  !tie
  db 96
  !as4
  !tie
  db 96
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
  !instr,!instr26
  !vibrato,34,10,47
  !volume,200
  !pan,10
  db 24,$71
  !f6
  db 24,$73
  !c6
  db 24,$75
  !ds6
  db 24,$77
  !as5
  db 24,$78
  !c6
  db 24,$79
  !gs5
  db 24,$7A
  !as5
  !g5
  db 24,$7B
  !gs6
  !c6
  db 24,$7C
  !g6
  !c6
  db 24,$7D
  !f6
  !c6
  db 24,$7E
  !ds6
  !c6
  !loop : dw .sub4A65 : db 1
  db 24,$7F
  !c6
  !f6
  !c6
  !ds6
  !c6
  !loop : dw .sub4A65 : db 1
  db 24,$7F
  !c6
  !adsrGain,$7F,$F6
  !tie
  db 72
  !rest
  !endVibrato
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 7
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 7
  !subloop,0
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 3
  !subloop,3
  !subloop,0
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4972 : db 7
  !subloop,1
  !subloop,0
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4972 : db 3
  !subloop,1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4972 : db 2
  !instr,!instr22
  !volume,166
  !pan,11
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,170
  !pan,9
  db 12,$7D
  !c5
  !loop : dw .sub4A24 : db 1
  !loop : dw .sub493C : db 7
  !subloop,0
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 7
  !subloop,1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 2
  !loop : dw .sub4951 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub4951 : db 1
  !loop : dw .sub49B6 : db 1
  !loop : dw .sub49E2 : db 2
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr23
  !volume,185
  !pan,10
  !c5
  !c5
  db 24
  !c5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 72
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr23
  !volume,185
  !pan,10
  db 48
  !c5
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  !cs5
  !cs5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub493C : db 6
  !loop : dw .sub4951 : db 1
  !loop : dw .sub493C : db 8
  !end

.pattern0_7
  !subloop,0
  db 96,$7F
  !rest
  !subloop,15
  !instr,!instr31
  !volume,220
  !pan,138
  !transpose,244
  !loop : dw .sub4A73 : db 1
  db 48,$7F
  !rest
  !transpose,0
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,10
  db 96
  !f5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !cs5
  !tie
  db 96
  !ds5
  !tie
.pattern1_7:
  !pan,10
  db 96
  !f5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !d5
  !tie
  !cs5
  !ds5
  !loop : dw .sub4E97 : db 1
  db 96,$7F
  !cs5
  !tie
  db 96
  !ds5
  !tie
  !pan,13
  db 96
  !c5
  !tie
  !tie
  db 48
  !ds5
  !instr,!instr27
  !volume,255
  !vibrato,32,10,47
  !tremolo,0,6,18
  !amplify,63
  !pan,9
  db 24
  !f5
  !gs5
  !amplify,0
  !tremolo,0,0,0
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,13
  db 96
  !c5
  !tie
  !loop : dw .sub4EE8 : db 1
  db 96,$7F
  !c5
  !tie
  !tie
  !tie
  !loop : dw .sub4EE8 : db 1
  db 96,$7F
  !cs5
  db 72
  !c5
  !instr,!instr28
  !volume,255
  !vibrato,34,8,52
  !tremolo,0,6,20
  !amplify,95
  !pan,9
  db 12
  !c6
  !ds6
  !amplify,0
  !tremolo,0,0,0
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,13
  !loop : dw .sub4E8A : db 3
  !loop : dw .sub4EFB : db 1
  !loop : dw .sub4F16 : db 2
  !loop : dw .sub4F2A : db 2
  db 96,$7F
  !c5
  !tie
  db 96
  !as4
  !tie
  db 96
  !gs4
  !tie
  !g4
  db 96
  !c5
  !tie
  !tie
  db 96
  !as4
  !tie
  !tie
  !tie
  !g4
  !as4
  db 96
  !gs4
  !tie
  db 96
  !as4
  !tie
  db 96
  !g4
  !tie
  !c5
  !as4
  db 96
  !gs4
  !tie
  db 96
  !as4
  !tie
  db 96
  !g4
  !tie
  db 96
  !c5
  !tie
  !endVibrato
  !instr,!instr20
  !volume,255
  !pan,138
  !amplify,100
  db 96
  !c3
  !tie
  !amplify,0
  !instr,!instr31
  !volume,220
  !pan,138
  !transpose,244
  !loop : dw .sub4906 : db 1
  db 96,$7F
  !rest
  !transpose,0
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,13
  !loop : dw .sub4E8A : db 3
  !loop : dw .sub4EFB : db 1
  !loop : dw .sub4F16 : db 1
  db 96,$7F
  !c5
  db 72
  !tie
  db 96
  !as4
  !tie
  db 24
  !tie
  db 96
  !gs4
  db 72
  !tie
  db 96
  !as4
  !tie
  !instr,!instr27
  !volume,255
  !vibrato,32,10,47
  !tremolo,0,6,18
  !amplify,63
  !pan,9
  db 12
  !c6
  !ds6
  !amplify,0
  !tremolo,0,0,0
  !instr,!instr2E
  !volume,170
  !endVibrato
  !pan,13
  !loop : dw .sub4F2A : db 2
  !loop : dw .sub4E7C : db 1
  !end

.sub4727
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,170
  !pan,9
  !amplify,0
  db 12
  !c5
  db 12,$7D
  !c5
  !amplify,70
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36,$7F
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  db 12
  !c4
  !end

.sub474D
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !end

.sub4760
  db 24,$7F
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  db 12
  !c4
  !end

.sub4775
  db 12,$7F
  !c4
  !c4
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
  !volume,218
  !pan,10
  !end

.sub478C
  db 12,$7F
  !c4
  !instr,!instr21
  !volume,170
  !pan,9
  !amplify,0
  db 12,$7D
  !c5
  db 12,$7F
  !c5
  db 12,$7D
  !c5
  !amplify,70
  !instr,!instr1E
  !volume,255
  !pan,10
  db 36,$7F
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  db 12
  !c4
  !end

.sub47B6
  !subloop,0
  db 24,$7F
  !c4
  !rest
  !subloop,6
  db 12,$7F
  !c4
  db 24
  !c4
  db 12
  !rest
  !subloop,0
  db 24,$7F
  !c4
  !rest
  !subloop,3
  db 24,$7F
  !c4
  !end

.sub47D1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,218
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
  !volume,218
  !pan,10
  !end

.sub4800
  db 24,$7F
  !c4
  db 12
  !c4
  !instr,!instr21
  !volume,170
  !pan,9
  !amplify,0
  db 12,$7D
  !c5
  !amplify,70
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !end

.sub4824
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !end

.sub4839
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !end

.sub484C
  db 24,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 36
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  db 12
  !c4
  !end

.sub4861
  db 24,$7F
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 48
  !c4
  db 12
  !c4
  !c4
  db 48
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  db 24
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  !end

.sub488F
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,218
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
  !volume,218
  !pan,10
  !end

.sub48B2
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48,$7F
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,218
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
  !volume,218
  !pan,10
  !end

.sub48D7
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48,$7F
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,218
  !pan,10
  db 12
  !c4
  !instr,!instr21
  !volume,170
  !pan,9
  !amplify,0
  db 12,$7D
  !c5
  !amplify,70
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
  !c4
  !c4
  !c4
  !c4
  !end

.sub4906
  !subloop,0
  db 96,$7F
  !f3
  !tie
  !tie
  !tie
  db 96
  !cs3
  !tie
  db 96
  !ds3
  !tie
  !subloop,1
  db 96,$7F
  !cs3
  !tie
  db 96
  !ds3
  !tie
  db 96
  !c3
  !tie
  db 96
  !ds3
  !tie
  db 96
  !cs3
  !tie
  db 96
  !e3
  !tie
  db 96
  !f3
  !tie
  !tie
  !tie
  !adsrGain,$7F,$EF
  db 96
  !tie
  !tie
  !subloop,0
  db 96,$7F
  !rest
  !subloop,8
  !end

.sub4A73
  db 96,$7F
  !cs3
  !tie
  db 96
  !ds3
  !tie
  db 96
  !f3
  !tie
  !tie
  !tie
  db 96
  !cs3
  !tie
  db 96
  !ds3
  !tie
  db 96
  !f3
  !tie
  !tie
  db 48
  !tie
  !end

.sub4A8C
  db 24,$7F
  !f5
  db 12
  !f5
  !f5
  !end

.sub4A93
  db 24,$7F
  !gs5
  db 12
  !cs5
  !cs5
  !end

.sub4A9A
  db 24,$7F
  !cs5
  db 12
  !cs5
  !cs5
  db 24
  !cs6
  db 12
  !cs5
  !cs5
  !end

.sub4AA6
  db 24,$7F
  !cs6
  db 12
  !cs5
  !cs5
  db 24
  !b5
  db 12
  !cs5
  !cs5
  !transpose,0
  !end

.sub4AB5
  db 24,$7F
  !cs5
  db 12
  !cs5
  !cs5
  db 24
  !cs6
  db 48
  !b4
  db 12
  !b4
  !b4
  db 48
  !b4
  db 24,$78
  !b4
  db 24,$75
  !b4
  !transpose,0
  db 48,$7F
  !f6
  !pitchSlide,16,28 : !f5
  !end

.sub4AD5
  db 24,$7F
  !f5
  db 12
  !ds5
  !ds5
  !end

.sub4ADC
  db 24,$7F
  !cs5
  db 12
  !ds5
  !ds5
  !end

.sub4AE3
  db 24,$7F
  !ds5
  db 12
  !e5
  !e5
  !end

.sub4AEA
  db 48,$7D
  !f6
  !ds6
  !c6
  !as5
  !end

.sub4AF1
  db 48,$7D
  !f6
  !ds6
  !c6
  db 24
  !g6
  db 72
  !gs6
  !end

.sub4AFB
  db 24,$7F
  !f6
  !c6
  !ds6
  !as5
  !c6
  !gs5
  !as5
  !g5
  !end

.sub4B06
  db 24,$7F
  !f6
  !c6
  !ds6
  !as5
  !c6
  !gs5
  !g6
  db 48
  !gs6
  !end

.sub4B12
  db 24,$7F
  !c6
  !g6
  !as5
  !f6
  !gs5
  !ds6
  !g5
  !end

.sub4B1C
  db 24,$7F
  !c6
  !as6
  !g6
  !gs6
  !c6
  !end

.sub4B24
  db 96,$7F
  !g5
  db 48
  !b4
  !pitchSlide,0,11 : !ds5
  db 24
  !tie
  !f5
  db 48
  !f5
  db 24
  !f5
  !gs5
  db 48
  !gs5
  !pitchSlide,0,10 : !as5
  db 24
  !as5
  !c6
  !ds6
  !c6
  !end

.sub4B41
  db 96,$7F
  !g6
  db 48
  !b5
  !pitchSlide,0,11 : !ds6
  db 24
  !tie
  !f6
  db 48
  !f6
  db 24
  !f6
  !gs6
  db 48
  !gs6
  !pitchSlide,0,10 : !as6
  db 24
  !as6
  !c7
  !ds7
  !c7
  !as6
  !c7
  !end

.sub4B60
  db 24,$7F
  !f6
  !c6
  !ds6
  !as5
  !c6
  !gs5
  !g6
  !f6
  !pitchSlide,0,6 : !gs6
  !tie
  !end

.sub4B70
  db 24,$7F
  !f6
  db 12
  !c6
  !c6
  db 24
  !ds6
  !as5
  !c6
  !gs5
  !as5
  !g5
  !end

.sub4B7E
  db 48,$7F
  !cs6
  !pitchSlide,0,10 : !f6
  db 24
  !f6
  !f6
  !adsrGain,$7F,$F8
  !tie
  !instr,!instr28
  !c7
  !pitchSlide,0,10 : !ds7
  !cs7
  db 120
  !c7
  !adsrGain,$7F,$F6
  db 24
  !tie
  !instr,!instr29
  !volume,255
  !vibrato,36,12,36
  !tremolo,0,8,22
  !amplify,66
  !pan,9
  db 12
  !f5
  !g5
  db 24
  !gs5
  !as5
  !end

.sub4BB3
  db 48,$7F
  !a5
  !pitchSlide,0,10 : !c6
  !f5
  !a5
  !pitchSlide,0,10 : !c6
  db 24
  !f5
  db 48
  !d5
  !pitchSlide,0,10 : !f5
  db 24
  !as5
  !c6
  !ds6
  !c6
  !as5
  db 48
  !f5
  !a5
  !pitchSlide,0,10 : !c6
  !f5
  !end

.sub4BD7
  db 48,$7F
  !a5
  !pitchSlide,0,10 : !c6
  db 24
  !f5
  db 48
  !d6
  !pitchSlide,0,10 : !f6
  db 24
  !c6
  !ds6
  db 12
  !as5
  !c6
  !as5
  !gs5
  !g5
  !ds5
  !g5
  !gs5
  db 24
  !as5
  !end

.sub4BF5
  db 48,$7F
  !d6
  !pitchSlide,0,10 : !f6
  !c6
  !d6
  !pitchSlide,0,10 : !f6
  !c6
  db 36
  !e6
  !pitchSlide,0,12 : !g6
  !gs6
  !end

.sub4C0B
  db 24,$7F
  !as6
  !gs6
  !g6
  db 48
  !ds6
  db 24
  !d6
  !pitchSlide,0,10 : !f6
  !c6
  !ds6
  !as5
  !c6
  !gs5
  !end

.sub4C1E
  db 24,$7F
  !e6
  !pitchSlide,0,8 : !g6
  db 48
  !f6
  !pitchSlide,0,10 : !gs6
  db 24
  !c6
  !as6
  !g6
  !gs6
  !c6
  !g6
  db 12
  !as5
  !c6
  db 48
  !d6
  !pitchSlide,0,10 : !f6
  !c6
  !d6
  !pitchSlide,0,10 : !f6
  !c6
  db 24
  !a5
  !pitchSlide,0,10 : !c6
  !f6
  !gs6
  !end

.sub4C4B
  db 24,$7F
  !d5
  !pitchSlide,0,8 : !f5
  !b5
  !c6
  !c6
  !end

.sub4C56
  db 24,$7F
  !c6
  !as5
  !gs5
  db 12
  !as5
  !gs5
  !as5
  !b5
  db 24
  !c6
  db 24,$79
  !c6
  db 24,$76
  !c6
  db 12,$7F
  !as5
  !gs5
  !as5
  !b5
  !end

.sub4C6F
  db 24,$7F
  !ds6
  !c6
  !ds6
  !c6
  !e6
  !g6
  db 48
  !f6
  !pitchSlide,0,10 : !gs6
  db 24,$79
  !gs6
  db 12,$7F
  !g6
  !gs6
  db 24
  !g6
  !f6
  !ds6
  !as5
  db 48
  !f6
  !pitchSlide,0,10 : !gs6
  db 24,$79
  !gs6
  db 12,$7F
  !g6
  !gs6
  db 24
  !as6
  !gs6
  !g6
  !ds6
  db 48
  !a6
  !pitchSlide,0,10 : !c7
  db 24,$79
  !c7
  db 12,$7F
  !as6
  !gs6
  db 48
  !as6
  !pitchSlide,0,10 : !c7
  !tie
  db 24,$79
  !c7
  db 24,$7F
  !c6
  !pitchSlide,0,8 : !e6
  !e6
  !c6
  !e6
  !c6
  !end

.sub4CBE
  db 48,$7F
  !f6
  !ds6
  !c6
  !as5
  !gs6
  !g6
  !f6
  !ds6
  !end

.sub4CC9
  db 24,$7F
  !c7
  !gs6
  !as6
  !g6
  !gs6
  !f6
  !g6
  !ds6
  !end

.sub4CD4
  db 48,$7D
  !c6
  !as5
  !gs5
  !g5
  !end

.sub4CDB
  db 48,$7D
  !c6
  !as5
  db 96
  !gs5
  !end

.sub4CE2
  db 24,$6F
  !f5
  db 12
  !f5
  !f5
  !end

.sub4CE9
  db 12,$6F
  !f5
  !f5
  !f5
  !f5
  !end

.sub4CF0
  db 24,$7D
  !c6
  !gs5
  !c6
  !g5
  !gs5
  !f5
  !g5
  !ds5
  !end

.sub4CFB
  db 24,$7D
  !c6
  !gs5
  !c6
  !g5
  !gs5
  !f5
  !ds6
  !d6
  !pitchSlide,0,6 : !f6
  !tie
  !end

.sub4D0B
  db 24,$7D
  !gs5
  !ds6
  !g5
  !c6
  !f5
  !c6
  !ds5
  !end

.sub4D15
  db 24,$7D
  !c6
  db 12
  !gs5
  !gs5
  db 24
  !c6
  !g5
  !gs5
  !f5
  !g5
  !ds5
  !end

.sub4D23
  db 24,$7D
  !gs5
  !g6
  !ds6
  !f6
  !gs5
  !end

.sub4D2B
  db 48,$7D
  !f5
  !pitchSlide,0,10 : !c6
  db 24
  !c6
  !c6
  !adsrGain,$7F,$F8
  !tie
  !instr,!instr28
  !a6
  !pitchSlide,0,10 : !c7
  !as6
  db 120
  !g6
  !adsrGain,$7F,$F6
  db 24
  !tie
  !instr,!instr29
  !volume,255
  !vibrato,36,12,36
  !tremolo,0,8,22
  !amplify,66
  !pan,11
  db 12,$7C
  !c5
  !ds5
  db 24
  !f5
  !f5
  !end

.sub4D61
  db 48,$7C
  !d5
  !pitchSlide,0,10 : !f5
  !c5
  !d5
  !pitchSlide,0,10 : !f5
  db 24
  !c5
  db 48
  !a4
  !pitchSlide,0,10 : !c5
  db 24
  !f5
  !f5
  !c6
  !f5
  !f5
  db 48
  !c5
  !d5
  !pitchSlide,0,10 : !f5
  !c5
  !end

.sub4D85
  db 48,$7C
  !d5
  !pitchSlide,0,10 : !f5
  db 24
  !c5
  db 48
  !e5
  !pitchSlide,0,10 : !gs5
  db 24
  !gs5
  !g5
  db 12
  !g5
  !f5
  !g5
  !f5
  !ds5
  !c5
  !ds5
  !f5
  db 24
  !g5
  !end

.sub4DA3
  db 48,$7C
  !a5
  !pitchSlide,0,12 : !cs6
  !tie
  db 12
  !ds6
  !cs6
  db 72
  !c6
  !end

.sub4DB1
  db 48,$7C
  !a5
  !pitchSlide,0,10 : !c6
  !f5
  !a5
  !pitchSlide,0,10 : !c6
  !f5
  db 36
  !c6
  !pitchSlide,0,12 : !ds6
  !f6
  !end

.sub4DC7
  db 24,$7C
  !g6
  !f6
  !ds6
  db 48
  !c6
  db 24
  !a5
  !pitchSlide,0,10 : !c6
  !gs5
  !c6
  !g5
  !gs5
  !f5
  !end

.sub4DDA
  db 24,$7C
  !c6
  !pitchSlide,0,8 : !ds6
  db 48
  !d6
  !pitchSlide,0,10 : !f6
  db 24
  !gs5
  !g6
  !ds6
  !f6
  !gs5
  !ds6
  db 12
  !g5
  !gs5
  db 48
  !a5
  !pitchSlide,0,10 : !c6
  !f5
  !a5
  !pitchSlide,0,10 : !c6
  !f5
  db 24
  !d5
  !pitchSlide,0,10 : !f5
  !c6
  !f6
  !end

.sub4E07
  db 24,$7D
  !c6
  !g5
  !c6
  !g5
  !c6
  !e6
  db 48
  !a5
  !pitchSlide,0,10 : !c6
  db 24,$77
  !c6
  db 12,$7D
  !as5
  !c6
  db 24
  !as5
  !gs5
  !g5
  !ds5
  db 48
  !a5
  !pitchSlide,0,10 : !c6
  db 24,$77
  !c6
  db 12,$7D
  !as5
  !c6
  db 24
  !cs6
  !c6
  !as5
  !g5
  db 48
  !f6
  !pitchSlide,0,10 : !gs6
  db 24,$77
  !gs6
  db 12,$7D
  !g6
  !f6
  db 48
  !fs6
  !pitchSlide,0,10 : !gs6
  !tie
  db 24,$77
  !gs6
  db 24,$7D
  !gs5
  !pitchSlide,0,8 : !c6
  !c6
  !g5
  !c6
  !g5
  db 48
  !c6
  !pitchSlide,26,22 : !c5
  !end

.sub4E5C
  db 48,$7F
  !c6
  !as5
  !gs5
  !g5
  !c6
  !c6
  !c6
  !c6
  !end

.sub4E67
  db 24,$7C
  !gs6
  !f6
  !g6
  !ds6
  !f6
  !c6
  !ds6
  !c6
  !f6
  !end

.sub4E73
  db 24,$7C
  !ds6
  !as5
  !c6
  !gs5
  !as5
  !g5
  !end

.sub4E7C
  db 96,$7F
  !c5
  !tie
  db 96
  !as4
  !tie
  db 96
  !gs4
  !tie
  db 96
  !as4
  !tie
  !end

.sub4E8A
  db 96,$7F
  !gs4
  !tie
  db 96
  !as4
  !tie
  db 96
  !c5
  !tie
  !tie
  !ds5
  !end

.sub4E97
  db 96,$7F
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

.sub4EA4
  db 96,$7F
  !cs5
  !tie
  db 96
  !ds5
  !tie
  db 96
  !f5
  !tie
  !tie
  !g5
  !end

.sub4EB1
  db 96,$7F
  !cs5
  !tie
  db 96
  !ds5
  !tie
  db 120
  !f5
  !adsrGain,$7F,$F6
  db 48
  !tie
  !instr,!instr2E
  db 120
  !g5
  !adsrGain,$7F,$F6
  db 48
  !tie
  !instr,!instr2E
  !instr,!instr2D
  !volume,238
  !pan,138
  !endVibrato
  !c6
  !pitchSlide,16,28 : !c5
  !end

.sub4ED7
  db 12,$6F
  !f5
  !f5
  !ds5
  !ds5
  !end

.sub4EDE
  !transpose,0
  db 12,$6F
  !cs5
  !cs5
  !ds5
  !ds5
  !end

.sub4F3A
  db 96,$7F
  !gs4
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

.sub4F48
  db 96,$7F
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

.sub4F55
  db 96,$7F
  !g4
  !tie
  db 96
  !f4
  !tie
  db 96
  !g4
  !tie
  db 96
  !gs4
  !tie
  db 96
  !g4
  !tie
  !f4
  !g4
  !end

.sub4F68
  db 96,$7F
  !f4
  !tie
  db 96
  !g4
  !tie
  db 96
  !gs4
  !tie
  !tie
  !as4
  !end

.sub4F75
  db 96,$7F
  !f4
  !tie
  db 96
  !g4
  !tie
  db 120
  !gs4
  !adsrGain,$7F,$F6
  db 48
  !tie
  !instr,!instr2E
  db 120
  !as4
  !adsrGain,$7F,$F6
  db 48
  !tie
  !instr,!instr2E
  !rest
  !end

.sub4F90
  db 96,$7F
  !gs4
  db 72
  !tie
  db 96
  !g4
  !tie
  db 24
  !tie
  db 96
  !f4
  db 72
  !tie
  db 96
  !g4
  !tie
  db 24
  !tie
  !end

.sub4FA4
  db 96,$7F
  !f4
  !tie
  db 96
  !g4
  !tie
  db 96
  !ds4
  db 72
  !tie
  db 120
  !gs4
  db 96
  !g4
  db 96
  !f4
  !tie
  db 96
  !g4
  !tie
  db 96
  !ds4
  db 72
  !tie
  db 96
  !g4
  !tie
  db 24
  !tie
  !end

.sub4FC3
  db 96,$7F
  !gs4
  !tie
  db 96
  !g4
  !tie
  db 96
  !f4
  !tie
  !ds4
  !g4
  !end

.sub493C
  !instr,!instr22
  !volume,166
  !pan,11
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,170
  !pan,9
  db 12
  !c5
  db 12,$7D
  !c5
  !end

.sub4951
  !instr,!instr22
  !volume,166
  !pan,11
  db 24,$7F
  !c5
  !instr,!instr1F
  !volume,218
  !pan,10
  !amplify,70
  db 12
  !c4
  !amplify,0
  !instr,!instr21
  !volume,170
  !pan,9
  db 12,$7D
  !c5
  !end

.sub4972
  !instr,!instr22
  !volume,166
  !pan,11
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,170
  !pan,9
  db 12,$7D
  !c5
  db 12,$7F
  !c5
  db 12,$7D
  !c5
  !end

.sub498B
  !instr,!instr22
  !volume,166
  !pan,11
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,170
  !pan,9
  db 12,$7D
  !c5
  !instr,!instr1F
  !volume,218
  !pan,10
  !amplify,70
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr21
  !volume,170
  !pan,9
  db 12,$7D
  !c5
  !end

.sub49B6
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !cs5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !cs5
  !amplify,0
  !toggleEcho
  !subloop,0
  !instr,!instr23
  !volume,185
  !pan,10
  db 48,$7F
  !c5
  !subloop,6
  !end

.sub49E2
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !subloop,0
  !instr,!instr23
  !volume,185
  !pan,10
  db 48,$7F
  !c5
  !subloop,6
  !end

.sub4A03
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !subloop,0
  !instr,!instr23
  !volume,185
  !pan,10
  db 48,$7F
  !c5
  !subloop,2
  !end

.sub4A24
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 72,$7F
  !cs5
  db 96
  !cs5
  db 48
  !tie
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !cs5
  !amplify,0
  !toggleEcho
  !end

.sub4A46
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,232
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,170
  !pan,9
  db 12
  !c5
  db 12,$7D
  !c5
  !end

.sub4A65
  db 24,$7F
  !f6
  !c6
  !ds6
  !as5
  !c6
  !gs5
  !as5
  !g5
  !gs6
  !c6
  !g6
  !end

.sub4EE8
  db 96,$7F
  !as4
  !tie
  db 96
  !gs4
  !tie
  db 96
  !as4
  !tie
  db 96
  !c5
  !tie
  db 96
  !as4
  !tie
  !gs4
  !as4
  !end

.sub4EFB
  db 96,$7F
  !gs4
  !tie
  db 96
  !as4
  !tie
  db 120
  !c5
  !adsrGain,$7F,$F6
  db 48
  !tie
  !instr,!instr2E
  db 120
  !ds5
  !adsrGain,$7F,$F6
  db 48
  !tie
  !instr,!instr2E
  !rest
  !end

.sub4F16
  db 96,$7F
  !c5
  db 72
  !tie
  db 96
  !as4
  !tie
  db 24
  !tie
  db 96
  !gs4
  db 72
  !tie
  db 96
  !as4
  !tie
  db 24
  !tie
  !end

.sub4F2A
  db 96,$7F
  !gs4
  !tie
  db 96
  !as4
  !tie
  db 96
  !g4
  db 72
  !tie
  db 120
  !c5
  db 96
  !as4
  !end

assert pc() <= $10000-(5*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
