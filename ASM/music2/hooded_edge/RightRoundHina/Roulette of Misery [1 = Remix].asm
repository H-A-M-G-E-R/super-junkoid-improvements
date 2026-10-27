asar 1.91
norom : org 0
incsrc "../../defines.asm"

!instr1E = $16
!instr1F = $17
!instr20 = $18
!instr21 = $19
!instr22 = $1A
!instr24 = $1B
!instr25 = $1C
!instr26 = $1D
!instr27 = $1E
!instr28 = $1F
!instr29 = $20
!instr2A = $21

!sample04 = $16
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

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample19,$9F,$F5,$B8,$15,$00
  db !sample1A,$CF,$FA,$B8,$15,$00
  db !sample1B,$FF,$F2,$B8,$0A,$00
  db !sample1C,$FF,$FC,$B8,$0A,$00
  db !sample1C,$FF,$F4,$B8,$0A,$00
  db !sample1D,$9F,$F3,$B8,$0A,$00
  db !sample14,$FF,$F2,$B8,$04,$00
  db !sample15,$FF,$E6,$B8,$03,$F5
  db !sample16,$FF,$C6,$B8,$04,$01
  db !sample04,$AF,$E6,$B8,$03,$00
  db !sample17,$FC,$E0,$B8,$03,$05
  db !sample18,$FF,$EC,$B8,$05,$C0
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample04,Sample04+36
  dw Sample14,Sample14+3285
  dw Sample15,Sample15+1107
  dw Sample16,Sample16+27
  dw Sample17,Sample17+27
  dw Sample18,Sample18+1845
  dw Sample19,Sample19+909
  dw Sample1A,Sample1A+2034
  dw Sample1B,Sample1B+1809
  dw Sample1C,Sample1C+909
  dw Sample1D,Sample1D+909
endspcblock

pushpc
org !p_songSpecificData ; sample data
  Sample04: skip filesize("../../default/04 SMW @4.brr")-2
  Sample14: skip filesize("Top Piano.brr")-2
  Sample15: skip filesize("Rudra Sawtooth.brr")-2
  Sample16: skip filesize("MM7 Pulse 18.75%.brr")-2
  Sample17: skip filesize("String Ensemble 3.brr")-2
  Sample18: skip filesize("S3 Slap Bass II.brr")-2
  Sample19: skip filesize("Yasui Snare.brr")-2
  Sample1A: skip filesize("DR-660 Kick.brr")-2
  Sample1B: skip filesize("R8 Tom 2.brr")-2
  Sample1C: skip filesize("Ultima Hi-Hat.brr")-2
  Sample1D: skip filesize("R8 Crash.brr")-2
  NoteLengthTable:
pullpc

spcblock NoteLengthTable nspc
  ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2B60

Tracker2B60:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !echo,%11111000,66,-78
  !echoParameters,6,164,0
  !setDPMiscCommand,!noteEndInTicks,1
  !musicTranspose,253
  !musicVolume,95
  !tempo,69
  !instr,!instr1F
  !volume,230
  db 48,$7F
  !ds4
  !instr,!instr21
  !volume,230
  db 12,$7D
  !ds5
  !rest
  !instr,!instr1F
  !volume,230
  db 24,$7F
  !ds4
  db 72
  !ds4
  db 24
  !ds4
  db 72
  !ds4
  db 24
  !ds4
  db 72
  !ds4
  db 24
  !ds4
  !instr,!instr1F
  !volume,230
  !loop : dw .sub313B : db 14
  !instr,!instr1E
  !volume,235
  db 12,$7F
  !ds4
  !ds4
  !ds4
  !ds4
  !instr,!instr1F
  !volume,230
.pattern1_0:
  !loop : dw .sub313F : db 3
  !loop : dw .sub3170 : db 1
  !loop : dw .sub313F : db 3
  !loop : dw .sub31A1 : db 1
  !loop : dw .sub31CB : db 1
  !loop : dw .sub3170 : db 1
  !loop : dw .sub31CB : db 1
  !loop : dw .sub31A1 : db 1
  !loop : dw .sub31CB : db 1
  !loop : dw .sub3170 : db 1
  !loop : dw .sub31CB : db 1
  !loop : dw .sub31EF : db 1
  !loop : dw .sub313F : db 3
  !loop : dw .sub3170 : db 1
  !loop : dw .sub313F : db 3
  !loop : dw .sub31A1 : db 1
  !loop : dw .sub3212 : db 1
  !loop : dw .sub313F : db 1
  !loop : dw .sub3212 : db 1
  !loop : dw .sub3170 : db 1
  !loop : dw .sub3212 : db 1
  !loop : dw .sub313F : db 1
  !loop : dw .sub3212 : db 1
  !loop : dw .sub31EF : db 1
  !loop : dw .sub313F : db 2
  !loop : dw .sub3170 : db 1
  !loop : dw .sub3246 : db 1
  !loop : dw .sub313F : db 3
  !loop : dw .sub3170 : db 1
  !loop : dw .sub313F : db 3
  !loop : dw .sub31A1 : db 1
  !subloop,0
  !loop : dw .sub3212 : db 1
  !loop : dw .sub3170 : db 1
  !loop : dw .sub3212 : db 1
  !loop : dw .sub31A1 : db 1
  !subloop,1
  !loop : dw .sub313F : db 3
  !loop : dw .sub3170 : db 1
  !loop : dw .sub313F : db 3
  !loop : dw .sub31A1 : db 1
  !loop : dw .sub31CB : db 1
  !loop : dw .sub313F : db 1
  !loop : dw .sub31CB : db 1
  !loop : dw .sub31A1 : db 1
  !loop : dw .sub31CB : db 1
  !loop : dw .sub313F : db 1
  !loop : dw .sub3212 : db 1
  !loop : dw .sub31EF : db 1
  !loop : dw .sub313F : db 1
  !loop : dw .sub31A1 : db 1
  !loop : dw .sub3170 : db 1
  !loop : dw .sub31A1 : db 1
  !loop : dw .sub313F : db 1
  !loop : dw .sub31A1 : db 1
  !loop : dw .sub3170 : db 1
  !loop : dw .sub3246 : db 1
  !end

.pattern0_1
  !pan,10
  !toggleEcho
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,95
  db 84,$7F
  !e5
  !amplify,0
  !toggleEcho
  !instr,!instr21
  !volume,230
  db 12,$7D
  !ds5
  db 24
  !rest
  db 12
  !ds5
  !rest
  !ds5
  db 60
  !rest
  db 12
  !ds5
  !rest
  !ds5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !ds5
  !ds5
  !ds5
  !instr,!instr20
  !volume,225
  !pan,8
  db 6
  !as5
  !pan,9
  !gs5
  !pan,10
  !g5
  !pan,11
  !f5
  !pan,12
  !ds5
  !pan,13
  !d5
  !pan,10
  !instr,!instr21
  !volume,230
  db 12
  !ds5
  db 36
  !rest
  db 12
  !ds5
  db 24
  !rest
  !instr,!instr22
  !volume,230
  db 12
  !ds5
  !instr,!instr21
  !volume,230
  !ds5
  !rest
  !ds5
  !rest
  !ds5
  !rest
  !instr,!instr22
  !volume,230
  db 24
  !ds5
  !instr,!instr21
  !volume,230
  !loop : dw .sub3264 : db 3
  !instr,!instr20
  !volume,225
  !pan,13
  db 6,$7D
  !as5
  !as5
  !pan,11
  !gs5
  !gs5
  !pan,9
  !ds5
  !ds5
  !pan,7
  !d5
  !d5
  !pan,10
.pattern1_1:
  !subloop,0
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 6
  !loop : dw .sub32AD : db 1
  !subloop,1
  !subloop,0
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 2
  !loop : dw .sub32AD : db 1
  !subloop,2
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 2
  !loop : dw .sub32C1 : db 1
  !subloop,0
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 6
  !loop : dw .sub32AD : db 1
  !subloop,1
  !subloop,0
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 2
  !loop : dw .sub32AD : db 1
  !subloop,2
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 2
  !loop : dw .sub32E2 : db 1
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 3
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 2
  !loop : dw .sub32AD : db 1
  !subloop,0
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 6
  !loop : dw .sub32AD : db 1
  !subloop,1
  !subloop,0
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 2
  !loop : dw .sub32AD : db 1
  !subloop,2
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 2
  !loop : dw .sub32C1 : db 1
  !subloop,0
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 6
  !loop : dw .sub32AD : db 1
  !subloop,1
  !subloop,0
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 2
  !loop : dw .sub32AD : db 1
  !subloop,2
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 2
  !loop : dw .sub32E2 : db 1
  !subloop,0
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 3
  !loop : dw .sub3273 : db 1
  !loop : dw .sub3292 : db 2
  !loop : dw .sub32AD : db 1
  !subloop,1
  !end

.pattern0_2
  !instr,!instr2A
  !volume,200
  !transpose,0
  db 96,$7F
  !c5
  !cs5
  !d5
  db 48
  !ds5
  db 12
  !gs5
  !f5
  !ds5
  !c5
  !loop : dw .sub3303 : db 4
  !loop : dw .sub3307 : db 4
  !loop : dw .sub330B : db 4
  !loop : dw .sub330F : db 4
.pattern1_2:
  !subloop,0
  !loop : dw .sub3313 : db 4
  !loop : dw .sub3336 : db 4
  !transpose,253
  !subloop,1
  !transpose,1
  !loop : dw .sub3359 : db 2
  !subloop,0
  !loop : dw .sub3313 : db 4
  !loop : dw .sub3336 : db 4
  !transpose,3
  !subloop,1
  !transpose,0
  !loop : dw .sub3359 : db 4
  !end

.pattern0_3
  !transpose,0
  !instr,!instr25
  !volume,230
  !vibrato,16,12,31
  !pan,9
  !loop : dw .sub337C : db 1
  !loop : dw .sub338E : db 1
.pattern1_3:
  !instr,!instr26
  !volume,220
  !vibrato,16,13,31
  !transpose,0
  !remoteCode : dw .remoteCode3134 : db -1,0
  !remoteCode : dw .remoteCode3137 : db 3,0
  !loop : dw .sub33AB : db 1
  db 48,$7F
  !gs5
  !loop : dw .sub33AB : db 1
  db 36,$7F
  !gs5
  db 12
  !e5
  !loop : dw .sub33E1 : db 2
  !remoteCode : dw .remoteCode3134 : db 0,0
  !remoteCode : dw .remoteCode3137 : db 0,0
  !instr,!instr27
  !volume,185
  !transpose,253
  !loop : dw .sub3421 : db 1
  db 48,$6D
  !gs5
  !loop : dw .sub3421 : db 1
  db 36,$6D
  !gs5
  db 12
  !e5
  !loop : dw .sub3451 : db 2
  !transpose,0
  !instr,!instr25
  !volume,230
  !vibrato,16,12,31
  !transpose,1
  !loop : dw .sub337C : db 1
  !loop : dw .sub338E : db 1
  !instr,!instr26
  !volume,220
  !vibrato,16,13,31
  !remoteCode : dw .remoteCode3134 : db -1,0
  !remoteCode : dw .remoteCode3137 : db 3,0
  !loop : dw .sub33AB : db 1
  db 48,$7F
  !gs5
  !loop : dw .sub33AB : db 1
  db 36,$7F
  !gs5
  db 12
  !e5
  !loop : dw .sub33E1 : db 2
  !remoteCode : dw .remoteCode3134 : db 0,0
  !remoteCode : dw .remoteCode3137 : db 0,0
  !instr,!instr28
  !volume,220
  !transpose,3
  !loop : dw .sub3421 : db 1
  db 48,$7F
  !gs5
  !loop : dw .sub3421 : db 1
  db 36,$7F
  !gs5
  db 12
  !e5
  !loop : dw .sub3451 : db 2
  !transpose,0
  !instr,!instr25
  !volume,230
  !vibrato,16,12,31
  !loop : dw .sub337C : db 1
  !loop : dw .sub338E : db 1
  !transpose,12
  !loop : dw .sub338E : db 2
  !end

.pattern0_4
  !instr,!instr25
  !volume,230
  !vibrato,16,12,31
  !pan,12
  !loop : dw .sub348F : db 1
  !loop : dw .sub34A1 : db 1
.pattern1_4:
  !instr,!instr26
  !volume,220
  !vibrato,16,13,31
  !transpose,0
  !remoteCode : dw .remoteCode3134 : db -1,0
  !remoteCode : dw .remoteCode3137 : db 3,0
  !loop : dw .sub34BE : db 1
  db 48,$7F
  !ds5
  !loop : dw .sub34BE : db 1
  db 36,$7F
  !ds5
  db 12
  !cs5
  !loop : dw .sub34F4 : db 2
  !remoteCode : dw .remoteCode3134 : db 0,0
  !remoteCode : dw .remoteCode3137 : db 0,0
  !instr,!instr27
  !volume,185
  !transpose,253
  !loop : dw .sub3534 : db 1
  db 48,$6D
  !ds5
  !loop : dw .sub3534 : db 1
  db 36,$6D
  !ds5
  db 12
  !cs5
  !loop : dw .sub3564 : db 2
  !instr,!instr25
  !volume,230
  !vibrato,16,12,31
  !transpose,1
  !loop : dw .sub348F : db 1
  !loop : dw .sub34A1 : db 1
  !instr,!instr26
  !volume,220
  !vibrato,16,13,31
  !remoteCode : dw .remoteCode3134 : db -1,0
  !remoteCode : dw .remoteCode3137 : db 3,0
  !loop : dw .sub34BE : db 1
  db 48,$7F
  !ds5
  !loop : dw .sub34BE : db 1
  db 36,$7F
  !ds5
  db 12
  !cs5
  !loop : dw .sub34F4 : db 2
  !remoteCode : dw .remoteCode3134 : db 0,0
  !remoteCode : dw .remoteCode3137 : db 0,0
  !instr,!instr28
  !volume,220
  !transpose,3
  !loop : dw .sub3534 : db 1
  db 48,$7F
  !ds5
  !loop : dw .sub3534 : db 1
  db 36,$7F
  !ds5
  db 12
  !cs5
  !loop : dw .sub3564 : db 2
  !transpose,0
  !instr,!instr25
  !volume,230
  !vibrato,16,12,31
  !loop : dw .sub348F : db 1
  !loop : dw .sub34A1 : db 1
  !transpose,12
  !loop : dw .sub34A1 : db 2
  !end

.pattern0_5
  !instr,!instr29
  !volume,200
  !pan,7
  !loop : dw .sub35A2 : db 2
.pattern1_5:
  !subloop,0
  !loop : dw .sub35A9 : db 4
  !loop : dw .sub35B0 : db 2
  !loop : dw .sub35B8 : db 2
  !transpose,253
  !subloop,1
  !transpose,1
  !loop : dw .sub35A2 : db 2
  !subloop,0
  !loop : dw .sub35A9 : db 4
  !loop : dw .sub35B0 : db 2
  !loop : dw .sub35B8 : db 2
  !transpose,3
  !subloop,1
  !transpose,0
  !loop : dw .sub35A2 : db 4
  !end

.pattern0_6
  !instr,!instr29
  !volume,200
  !pan,13
  !loop : dw .sub35C0 : db 2
.pattern1_6:
  !subloop,0
  !loop : dw .sub35C7 : db 4
  !loop : dw .sub35CE : db 2
  !loop : dw .sub35D6 : db 2
  !transpose,253
  !subloop,1
  !transpose,1
  !loop : dw .sub35C0 : db 2
  !subloop,0
  !loop : dw .sub35C7 : db 4
  !loop : dw .sub35CE : db 2
  !loop : dw .sub35D6 : db 2
  !transpose,3
  !subloop,1
  !transpose,0
  !loop : dw .sub35C0 : db 4
  !end

.pattern0_7
  !instr,!instr29
  !volume,200
  !pan,11
  !loop : dw .sub35DE : db 2
.pattern1_7:
  !subloop,0
  !loop : dw .sub35E5 : db 4
  !loop : dw .sub35EC : db 2
  !loop : dw .sub35F4 : db 2
  !transpose,253
  !subloop,1
  !transpose,1
  !loop : dw .sub35DE : db 2
  !subloop,0
  !loop : dw .sub35E5 : db 4
  !loop : dw .sub35EC : db 2
  !loop : dw .sub35F4 : db 2
  !transpose,3
  !subloop,1
  !transpose,0
  !loop : dw .sub35DE : db 4
  !end

.sub313B
  db 24,$7F
  !ds4
  !end

.sub313F
  db 24,$7F
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !instr,!instr1F
  !volume,230
  db 12
  !ds4
  !ds4
  !instr,!instr1E
  !volume,235
  db 24
  !ds4
  !instr,!instr1F
  !volume,230
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !instr,!instr1F
  !volume,230
  db 12
  !ds4
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !ds4
  !instr,!instr1F
  !volume,230
  !end

.sub3170
  db 24,$7F
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !instr,!instr1F
  !volume,230
  db 12
  !ds4
  !ds4
  !instr,!instr1E
  !volume,235
  db 24
  !ds4
  !instr,!instr1F
  !volume,230
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !instr,!instr1F
  !volume,230
  db 12
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !ds4
  !ds4
  !instr,!instr1F
  !volume,230
  !end

.sub31A1
  db 24,$7F
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !instr,!instr1F
  !volume,230
  db 12
  !ds4
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !ds4
  !instr,!instr1F
  !volume,230
  db 24
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  db 12
  !ds4
  !ds4
  !ds4
  !ds4
  !instr,!instr1F
  !volume,230
  !end

.sub31CB
  db 24,$7F
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  db 12
  !ds4
  db 24
  !ds4
  db 12
  !ds4
  db 24
  !ds4
  db 12
  !ds4
  !ds4
  !instr,!instr1F
  !volume,230
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !ds4
  !ds4
  !instr,!instr1F
  !volume,230
  !end

.sub31EF
  db 24,$7F
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !instr,!instr1F
  !volume,230
  db 12
  !ds4
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !ds4
  !ds4
  !ds4
  db 24
  !ds4
  db 12
  !ds4
  !ds4
  !ds4
  !ds4
  !instr,!instr1F
  !volume,230
  !end

.sub3212
  db 24,$7F
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !instr,!instr1F
  !volume,230
  db 12
  !ds4
  !instr,!instr1E
  !volume,235
  db 24
  !ds4
  db 12
  !ds4
  !instr,!instr1F
  !volume,230
  db 24
  !ds4
  !instr,!instr1E
  !volume,235
  db 12
  !ds4
  !ds4
  !instr,!instr1F
  !volume,230
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !ds4
  !ds4
  !instr,!instr1F
  !volume,230
  !end

.sub3246
  db 24,$7F
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !instr,!instr1F
  !volume,230
  !ds4
  !instr,!instr1E
  !volume,235
  !ds4
  !subloop,0
  db 12,$7F
  !ds4
  !subloop,7
  !instr,!instr1F
  !volume,230
  !end

.sub3264
  db 12,$7D
  !ds5
  !ds5
  !instr,!instr22
  !volume,230
  db 24
  !ds5
  !instr,!instr21
  !volume,230
  !end

.sub3273
  !toggleEcho
  !instr,!instr24
  !volume,255
  !pan,10
  !amplify,95
  db 72,$7F
  !e5
  !amplify,0
  !toggleEcho
  !instr,!instr22
  !volume,230
  db 24,$7D
  !ds5
  !instr,!instr21
  !volume,230
  !end

.sub3292
  db 12,$7D
  !ds5
  !ds5
  !instr,!instr22
  !volume,230
  !ds5
  !instr,!instr21
  !volume,230
  !ds5
  !ds5
  !ds5
  !instr,!instr22
  !volume,230
  db 24
  !ds5
  !instr,!instr21
  !volume,230
  !end

.sub32AD
  db 12,$7D
  !ds5
  !ds5
  !instr,!instr22
  !volume,230
  db 24
  !ds5
  db 12
  !ds5
  !ds5
  !ds5
  !ds5
  !instr,!instr21
  !volume,230
  !end

.sub32C1
  !instr,!instr20
  !volume,225
  !pan,14
  db 12,$7D
  !as5
  !pan,13
  !as5
  !pan,12
  !gs5
  !pan,11
  !gs5
  !pan,10
  !ds5
  !pan,9
  !ds5
  !pan,8
  !d5
  !pan,7
  !d5
  !pan,10
  !end

.sub32E2
  !instr,!instr20
  !volume,225
  !pan,7
  db 12,$7D
  !as5
  !pan,8
  !as5
  !pan,9
  !gs5
  !pan,10
  !gs5
  !pan,11
  !ds5
  !pan,12
  !ds5
  !pan,13
  !d5
  !pan,14
  !d5
  !pan,10
  !end

.sub3303
  db 24,$7F
  !c5
  !end

.sub3307
  db 24,$7F
  !cs5
  !end

.sub330B
  db 24,$7F
  !d5
  !end

.sub330F
  db 24,$7F
  !ds5
  !end

.sub3313
  db 12,$7F
  !cs5
  !cs5
  !cs6
  !cs6
  !cs5
  !cs5
  !cs6
  !cs6
  !a4
  !a4
  !a5
  !a5
  !a4
  !a4
  !a5
  !a5
  !b4
  !b4
  !b5
  !b5
  !b4
  !b4
  !b5
  !b5
  !gs4
  !gs4
  !gs5
  !gs5
  !gs4
  !gs4
  !gs5
  !gs5
  !end

.sub3336
  db 12,$7F
  !a4
  !a4
  !a5
  !a5
  !a4
  !a4
  !a5
  !a5
  !b4
  !b4
  !b5
  !b5
  !b4
  !b4
  !b5
  !b5
  !cs5
  !cs5
  !cs6
  !cs6
  !cs5
  !cs5
  !cs6
  !cs6
  !cs5
  !cs5
  !cs6
  !cs6
  !cs5
  !cs5
  !cs6
  !cs6
  !end

.sub3359
  db 12,$7F
  !c5
  !c5
  !f5
  !f5
  !c5
  !c5
  !f5
  !f5
  !cs5
  !cs5
  !fs5
  !fs5
  !cs5
  !cs5
  !fs5
  !fs5
  !d5
  !d5
  !g5
  !g5
  !d5
  !d5
  !g5
  !g5
  !ds5
  !ds5
  !gs5
  !gs5
  !ds5
  !ds5
  !gs5
  !gs5
  !end

.sub337C
  db 72,$7F
  !f5
  db 24
  !f5
  db 72
  !fs5
  db 24
  !fs5
  db 72
  !g5
  db 24
  !g5
  db 72
  !gs5
  db 24
  !gs5
  !end

.sub338E
  !subloop,0
  db 24,$7F
  !f5
  !subloop,3
  !subloop,0
  db 24,$7F
  !fs5
  !subloop,3
  !subloop,0
  db 24,$7F
  !g5
  !subloop,3
  !subloop,0
  db 24,$7F
  !gs5
  !subloop,3
  !end

.sub33AB
  db 24,$7F
  !cs6
  db 12
  !gs5
  !cs6
  !ds6
  !e6
  db 24
  !fs6
  db 56
  !cs6
  db 16
  !rest
  db 24
  !cs6
  !ds6
  db 12
  !cs6
  db 24
  !ds6
  db 12
  !e6
  !ds6
  !b5
  db 36
  !gs5
  !c6
  db 24
  !gs6
  db 56
  !e6
  db 16
  !rest
  db 24
  !e6
  db 56
  !cs6
  db 16
  !rest
  db 12
  !b5
  !a5
  db 36
  !fs5
  !fs5
  db 24
  !fs5
  db 12
  !gs5
  !a5
  !gs5
  !a5
  !end

.sub33E1
  db 12,$7F
  !cs5
  !ds5
  !e5
  !fs5
  db 24
  !gs5
  db 12
  !fs5
  !gs5
  !gs5
  !cs6
  !ds6
  !e6
  db 24
  !fs6
  db 12
  !e6
  !fs6
  !cs6
  !cs6
  !gs6
  !gs6
  !cs6
  !cs6
  !gs6
  !gs6
  db 56
  !cs6
  db 16
  !rest
  db 12
  !gs5
  !e5
  !cs5
  !ds5
  !e5
  !fs5
  db 24
  !gs5
  db 12
  !fs5
  !gs5
  !gs5
  !cs6
  !ds6
  !e6
  db 24
  !fs6
  db 12
  !gs6
  !b6
  !cs7
  !gs6
  !fs6
  !e6
  !cs6
  !gs5
  !fs5
  !e5
  db 96
  !cs5
  !end

.sub3421
  db 24,$6D
  !cs6
  db 12
  !gs5
  !cs6
  !ds6
  !e6
  db 24
  !fs6
  db 72
  !cs6
  db 24
  !cs6
  !ds6
  db 12
  !cs6
  db 24
  !ds6
  db 12
  !e6
  !ds6
  !b5
  db 36
  !gs5
  !c6
  db 24
  !gs6
  db 72
  !e6
  db 24
  !e6
  db 72
  !cs6
  db 12
  !b5
  !a5
  db 36
  !fs5
  !fs5
  db 24
  !fs5
  db 12
  !gs5
  !a5
  !gs5
  !a5
  !end

.sub3451
  db 12,$6D
  !cs5
  !ds5
  !e5
  !fs5
  db 24
  !gs5
  db 12
  !fs5
  !gs5
  !gs5
  !cs6
  !ds6
  !e6
  db 24
  !fs6
  db 12
  !e6
  !fs6
  !cs6
  !cs6
  !gs6
  !gs6
  !cs6
  !cs6
  !gs6
  !gs6
  db 72
  !cs6
  db 12
  !gs5
  !e5
  !cs5
  !ds5
  !e5
  !fs5
  db 24
  !gs5
  db 12
  !fs5
  !gs5
  !gs5
  !cs6
  !ds6
  !e6
  db 24
  !fs6
  db 12
  !gs6
  !b6
  !cs7
  !gs6
  !fs6
  !e6
  !cs6
  !gs5
  !fs5
  !e5
  db 96
  !cs5
  !end

.sub348F
  db 72,$7F
  !c5
  db 24
  !c5
  db 72
  !cs5
  db 24
  !cs5
  db 72
  !d5
  db 24
  !d5
  db 72
  !ds5
  db 24
  !ds5
  !end

.sub34A1
  !subloop,0
  db 24,$7F
  !c5
  !subloop,3
  !subloop,0
  db 24,$7F
  !cs5
  !subloop,3
  !subloop,0
  db 24,$7F
  !d5
  !subloop,3
  !subloop,0
  db 24,$7F
  !ds5
  !subloop,3
  !end

.sub34BE
  db 24,$7F
  !gs5
  db 12
  !e5
  !gs5
  !b5
  !cs6
  db 24
  !cs6
  db 56
  !a5
  db 16
  !rest
  db 24
  !a5
  !b5
  db 12
  !gs5
  db 24
  !b5
  db 12
  !cs6
  !b5
  !gs5
  db 36
  !ds5
  !gs5
  db 24
  !c6
  db 56
  !cs6
  db 16
  !rest
  db 24
  !cs6
  db 56
  !a5
  db 16
  !rest
  db 12
  !gs5
  !fs5
  db 36
  !ds5
  !ds5
  db 24
  !ds5
  db 12
  !e5
  !fs5
  !e5
  !fs5
  !end

.sub34F4
  db 12,$7F
  !a4
  !b4
  !cs5
  !ds5
  db 24
  !e5
  db 12
  !ds5
  !e5
  !e5
  !gs5
  !b5
  !cs6
  db 24
  !ds6
  db 12
  !cs6
  !ds6
  !gs5
  !gs5
  !e6
  !e6
  !gs5
  !gs5
  !e6
  !e6
  db 56
  !gs5
  db 16
  !rest
  db 12
  !e5
  !cs5
  !a4
  !b4
  !cs5
  !ds5
  db 24
  !e5
  db 12
  !cs5
  !e5
  !e5
  !gs5
  !b5
  !cs6
  db 24
  !ds6
  db 12
  !ds6
  !fs6
  !gs6
  !e6
  !cs6
  !b5
  !gs5
  !e5
  !cs5
  !cs5
  db 96
  !gs4
  !end

.sub3534
  db 24,$6D
  !gs5
  db 12
  !e5
  !gs5
  !b5
  !cs6
  db 24
  !cs6
  db 72
  !a5
  db 24
  !a5
  !b5
  db 12
  !gs5
  db 24
  !b5
  db 12
  !cs6
  !b5
  !gs5
  db 36
  !ds5
  !gs5
  db 24
  !c6
  db 72
  !cs6
  db 24
  !cs6
  db 72
  !a5
  db 12
  !gs5
  !fs5
  db 36
  !ds5
  !ds5
  db 24
  !ds5
  db 12
  !e5
  !fs5
  !e5
  !fs5
  !end

.sub3564
  db 12,$6D
  !a4
  !b4
  !cs5
  !ds5
  db 24
  !e5
  db 12
  !ds5
  !e5
  !e5
  !gs5
  !b5
  !cs6
  db 24
  !ds6
  db 12
  !cs6
  !ds6
  !gs5
  !gs5
  !e6
  !e6
  !gs5
  !gs5
  !e6
  !e6
  db 72
  !gs5
  db 12
  !e5
  !cs5
  !a4
  !b4
  !cs5
  !ds5
  db 24
  !e5
  db 12
  !cs5
  !e5
  !e5
  !gs5
  !b5
  !cs6
  db 24
  !ds6
  db 12
  !ds6
  !fs6
  !gs6
  !e6
  !cs6
  !b5
  !gs5
  !e5
  !cs5
  !cs5
  db 96
  !gs4
  !end

.sub35A2
  db 96,$7C
  !gs4
  !a4
  !as4
  !b4
  !end

.sub35A9
  db 96,$7C
  !e5
  !cs5
  !ds5
  !b4
  !end

.sub35B0
  db 96,$7C
  !cs5
  !ds5
  db 96
  !e5
  !tie
  !end

.sub35B8
  db 96,$7C
  !e5
  !fs5
  db 96
  !gs5
  !tie
  !end

.sub35C0
  db 96,$7C
  !c5
  !cs5
  !d5
  !ds5
  !end

.sub35C7
  db 96,$7C
  !gs5
  !e5
  !fs5
  !ds5
  !end

.sub35CE
  db 96,$7C
  !e5
  !fs5
  db 96
  !gs5
  !tie
  !end

.sub35D6
  db 96,$7C
  !a5
  !b5
  db 96
  !cs6
  !tie
  !end

.sub35DE
  db 96,$7C
  !f4
  !fs4
  !g4
  !gs4
  !end

.sub35E5
  db 96,$7C
  !cs5
  !a4
  !b4
  !gs4
  !end

.sub35EC
  db 96,$7C
  !a4
  !b4
  db 96
  !cs5
  !tie
  !end

.sub35F4
  db 96,$7C
  !cs5
  !ds5
  db 96
  !e5
  !tie
  !end

.remoteCode3134
  !restoreInstrument
  !end

.remoteCode3137
  !adsrGain,$7F,$F9
  !end

assert pc() <= $10000-(6*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
