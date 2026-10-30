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

!sample02 = $16
!sample08 = $17
!sample0C = $18
!sample14 = $19
!sample15 = $1A
!sample16 = $1B
!sample17 = $1C
!sample18 = $1D
!sample19 = $1E
!sample1A = $1F
!sample1B = $20
!sample1C = $21
!sample1D = $22
!sample1E = $23
!sample1F = $24
!sample20 = $25
!sample21 = $26

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample1D,$9F,$F5,$B8,$15,$00
  db !sample1E,$CF,$FA,$B8,$13,$00
  db !sample1F,$FF,$F2,$B8,$09,$00
  db !sample20,$FF,$FC,$B8,$0A,$80
  db !sample20,$FF,$F5,$B8,$0A,$80
  db !sample20,$FE,$FA,$B8,$0B,$40
  db !sample21,$9F,$F2,$B8,$0A,$00
  db !sample21,$9F,$F3,$B8,$0A,$00
  db !sample02,$AE,$52,$B8,$03,$00
  db !sample14,$FF,$E8,$B8,$04,$02
  db !sample15,$FF,$EA,$B8,$04,$01
  db !sample08,$EF,$AC,$B8,$03,$00
  db !sample16,$FF,$D0,$B8,$03,$00
  db !sample17,$FF,$EA,$B8,$03,$C0
  db !sample18,$FF,$E4,$B8,$04,$00
  db !sample19,$FE,$EA,$B8,$03,$00
  db !sample1A,$FE,$EA,$B8,$03,$00
  db !sample0C,$FF,$E8,$B8,$03,$00
  db !sample1B,$FA,$E0,$B8,$03,$00
  db !sample14,$FE,$EA,$B8,$04,$02
  db !sample14,$FE,$E0,$B8,$04,$02
  db !sample1C,$FF,$EC,$B8,$05,$C0
  db !sample1B,$FE,$E0,$B8,$03,$00
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample02,Sample02+234
  dw Sample08,Sample08+36
  dw Sample0C,Sample0C+36
  dw Sample14,Sample14+9
  dw Sample15,Sample15+27
  dw Sample16,Sample16+1359
  dw Sample17,Sample17+441
  dw Sample18,Sample18+27
  dw Sample19,Sample19+63
  dw Sample1A,Sample1A+1224
  dw Sample1B,Sample1B+513
  dw Sample1C,Sample1C+1845
  dw Sample1D,Sample1D+909
  dw Sample1E,Sample1E+1584
  dw Sample1F,Sample1F+684
  dw Sample20,Sample20+234
  dw Sample21,Sample21+909
endspcblock

pushpc
org !p_songSpecificData ; sample data
  Sample02: skip filesize("../../default/02 SMW @2.brr")-2
  Sample08: skip filesize("../../default/08 SMW @6.brr")-2
  Sample0C: skip filesize("../../default/0C SMW @13.brr")-2
  Sample14: skip filesize("Chrono Pulse-Width Mod.brr")-2
  Sample15: skip filesize("MM7 Elec Piano.brr")-2
  Sample16: skip filesize("Soi Piano High.brr")-2
  Sample17: skip filesize("Popful Mail Overdrive.brr")-2
  Sample18: skip filesize("KMT Square.brr")-2
  Sample19: skip filesize("08 SMW @6C.brr")-2
  Sample1A: skip filesize("Ken Trumpet.brr")-2
  Sample1B: skip filesize("MMX1 String Ens.brr")-2
  Sample1C: skip filesize("S3 Slap Bass II.brr")-2
  Sample1D: skip filesize("Yasui Snare.brr")-2
  Sample1E: skip filesize("DR-880 Kick.brr")-2
  Sample1F: skip filesize("S-550 LA Tom.brr")-2
  Sample20: skip filesize("TR-909 Hi-Hat.brr")-2
  Sample21: skip filesize("R-8 Crash Cym.brr")-2
  NoteLengthTable:
pullpc

spcblock NoteLengthTable nspc
  ; note length table
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
  !echo,%10111100,64,-65
  !echoParameters,4,160,0
  !setDPMiscCommand,!noteEndInTicks,1
  !musicVolume,100
  !tempo,72
  !endVibrato
  !amplify,63
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 72
  !tie
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
.pattern1_0:
  !loop : dw .sub4E24 : db 1
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
  db 12
  !c4
  !c4
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
  !loop : dw .sub4E24 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24,$7F
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
  !loop : dw .sub4E9D : db 1
  !loop : dw .sub4ECD : db 1
  !loop : dw .sub4EF0 : db 1
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
  !loop : dw .sub4E9D : db 1
  !loop : dw .sub4ECD : db 1
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
  !instr,!instr1F
  !volume,225
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
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  db 12
  !c5
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
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 72
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4ECD : db 1
  !loop : dw .sub4EF0 : db 1
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
  !loop : dw .sub4F24 : db 1
  !loop : dw .sub4ECD : db 1
  !loop : dw .sub4EF0 : db 1
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
  !loop : dw .sub4F56 : db 1
  db 12,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4F63 : db 1
  !loop : dw .sub4F8B : db 1
  !loop : dw .sub4F63 : db 1
  !loop : dw .sub4FAD : db 1
  !loop : dw .sub4F63 : db 1
  !loop : dw .sub4F8B : db 1
  !loop : dw .sub4F63 : db 1
  db 24,$7F
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
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !amplify,63
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
  !loop : dw .sub4F8B : db 1
  !loop : dw .sub4F63 : db 1
  !loop : dw .sub4FAD : db 1
  !loop : dw .sub4F63 : db 1
  !loop : dw .sub4F8B : db 1
  !loop : dw .sub4F63 : db 1
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
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
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4FCF : db 1
  db 24,$7F
  !rest
  !c4
  !rest
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
  !c4
  !rest
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  db 12
  !c4
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4FCF : db 1
  db 24,$7F
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
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  db 12
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4F24 : db 1
  !loop : dw .sub4ECD : db 1
  !loop : dw .sub4EF0 : db 1
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
  db 12
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !c5
  !c5
  !amplify,63
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
  db 72
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4ECD : db 1
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
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !loop : dw .sub4F56 : db 1
  db 12,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !c5
  !amplify,63
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4FFB : db 1
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
  !loop : dw .sub4FFB : db 1
  db 48,$7F
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
  !loop : dw .sub501A : db 1
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  db 24,$7F
  !c5
  !amplify,63
  !instr,!instr1F
  !volume,225
  !pan,10
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
  !loop : dw .sub501A : db 1
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
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !loop : dw .sub4F56 : db 1
  db 12,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub5044 : db 1
  db 72,$7F
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
  db 24
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  !c4
  !c4
  db 48
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !instr,!instr21
  !volume,180
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
  db 12
  !c4
  !instr,!instr21
  !volume,180
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
  db 12
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !c5
  !c5
  !amplify,63
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
  db 24
  !c4
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
  db 12
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !c5
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
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 48
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  db 12
  !c5
  !c5
  !amplify,63
  !instr,!instr1F
  !volume,225
  !pan,10
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !amplify,63
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
  db 24
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
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  db 12
  !c5
  !c5
  !amplify,63
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
  db 24
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
  db 12
  !c4
  !c4
  !c4
  !c4
  db 60
  !c4
  db 12
  !c4
  !c4
  !c4
  db 48
  !c4
  db 12
  !c4
  !c4
  !c4
  !c4
  db 48
  !c4
  !c4
  db 24
  !c4
  !c4
  db 12
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub5044 : db 1
  db 72,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub5070 : db 1
  !loop : dw .sub509B : db 1
  !loop : dw .sub50B9 : db 1
  !loop : dw .sub5044 : db 1
  db 72,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub5070 : db 1
  !loop : dw .sub509B : db 1
  !loop : dw .sub50EF : db 1
  !loop : dw .sub5044 : db 1
  db 72,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub5070 : db 1
  !loop : dw .sub509B : db 1
  !loop : dw .sub50B9 : db 1
  !loop : dw .sub5044 : db 1
  !loop : dw .sub511E : db 1
  !loop : dw .sub5070 : db 1
  db 12,$7F
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !c5
  !c5
  !amplify,63
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
  db 24
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !loop : dw .sub514B : db 1
  !loop : dw .sub4F56 : db 1
  db 12,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub515B : db 1
  !loop : dw .sub519A : db 1
  !loop : dw .sub515B : db 1
  !loop : dw .sub51D1 : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
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
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub515B : db 1
  !loop : dw .sub519A : db 1
  !loop : dw .sub515B : db 1
  !loop : dw .sub51D1 : db 1
  !loop : dw .sub51EE : db 1
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  db 12
  !c5
  !c5
  !amplify,63
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
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !amplify,63
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !loop : dw .sub520A : db 1
  !loop : dw .sub515B : db 1
  !loop : dw .sub51D1 : db 1
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
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub515B : db 1
  !loop : dw .sub520A : db 1
  !loop : dw .sub515B : db 1
  !loop : dw .sub51D1 : db 1
  !loop : dw .sub51EE : db 1
  !loop : dw .sub5241 : db 1
  db 12,$7F
  !c4
  db 24
  !c4
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
  !loop : dw .sub5241 : db 1
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12
  !c4
  !c4
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub52CE : db 1
  !loop : dw .sub52ED : db 3
  !loop : dw .sub52ED : db 3
  !loop : dw .sub52FE : db 1
  !loop : dw .sub52ED : db 4
  !loop : dw .sub52ED : db 2
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 24
  !c4
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub4F56 : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub52CE : db 1
  !loop : dw .sub52ED : db 2
  !loop : dw .sub52FE : db 1
  !loop : dw .sub52ED : db 3
  !loop : dw .sub4F56 : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub52ED : db 3
  !loop : dw .sub52FE : db 1
  !loop : dw .sub52ED : db 1
  !loop : dw .sub52ED : db 1
  db 12,$7F
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
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub5044 : db 1
  db 72,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub5070 : db 1
  !loop : dw .sub509B : db 1
  !loop : dw .sub50B9 : db 1
  !loop : dw .sub5044 : db 1
  db 72,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub5070 : db 1
  !loop : dw .sub509B : db 1
  !loop : dw .sub50EF : db 1
  !loop : dw .sub5044 : db 1
  db 72,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !loop : dw .sub5070 : db 1
  !loop : dw .sub509B : db 1
  !loop : dw .sub50B9 : db 1
  !loop : dw .sub5044 : db 1
  !loop : dw .sub511E : db 1
  !loop : dw .sub5070 : db 1
  !loop : dw .sub5044 : db 1
  !loop : dw .sub514B : db 1
  !loop : dw .sub4F56 : db 1
  db 12,$7F
  !c4
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 96
  !cs5
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !amplify,0
  !toggleEcho
  !instr,!instr1F
  !volume,225
  !pan,10
  !subloop,0
  db 24,$7F
  !c4
  db 48
  !rest
  !subloop,3
  db 24,$7F
  !c4
  !rest
  !c4
  !rest
  !subloop,0
  db 24,$7F
  !c4
  db 48
  !rest
  !subloop,4
  !instr,!instr1E
  !volume,255
  !pan,10
  db 12,$7F
  !c4
  !c4
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
  !tie
.pattern1_1:
  !instr,!instr33
  !volume,215
  !pan,10
  !loop : dw .sub562E : db 1
  db 24,$7F
  !cs5
  !c5
  !gs4
  !loop : dw .sub562E : db 1
  db 12,$7F
  !as5
  !as5
  !f5
  !f5
  !gs4
  !gs4
  !loop : dw .sub564F : db 1
  !loop : dw .sub5656 : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,251
  !loop : dw .sub564F : db 1
  !transpose,249
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub565D : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,254
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub564F : db 1
  !loop : dw .sub5656 : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,254
  !loop : dw .sub564F : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub5664 : db 1
  !transpose,251
  !loop : dw .sub564F : db 2
  !transpose,0
  !loop : dw .sub564F : db 1
  !loop : dw .sub5656 : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,251
  !loop : dw .sub564F : db 1
  !transpose,249
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub565D : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,254
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub564F : db 1
  !loop : dw .sub5656 : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,254
  !loop : dw .sub564F : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub5656 : db 1
  !transpose,251
  !loop : dw .sub564F : db 1
  !transpose,0
  db 24,$7F
  !f4
  db 12
  !gs4
  !gs4
  !c5
  !c5
  !f5
  !f5
  !transpose,249
  !loop : dw .sub564F : db 1
  !transpose,251
  !loop : dw .sub564F : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub566B : db 1
  !transpose,249
  !loop : dw .sub564F : db 1
  !transpose,251
  !loop : dw .sub564F : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub5672 : db 1
  !transpose,249
  !loop : dw .sub564F : db 1
  !transpose,251
  !loop : dw .sub564F : db 1
  !subloop,0
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,254
  !loop : dw .sub564F : db 1
  !transpose,0
  !subloop,1
  !loop : dw .sub564F : db 1
  !transpose,2
  !loop : dw .sub564F : db 1
  !transpose,249
  !loop : dw .sub564F : db 1
  !transpose,251
  !loop : dw .sub564F : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub566B : db 1
  !transpose,249
  !loop : dw .sub564F : db 1
  !transpose,251
  !loop : dw .sub564F : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub5672 : db 1
  !transpose,249
  !loop : dw .sub564F : db 1
  !transpose,251
  !loop : dw .sub564F : db 1
  !subloop,0
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,254
  !loop : dw .sub564F : db 1
  !transpose,0
  !subloop,1
  !loop : dw .sub564F : db 1
  db 24,$7F
  !c5
  db 12
  !c6
  !c6
  !gs5
  !gs5
  !c5
  !c5
  !loop : dw .sub5679 : db 1
  db 24,$7F
  !ds4
  !ds4
  db 48
  !ds4
  !f4
  db 24
  !f4
  db 48
  !fs4
  db 24
  !fs4
  db 48
  !fs4
  db 72
  !gs4
  db 24
  !gs4
  !loop : dw .sub5679 : db 1
  db 24,$7F
  !fs4
  !fs4
  db 48
  !fs4
  !gs4
  db 24
  !gs4
  db 48
  !f4
  db 24
  !f4
  !f4
  !f4
  !f4
  !f5
  !f4
  !f5
  !loop : dw .sub564F : db 1
  !loop : dw .sub5656 : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,251
  !loop : dw .sub564F : db 1
  !transpose,249
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub565D : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,254
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub564F : db 1
  !loop : dw .sub5656 : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,254
  !loop : dw .sub564F : db 1
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub5664 : db 1
  !transpose,251
  !loop : dw .sub564F : db 1
  !transpose,0
  db 24,$7F
  !f4
  db 12
  !gs4
  !gs4
  !c5
  !c5
  !f5
  !f5
  !instr,!instr34
  !volume,255
  !pan,138
  !toggleEcho
  db 96
  !fs2
  !tie
  db 96
  !gs2
  !tie
  db 72
  !as2
  !gs2
  db 96
  !as2
  !tie
  db 48
  !tie
  db 96
  !fs2
  !tie
  db 96
  !gs2
  !tie
  db 96
  !a2
  !tie
  !tie
  db 24
  !tie
  !toggleEcho
  !instr,!instr33
  !volume,215
  !pan,10
  db 12
  !f5
  !f5
  !c5
  !c5
  !f4
  !f4
  !transpose,252
  !loop : dw .sub564F : db 2
  !transpose,254
  !loop : dw .sub564F : db 1
  !transpose,0
  db 24,$7F
  !gs4
  !gs5
  !gs4
  !gs4
  db 48
  !as4
  db 24,$78
  !as4
  db 48,$7F
  !gs4
  db 24,$78
  !gs4
  db 72,$7F
  !as4
  db 24
  !as4
  !as5
  !as4
  !as4
  db 12
  !cs5
  !cs5
  !c5
  !c5
  db 24
  !gs4
  !transpose,252
  !loop : dw .sub564F : db 1
  !transpose,0
  db 24,$7F
  !fs4
  !fs5
  !as4
  !fs4
  !transpose,254
  !loop : dw .sub564F : db 1
  !transpose,0
  !loop : dw .sub5672 : db 1
  !transpose,255
  !loop : dw .sub564F : db 1
  !transpose,0
  db 24,$7F
  !a4
  !a5
  !f5
  !a4
  !transpose,2
  !as5
  !loop : dw .sub564F : db 1
  !transpose,0
  db 12,$7F
  !c6
  !c6
  !f5
  !f5
  !c5
  !c5
  db 96
  !rest
  !tie
  !tie
  !tie
  !loop : dw .sub5690 : db 3
  !loop : dw .sub5697 : db 1
  !transpose,2
  !loop : dw .sub5690 : db 3
  !transpose,4
  !loop : dw .sub5690 : db 3
  !transpose,0
  !loop : dw .sub56A0 : db 1
  !transpose,2
  !loop : dw .sub5690 : db 3
  !transpose,0
  !loop : dw .sub5690 : db 3
  !loop : dw .sub5697 : db 1
  !transpose,2
  !loop : dw .sub5690 : db 3
  !transpose,3
  !loop : dw .sub5690 : db 3
  !transpose,0
  !loop : dw .sub56A9 : db 1
  !transpose,255
  !loop : dw .sub5690 : db 1
  !transpose,2
  !loop : dw .sub5690 : db 2
  !transpose,0
  !loop : dw .sub5690 : db 3
  !loop : dw .sub5697 : db 1
  !transpose,2
  !loop : dw .sub5690 : db 3
  !transpose,4
  !loop : dw .sub5690 : db 3
  !transpose,0
  !loop : dw .sub56A0 : db 1
  !transpose,2
  !loop : dw .sub5690 : db 3
  !transpose,0
  !loop : dw .sub5690 : db 3
  !loop : dw .sub5697 : db 1
  !transpose,2
  !loop : dw .sub5690 : db 2
  !transpose,0
  !loop : dw .sub56B2 : db 1
  !transpose,4
  !loop : dw .sub5690 : db 7
  !transpose,0
  db 12,$7F
  !f5
  !f5
  !as4
  !as4
  !loop : dw .sub56B9 : db 16
  !transpose,3
  !loop : dw .sub56B9 : db 16
  !transpose,0
  !loop : dw .sub56B9 : db 16
  !transpose,3
  !loop : dw .sub56B9 : db 14
  !transpose,0
  db 24,$7F
  !ds5
  db 12
  !c6
  !c6
  !g5
  !g5
  !as4
  !as4
  !subloop,0
  db 24,$7F
  !c5
  !c6
  !subloop,2
  db 24,$7F
  !c5
  !as5
  !subloop,0
  db 24,$7F
  !as4
  !as5
  !subloop,3
  !subloop,0
  db 24,$7F
  !a4
  !a5
  !subloop,2
  db 24,$7F
  !a4
  !b5
  !subloop,0
  db 24,$7F
  !b4
  !b5
  !subloop,3
  !subloop,0
  db 24,$7F
  !c5
  !c6
  !subloop,2
  db 24,$7F
  !c5
  !as5
  !subloop,0
  db 24,$7F
  !as4
  !as5
  !subloop,3
  !subloop,0
  db 24,$7F
  !a4
  !a5
  !subloop,2
  db 24,$7F
  !a4
  !b5
  !subloop,0
  db 24,$7F
  !b4
  !b5
  !subloop,3
  !subloop,0
  !loop : dw .sub56C0 : db 3
  !loop : dw .sub56C7 : db 1
  !transpose,254
  !loop : dw .sub56C0 : db 4
  !transpose,253
  !loop : dw .sub56C0 : db 3
  !transpose,0
  !loop : dw .sub56CE : db 1
  !transpose,255
  !loop : dw .sub56C0 : db 4
  !transpose,0
  !subloop,1
  !transpose,2
  !loop : dw .sub5690 : db 3
  !loop : dw .sub5697 : db 1
  !transpose,4
  !loop : dw .sub5690 : db 3
  !transpose,6
  !loop : dw .sub5690 : db 3
  !transpose,2
  !loop : dw .sub56A0 : db 1
  !transpose,4
  !loop : dw .sub5690 : db 3
  !transpose,2
  !loop : dw .sub5690 : db 3
  !loop : dw .sub5697 : db 1
  !transpose,4
  !loop : dw .sub5690 : db 3
  !transpose,5
  !loop : dw .sub5690 : db 3
  !transpose,2
  !loop : dw .sub56A9 : db 1
  !transpose,1
  !loop : dw .sub5690 : db 1
  !transpose,4
  !loop : dw .sub5690 : db 2
  !transpose,2
  !loop : dw .sub5690 : db 3
  !loop : dw .sub5697 : db 1
  !transpose,4
  !loop : dw .sub5690 : db 3
  !transpose,6
  !loop : dw .sub5690 : db 3
  !transpose,2
  !loop : dw .sub56A0 : db 1
  !transpose,4
  !loop : dw .sub5690 : db 3
  !transpose,2
  !loop : dw .sub5690 : db 3
  !loop : dw .sub5697 : db 1
  !transpose,4
  !loop : dw .sub5690 : db 2
  !transpose,2
  !loop : dw .sub56B2 : db 1
  !transpose,6
  !loop : dw .sub5690 : db 7
  !transpose,0
  db 12,$7F
  !g5
  !g5
  !c5
  !c5
  !subloop,0
  db 96,$7F
  !rest
  !subloop,15
  !end

.pattern0_2
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E1C : db 3,0
  !instr,!instr26
  !volume,255
  !vibrato,22,10,47
  !pan,10
  !loop : dw .sub56D5 : db 1
  db 48,$7F
  !fs5
  !ds6
  db 24
  !gs6
  db 72
  !rest
.pattern1_2:
  !transpose,0
  !loop : dw .sub56D5 : db 1
  db 48,$7F
  !fs5
  !ds6
  !gs6
  !gs5
  !loop : dw .sub56D5 : db 1
  db 48,$7F
  !fs5
  !ds6
  db 24
  !gs6
  !ds6
  !gs5
  !gs6
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E1C : db 0,0
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !pan,9
  !slideIn,0,2,1
  !loop : dw .sub56E4 : db 1
  !loop : dw .sub5708 : db 1
  !loop : dw .sub5717 : db 1
  db 24,$7F
  !a5
  !ds5
  db 120
  !f5
  !adsrGain,$7F,$F4
  db 24
  !tie
  !instr,!instr27
  !f5
  !gs5
  !c6
  !loop : dw .sub56E4 : db 1
  !loop : dw .sub5708 : db 1
  !loop : dw .sub5717 : db 1
  db 24,$7F
  !a5
  !ds5
  db 120
  !f5
  !adsrGain,$7F,$F2
  db 48
  !tie
  !rest
  !slideIn,0,0,0
  !instr,!instr28
  !volume,255
  !vibrato,28,11,54
  !pan,8
  db 72
  !as4
  !loop : dw .sub5734 : db 1
  !loop : dw .sub5749 : db 1
  db 72,$7F
  !f5
  db 120
  !ds5
  !transpose,12
  db 72
  !as4
  !loop : dw .sub5734 : db 1
  !loop : dw .sub5749 : db 1
  db 96,$7F
  !f5
  !tie
  !transpose,0
  !instr,!instr29
  !volume,255
  !vibrato,28,11,52
  !amplify,95
  !pan,9
  !loop : dw .sub56E4 : db 1
  db 12,$7F
  !c6
  !cs6
  !loop : dw .sub5717 : db 1
  db 24,$7F
  !a5
  !ds5
  db 120
  !f5
  !adsrGain,$7F,$F4
  db 24
  !tie
  !amplify,0
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !slideIn,0,2,1
  !f5
  !gs5
  !c6
  !loop : dw .sub56E4 : db 1
  !loop : dw .sub5708 : db 1
  !loop : dw .sub5717 : db 1
  db 24,$7F
  !cs6
  !ds6
  db 120
  !f6
  !adsrGain,$7F,$F2
  db 48
  !tie
  !rest
  !slideIn,0,0,0
  !instr,!instr2A
  !volume,255
  !vibrato,26,10,50
  !cs6
  db 24
  !cs6
  db 48
  !cs6
  db 24
  !cs6
  db 48
  !cs6
  !c6
  db 24
  !c6
  db 48
  !ds6
  db 24
  !ds6
  db 48
  !f6
  db 72
  !cs6
  !c6
  db 96
  !cs6
  db 72
  !tie
  db 24
  !cs6
  !c6
  !gs5
  !loop : dw .sub5755 : db 1
  !loop : dw .sub5761 : db 1
  db 48,$7F
  !c6
  !c6
  db 24
  !c6
  db 48
  !c6
  db 72
  !f6
  db 120
  !f6
  !instr,!instr29
  !volume,255
  !vibrato,28,11,52
  !amplify,95
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E1C : db 3,0
  db 48
  !fs6
  db 24
  !fs6
  db 48
  !fs6
  db 24
  !fs6
  db 48
  !fs6
  !ds6
  db 24
  !ds6
  db 48
  !fs6
  db 24
  !fs6
  db 48
  !gs6
  !f6
  db 24
  !rest
  db 48
  !ds6
  db 24
  !rest
  db 96
  !f6
  !tie
  db 48
  !tie
  !loop : dw .sub5755 : db 1
  !loop : dw .sub5761 : db 2
  db 48,$7F
  !f6
  db 24
  !rest
  db 48
  !f6
  db 24
  !rest
  db 48
  !f6
  db 96
  !rest
  !tie
  !tie
  db 48
  !tie
  !instr,!instr2B
  !volume,255
  !vibrato,24,10,61
  !pan,9
  !amplify,0
  !loop : dw .sub576D : db 1
  !loop : dw .sub5776 : db 1
  !loop : dw .sub579C : db 1
  db 24,$7F
  !cs6
  !ds6
  db 72
  !f6
  !loop : dw .sub5776 : db 1
  db 24,$7F
  !ds6
  !f6
  !gs6
  !rest
  db 96
  !as6
  !tie
  !tie
  db 48
  !tie
  db 24
  !rest
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E1C : db 0,0
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !toggleLegato
  db 6
  !e5
  !f5
  !fs5
  !g5
  !gs5
  !a5
  !as5
  db 3
  !b5
  !toggleLegato
  !tie
  !loop : dw .sub57AF : db 1
  !loop : dw .sub57D3 : db 1
  db 6,$7F
  !rest
  !e5
  !rest
  !toggleEcho
  !loop : dw .sub57AF : db 1
  !loop : dw .sub580D : db 1
  !loop : dw .sub5837 : db 1
  db 6,$7F
  !rest
  !g5
  !rest
  !toggleEcho
  !transpose,3
  !loop : dw .sub57AF : db 1
  !loop : dw .sub57D3 : db 1
  db 6,$7F
  !rest
  !e5
  !rest
  !toggleEcho
  !loop : dw .sub57AF : db 1
  !loop : dw .sub580D : db 1
  !loop : dw .sub5837 : db 1
  db 6,$7F
  !rest
  !g5
  !rest
  !toggleEcho
  !transpose,0
  !loop : dw .sub57AF : db 1
  !loop : dw .sub57D3 : db 1
  db 6,$7F
  !rest
  !e5
  !rest
  !toggleEcho
  !loop : dw .sub57AF : db 1
  !loop : dw .sub580D : db 1
  !loop : dw .sub5837 : db 1
  db 6,$7F
  !rest
  !g5
  !rest
  !toggleEcho
  !transpose,3
  !loop : dw .sub57AF : db 1
  !loop : dw .sub57D3 : db 1
  db 6,$7F
  !rest
  !e5
  !rest
  !toggleEcho
  !transpose,0
  !transpose,3
  !loop : dw .sub57AF : db 1
  !loop : dw .sub580D : db 1
  !volume,140
  !pan,11
  db 6,$7F
  !cs6
  !volume,200
  !pan,9
  !a5
  !volume,140
  !pan,11
  !e6
  !volume,200
  !pan,9
  !g6
  !volume,140
  !pan,11
  !a5
  !volume,200
  !pan,9
  !c6
  !volume,140
  !pan,11
  !g6
  !volume,200
  !pan,9
  !ds6
  !volume,140
  !pan,11
  !c6
  !volume,200
  !pan,9
  !gs5
  !volume,140
  !pan,11
  !ds6
  !volume,200
  !pan,9
  !fs6
  !volume,140
  !pan,11
  !gs5
  !volume,200
  !pan,9
  !b5
  !volume,140
  !pan,11
  !fs6
  !volume,200
  !pan,9
  !d6
  !volume,140
  !pan,11
  !b5
  !volume,200
  !pan,9
  !g5
  !volume,140
  !pan,11
  !d6
  !toggleEcho
  !transpose,0
  !instr,!instr2D
  !volume,255
  !vibrato,22,10,47
  !pan,10
  !subloop,0
  !loop : dw .sub584A : db 1
  db 24,$7F
  !f6
  !d6
  !subloop,3
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !pan,9
  db 96,$7F
  !c6
  db 72
  !tie
  !c6
  db 48
  !d6
  !ds6
  db 24
  !f6
  db 96
  !g6
  !tie
  db 72
  !g6
  db 48
  !f6
  !ds6
  db 24
  !f6
  db 72
  !ds6
  db 48
  !d6
  !c6
  db 24
  !d6
  db 72
  !ds6
  db 48
  !d6
  !c6
  db 24
  !d6
  db 72
  !ds6
  db 48
  !f6
  !g6
  db 24
  !f6
  db 96
  !g6
  !tie
  db 24
  !tie
  db 96
  !g6
  db 72
  !tie
  !c7
  db 48
  !d7
  !ds7
  db 24
  !d7
  db 72
  !ds7
  db 48
  !d7
  !c7
  db 24
  !as6
  db 96
  !c7
  !tie
  db 72
  !ds7
  db 48
  !d7
  !c7
  db 24
  !d7
  db 72
  !ds7
  db 48
  !d7
  !c7
  db 24
  !d7
  db 96
  !e7
  !tie
  !tie
  !tie
  !adsrGain,$7F,$F4
  db 24
  !tie
  !instr,!instr26
  !volume,255
  !vibrato,22,10,47
  !pan,10
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E1C : db 3,0
  !transpose,2
  !loop : dw .sub56D5 : db 1
  db 48,$7F
  !fs5
  !ds6
  !gs6
  !gs5
  !loop : dw .sub56D5 : db 1
  db 48,$7F
  !fs5
  !ds6
  db 24
  !gs6
  db 72
  !rest
  !end

.pattern0_3
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E1C : db 3,0
  db 24,$7F
  !rest
  !instr,!instr26
  !volume,255
  !vibrato,22,10,47
  !pan,10
  !loop : dw .sub586B : db 1
  db 48,$7F
  !gs5
  db 72
  !rest
.pattern1_3:
  db 24
  !rest
  !transpose,0
  !loop : dw .sub586B : db 1
  db 48,$7F
  !gs5
  !ds6
  !gs6
  !loop : dw .sub586B : db 1
  db 48,$7F
  !gs5
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E1C : db 0,0
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !pan,12
  !slideIn,0,2,1
  db 24,$7D
  !c5
  !ds5
  !gs5
  !loop : dw .sub587B : db 1
  db 24,$7D
  !ds5
  !c5
  db 120
  !c5
  !adsrGain,$7F,$F4
  db 24
  !tie
  !instr,!instr27
  !c5
  !ds5
  !gs5
  !loop : dw .sub587B : db 1
  db 24,$7D
  !ds5
  !c5
  db 120
  !c5
  !adsrGain,$7F,$F2
  db 48
  !tie
  !rest
  !slideIn,0,0,0
  !instr,!instr2F
  !volume,190
  !vibrato,15,10,47
  !pan,7
  db 96,$7F
  !fs4
  !tie
  !as4
  !c5
  db 96
  !cs5
  !tie
  !c5
  !gs4
  !loop : dw .sub58BB : db 1
  !loop : dw .sub58C2 : db 1
  !instr,!instr28
  !volume,255
  !vibrato,28,11,54
  !pan,11
  db 72,$7C
  !fs5
  db 120
  !gs5
  db 72
  !as5
  !c6
  db 48
  !ds6
  db 96
  !f6
  !tie
  db 96
  !gs6
  db 48
  !tie
  db 120
  !f6
  db 72
  !f6
  db 48
  !f6
  db 72
  !cs6
  !loop : dw .sub58C9 : db 1
  db 120,$7C
  !c6
  !instr,!instr29
  !volume,255
  !vibrato,28,11,52
  !amplify,95
  !pan,12
  db 24,$7D
  !c5
  !ds5
  !gs5
  !loop : dw .sub587B : db 1
  db 24,$7D
  !ds5
  !c5
  db 120
  !c5
  !adsrGain,$7F,$F4
  db 24
  !tie
  !amplify,0
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !slideIn,0,2,1
  !c5
  !ds5
  !gs5
  !loop : dw .sub587B : db 1
  db 24,$7D
  !as5
  !c6
  db 120
  !c6
  !adsrGain,$7F,$F2
  db 48
  !tie
  !rest
  !slideIn,0,0,0
  !instr,!instr2A
  !volume,255
  !vibrato,26,10,50
  !as5
  db 24
  !as5
  db 48
  !as5
  db 24
  !as5
  db 48
  !as5
  !gs5
  db 24
  !gs5
  db 48
  !c6
  db 24
  !c6
  db 48
  !cs6
  db 72
  !as5
  !gs5
  db 96
  !f5
  !tie
  db 48
  !tie
  !loop : dw .sub58D4 : db 1
  db 48,$7D
  !a5
  !a5
  db 24
  !a5
  db 48
  !a5
  !c6
  db 24
  !c6
  db 48
  !c6
  !instr,!instr29
  !volume,255
  !vibrato,28,11,52
  !amplify,95
  !pan,9
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E1C : db 3,0
  db 24,$7F
  !c6
  !cs6
  !ds6
  !pan,12
  db 48,$7D
  !cs6
  db 24
  !cs6
  db 48
  !cs6
  db 24
  !cs6
  db 48
  !cs6
  !c6
  db 24
  !c6
  db 48
  !ds6
  db 24
  !ds6
  db 48
  !f6
  !cs6
  db 24
  !rest
  db 48
  !c6
  db 24
  !rest
  db 96
  !cs6
  db 72
  !tie
  db 24
  !cs6
  !c6
  !gs5
  !loop : dw .sub58D4 : db 1
  db 24,$7D
  !a5
  db 48
  !a5
  db 24
  !a5
  db 48
  !a5
  db 24
  !a5
  db 48
  !c6
  db 24
  !rest
  db 48
  !c6
  db 24
  !rest
  db 48
  !c6
  db 96
  !rest
  !tie
  !tie
  db 78
  !tie
  !instr,!instr2B
  !volume,255
  !vibrato,24,10,61
  !volume,180
  !pan,10
  !amplify,0
  !loop : dw .sub576D : db 1
  !loop : dw .sub5776 : db 1
  !loop : dw .sub579C : db 1
  db 18,$7F
  !cs6
  !instr,!instr2B
  !volume,255
  !vibrato,24,10,61
  !pan,12
  db 72,$7D
  !cs6
  db 48
  !f6
  !ds6
  db 24
  !c6
  db 96
  !cs6
  !tie
  db 24
  !cs6
  !rest
  !cs6
  db 48
  !gs6
  !f6
  db 24
  !ds6
  !f6
  !rest
  !f6
  db 48
  !ds6
  !cs6
  db 24
  !c6
  db 72
  !cs6
  db 48
  !c6
  !as5
  db 24
  !c6
  !cs6
  !rest
  !cs6
  !c6
  !c6
  !c6
  !c6
  !rest
  db 96
  !d6
  !tie
  !tie
  db 48
  !tie
  db 24
  !rest
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !toggleLegato
  db 6
  !b4
  !c5
  !cs5
  !d5
  !ds5
  !e5
  !f5
  db 3
  !fs5
  !toggleLegato
  !tie
  !loop : dw .sub58EA : db 1
  !loop : dw .sub57D3 : db 1
  !toggleEcho
  !loop : dw .sub58EA : db 1
  !loop : dw .sub580D : db 1
  !loop : dw .sub5837 : db 1
  !toggleEcho
  !transpose,3
  !loop : dw .sub58EA : db 1
  !loop : dw .sub57D3 : db 1
  !toggleEcho
  !loop : dw .sub58EA : db 1
  !loop : dw .sub580D : db 1
  !loop : dw .sub5837 : db 1
  !toggleEcho
  !transpose,0
  !loop : dw .sub58EA : db 1
  !loop : dw .sub57D3 : db 1
  !toggleEcho
  !loop : dw .sub58EA : db 1
  !loop : dw .sub580D : db 1
  !loop : dw .sub5837 : db 1
  !toggleEcho
  !transpose,3
  !loop : dw .sub58EA : db 1
  !loop : dw .sub57D3 : db 1
  !toggleEcho
  !loop : dw .sub58EA : db 1
  !loop : dw .sub580D : db 1
  !toggleEcho
  !transpose,0
  !instr,!instr2D
  !volume,255
  !vibrato,22,10,47
  !pan,10
  !toggleLegato
  db 12,$7F
  !g5
  !toggleLegato
  !toggleLegato
  !gs5
  !toggleLegato
  !toggleLegato
  !a5
  !toggleLegato
  !toggleLegato
  !as5
  !toggleLegato
  !toggleLegato
  !b5
  !toggleLegato
  !toggleLegato
  !c6
  !toggleLegato
  !toggleLegato
  !cs6
  !toggleLegato
  !toggleLegato
  db 6
  !d6
  !toggleLegato
  !tie
  db 36
  !rest
  !volume,175
  !pan,11
  !loop : dw .sub584A : db 1
  db 24,$7F
  !f6
  !d6
  !loop : dw .sub584A : db 1
  db 12,$7F
  !f6
  !instr,!instr2E
  !volume,245
  !vibrato,22,10,47
  !pan,10
  !subloop,0
  !loop : dw .sub5911 : db 1
  !toggleLegato
  db 24,$7F
  !g6
  !toggleLegato
  !toggleLegato
  !f6
  !toggleLegato
  !toggleLegato
  !ds6
  !toggleLegato
  !toggleLegato
  !d6
  !toggleLegato
  !toggleLegato
  !ds6
  !toggleLegato
  !toggleLegato
  !gs6
  !toggleLegato
  !toggleLegato
  !g6
  !toggleLegato
  !toggleLegato
  !f6
  !toggleLegato
  !toggleLegato
  !ds6
  !toggleLegato
  !toggleLegato
  !d6
  !toggleLegato
  !toggleLegato
  !ds6
  !toggleLegato
  !toggleLegato
  !f6
  !loop : dw .sub5911 : db 2
  db 24,$7F
  !gs6
  !toggleLegato
  !toggleLegato
  db 12
  !f6
  !toggleLegato
  !tie
  !subloop,1
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !pan,12
  db 96,$7D
  !g5
  db 72
  !tie
  !g5
  db 48
  !as5
  !c6
  db 24
  !c6
  db 96
  !c6
  !tie
  db 72
  !d6
  db 48
  !d6
  !c6
  db 24
  !d6
  !subloop,0
  db 72,$7D
  !c6
  db 48
  !as5
  !g5
  db 24
  !as5
  !subloop,1
  db 72,$7D
  !c6
  db 48
  !c6
  !c6
  db 24
  !c6
  db 96
  !c6
  !tie
  db 24
  !tie
  db 96
  !ds6
  db 72
  !tie
  !g6
  db 48
  !as6
  !c7
  db 24
  !as6
  db 72
  !c7
  db 48
  !as6
  !g6
  db 24
  !g6
  db 96
  !g6
  !tie
  db 72
  !g6
  db 48
  !f6
  !ds6
  db 24
  !f6
  db 72
  !g6
  db 48
  !f6
  !g6
  db 24
  !as6
  db 96
  !c7
  !tie
  !tie
  !tie
  !adsrGain,$7F,$F4
  db 24
  !tie
  !rest
  !instr,!instr26
  !volume,255
  !vibrato,22,10,47
  !pan,10
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E1C : db 3,0
  !transpose,2
  !loop : dw .sub586B : db 1
  db 48,$7F
  !gs5
  !ds6
  !gs6
  !loop : dw .sub586B : db 1
  db 48,$7F
  !gs5
  db 72
  !rest
  !end

.pattern0_4
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
.pattern1_4:
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E20 : db 0,0
  !instr,!instr2F
  !volume,190
  !vibrato,15,10,47
  !pan,13
  !loop : dw .sub5932 : db 1
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !loop : dw .sub5932 : db 1
  db 96,$7F
  !f5
  !loop : dw .sub5940 : db 1
  db 96,$7F
  !f5
  !tie
  !tie
  db 24
  !tie
  !loop : dw .sub5940 : db 1
  db 96,$7F
  !f5
  !tie
  db 24
  !tie
  !instr,!instr2F
  !volume,190
  !vibrato,15,10,47
  db 96
  !as4
  !tie
  !cs5
  !ds5
  db 96
  !f5
  !tie
  !ds5
  !c5
  !loop : dw .sub5959 : db 1
  !loop : dw .sub5960 : db 1
  !loop : dw .sub5959 : db 3
  !loop : dw .sub5960 : db 1
  !endVibrato
  !subloop,0
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  db 96,$7F
  !cs5
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !subloop,1
  !amplify,0
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !pan,13
  db 96,$7F
  !f5
  !loop : dw .sub5940 : db 1
  db 96,$7F
  !f5
  !tie
  db 24
  !tie
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  db 72
  !cs4
  !cs5
  !as4
  !gs4
  !gs5
  !gs4
  !cs5
  !f5
  !f4
  !f5
  !cs5
  !fs4
  !fs5
  !fs4
  !c5
  !ds5
  !ds4
  !ds5
  !c5
  !a4
  !a5
  db 24
  !a4
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  db 96
  !cs5
  !tie
  db 96
  !ds5
  !tie
  db 48
  !f5
  db 24
  !rest
  db 48
  !ds5
  db 24
  !rest
  db 96
  !f5
  !tie
  db 48
  !tie
  db 96
  !ds5
  !tie
  !tie
  !tie
  !tie
  !tie
  db 48
  !f5
  db 24
  !rest
  db 48
  !f5
  db 24
  !rest
  db 48
  !f5
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E20 : db 0,0
  !endVibrato
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  db 72
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr20
  !volume,255
  !pan,12
  db 12
  !c6
  !pan,11
  !a5
  !pan,10
  db 96
  !fs5
  db 48
  !ds5
  !ds5
  db 12
  !ds5
  !pan,9
  !c6
  !c6
  !pan,8
  !c6
  !c6
  !pan,7
  !a5
  !fs5
  !pan,6
  !ds5
  !toggleEcho
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !pan,13
  !loop : dw .sub5967 : db 1
  !loop : dw .sub597F : db 1
  !loop : dw .sub5967 : db 1
  db 96,$7F
  !ds5
  !tie
  db 96
  !f5
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !instr,!instr32
  !vibrato,12,11,34
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  !loop : dw .sub598E : db 1
  db 96,$7F
  !ds5
  db 72
  !tie
  db 48
  !d5
  !cs5
  !c5
  !loop : dw .sub598E : db 1
  db 96,$7F
  !ds5
  !tie
  db 24
  !tie
  db 96
  !d5
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E20 : db 0,0
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !subloop,0
  db 96,$7F
  !ds5
  db 72
  !tie
  db 96
  !d5
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  db 96
  !ds5
  db 72
  !tie
  db 96
  !d5
  !tie
  db 24
  !tie
  db 96
  !f5
  db 72
  !tie
  db 96
  !d5
  !tie
  db 24
  !tie
  !subloop,1
  !transpose,2
  !loop : dw .sub5967 : db 1
  !loop : dw .sub597F : db 1
  !loop : dw .sub5967 : db 1
  db 96,$7F
  !ds5
  !tie
  db 96
  !f5
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,!instr2F
  !volume,190
  !vibrato,15,10,47
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  !loop : dw .sub5932 : db 1
  !transpose,0
  db 96,$7F
  !g5
  !tie
  db 96
  !f5
  !tie
  db 96
  !ds5
  !tie
  db 120
  !f5
  db 72
  !rest
  !end

.pattern0_5
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
.pattern1_5:
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E20 : db 0,0
  !instr,!instr2F
  !volume,190
  !vibrato,15,10,47
  !pan,11
  !loop : dw .sub5A45 : db 1
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !loop : dw .sub5A45 : db 1
  !loop : dw .sub5A53 : db 1
  db 96,$7F
  !a4
  !tie
  db 24
  !tie
  !loop : dw .sub5A53 : db 1
  db 96,$7F
  !a4
  !tie
  db 24
  !tie
  !instr,!instr2F
  !volume,190
  !vibrato,15,10,47
  db 96
  !ds4
  !tie
  !fs4
  !gs4
  db 96
  !as4
  !tie
  !gs4
  !f4
  !loop : dw .sub5A6E : db 1
  !loop : dw .sub5A75 : db 1
  !loop : dw .sub5A6E : db 3
  !loop : dw .sub5A75 : db 1
  db 36,$7F
  !rest
  !instr,!instr29
  !volume,255
  !vibrato,28,11,52
  !amplify,95
  !volume,170
  !pan,10
  !loop : dw .sub56E4 : db 1
  db 12,$7F
  !c6
  !cs6
  !loop : dw .sub5717 : db 1
  db 24,$7F
  !a5
  !ds5
  db 84
  !f5
  !adsrGain,$7F,$F4
  db 24
  !tie
  db 72
  !rest
  !amplify,0
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !pan,11
  !loop : dw .sub5A53 : db 1
  db 96,$7F
  !a4
  !tie
  db 24
  !tie
  db 48
  !rest
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !pan,7
  db 72
  !as4
  !cs5
  !ds4
  !ds5
  !c5
  !as4
  !as5
  !as4
  !cs5
  !f5
  !cs4
  !cs5
  !as4
  !gs4
  !gs5
  !gs4
  !c5
  !ds5
  !f4
  !f5
  db 48
  !c5
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !pan,11
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  db 96
  !fs4
  !tie
  db 96
  !gs4
  !tie
  db 48
  !as4
  db 24
  !rest
  db 48
  !gs4
  db 24
  !rest
  db 96
  !as4
  !tie
  db 48
  !gs4
  db 96
  !fs4
  !tie
  db 96
  !gs4
  !tie
  db 96
  !a4
  !tie
  db 48
  !a4
  db 24
  !rest
  db 48
  !a4
  db 24
  !rest
  db 48
  !a4
  db 96
  !rest
  !tie
  !tie
  !tie
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E20 : db 0,0
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !loop : dw .sub5A7C : db 1
  !loop : dw .sub5A94 : db 1
  !loop : dw .sub5A7C : db 1
  db 96,$7F
  !gs4
  !tie
  db 96
  !as4
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !instr,!instr32
  !vibrato,12,11,34
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  !loop : dw .sub5AA0 : db 1
  db 96,$7F
  !fs4
  db 72
  !tie
  db 48
  !f4
  !e4
  !ds4
  !loop : dw .sub5AA0 : db 1
  db 96,$7F
  !fs4
  !tie
  db 24
  !tie
  db 96
  !g4
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E20 : db 0,0
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
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
  !g4
  !tie
  !tie
  !tie
  db 96
  !a4
  db 72
  !tie
  db 96
  !g4
  !tie
  !tie
  !tie
  !tie
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
  !a4
  db 72
  !tie
  db 96
  !g4
  !tie
  db 24
  !tie
  !transpose,2
  !loop : dw .sub5A7C : db 1
  !loop : dw .sub5A94 : db 1
  !loop : dw .sub5A7C : db 1
  db 96,$7F
  !gs4
  !tie
  db 96
  !as4
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,!instr2F
  !volume,190
  !vibrato,15,10,47
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  !loop : dw .sub5A45 : db 1
  !transpose,0
  db 96,$7F
  !c5
  !tie
  db 96
  !as4
  !tie
  db 96
  !gs4
  !tie
  db 120
  !as4
  db 72
  !rest
  !end

.pattern0_6
  !endVibrato
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
.pattern1_6:
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5311 : db 1
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub5311 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5369 : db 1
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub5388 : db 1
  db 24,$7F
  !c5
  !c5
  !instr,!instr22
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !loop : dw .sub539B : db 1
  !subloop,0
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub5369 : db 1
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub5388 : db 1
  !subloop,1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub53B9 : db 1
  !loop : dw .sub539B : db 1
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub53B9 : db 1
  db 12,$7F
  !c5
  !c5
  db 24
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub53B9 : db 1
  !loop : dw .sub539B : db 1
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub53B9 : db 1
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub541A : db 1
  !instr,!instr21
  !volume,180
  !pan,9
  !subloop,0
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub5441 : db 1
  !subloop,3
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,180
  !pan,9
  !loop : dw .sub5441 : db 1
  !subloop,0
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub5441 : db 1
  !subloop,2
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub5481 : db 1
  db 24,$7F
  !c5
  !c5
  !subloop,0
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub5481 : db 1
  db 24,$7F
  !c5
  !instr,!instr22
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !subloop,1
  !loop : dw .sub5494 : db 1
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !c5
  !instr,!instr22
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !c5
  !loop : dw .sub5481 : db 1
  db 24,$7F
  !c5
  !instr,!instr22
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !subloop,0
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub5481 : db 1
  db 24,$7F
  !c5
  !instr,!instr22
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !subloop,1
  !loop : dw .sub5494 : db 1
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !loop : dw .sub54A7 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub541A : db 1
  !loop : dw .sub54BA : db 1
  !loop : dw .sub54D6 : db 7
  !loop : dw .sub54BA : db 1
  !loop : dw .sub54D6 : db 1
  !loop : dw .sub54E9 : db 1
  !instr,!instr22
  !volume,180
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !c5
  !loop : dw .sub54BA : db 1
  !loop : dw .sub54D6 : db 1
  !loop : dw .sub54E9 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub54A7 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5407 : db 1
  !subloop,0
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub5506 : db 1
  !subloop,1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub5407 : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 72,$7F
  !cs5
  !cs5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,180
  !pan,9
  db 12
  !c5
  !c5
  !loop : dw .sub5506 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub5407 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5506 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub5506 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5407 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub5407 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5506 : db 1
  db 12,$7F
  !c5
  !c5
  !c5
  !c5
  !loop : dw .sub5506 : db 1
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 72,$7F
  !cs5
  !cs5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  db 12
  !c4
  !amplify,0
  !subloop,0
  !instr,!instr21
  !volume,180
  !pan,9
  db 12,$7F
  !c5
  !subloop,6
  !subloop,0
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !c5
  !c5
  !subloop,5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,2
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub552B : db 1
  !loop : dw .sub54A7 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,2
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub554A : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub556F : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5506 : db 1
  !loop : dw .sub5369 : db 1
  !instr,!instr22
  !volume,180
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !loop : dw .sub558B : db 1
  !subloop,0
  !loop : dw .sub55A2 : db 1
  !loop : dw .sub55D1 : db 22
  !subloop,2
  !loop : dw .sub55A2 : db 1
  !loop : dw .sub55DB : db 1
  !loop : dw .sub55A2 : db 1
  !subloop,0
  !instr,!instr21
  !volume,180
  !pan,9
  db 12,$7F
  !c5
  !subloop,21
  !loop : dw .sub55A2 : db 1
  !loop : dw .sub55DB : db 1
  !loop : dw .sub55A2 : db 1
  !subloop,0
  !instr,!instr21
  !volume,180
  !pan,9
  db 12,$7F
  !c5
  !subloop,21
  !loop : dw .sub55A2 : db 1
  !subloop,0
  !instr,!instr21
  !volume,180
  !pan,9
  db 12,$7F
  !c5
  !subloop,11
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  db 12,$7F
  !c4
  !amplify,0
  !subloop,0
  !instr,!instr21
  !volume,180
  !pan,9
  db 12,$7F
  !c5
  !subloop,8
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5388 : db 2
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5388 : db 7
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5388 : db 4
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5388 : db 2
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5388 : db 7
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5388 : db 2
  !instr,!instr22
  !volume,180
  !pan,10
  db 24,$7F
  !c5
  !loop : dw .sub558B : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,180
  !pan,9
  !loop : dw .sub561B : db 14
  !loop : dw .sub54A7 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,180
  !pan,9
  !loop : dw .sub561B : db 13
  !instr,!instr20
  !volume,255
  !pan,13
  db 12,$7F
  !d6
  db 24
  !d6
  !pan,12
  db 12
  !d6
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
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
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,2
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,2
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,1
  !loop : dw .sub552B : db 1
  !loop : dw .sub54A7 : db 1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5388 : db 1
  !instr,!instr22
  !volume,180
  !pan,10
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,2
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !subloop,0
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5388 : db 1
  !subloop,1
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub554A : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub556F : db 1
  !loop : dw .sub5388 : db 1
  !loop : dw .sub5407 : db 1
  !loop : dw .sub5369 : db 1
  !loop : dw .sub5506 : db 1
  !loop : dw .sub5369 : db 1
  !instr,!instr22
  !volume,180
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !loop : dw .sub558B : db 1
  !instr,!instr21
  !volume,180
  !pan,9
  !loop : dw .sub5481 : db 15
  db 24,$7F
  !c5
  db 72
  !rest
  !end

.pattern0_7
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
.pattern1_7:
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E20 : db 0,0
  !instr,!instr2F
  !volume,190
  !vibrato,15,10,47
  !pan,7
  !loop : dw .sub59B4 : db 1
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  db 96,$7F
  !cs5
  !tie
  db 96
  !c5
  !tie
  db 96
  !as4
  !tie
  db 120
  !c5
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !pan,9
  !slideIn,0,2,1
  db 24
  !f5
  !gs5
  !c6
  !slideIn,0,0,0
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !pan,7
  !loop : dw .sub59C2 : db 1
  db 96,$7F
  !c5
  !tie
  !tie
  !loop : dw .sub59C2 : db 1
  db 96,$7F
  !c5
  !tie
  !tie
  !endVibrato
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,223
  db 108,$7F
  !cs5
  !amplify,0
  !amplify,0
  !instr,!instr28
  !volume,255
  !vibrato,28,11,54
  !volume,175
  !pan,11
  !loop : dw .sub5734 : db 1
  db 36,$7F
  !as5
  !instr,!instr28
  !volume,255
  !vibrato,28,11,54
  !pan,11
  db 48,$7C
  !cs5
  !transpose,244
  !loop : dw .sub58C9 : db 1
  !transpose,0
  db 72,$7C
  !cs5
  db 120
  !c5
  !instr,!instr2F
  !volume,190
  !vibrato,15,10,47
  !pan,7
  !loop : dw .sub58BB : db 3
  db 96,$7F
  !as4
  !c5
  !cs5
  db 24
  !ds5
  !instr,!instr29
  !volume,255
  !vibrato,28,11,52
  !amplify,95
  !pan,9
  !f5
  !gs5
  !c6
  !amplify,0
  db 36
  !rest
  !volume,170
  !pan,10
  !loop : dw .sub587B : db 1
  db 24,$7F
  !ds5
  !c5
  db 84
  !c5
  !adsrGain,$7F,$F4
  db 24
  !tie
  db 72
  !rest
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !loop : dw .sub59C2 : db 1
  db 96,$7F
  !c5
  !tie
  !tie
  db 24
  !rest
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !pan,11
  db 72
  !fs4
  !f5
  !fs4
  !c5
  !ds5
  !f4
  !f5
  !cs5
  !as4
  !as5
  !as4
  !as4
  !cs5
  !ds4
  !ds5
  !c5
  !a4
  !a5
  !a4
  !c5
  !f5
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !pan,7
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  db 96
  !as4
  !tie
  db 96
  !c5
  !tie
  db 48
  !cs5
  db 24
  !rest
  db 48
  !c5
  db 24
  !rest
  db 96
  !cs5
  !tie
  db 48
  !c5
  db 96
  !as4
  !tie
  db 96
  !c5
  !tie
  !tie
  !tie
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  db 96
  !rest
  !tie
  !tie
  !tie
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E20 : db 0,0
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !loop : dw .sub59DB : db 1
  !loop : dw .sub59F3 : db 1
  !loop : dw .sub59DB : db 1
  db 96,$7F
  !c5
  !tie
  db 96
  !d5
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,!instr31
  !volume,160
  !vibrato,10,10,26
  !instr,!instr32
  !vibrato,12,11,34
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  !loop : dw .sub59FF : db 1
  db 96,$7F
  !as4
  db 72
  !tie
  db 48
  !a4
  !gs4
  !g4
  !loop : dw .sub59FF : db 1
  db 96,$7F
  !as4
  !tie
  !tie
  db 24
  !tie
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E20 : db 0,0
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !loop : dw .sub5A24 : db 1
  db 96,$7F
  !b4
  !tie
  db 24
  !tie
  !loop : dw .sub5A24 : db 1
  db 96,$7F
  !b4
  db 72
  !tie
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !pan,9
  !instr,!instr32
  !vibrato,12,11,34
  db 12
  !f5
  !g5
  !gs5
  !as5
  !instr,!instr30
  !volume,180
  !vibrato,12,11,34
  !pan,7
  !transpose,2
  !loop : dw .sub59DB : db 1
  !loop : dw .sub59F3 : db 1
  !loop : dw .sub59DB : db 1
  db 96,$7F
  !c5
  !tie
  db 96
  !d5
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,!instr2F
  !volume,190
  !vibrato,15,10,47
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E20 : db 3,0
  !loop : dw .sub59B4 : db 1
  !transpose,0
  db 96,$7F
  !ds5
  !tie
  db 96
  !d5
  !tie
  db 96
  !c5
  !tie
  db 120
  !d5
  db 72
  !rest
  !end

.sub4E24
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !amplify,63
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
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
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
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !end

.sub4E9D
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,180
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
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 72
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4ECD
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
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4EF0
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
  db 24
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
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4F24
  db 12,$7F
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !c5
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
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  db 72
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4F56
  db 12,$7F
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !c4
  !c4
  !c4
  !end

.sub4F63
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
  !end

.sub4F8B
  db 24,$7F
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
  db 48
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4FAD
  db 24,$7F
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
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub4FCF
  db 24,$7F
  !c4
  !rest
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

.sub4FFB
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
  !rest
  !c4
  !c4
  !rest
  !instr,!instr1E
  !volume,255
  !pan,10
  !end

.sub501A
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !c5
  !amplify,63
  !instr,!instr1F
  !volume,225
  !pan,10
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
  !end

.sub5044
  db 12,$7F
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !c5
  !c5
  !amplify,63
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
  db 24
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !end

.sub5070
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
  db 12
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
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

.sub509B
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
  db 24
  !c4
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !end

.sub50B9
  db 72,$7F
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
  db 24
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
  db 24
  !c4
  db 12
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub50EF
  db 48,$7F
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
  db 48
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
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub511E
  db 24,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !instr,!instr22
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !amplify,63
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub514B
  db 48,$7F
  !c4
  !c4
  !c4
  db 24
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  !end

.sub515B
  db 12,$7F
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !c5
  !c5
  !amplify,63
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
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  !c5
  !amplify,63
  !instr,!instr1F
  !volume,225
  !pan,10
  db 24
  !c4
  !instr,!instr1E
  !volume,255
  !pan,10
  !end

.sub519A
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
  db 48
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

.sub51D1
  db 36,$7F
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
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
  db 48
  !c4
  !end

.sub51EE
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
  !c4
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub520A
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
  db 48
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

.sub5241
  db 24,$7F
  !c4
  !instr,!instr21
  !volume,180
  !pan,9
  !amplify,0
  db 12
  !c5
  !c5
  !amplify,63
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
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  db 12
  !c4
  db 24
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
  !volume,225
  !pan,10
  db 24
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
  db 36
  !c4
  !instr,!instr1F
  !volume,225
  !pan,10
  !end

.sub52CE
  db 12,$7F
  !c4
  !instr,!instr21
  !volume,180
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

.sub52ED
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

.sub52FE
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

.sub562E
  !subloop,0
  db 24,$7F
  !as4
  !subloop,6
  db 48,$7F
  !gs4
  !subloop,0
  db 24,$7F
  !gs4
  !subloop,6
  !subloop,0
  db 24,$7F
  !fs4
  !subloop,6
  db 48,$7F
  !gs4
  db 24
  !gs4
  !gs4
  !gs4
  !gs4
  !end

.sub564F
  db 24,$7F
  !as4
  !as4
  !as5
  !as4
  !end

.sub5656
  db 24,$7F
  !gs4
  !gs4
  !gs5
  !fs4
  !end

.sub565D
  db 24,$7F
  !f4
  !f4
  !f5
  !fs4
  !end

.sub5664
  db 24,$7F
  !gs4
  !gs4
  !gs5
  !f4
  !end

.sub566B
  db 24,$7F
  !gs4
  !gs4
  !ds5
  !gs5
  !end

.sub5672
  db 24,$7F
  !gs4
  !gs5
  !ds5
  !gs4
  !end

.sub5679
  db 24,$7F
  !as4
  db 48
  !as4
  db 24
  !as4
  db 48
  !gs4
  db 24
  !gs4
  db 48
  !fs4
  db 24
  !fs4
  !fs4
  !fs4
  db 48
  !f4
  db 24
  !f4
  !f4
  !end

.sub5690
  db 24,$7F
  !fs4
  db 12
  !fs5
  !fs5
  !end

.sub5697
  db 24,$7F
  !fs4
  db 48
  !gs4
  db 12
  !gs5
  !gs5
  !end

.sub56A0
  db 24,$7F
  !as4
  db 48
  !gs4
  db 12
  !gs5
  !gs5
  !end

.sub56A9
  db 24,$7F
  !a4
  db 48
  !f4
  db 12
  !f5
  !f5
  !end

.sub56B2
  db 24,$7F
  !gs4
  db 12
  !as5
  !as5
  !end

.sub56B9
  db 24,$7F
  !c5
  db 12
  !c6
  !g5
  !end

.sub56C0
  db 12,$7F
  !c5
  !c5
  !c6
  !c6
  !end

.sub56C7
  db 12,$7F
  !c5
  !c5
  !as5
  !as5
  !end

.sub56CE
  db 12,$7F
  !a4
  !a4
  !b5
  !b5
  !end

.sub56D5
  db 48,$7F
  !as6
  !as5
  !f6
  !as6
  !as5
  !ds6
  !gs6
  !gs5
  !fs6
  !fs5
  !cs6
  !fs6
  !end

.sub56E4
  db 24,$7F
  !as5
  !cs6
  !f6
  db 48
  !c6
  db 24
  !ds6
  !gs6
  db 48
  !f6
  db 24
  !ds6
  !cs6
  db 48
  !c6
  db 24
  !cs6
  !c6
  !gs5
  !f5
  !as5
  !cs6
  db 48
  !a5
  db 24
  !c6
  !f6
  db 48
  !cs6
  db 24
  !as5
  !f5
  !cs6
  !end

.sub5708
  db 3,$7F
  !c6
  !toggleLegato
  !tie
  db 6
  !cs6
  !c6
  db 3
  !cs6
  !toggleLegato
  !tie
  !end

.sub5717
  db 24,$7F
  !c6
  !as5
  !c6
  !cs6
  !ds6
  !f6
  db 48
  !ds6
  db 24
  !gs6
  !as6
  db 48
  !f6
  db 24
  !gs6
  !ds6
  !f6
  !cs6
  !f5
  !c6
  !ds5
  !f5
  !as5
  !cs6
  db 48
  !c6
  !end

.sub5734
  db 120,$7F
  !c5
  db 72
  !cs5
  !ds5
  db 48
  !gs5
  db 72
  !as5
  db 120
  !a5
  db 72
  !cs6
  !c6
  db 48
  !as5
  db 72
  !as5
  !gs5
  !end

.sub5749
  db 48,$7F
  !as5
  !f5
  !gs5
  !ds5
  !c5
  db 72
  !cs5
  db 120
  !c5
  !end

.sub5755
  db 24,$7F
  !as5
  db 48
  !as5
  !as5
  db 24
  !as5
  db 48
  !as5
  !c6
  !end

.sub5761
  db 24,$7F
  !c6
  db 48
  !c6
  db 24
  !c6
  db 48
  !c6
  db 24
  !c6
  !end

.sub576D
  db 12,$7F
  !gs5
  !as5
  !cs6
  !ds6
  db 48
  !f6
  !end

.sub5776
  db 48,$7F
  !cs7
  !c7
  db 24
  !ds6
  db 96
  !f6
  !tie
  db 24
  !f6
  !rest
  !f6
  db 48
  !ds7
  !cs7
  db 24
  !c7
  !cs7
  !rest
  !cs7
  db 48
  !c7
  !as6
  db 24
  !gs6
  db 72
  !as6
  db 48
  !gs6
  !f6
  db 24
  !gs6
  !as6
  !rest
  !as6
  !gs6
  !end

.sub579C
  db 24,$7F
  !f6
  !f6
  !gs6
  !rest
  !f6
  !rest
  !f6
  !ds6
  !f6
  !gs6
  !f6
  !ds6
  db 96
  !f6
  db 48
  !tie
  !end

.sub57AF
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !pan,9
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E1C : db 3,0
  db 48,$7F
  !c6
  db 24
  !rest
  !c6
  db 12
  !rest
  !instr,!instr2C
  !endVibrato
  !volume,200
  !pan,9
  !end

.sub57D3
  !toggleEcho
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E1C : db 0,0
  db 6,$7F
  !g5
  !rest
  !as5
  !rest
  !c6
  !rest
  !ds6
  !rest
  !c6
  !rest
  !g6
  !rest
  !ds6
  !rest
  !fs6
  !rest
  !b5
  !rest
  !d6
  !rest
  !g5
  !rest
  !f6
  !rest
  !as5
  !rest
  !cs6
  !rest
  !fs5
  !rest
  !e6
  !rest
  !a5
  !rest
  !c6
  !rest
  !f5
  !rest
  !ds6
  !rest
  !gs5
  !rest
  !b5
  !end

.sub580D
  !toggleEcho
  !remoteCode : dw .remoteCode4E19 : db 0,0
  !remoteCode : dw .remoteCode4E1C : db 0,0
  db 6,$7F
  !as5
  !rest
  !c6
  !rest
  !d6
  !rest
  !ds6
  !rest
  !c6
  !rest
  !g6
  !rest
  !ds6
  !rest
  !a6
  !rest
  !d6
  !rest
  !f6
  !rest
  !as5
  !rest
  !gs6
  !rest
  !cs6
  !rest
  !e6
  !end

.sub5837
  db 6,$7F
  !rest
  !a5
  !rest
  !g6
  !rest
  !c6
  !rest
  !ds6
  !rest
  !gs5
  !rest
  !fs6
  !rest
  !b5
  !rest
  !d6
  !end

.sub584A
  db 24,$7F
  !ds6
  !d6
  !c6
  !g5
  !c6
  !d6
  !ds6
  !d6
  !c6
  !g5
  !c6
  !f6
  !ds6
  !d6
  !c6
  !g5
  !c6
  !d6
  !ds6
  !d6
  !c6
  !g5
  !c6
  !d6
  !ds6
  !d6
  !c6
  !g5
  !c6
  !d6
  !end

.sub586B
  db 48,$7F
  !f6
  !as6
  !as5
  !f6
  !gs6
  !gs5
  !ds6
  !gs6
  !cs6
  !fs6
  !fs5
  !cs6
  !gs6
  !end

.sub587B
  db 24,$7D
  !f5
  !as5
  !cs6
  db 48
  !gs5
  db 24
  !c6
  !ds6
  db 48
  !cs6
  db 24
  !as5
  !gs5
  db 48
  !f5
  db 24
  !f5
  !ds5
  !cs5
  !as4
  !cs5
  !f5
  db 48
  !f5
  db 24
  !a5
  !a5
  db 48
  !fs5
  db 24
  !fs5
  !cs5
  !fs5
  db 48
  !f5
  db 24
  !f5
  !a5
  !as5
  !c6
  !cs6
  db 48
  !c6
  db 24
  !ds6
  !f6
  db 48
  !cs6
  db 24
  !f6
  !c6
  !cs6
  !f5
  !cs5
  !ds5
  !c5
  !cs5
  !f5
  !as5
  db 48
  !a5
  !end

.sub58BB
  db 96,$7F
  !fs4
  !gs4
  !as4
  !c5
  !end

.sub58C2
  db 96,$7F
  !as4
  !c5
  !cs5
  !ds5
  !end

.sub58C9
  db 48,$7C
  !c6
  !gs5
  db 24
  !gs5
  db 72
  !as5
  db 120
  !a5
  !end

.sub58D4
  db 24,$7D
  !fs5
  db 48
  !fs5
  !fs5
  db 24
  !fs5
  db 48
  !fs5
  !gs5
  db 24
  !gs5
  db 48
  !gs5
  db 24
  !gs5
  db 48
  !gs5
  db 24
  !a5
  !end

.sub58EA
  !amplify,0
  !instr,!instr27
  !volume,215
  !vibrato,28,11,52
  !pan,12
  !remoteCode : dw .remoteCode4E19 : db -1,0
  !remoteCode : dw .remoteCode4E1C : db 3,0
  db 48,$7D
  !g5
  db 24
  !rest
  !g5
  db 30
  !rest
  !instr,!instr2C
  !endVibrato
  !volume,140
  !pan,11
  !end

.sub5911
  !toggleLegato
  db 24,$7F
  !g6
  !toggleLegato
  !toggleLegato
  !f6
  !toggleLegato
  !toggleLegato
  !ds6
  !toggleLegato
  !toggleLegato
  !d6
  !toggleLegato
  !toggleLegato
  !ds6
  !toggleLegato
  !toggleLegato
  !f6
  !toggleLegato
  !end

.sub5932
  db 96,$7F
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
  !end

.sub5940
  db 72,$7F
  !ds5
  db 120
  !fs5
  db 96
  !f5
  !ds5
  db 72
  !f5
  db 120
  !fs5
  db 96
  !ds5
  !f5
  db 72
  !ds5
  db 120
  !cs5
  db 96
  !ds5
  !cs5
  db 72
  !ds5
  !end

.sub5959
  db 96,$7F
  !as4
  !c5
  !cs5
  !ds5
  !end

.sub5960
  db 96,$7F
  !cs5
  !ds5
  !f5
  !gs5
  !end

.sub5967
  db 96,$7F
  !cs5
  db 72
  !tie
  db 96
  !ds5
  !tie
  db 24
  !tie
  db 96
  !f5
  db 72
  !tie
  db 96
  !ds5
  !tie
  db 24
  !tie
  db 96
  !cs5
  db 72
  !tie
  !end

.sub597F
  db 96,$7F
  !ds5
  !tie
  db 24
  !tie
  db 96
  !c5
  db 48
  !tie
  !ds5
  db 96
  !f5
  !ds5
  !end

.sub598E
  db 48,$7F
  !c5
  db 24
  !rest
  db 96
  !c5
  !tie
  !tie
  db 24
  !tie
  db 48
  !c5
  db 24
  !rest
  db 96
  !c5
  db 72
  !tie
  db 48
  !ds5
  db 96
  !f5
  db 48
  !ds5
  db 24
  !rest
  db 96
  !ds5
  !tie
  db 72
  !tie
  db 48
  !d5
  !ds5
  db 24
  !rest
  !end

.sub5A45
  db 96,$7F
  !as4
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

.sub5A53
  db 96,$7F
  !as4
  db 72
  !gs4
  db 120
  !as4
  db 96
  !gs4
  !fs4
  db 72
  !a4
  db 120
  !as4
  db 96
  !gs4
  !as4
  db 72
  !gs4
  db 120
  !fs4
  db 96
  !gs4
  !fs4
  db 72
  !gs4
  !end

.sub5A6E
  db 96,$7F
  !ds4
  !f4
  !fs4
  !gs4
  !end

.sub5A75
  db 96,$7F
  !fs4
  !gs4
  !as4
  !c5
  !end

.sub5A7C
  db 96,$7F
  !fs4
  db 72
  !tie
  db 96
  !gs4
  !tie
  db 24
  !tie
  db 96
  !as4
  db 72
  !tie
  db 96
  !gs4
  !tie
  db 24
  !tie
  db 96
  !fs4
  db 72
  !tie
  !end

.sub5A94
  db 96,$7F
  !gs4
  !tie
  db 24
  !tie
  db 96
  !f4
  !tie
  !as4
  !gs4
  !end

.sub5AA0
  db 48,$7F
  !ds4
  db 24
  !rest
  db 96
  !ds4
  !tie
  !tie
  db 24
  !tie
  db 48
  !ds4
  db 24
  !rest
  db 96
  !ds4
  !tie
  db 24
  !tie
  db 96
  !g4
  db 48
  !fs4
  db 24
  !rest
  db 96
  !fs4
  !tie
  !tie
  db 24
  !tie
  db 48
  !fs4
  db 24
  !rest
  !end

.sub5311
  !instr,!instr21
  !volume,180
  !pan,9
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
  !volume,180
  !pan,9
  !c5
  db 24
  !c5
  !c5
  !c5
  db 12
  !c5
  !c5
  db 24
  !c5
  !instr,!instr23
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  db 12
  !c5
  !c5
  db 24
  !c5
  !instr,!instr23
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !instr,!instr23
  !volume,180
  !pan,10
  db 12
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !end

.sub5369
  !instr,!instr22
  !volume,180
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
  !volume,180
  !pan,9
  !c5
  !end

.sub5388
  !instr,!instr22
  !volume,180
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  db 12
  !c5
  !c5
  !end

.sub539B
  db 12,$7F
  !c5
  !c5
  db 24
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !instr,!instr22
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  db 12
  !c5
  !c5
  !end

.sub53B9
  !instr,!instr22
  !volume,180
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
  !volume,180
  !pan,9
  !c5
  db 24
  !c5
  !c5
  !instr,!instr22
  !volume,180
  !pan,10
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  db 12
  !c4
  !amplify,0
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  db 24
  !c5
  !c5
  !instr,!instr22
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !end

.sub5407
  !instr,!instr22
  !volume,180
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !c5
  !c5
  !end

.sub541A
  !instr,!instr22
  !volume,180
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !instr,!instr20
  !volume,255
  !pan,13
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
  !end

.sub5441
  db 24,$7F
  !c5
  db 12
  !c5
  !c5
  db 24
  !c5
  !c5
  !c5
  !instr,!instr23
  !volume,180
  !pan,10
  db 12
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  db 24
  !c5
  !c5
  !c5
  !instr,!instr23
  !volume,180
  !pan,10
  db 12
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  db 24
  !c5
  !c5
  !instr,!instr23
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  db 12
  !c5
  !c5
  !end

.sub5481
  db 24,$7F
  !c5
  !c5
  !instr,!instr23
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !end

.sub5494
  db 24,$7F
  !c5
  !c5
  !c5
  !instr,!instr22
  !volume,180
  !pan,10
  !c5
  !instr,!instr23
  !volume,180
  !pan,10
  !end

.sub54A7
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

.sub54BA
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 72,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,180
  !pan,9
  db 24
  !c5
  !end

.sub54D6
  !instr,!instr22
  !volume,180
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !c5
  !c5
  !end

.sub54E9
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,180
  !pan,9
  db 24
  !c5
  !c5
  !end

.sub5506
  !instr,!instr22
  !volume,180
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !end

.sub552B
  !instr,!instr22
  !volume,180
  !pan,10
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,180
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

.sub554A
  !instr,!instr22
  !volume,180
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,180
  !pan,9
  db 12
  !c5
  !c5
  !end

.sub556F
  !instr,!instr22
  !volume,180
  !pan,10
  db 24,$7F
  !c5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 72
  !cs5
  !amplify,0
  !toggleEcho
  !end

.sub558B
  !instr,!instr20
  !volume,255
  !pan,13
  db 12,$7F
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
  !end

.sub55A2
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48,$7F
  !cs5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,180
  !pan,9
  db 12
  !c5
  !c5
  !instr,!instr25
  !volume,255
  !pan,10
  !amplify,223
  !toggleEcho
  db 48
  !cs5
  !amplify,0
  !toggleEcho
  !end

.sub55D1
  !instr,!instr21
  !volume,180
  !pan,9
  db 12,$7F
  !c5
  !end

.sub55DB
  !subloop,0
  !instr,!instr21
  !volume,180
  !pan,9
  db 12,$7F
  !c5
  !subloop,11
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  db 12,$7F
  !c4
  !amplify,0
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !c5
  !c5
  !instr,!instr1F
  !volume,225
  !pan,10
  !amplify,63
  !c4
  !amplify,0
  !subloop,0
  !instr,!instr21
  !volume,180
  !pan,9
  db 12,$7F
  !c5
  !subloop,4
  !end

.sub561B
  db 12,$7F
  !c5
  !c5
  !instr,!instr22
  !volume,180
  !pan,10
  !c5
  !instr,!instr21
  !volume,180
  !pan,9
  !c5
  !end

.sub59B4
  db 96,$7F
  !cs5
  !tie
  db 96
  !c5
  !tie
  db 96
  !as4
  !tie
  db 96
  !c5
  !tie
  !end

.sub59C2
  db 96,$7F
  !cs5
  db 72
  !c5
  db 120
  !cs5
  db 96
  !c5
  !as4
  db 72
  !c5
  db 120
  !cs5
  db 96
  !c5
  !cs5
  db 72
  !c5
  db 120
  !as4
  db 96
  !c5
  !as4
  !end

.sub59DB
  db 96,$7F
  !as4
  db 72
  !tie
  db 96
  !c5
  !tie
  db 24
  !tie
  db 96
  !cs5
  db 72
  !tie
  db 96
  !c5
  !tie
  db 24
  !tie
  db 96
  !as4
  db 72
  !tie
  !end

.sub59F3
  db 96,$7F
  !c5
  !tie
  db 24
  !tie
  db 96
  !a4
  !tie
  !cs5
  !c5
  !end

.sub59FF
  db 48,$7F
  !g4
  db 24
  !rest
  db 96
  !g4
  !tie
  !tie
  db 24
  !tie
  db 48
  !g4
  db 24
  !rest
  db 96
  !g4
  !tie
  db 24
  !tie
  db 96
  !c5
  db 48
  !as4
  db 24
  !rest
  db 96
  !as4
  !tie
  !tie
  db 24
  !tie
  db 48
  !as4
  db 24
  !rest
  !end

.sub5A24
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
  !a4
  db 72
  !tie
  db 96
  !b4
  !tie
  db 24
  !tie
  db 96
  !c5
  db 72
  !tie
  db 96
  !as4
  !tie
  db 24
  !tie
  db 96
  !d5
  db 72
  !tie
  !end

.remoteCode4E19
  !restoreInstrument
  !end

.remoteCode4E1C
  !adsrGain,$7F,$F8
  !end

.remoteCode4E20
  !adsrGain,$7F,$F6
  !end

assert pc() <= $10000-(4*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
