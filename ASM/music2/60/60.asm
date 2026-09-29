asar 1.91
norom : org 0
incsrc "../defines.asm"

!instr18 = $16
!instr19 = $17
!instr1A = $18
!instr1B = $19
!instr1C = $1A
!instr1D = $1B
!instr1E = $1C

!sample18 = $16
!sample19 = $17
!sample1A = $18
!sample1B = $19
!sample1C = $1A
!sample1D = $1B
!sample1E = $1C

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample18,$00,$00,$7F,$00,$7A
  db !sample19,$00,$00,$7F,$05,$17
  db !sample1A,$8F,$EF,$00,$01,$4F
  db !sample1B,$00,$00,$7F,$05,$64
  db !sample1C,$BF,$C0,$00,$01,$35
  db !sample1D,$00,$00,$7F,$01,$50
  db !sample1E,$AF,$A0,$00,$02,$81
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample18,Sample18+90
  dw Sample19,Sample19+7299
  dw Sample1A,Sample1A+639
  dw Sample1B,Sample1B+306
  dw Sample1C,Sample1C+189
  dw Sample1D,Sample1D+2421
  dw Sample1E,Sample1E+9
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample18: incbin "Sample_56cef49ad9e249959efa8fbae2a5acad.brr"
  Sample19: incbin "Sample_32c6ae48d8f32eb8c0e855e724e9a30b.brr"
  Sample1A: incbin "Sample_f11a6fcea73b6eae78e5b11e11d765e3.brr"
  Sample1B: incbin "Sample_968ded3129916b0bbc9014c5ff996fee.brr"
  Sample1C: incbin "Sample_a8793cfdc2efdf939bb729466d392a34.brr"
  Sample1D: incbin "Sample_609b1cb0c5682c25bab5535cb1fad5ca.brr"
  Sample1E: incbin "Sample_43bee8129d681ca1fd92ac7564025795.brr"

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker5830

Tracker5830:
  dw .pattern0
  dw .pattern1
  dw .pattern2
  dw .pattern3
  dw .pattern4
  dw .pattern5
-
  dw .pattern6
  dw .pattern7
  dw .pattern8
  dw .pattern9
  dw .pattern10
  dw .pattern11
  dw .pattern12
  dw .pattern13
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, 0, .pattern1_3, 0, 0, .pattern1_6, .pattern1_7
.pattern2: dw .pattern2_0, .pattern2_1, .pattern2_2, .pattern2_3, 0, 0, .pattern2_6, 0
.pattern3: dw .pattern3_0, .pattern3_1, .pattern3_2, .pattern3_3, .pattern3_4, .pattern3_5, .pattern3_6, 0
.pattern4: dw .pattern2_0, .pattern2_1, .pattern2_3, .pattern4_3, .pattern4_4, .pattern4_5, .pattern3_6, 0
.pattern5: dw .pattern3_0, .pattern5_1, .pattern2_3, .pattern5_3, .pattern5_4, .pattern5_5, .pattern5_6, 0
.pattern6: dw .pattern2_0, .pattern6_1, .pattern6_2, .pattern6_3, .pattern6_4, 0, 0, 0
.pattern7: dw .pattern3_0, .pattern3_1, .pattern7_2, .pattern7_3, .pattern7_4, 0, 0, 0
.pattern8: dw .pattern2_0, .pattern2_1, .pattern8_2, .pattern8_3, .pattern8_4, 0, 0, 0
.pattern9: dw .pattern3_0, .pattern3_1, .pattern9_2, .pattern9_3, .pattern9_4, 0, .pattern9_6, 0
.pattern10: dw .pattern2_0, .pattern2_1, .pattern2_2, .pattern5_1, .pattern10_4, 0, .pattern10_6, 0
.pattern11: dw .pattern3_0, .pattern6_3, .pattern11_2, .pattern11_3, .pattern11_4, .pattern3_5, 0, 0
.pattern12: dw .pattern2_0, .pattern12_1, .pattern12_2, .pattern12_3, .pattern12_4, 0, .pattern12_6, 0
.pattern13: dw .pattern3_0, .pattern5_1, .pattern2_3, .pattern5_3, .pattern5_4, .pattern5_5, .pattern13_6, 0

.pattern0_0
  !pan,10
  !echo,%00000000,0,0
  !musicVolume,179
  !tempo,41
  !volume,179
  db 6,$7F
  !rest
  !dynamicVibrato,1
  !end

.pattern0_1
  !pan,10
  !echo,%00000000,0,0
  !musicVolume,179
  !tempo,41
  !volume,179
  db 6,$7F
  !rest
  !end

.pattern0_2
  !pan,10
  !echo,%00000000,0,0
  !musicVolume,179
  !tempo,41
  !volume,179
  db 6,$7F
  !rest
  !end

.pattern0_3
  !pan,10
  !echo,%00000000,0,0
  !musicVolume,179
  !tempo,41
  !volume,179
  db 6,$7F
  !rest
  !end

.pattern0_4
  !pan,10
  !echo,%00000000,0,0
  !musicVolume,179
  !tempo,41
  !volume,179
  db 6,$7F
  !rest
  !end

.pattern0_5
  !pan,10
  !echo,%00000000,0,0
  !musicVolume,179
  !tempo,41
  !volume,179
  db 6,$7F
  !rest
  !end

.pattern0_6
  !pan,10
  !echo,%00000000,0,0
  !musicVolume,179
  !tempo,41
  !volume,179
  db 6,$7F
  !rest
  !end

.pattern0_7
  !pan,10
  !echo,%00000000,0,0
  !musicVolume,179
  !tempo,41
  !volume,179
  db 6,$7F
  !rest
  !end

.pattern1_0
  !instr,!instr18
  !volume,125
  db 6
  !e6
  !dynamicVolume,180,233
  db 126
  !tie
  !tie
  !tie
  !e6
  db 66
  !tie
  !volume,236
  !dynamicVolume,180,163
  db 126
  !tie
  db 66
  !tie
  !end

.pattern1_1
  !instr,!instr18
  !volume,125
  db 6
  !d5
  !dynamicVolume,180,233
  db 126
  !tie
  !tie
  db 30
  !tie
  db 126
  !d5
  !tie
  db 36
  !tie
  !volume,236
  !dynamicVolume,90,189
  db 96
  !tie
  !dynamicVolume,1,186
  db 6
  !d5
  !volume,183
  !dynamicVolume,78,163
  db 90
  !tie
  !end

.pattern1_3
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 6
  !tie
  !instr,!instr19
  !volume,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !end

.pattern1_6
  !echoParameters,2,91,3
  db 126
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 12
  !tie
  !end

.pattern1_7
  !echo,%00111111,48,-32
  db 126
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 12
  !tie
  !end

.pattern2_0
  !instr,!instr18
  db 18
  !e6
  !volume,167
  !dynamicVolume,168,234
  db 126
  !tie
  !tie
  db 114
  !tie
  db 126
  !e6
  db 66
  !tie
  !volume,236
  !dynamicVolume,186,125
  db 126
  !tie
  db 66
  !tie
  !end

.pattern2_1
  db 18
  !tie
  !volume,167
  !dynamicVolume,168,234
  db 126
  !tie
  !tie
  db 18
  !tie
  !instr,!instr18
  db 126
  !d5
  !tie
  db 36
  !tie
  !volume,236
  !dynamicVolume,186,125
  db 126
  !tie
  db 66
  !tie
  !end

.pattern2_2
  db 126
  !tie
  db 18
  !tie
  !instr,!instr1A
  !volume,255
  db 24
  !c5
  !volume,189
  !c5
  !volume,163
  !c5
  !volume,97
  !c5
  !c5
  !dynamicVolume,255,0
  db 126
  !tie
  !tie
  db 12
  !tie
  !dynamicVolume,1,255
  db 24
  !c5
  !dynamicVolume,1,189
  !c5
  !dynamicVolume,1,163
  !c5
  !dynamicVolume,1,97
  !c5
  !c5
  !dynamicVolume,255,0
  db 120
  !tie
  !end

.pattern2_3
  !instr,!instr19
  !volume,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !end

.pattern2_6
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 6
  !tie
  !instr,!instr1B
  !volume,177
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  !end

.pattern3_0
  !instr,!instr18
  db 6
  !e6
  !dynamicVolume,180,233
  db 126
  !tie
  !tie
  !tie
  !e6
  db 66
  !tie
  !volume,236
  !dynamicVolume,180,163
  db 126
  !tie
  db 66
  !tie
  !end

.pattern3_1
  !instr,!instr18
  db 6
  !d5
  !dynamicVolume,180,233
  db 126
  !tie
  !tie
  db 30
  !tie
  db 126
  !d5
  !tie
  db 36
  !tie
  !volume,236
  !dynamicVolume,90,189
  db 96
  !tie
  !dynamicVolume,1,186
  db 6
  !d5
  !volume,183
  !dynamicVolume,78,163
  db 90
  !tie
  !end

.pattern3_2
  !instr,!instr19
  !volume,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 36
  !tie
  !instr,!instr1A
  !dynamicVolume,1,255
  db 24
  !c5
  !dynamicVolume,1,189
  !c5
  !instr,!instr19
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !end

.pattern3_3
  !instr,!instr1C
  !volume,220
  db 6
  !cs5
  !dynamicVolume,1,170
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,180
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !as4
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,201
  !a4
  !dynamicVolume,1,206
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,212
  db 6
  !a4
  !dynamicVolume,1,215
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,217
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,224
  db 6
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,237
  !cs5
  !dynamicVolume,1,240
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,245
  !cs5
  !dynamicVolume,1,247
  !tie
  db 12
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !dynamicVolume,1,255
  db 6
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,242
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 12
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,1,249
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,243
  !cs5
  !dynamicVolume,1,242
  !tie
  !dynamicVolume,1,247
  !as4
  !dynamicVolume,1,243
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,228
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,236
  !cs5
  !dynamicVolume,1,234
  !tie
  !dynamicVolume,1,233
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,234
  db 6
  !a4
  !dynamicVolume,1,231
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,210
  !tie
  !dynamicVolume,1,206
  !as4
  !dynamicVolume,1,204
  !tie
  !dynamicVolume,1,201
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,197
  db 6
  !cs5
  !dynamicVolume,1,194
  !tie
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,186
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,177
  !cs5
  !dynamicVolume,1,170
  !tie
  !dynamicVolume,1,177
  !as4
  !dynamicVolume,1,174
  !tie
  !dynamicVolume,1,155
  !a4
  !dynamicVolume,30,0
  db 126
  !tie
  db 72
  !tie
  !end

.pattern3_4
  db 12
  !tie
  !instr,!instr1C
  !volume,170
  db 6
  !as4
  !volume,174
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,206
  db 6
  !as4
  !dynamicVolume,1,210
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,220
  db 6
  !as4
  !dynamicVolume,1,222
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,231
  db 6
  !as4
  !dynamicVolume,1,234
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,220
  db 6
  !as4
  !dynamicVolume,1,217
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,206
  db 6
  !a4
  !dynamicVolume,1,204
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,186
  db 6
  !as4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !instr,!instr1A
  !dynamicVolume,1,255
  db 24
  !c5
  !dynamicVolume,1,189
  !c5
  !dynamicVolume,1,163
  !c5
  !dynamicVolume,1,97
  !c5
  !c5
  !dynamicVolume,255,0
  db 120
  !tie
  !end

.pattern3_5
  db 126
  !tie
  db 66
  !tie
  !instr,!instr1A
  !volume,163
  db 24
  !c5
  !volume,97
  !c5
  !c5
  !dynamicVolume,255,0
  db 126
  !tie
  !tie
  !tie
  !tie
  !end

.pattern3_6
  !instr,!instr1B
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  !end

.pattern4_3
  db 126
  !tie
  db 18
  !tie
  !instr,!instr1A
  !volume,255
  db 24
  !c5
  !volume,189
  !c5
  !volume,163
  !c5
  !volume,97
  !c5
  !c5
  !dynamicVolume,255,0
  db 120
  !tie
  !instr,!instr1C
  !dynamicVolume,1,170
  db 6
  !cs5
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,180
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !as4
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,201
  !a4
  !dynamicVolume,1,206
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,212
  db 6
  !a4
  !dynamicVolume,1,215
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,217
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,224
  db 6
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,237
  !cs5
  !dynamicVolume,1,240
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,245
  !cs5
  !dynamicVolume,1,247
  !tie
  db 12
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !dynamicVolume,1,255
  db 6
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,242
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 12
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !end

.pattern4_4
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 18
  !tie
  !instr,!instr1C
  !volume,170
  db 6
  !as4
  !volume,174
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,206
  db 6
  !as4
  !dynamicVolume,1,210
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,220
  db 6
  !as4
  !dynamicVolume,1,222
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,231
  db 6
  !as4
  !dynamicVolume,1,234
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  !tie
  !end

.pattern4_5
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 24
  !tie
  !instr,!instr1A
  !volume,255
  !c5
  !volume,189
  !c5
  !volume,163
  !c5
  !volume,97
  !c5
  !c5
  !dynamicVolume,255,0
  db 120
  !tie
  !end

.pattern5_1
  !instr,!instr1C
  !volume,159
  db 6
  !e4
  !dynamicVolume,1,163
  !tie
  !dynamicVolume,1,167
  !f4
  !tie
  !dynamicVolume,1,180
  !fs4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,180
  !as4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,208
  !c5
  !tie
  !dynamicVolume,1,194
  !e4
  !dynamicVolume,1,197
  !tie
  !dynamicVolume,1,199
  !f4
  !dynamicVolume,1,204
  !tie
  !fs4
  !dynamicVolume,1,206
  !tie
  !dynamicVolume,1,220
  !as4
  !dynamicVolume,1,222
  !tie
  !dynamicVolume,1,237
  !c5
  !dynamicVolume,1,240
  !tie
  !dynamicVolume,1,234
  !e4
  !dynamicVolume,1,236
  !tie
  !dynamicVolume,1,220
  !f4
  !dynamicVolume,1,222
  !tie
  !dynamicVolume,1,239
  !fs4
  !dynamicVolume,1,242
  !tie
  !dynamicVolume,1,243
  !as4
  !dynamicVolume,1,246
  !tie
  !dynamicVolume,1,255
  !c5
  !tie
  !e4
  !tie
  !dynamicVolume,1,243
  db 12
  !f4
  !dynamicVolume,1,253
  !fs4
  !dynamicVolume,1,255
  !as4
  !c5
  !dynamicVolume,1,251
  !e4
  !dynamicVolume,1,247
  !f4
  !dynamicVolume,1,253
  !fs4
  !dynamicVolume,1,255
  !as4
  !c5
  !e4
  !dynamicVolume,1,246
  !f4
  !dynamicVolume,1,253
  !fs4
  !dynamicVolume,1,255
  !as4
  !c5
  !dynamicVolume,1,243
  !e4
  !dynamicVolume,1,247
  !f4
  !dynamicVolume,1,255
  !fs4
  !as4
  !c5
  !dynamicVolume,1,247
  !e4
  !dynamicVolume,1,243
  !f4
  !dynamicVolume,1,255
  !fs4
  !as4
  !c5
  !dynamicVolume,1,247
  !e4
  !dynamicVolume,1,243
  !f4
  !dynamicVolume,1,255
  !fs4
  !dynamicVolume,1,253
  !as4
  !dynamicVolume,1,243
  !c5
  !dynamicVolume,1,222
  !e4
  !dynamicVolume,1,243
  !f4
  !dynamicVolume,1,255
  !fs4
  !dynamicVolume,1,253
  !as4
  !dynamicVolume,1,255
  !c5
  !dynamicVolume,1,240
  !e4
  !dynamicVolume,1,243
  !f4
  !dynamicVolume,1,255
  !fs4
  !as4
  !c5
  !dynamicVolume,1,251
  !e4
  !dynamicVolume,1,247
  !f4
  !dynamicVolume,1,253
  !fs4
  !as4
  !dynamicVolume,1,255
  !c5
  !dynamicVolume,1,251
  !e4
  !f4
  !dynamicVolume,1,255
  !fs4
  !dynamicVolume,1,250
  !as4
  !end

.pattern5_3
  !instr,!instr1C
  !volume,251
  db 6
  !a4
  !volume,249
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,243
  !cs5
  !dynamicVolume,1,242
  !tie
  !dynamicVolume,1,247
  !as4
  !dynamicVolume,1,243
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,228
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,236
  !cs5
  !dynamicVolume,1,234
  !tie
  !dynamicVolume,1,233
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,234
  db 6
  !a4
  !dynamicVolume,1,231
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,210
  !tie
  !dynamicVolume,1,206
  !as4
  !dynamicVolume,1,204
  !tie
  !dynamicVolume,1,201
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,197
  db 6
  !cs5
  !dynamicVolume,1,194
  !tie
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,186
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,177
  !cs5
  !dynamicVolume,1,170
  !tie
  !dynamicVolume,1,177
  !as4
  !dynamicVolume,1,174
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,155
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,170
  !cs5
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,180
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !as4
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,201
  !a4
  !dynamicVolume,1,206
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,212
  db 6
  !a4
  !dynamicVolume,1,215
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,217
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,224
  db 6
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,237
  !cs5
  !dynamicVolume,1,240
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,245
  !cs5
  !dynamicVolume,1,247
  !tie
  db 12
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !dynamicVolume,1,255
  db 6
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,242
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 12
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,1,249
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,243
  !cs5
  !dynamicVolume,1,242
  !tie
  !dynamicVolume,1,247
  !as4
  !dynamicVolume,1,243
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,228
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,236
  !cs5
  !dynamicVolume,1,234
  !tie
  !dynamicVolume,1,233
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,234
  db 6
  !a4
  !dynamicVolume,1,231
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,210
  !tie
  !dynamicVolume,1,206
  !as4
  !dynamicVolume,1,204
  !tie
  !dynamicVolume,1,201
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,197
  db 6
  !cs5
  !dynamicVolume,1,194
  !tie
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,186
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,177
  !cs5
  !dynamicVolume,1,170
  !tie
  !dynamicVolume,1,177
  !as4
  !dynamicVolume,1,174
  !tie
  !dynamicVolume,1,170
  !dynamicVolume,30,0
  db 12
  !tie
  !end

.pattern5_4
  db 60
  !tie
  !instr,!instr1C
  !volume,220
  db 6
  !as4
  !volume,217
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,206
  db 6
  !a4
  !dynamicVolume,1,204
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,186
  db 6
  !as4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,170
  db 6
  !as4
  !dynamicVolume,1,174
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,206
  db 6
  !as4
  !dynamicVolume,1,210
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,220
  db 6
  !as4
  !dynamicVolume,1,222
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,231
  db 6
  !as4
  !dynamicVolume,1,234
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,220
  db 6
  !as4
  !dynamicVolume,1,217
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,206
  db 6
  !a4
  !dynamicVolume,1,204
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,186
  db 6
  !as4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,155
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !end

.pattern5_5
  db 126
  !tie
  db 18
  !tie
  !instr,!instr1A
  !volume,255
  db 24
  !c5
  !volume,189
  !c5
  !volume,163
  !c5
  !volume,97
  !c5
  !c5
  !dynamicVolume,255,0
  db 126
  !tie
  !tie
  db 12
  !tie
  !dynamicVolume,1,255
  db 24
  !c5
  !dynamicVolume,1,189
  !c5
  !dynamicVolume,1,163
  !c5
  !dynamicVolume,1,97
  !c5
  db 30
  !c5
  !dynamicVolume,255,0
  db 114
  !tie
  !end

.pattern5_6
  !instr,!instr1B
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 126
  !rest
  !tie
  !tie
  db 66
  !tie
  !end

.pattern6_1
  !instr,!instr18
  !volume,163
  db 18
  !d5
  !volume,167
  !dynamicVolume,168,234
  db 126
  !tie
  !tie
  db 18
  !tie
  db 126
  !d5
  !tie
  db 36
  !tie
  !volume,236
  !dynamicVolume,186,125
  db 126
  !tie
  db 66
  !tie
  !end

.pattern6_2
  !instr,!instr19
  !volume,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 126
  !tie
  !tie
  !tie
  db 90
  !tie
  !end

.pattern6_3
  !instr,!instr1C
  !volume,255
  db 6
  !c5
  !tie
  !dynamicVolume,1,247
  !e4
  !dynamicVolume,1,245
  !tie
  !dynamicVolume,1,242
  !f4
  !dynamicVolume,1,239
  !tie
  !dynamicVolume,1,236
  !fs4
  !dynamicVolume,1,233
  !tie
  !dynamicVolume,1,242
  !as4
  !dynamicVolume,1,237
  !tie
  !dynamicVolume,1,247
  !c5
  !dynamicVolume,1,243
  !tie
  !dynamicVolume,1,233
  !e4
  !dynamicVolume,1,229
  !tie
  !dynamicVolume,1,208
  !f4
  !dynamicVolume,1,206
  !tie
  !dynamicVolume,1,215
  !fs4
  !dynamicVolume,1,212
  !tie
  !dynamicVolume,1,210
  !as4
  !dynamicVolume,1,206
  !tie
  !dynamicVolume,1,215
  !c5
  !dynamicVolume,1,210
  !tie
  !dynamicVolume,1,191
  !e4
  !dynamicVolume,1,189
  !tie
  !f4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,186
  !fs4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,174
  !as4
  !dynamicVolume,1,167
  !tie
  !dynamicVolume,1,186
  !c5
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,159
  !e4
  !dynamicVolume,1,163
  !tie
  !dynamicVolume,1,167
  !f4
  !tie
  !dynamicVolume,1,180
  !fs4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,180
  !as4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,208
  !c5
  !tie
  !dynamicVolume,1,194
  !e4
  !dynamicVolume,1,197
  !tie
  !dynamicVolume,1,199
  !f4
  !dynamicVolume,1,204
  !tie
  !fs4
  !dynamicVolume,1,206
  !tie
  !dynamicVolume,1,220
  !as4
  !dynamicVolume,1,222
  !tie
  !dynamicVolume,1,237
  !c5
  !dynamicVolume,1,240
  !tie
  !dynamicVolume,1,234
  !e4
  !dynamicVolume,1,236
  !tie
  !dynamicVolume,1,220
  !f4
  !dynamicVolume,1,222
  !tie
  !dynamicVolume,1,239
  !fs4
  !dynamicVolume,1,242
  !tie
  !dynamicVolume,1,243
  !as4
  !dynamicVolume,1,246
  !tie
  !dynamicVolume,1,255
  !c5
  !tie
  !e4
  !tie
  !dynamicVolume,1,243
  db 12
  !f4
  !dynamicVolume,1,253
  !fs4
  !dynamicVolume,1,255
  !as4
  !c5
  !dynamicVolume,1,251
  !e4
  !dynamicVolume,1,247
  !f4
  !dynamicVolume,1,253
  !fs4
  !dynamicVolume,1,255
  !as4
  !c5
  !e4
  !dynamicVolume,1,246
  !f4
  !dynamicVolume,1,253
  !fs4
  !dynamicVolume,1,255
  !as4
  !c5
  !dynamicVolume,1,243
  !e4
  !dynamicVolume,1,247
  !f4
  !dynamicVolume,1,255
  !fs4
  !as4
  !c5
  !dynamicVolume,1,247
  !e4
  !dynamicVolume,1,243
  !f4
  !dynamicVolume,1,255
  !fs4
  !as4
  !c5
  !dynamicVolume,1,247
  !e4
  !dynamicVolume,1,243
  !f4
  !dynamicVolume,1,255
  !fs4
  !dynamicVolume,1,253
  !as4
  !dynamicVolume,1,243
  !c5
  !dynamicVolume,1,222
  !e4
  !dynamicVolume,1,243
  !f4
  !dynamicVolume,1,255
  !fs4
  !end

.pattern6_4
  !dynamicVolume,30,0
  db 6
  !tie
  !dynamicVolume,30,0
  db 126
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 6
  !tie
  !end

.pattern7_2
  !instr,!instr1C
  !volume,170
  db 6
  !cs5
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,180
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !as4
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,201
  !a4
  !dynamicVolume,1,206
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,212
  db 6
  !a4
  !dynamicVolume,1,215
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,217
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,224
  db 6
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,237
  !cs5
  !dynamicVolume,1,240
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,245
  !cs5
  !dynamicVolume,1,247
  !tie
  db 12
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !dynamicVolume,1,255
  db 6
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,242
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 12
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,1,249
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,243
  !cs5
  !dynamicVolume,1,242
  !tie
  !dynamicVolume,1,247
  !as4
  !dynamicVolume,1,243
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,228
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,236
  !cs5
  !dynamicVolume,1,234
  !tie
  !dynamicVolume,1,233
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,234
  db 6
  !a4
  !dynamicVolume,1,231
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,210
  !tie
  !dynamicVolume,1,206
  !as4
  !dynamicVolume,1,204
  !tie
  !dynamicVolume,1,201
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,197
  db 6
  !cs5
  !dynamicVolume,1,194
  !tie
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,186
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,177
  !cs5
  !dynamicVolume,1,170
  !tie
  !dynamicVolume,1,177
  !as4
  !dynamicVolume,1,174
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,155
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,170
  !cs5
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,180
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !as4
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,201
  !a4
  !dynamicVolume,1,206
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,212
  db 6
  !a4
  !dynamicVolume,1,215
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,217
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,224
  db 6
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,237
  !cs5
  !dynamicVolume,1,240
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,245
  !cs5
  !dynamicVolume,1,247
  !tie
  !end

.pattern7_3
  !instr,!instr1C
  !volume,253
  db 12
  !as4
  !volume,255
  !c5
  !volume,240
  !e4
  !volume,243
  !f4
  !volume,255
  !fs4
  !as4
  !c5
  !volume,251
  !e4
  !volume,247
  !f4
  !volume,253
  !fs4
  !as4
  !volume,255
  !c5
  !volume,251
  !e4
  !f4
  !volume,255
  !fs4
  !volume,250
  !as4
  !volume,255
  db 6
  !c5
  !tie
  !dynamicVolume,1,247
  !e4
  !dynamicVolume,1,245
  !tie
  !dynamicVolume,1,242
  !f4
  !dynamicVolume,1,239
  !tie
  !dynamicVolume,1,236
  !fs4
  !dynamicVolume,1,233
  !tie
  !dynamicVolume,1,242
  !as4
  !dynamicVolume,1,237
  !tie
  !dynamicVolume,1,247
  !c5
  !dynamicVolume,1,243
  !tie
  !dynamicVolume,1,233
  !e4
  !dynamicVolume,1,229
  !tie
  !dynamicVolume,1,208
  !f4
  !dynamicVolume,1,206
  !tie
  !dynamicVolume,1,215
  !fs4
  !dynamicVolume,1,212
  !tie
  !dynamicVolume,1,210
  !as4
  !dynamicVolume,1,206
  !tie
  !dynamicVolume,1,215
  !c5
  !dynamicVolume,1,210
  !tie
  !dynamicVolume,1,191
  !e4
  !dynamicVolume,1,189
  !tie
  !f4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,186
  !fs4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,174
  !as4
  !dynamicVolume,1,167
  !tie
  !dynamicVolume,1,186
  !c5
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,30,0
  db 60
  !tie
  !dynamicVolume,1,220
  db 6
  !as4
  !dynamicVolume,1,217
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,206
  db 6
  !a4
  !dynamicVolume,1,204
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,186
  db 6
  !as4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,170
  db 6
  !as4
  !dynamicVolume,1,174
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,206
  db 6
  !as4
  !dynamicVolume,1,210
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,220
  db 6
  !as4
  !dynamicVolume,1,222
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,231
  db 6
  !as4
  !dynamicVolume,1,234
  !dynamicVolume,30,0
  db 30
  !tie
  !end

.pattern7_4
  db 12
  !tie
  !instr,!instr1C
  !volume,170
  db 6
  !as4
  !volume,174
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,206
  db 6
  !as4
  !dynamicVolume,1,210
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,220
  db 6
  !as4
  !dynamicVolume,1,222
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,231
  db 6
  !as4
  !dynamicVolume,1,234
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 126
  !tie
  !tie
  !tie
  db 12
  !tie
  !end

.pattern8_2
  !instr,!instr1C
  db 12
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !dynamicVolume,1,255
  db 6
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,242
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 12
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,1,249
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,243
  !cs5
  !dynamicVolume,1,242
  !tie
  !dynamicVolume,1,247
  !as4
  !dynamicVolume,1,243
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,228
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,236
  !cs5
  !dynamicVolume,1,234
  !tie
  !dynamicVolume,1,233
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,234
  db 6
  !a4
  !dynamicVolume,1,231
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,210
  !tie
  !dynamicVolume,1,206
  !as4
  !dynamicVolume,1,204
  !tie
  !dynamicVolume,1,201
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,197
  db 6
  !cs5
  !dynamicVolume,1,194
  !tie
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,186
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,177
  !cs5
  !dynamicVolume,1,170
  !tie
  !dynamicVolume,1,177
  !as4
  !dynamicVolume,1,174
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,155
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,170
  !cs5
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,180
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !as4
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,201
  !a4
  !dynamicVolume,1,206
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,212
  db 6
  !a4
  !dynamicVolume,1,215
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,217
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,224
  db 6
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,237
  !cs5
  !dynamicVolume,1,240
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,245
  !cs5
  !dynamicVolume,1,247
  !tie
  db 12
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !dynamicVolume,1,255
  db 6
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,242
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 12
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !end

.pattern8_3
  db 12
  !tie
  !instr,!instr1C
  !volume,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  !tie
  !instr,!instr1D
  !dynamicVolume,1,218
  !d5
  !dynamicVolume,174,255
  db 126
  !tie
  db 60
  !tie
  db 6
  !e5
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
  !dynamicVolume,30,240
  db 36
  !tie
  !dynamicVolume,1,236
  db 6
  !d5
  !volume,240
  !dynamicVolume,180,255
  db 126
  !tie
  db 60
  !tie
  !end

.pattern8_4
  db 126
  !tie
  db 126
  !tie
  !instr,!instr1C
  !volume,220
  db 6
  !as4
  !volume,217
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,206
  db 6
  !a4
  !dynamicVolume,1,204
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,186
  db 6
  !as4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,170
  db 6
  !as4
  !dynamicVolume,1,174
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,206
  db 6
  !as4
  !dynamicVolume,1,210
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,220
  db 6
  !as4
  !dynamicVolume,1,222
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,231
  db 6
  !as4
  !dynamicVolume,1,234
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  !tie
  !end

.pattern9_2
  db 60
  !tie
  !instr,!instr1C
  !volume,220
  db 6
  !as4
  !volume,217
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,206
  db 6
  !a4
  !dynamicVolume,1,204
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,186
  db 6
  !as4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !instr,!instr1A
  !dynamicVolume,1,255
  db 24
  !c5
  !dynamicVolume,1,189
  !c5
  !dynamicVolume,1,163
  !c5
  !dynamicVolume,1,97
  !c5
  !c5
  !dynamicVolume,255,0
  db 126
  !tie
  !tie
  db 12
  !tie
  !dynamicVolume,1,255
  db 24
  !c5
  !dynamicVolume,1,189
  !c5
  !dynamicVolume,1,163
  !c5
  !dynamicVolume,1,97
  !c5
  !c5
  !dynamicVolume,255,0
  db 120
  !tie
  !end

.pattern9_3
  !instr,!instr1D
  db 6
  !e5
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
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !dynamicVolume,42,237
  db 48
  !tie
  !dynamicVolume,1,229
  db 6
  !g5
  !volume,233
  !dynamicVolume,180,255
  db 126
  !tie
  db 60
  !tie
  db 12
  !fs5
  db 6
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
  !tie
  !tie
  !tie
  !dynamicVolume,66,217
  db 72
  !tie
  !dynamicVolume,36,0
  db 126
  !tie
  db 66
  !tie
  !end

.pattern9_4
  !instr,!instr1C
  !volume,251
  db 6
  !a4
  !volume,249
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,243
  !cs5
  !dynamicVolume,1,242
  !tie
  !dynamicVolume,1,247
  !as4
  !dynamicVolume,1,243
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,228
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,236
  !cs5
  !dynamicVolume,1,234
  !tie
  !dynamicVolume,1,233
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,234
  db 6
  !a4
  !dynamicVolume,1,231
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,210
  !tie
  !dynamicVolume,1,206
  !as4
  !dynamicVolume,1,204
  !tie
  !dynamicVolume,1,201
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,197
  db 6
  !cs5
  !dynamicVolume,1,194
  !tie
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,186
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,177
  !cs5
  !dynamicVolume,1,170
  !tie
  !dynamicVolume,1,177
  !as4
  !dynamicVolume,1,174
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,155
  !a4
  !dynamicVolume,30,0
  db 126
  !tie
  !tie
  !tie
  !tie
  db 78
  !tie
  !end

.pattern9_6
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 72
  !tie
  !instr,!instr1B
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  !end

.pattern10_4
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 72
  !tie
  !instr,!instr19
  !volume,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !end

.pattern10_6
  !instr,!instr1B
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 126
  !rest
  !tie
  !end

.pattern11_2
  !instr,!instr19
  !volume,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 36
  !tie
  !instr,!instr1A
  !dynamicVolume,1,255
  db 24
  !c5
  !dynamicVolume,1,189
  !c5
  !instr,!instr19
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 36
  !tie
  !instr,!instr1A
  !dynamicVolume,1,255
  db 24
  !c5
  !dynamicVolume,1,189
  !c5
  !instr,!instr19
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !end

.pattern11_3
  !instr,!instr1C
  !volume,170
  db 6
  !cs5
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,180
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !as4
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,201
  !a4
  !dynamicVolume,1,206
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,212
  db 6
  !a4
  !dynamicVolume,1,215
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,217
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,224
  db 6
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,237
  !cs5
  !dynamicVolume,1,240
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,245
  !cs5
  !dynamicVolume,1,247
  !tie
  db 12
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !dynamicVolume,1,255
  db 6
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,242
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 12
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,1,249
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,243
  !cs5
  !dynamicVolume,1,242
  !tie
  !dynamicVolume,1,247
  !as4
  !dynamicVolume,1,243
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,228
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,236
  !cs5
  !dynamicVolume,1,234
  !tie
  !dynamicVolume,1,233
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,234
  db 6
  !a4
  !dynamicVolume,1,231
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,210
  !tie
  !dynamicVolume,1,206
  !as4
  !dynamicVolume,1,204
  !tie
  !dynamicVolume,1,201
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,197
  db 6
  !cs5
  !dynamicVolume,1,194
  !tie
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,186
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,177
  !cs5
  !dynamicVolume,1,170
  !tie
  !dynamicVolume,1,177
  !as4
  !dynamicVolume,1,174
  !tie
  !dynamicVolume,1,155
  !a4
  !dynamicVolume,30,0
  !tie
  !instr,!instr1A
  !dynamicVolume,1,163
  db 24
  !c5
  !dynamicVolume,1,97
  !c5
  !c5
  !dynamicVolume,255,0
  db 120
  !tie
  !end

.pattern11_4
  db 12
  !tie
  !instr,!instr1C
  !volume,170
  db 6
  !as4
  !volume,174
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,206
  db 6
  !as4
  !dynamicVolume,1,210
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,220
  db 6
  !as4
  !dynamicVolume,1,222
  !dynamicVolume,30,0
  db 30
  !tie
  !dynamicVolume,1,231
  db 6
  !as4
  !dynamicVolume,1,234
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,253
  db 6
  !a4
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,243
  db 6
  !as4
  !dynamicVolume,30,0
  db 66
  !tie
  !dynamicVolume,1,220
  db 6
  !as4
  !dynamicVolume,1,217
  !dynamicVolume,30,0
  db 42
  !tie
  !dynamicVolume,1,206
  db 6
  !a4
  !dynamicVolume,1,204
  !dynamicVolume,30,0
  db 18
  !tie
  !dynamicVolume,1,186
  db 6
  !as4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  db 126
  !tie
  db 120
  !tie
  !end

.pattern12_1
  !instr,!instr1C
  !volume,253
  db 12
  !as4
  !volume,255
  !c5
  !volume,240
  !e4
  !volume,243
  !f4
  !volume,255
  !fs4
  !as4
  !c5
  !volume,251
  !e4
  !volume,247
  !f4
  !volume,253
  !fs4
  !as4
  !volume,255
  !c5
  !volume,251
  !e4
  !f4
  !volume,255
  !fs4
  !volume,250
  !as4
  !volume,255
  db 6
  !c5
  !tie
  !dynamicVolume,1,247
  !e4
  !dynamicVolume,1,245
  !tie
  !dynamicVolume,1,242
  !f4
  !dynamicVolume,1,239
  !tie
  !dynamicVolume,1,236
  !fs4
  !dynamicVolume,1,233
  !tie
  !dynamicVolume,1,242
  !as4
  !dynamicVolume,1,237
  !tie
  !dynamicVolume,1,247
  !c5
  !dynamicVolume,1,243
  !tie
  !dynamicVolume,1,233
  !e4
  !dynamicVolume,1,229
  !tie
  !dynamicVolume,1,208
  !f4
  !dynamicVolume,1,206
  !tie
  !dynamicVolume,1,215
  !fs4
  !dynamicVolume,1,212
  !tie
  !dynamicVolume,1,210
  !as4
  !dynamicVolume,1,206
  !tie
  !dynamicVolume,1,215
  !c5
  !dynamicVolume,1,210
  !tie
  !dynamicVolume,1,191
  !e4
  !dynamicVolume,1,189
  !tie
  !f4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,186
  !fs4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,174
  !as4
  !dynamicVolume,1,167
  !tie
  !dynamicVolume,1,186
  !c5
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,159
  !e4
  !dynamicVolume,1,163
  !tie
  !dynamicVolume,1,167
  !f4
  !tie
  !dynamicVolume,1,180
  !fs4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,180
  !as4
  !dynamicVolume,1,183
  !tie
  !dynamicVolume,1,208
  !c5
  !tie
  !dynamicVolume,1,194
  !e4
  !dynamicVolume,1,197
  !tie
  !dynamicVolume,1,199
  !f4
  !dynamicVolume,1,204
  !tie
  !fs4
  !dynamicVolume,1,206
  !tie
  !dynamicVolume,1,220
  !as4
  !dynamicVolume,1,222
  !tie
  !dynamicVolume,1,237
  !c5
  !dynamicVolume,1,240
  !tie
  !dynamicVolume,1,234
  !e4
  !dynamicVolume,1,236
  !tie
  !dynamicVolume,1,220
  !f4
  !dynamicVolume,1,222
  !tie
  !dynamicVolume,1,239
  !fs4
  !dynamicVolume,1,242
  !tie
  !dynamicVolume,1,243
  !as4
  !dynamicVolume,1,246
  !tie
  !dynamicVolume,1,255
  !c5
  !tie
  !e4
  !tie
  !dynamicVolume,1,243
  db 12
  !f4
  !dynamicVolume,1,253
  !fs4
  !dynamicVolume,1,255
  !as4
  !c5
  !dynamicVolume,1,251
  !e4
  !dynamicVolume,1,247
  !f4
  !dynamicVolume,1,253
  !fs4
  !dynamicVolume,1,255
  !as4
  !c5
  !e4
  !dynamicVolume,1,246
  !f4
  !dynamicVolume,1,253
  !fs4
  !dynamicVolume,1,255
  !as4
  !c5
  !dynamicVolume,1,243
  !e4
  !dynamicVolume,1,247
  !f4
  !end

.pattern12_2
  !instr,!instr19
  !volume,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !instr,!instr1E
  !dynamicVolume,1,240
  db 24
  !as5
  !dynamicVolume,255,0
  db 48
  !tie
  !dynamicVolume,1,218
  db 24
  !fs5
  !dynamicVolume,255,0
  db 96
  !tie
  !instr,!instr19
  !dynamicVolume,1,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 84
  !tie
  !end

.pattern12_3
  !instr,!instr1E
  !volume,240
  db 24
  !as5
  !dynamicVolume,255,0
  db 48
  !tie
  !dynamicVolume,1,218
  db 24
  !fs5
  !dynamicVolume,255,0
  db 48
  !tie
  !dynamicVolume,1,222
  db 24
  !as5
  !dynamicVolume,1,218
  !fs5
  !dynamicVolume,255,0
  db 126
  !tie
  db 66
  !tie
  !instr,!instr1C
  !dynamicVolume,1,170
  db 6
  !cs5
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,180
  db 6
  !a4
  !dynamicVolume,1,183
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !as4
  !dynamicVolume,1,189
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,201
  !a4
  !dynamicVolume,1,206
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,186
  !cs5
  !dynamicVolume,1,189
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,212
  db 6
  !a4
  !dynamicVolume,1,215
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,215
  !cs5
  !dynamicVolume,1,217
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,224
  db 6
  !a4
  !dynamicVolume,1,226
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,237
  !cs5
  !dynamicVolume,1,240
  !tie
  !dynamicVolume,30,0
  db 12
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,245
  !cs5
  !dynamicVolume,1,247
  !tie
  db 12
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,251
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !dynamicVolume,1,255
  db 6
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,242
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 12
  !cs5
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,255
  db 6
  !a4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  db 12
  !cs5
  !as4
  !dynamicVolume,30,0
  !tie
  !dynamicVolume,1,247
  !cs5
  !dynamicVolume,30,0
  !tie
  !end

.pattern12_4
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 6
  !tie
  !instr,!instr19
  !volume,255
  db 12
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,255
  !e4
  !b3
  !dynamicVolume,255,0
  !tie
  !dynamicVolume,1,220
  !e3
  !dynamicVolume,255,0
  db 36
  !tie
  !instr,!instr1E
  !dynamicVolume,1,222
  db 24
  !as5
  !dynamicVolume,1,218
  !fs5
  !dynamicVolume,255,0
  db 126
  !tie
  db 66
  !tie
  !end

.pattern12_6
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 126
  !tie
  db 72
  !tie
  !instr,!instr1B
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  !end

.pattern13_6
  !instr,!instr1B
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 60
  !rest
  db 12
  !g4
  !g4
  !g4
  !g4
  !g4
  !rest
  !g4
  !g4
  !rest
  !g4
  !g4
  db 126
  !rest
  !tie
  !tie
  db 60
  !tie
  db 6
  !tie
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 1
endspcblock execute !p_spcEngine
