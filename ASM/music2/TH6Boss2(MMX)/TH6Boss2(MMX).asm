; Originally by ZUN, arranged by JX444444 (https://www.smwcentral.net/?p=section&a=details&id=28046)
asar 1.91
norom : org 0
incsrc "../defines.asm"

!instr1E = $16
!instr1F = $17
!instr20 = $18
!instr21 = $19
!instr22 = $1A
!instr23 = $1B
!instr24 = $1C
!instr25 = $1D
!instr26 = $1E

!sample14 = $16
!sample15 = $17
!sample16 = $18
!sample17 = $19
!sample18 = $1A
!sample19 = $1B
!sample1A = $1C
!sample1B = $1D
!sample1C = $1E

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample1A,$FF,$E0,$BA,$04,$00
  db !sample1C,$FF,$E0,$B1,$04,$80
  db !sample15,$FF,$E0,$B8,$0F,$58
  db !sample16,$FF,$E0,$B8,$0D,$C5
  db !sample19,$FF,$ED,$B8,$06,$02
  db !sample1B,$FF,$E0,$B5,$04,$7C
  db !sample14,$FF,$F1,$B8,$09,$64
  db !sample17,$FF,$E0,$B6,$07,$F5
  db !sample18,$FF,$E0,$B8,$07,$7F
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+1179
  dw Sample15,Sample15+0
  dw Sample16,Sample16+0
  dw Sample17,Sample17+2520
  dw Sample18,Sample18+0
  dw Sample19,Sample19+513
  dw Sample1A,Sample1A+1035
  dw Sample1B,Sample1B+702
  dw Sample1C,Sample1C+27
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "04 14.brr":2..0
  Sample15: incbin "05 15.brr":2..0
  Sample16: incbin "06 16.brr":2..0
  Sample17: incbin "07 18.brr":2..0
  Sample18: incbin "09 22.brr":2..0
  Sample19: incbin "10 19.brr":2..0
  Sample1A: incbin "11 23.brr":2..0
  Sample1B: incbin "15 bass.brr":2..0
  Sample1C: incbin "17 synth strings.brr":2..0

NoteLengthTable: ; note length table
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

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, 0
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, 0

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !musicVolume,159;119
  !tempo,57
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%01111111,-75,75
  !echoParameters,3,68,3
  !toggleKeyOffGain
  !instr,!instr1E
  !volume,160
  !loop : dw .sub2ECF : db 2
  !instr,!instr22
  !volume,208
  !loop : dw .sub2EE2 : db 2
  db 72,$7F
  !b4
  db 120
  !cs5
  db 72
  !ds5
  db 120
  !ds5
  !loop : dw .sub2EF9 : db 2
  !loop : dw .sub2F1B : db 1
  db 72,$7F
  !gs5
  db 24
  !as5
  db 48
  !fs5
  db 24
  !gs5
  !as5
  !loop : dw .sub2F1B : db 1
  !instr,!instr1E
  !volume,160
  !transpose,3
  !loop : dw .sub2ECF : db 3
  !transpose,0
  db 12,$7F
  !ds6
  !ds7
  !gs6
  !as6
  !cs7
  !gs6
  !ds6
  !as6
  !gs6
  !cs7
  !ds7
  !ds6
  !g6
  !gs6
  !as6
  !b6
  !end

.pattern0_1
  !toggleKeyOffGain
  db 96,$7F
  !rest
  !tie
  !tie
  db 48
  !tie
  !instr,!instr1F
  !volume,204
  !g4
  !instr,!instr1F
  !volume,204
  !loop : dw .sub2F58 : db 4
  db 24,$7F
  !ds5
  !cs5
  !ds5
  !fs5
  !rest
  db 12
  !f5
  !cs5
  db 48
  !gs4
  !ds5
  !rest
  db 24
  !ds5
  !f5
  !fs5
  !gs5
  !loop : dw .sub2F7D : db 1
  db 72,$7F
  !f6
  db 24
  !ds6
  !ds6
  !ds5
  !f5
  !fs5
  !loop : dw .sub2F7D : db 1
  db 72,$7F
  !f6
  db 24
  !ds6
  !ds6
  !ds5
  !f5
  !fs5
  !loop : dw .sub2F7D : db 1
  db 72,$7F
  !f6
  db 24
  !ds6
  !ds6
  !ds5
  !f5
  !fs5
  !loop : dw .sub2F7D : db 1
  db 48,$7F
  !f6
  db 24
  !rest
  db 18
  !ds6
  db 6
  !rest
  db 96
  !ds6
  !tie
  db 48
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  db 48
  !g4
  !end

.pattern0_2
  !toggleKeyOffGain
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !loop : dw .sub2FC5 : db 2
  !vibrato,24,12,64
  !instr,!instr25
  !volume,198
  !pan,9
  db 12,$7F
  !b4
  db 60
  !rest
  db 12
  !cs5
  db 36
  !rest
  db 12
  !cs5
  !rest
  !cs5
  !cs5
  !rest
  !cs5
  !ds5
  db 60
  !rest
  db 12
  !ds5
  db 36
  !rest
  db 12
  !ds5
  !rest
  !ds5
  !ds5
  !rest
  !ds5
  !loop : dw .sub3011 : db 1
  db 12,$7F
  !ds5
  db 60
  !rest
  db 12
  !ds5
  db 36
  !rest
  db 12
  !ds5
  !rest
  !ds5
  !ds5
  !rest
  !ds5
  !loop : dw .sub3011 : db 1
  db 12,$7F
  !ds5
  db 60
  !rest
  db 12
  !ds5
  db 36
  !rest
  db 12
  !ds5
  !rest
  !ds5
  !ds5
  !rest
  !ds5
  !loop : dw .sub3011 : db 1
  db 12,$7F
  !ds5
  db 60
  !rest
  db 12
  !ds5
  db 36
  !rest
  db 12
  !ds5
  !rest
  !ds5
  !ds5
  !rest
  !ds5
  !loop : dw .sub3011 : db 1
  !endVibrato
  !instr,!instr22
  !volume,208
  db 96,$7F
  !ds4
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

.pattern0_3
  !toggleKeyOffGain
  !pan,9
  !vibrato,32,12,64
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !instr,!instr25
  !volume,198
  !loop : dw .sub3076 : db 4
  db 12,$7F
  !ds5
  db 60
  !rest
  db 12
  !f5
  db 36
  !rest
  db 12
  !f5
  !rest
  !f5
  !f5
  !rest
  !f5
  !fs5
  db 60
  !rest
  db 12
  !fs5
  db 36
  !rest
  db 12
  !fs5
  !rest
  !fs5
  !fs5
  !rest
  !fs5
  !loop : dw .sub3087 : db 1
  db 12,$7F
  !fs5
  db 60
  !rest
  db 12
  !fs5
  db 36
  !rest
  db 12
  !fs5
  !rest
  !fs5
  !fs5
  !rest
  !fs5
  !loop : dw .sub3087 : db 1
  db 12,$7F
  !fs5
  db 60
  !rest
  db 12
  !fs5
  db 36
  !rest
  db 12
  !fs5
  !rest
  !fs5
  !fs5
  !rest
  !fs5
  !loop : dw .sub3087 : db 1
  db 12,$7F
  !fs5
  db 60
  !rest
  db 12
  !fs5
  db 36
  !rest
  db 12
  !fs5
  !rest
  !fs5
  !fs5
  !rest
  !fs5
  !loop : dw .sub3087 : db 1
  db 96,$7F
  !fs5
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

.pattern0_4
  !toggleKeyOffGain
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !instr,!instr23
  !volume,192
  !loop : dw .sub30EC : db 2
  db 24,$7F
  !b3
  !ds4
  !fs4
  !cs5
  !rest
  !f4
  !gs4
  !cs4
  !ds4
  !as4
  !as3
  !ds4
  !rest
  !fs4
  !as4
  !ds4
  !loop : dw .sub313D : db 1
  !loop : dw .sub3161 : db 1
  !loop : dw .sub313D : db 1
  db 24,$7F
  !ds4
  !fs4
  !ds5
  db 36
  !ds4
  db 12
  !rest
  db 24
  !as4
  !ds4
  !cs4
  !loop : dw .sub313D : db 1
  !loop : dw .sub3161 : db 1
  !loop : dw .sub313D : db 1
  db 24,$7F
  !ds4
  !fs4
  !ds5
  db 36
  !ds4
  db 12
  !rest
  db 24
  !as4
  !ds4
  !cs4
  !loop : dw .sub313D : db 1
  !loop : dw .sub3161 : db 1
  !loop : dw .sub313D : db 1
  db 24,$7F
  !ds4
  !fs4
  !ds5
  db 36
  !ds4
  db 12
  !rest
  db 24
  !as4
  !ds4
  !cs4
  !loop : dw .sub313D : db 1
  !loop : dw .sub3161 : db 1
  !loop : dw .sub313D : db 1
  !loop : dw .sub316F : db 3
  db 12,$7F
  !ds3
  !ds4
  !gs3
  !as3
  !cs4
  !gs3
  !ds3
  !as3
  !gs3
  !cs4
  !ds4
  !ds3
  !g3
  !gs3
  !as3
  !b3
  !end

.pattern0_5
  db 96,$7F
  !rest
  !tie
  !tie
  db 48
  !tie
  !instr,!instr20
  !volume,224
  db 24
  !e4
  !instr,!instr21
  !volume,192
  db 12
  !e4
  !e4
  !instr,!instr21
  !volume,192
  !loop : dw .sub3182 : db 1
  !instr,!instr21
  !volume,192
  db 12,$7F
  !e4
  !e4
  db 24
  !e4
  !loop : dw .sub3182 : db 1
  !instr,!instr21
  !volume,192
  db 24,$7F
  !e4
  db 12
  !e4
  !e4
  !loop : dw .sub3182 : db 1
  !instr,!instr21
  !volume,192
  db 12,$7F
  !e4
  !e4
  db 24
  !e4
  !loop : dw .sub3182 : db 1
  !instr,!instr21
  !volume,192
  db 24,$7F
  !e4
  db 12
  !e4
  !e4
  !instr,!instr20
  !volume,224
  db 48,$7F
  !e4
  db 72
  !e4
  db 24
  !e4
  !instr,!instr21
  !volume,192
  db 36
  !e4
  !instr,!instr20
  !volume,224
  db 12
  !e4
  !e4
  db 24
  !e4
  db 12
  !e4
  !instr,!instr21
  !volume,192
  db 24
  !e4
  !instr,!instr20
  !volume,224
  db 36
  !e4
  db 12
  !e4
  !instr,!instr21
  !volume,192
  db 24
  !e4
  !e4
  db 12
  !e4
  !e4
  !loop : dw .sub31CA : db 15
  !instr,!instr20
  !volume,224
  db 12,$7F
  !e4
  db 24
  !e4
  db 12
  !e4
  !instr,!instr21
  !volume,192
  db 24
  !e4
  !e4
  !instr,!instr26
  !volume,212
  db 12
  !cs5
  !a4
  !f4
  !cs4
  !a3
  !instr,!instr21
  !volume,192
  !e4
  db 96
  !e4
  !tie
  !tie
  !tie
  db 24
  !tie
  db 96
  !e4
  !tie
  !instr,!instr20
  !volume,224
  db 24
  !e4
  !e4
  !instr,!instr21
  !volume,192
  db 48
  !e4
  !instr,!instr20
  !volume,224
  db 12
  !e4
  !e4
  db 24
  !e4
  !instr,!instr21
  !volume,192
  !e4
  db 12
  !e4
  !e4
  !end

.pattern0_6
  !instr,!instr24
  !volume,192
  !pan,10
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !loop : dw .sub3200 : db 4
  db 72,$7F
  !rest
  !loop : dw .sub320B : db 16
  db 96,$7F
  !f4
  !tie
  !tie
  db 24
  !tie
  db 96
  !b4
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

.pattern1_0
  !instr,!instr22
  !volume,208
  !loop : dw .sub2EE2 : db 2
  db 72,$7F
  !b4
  db 120
  !cs5
  db 72
  !ds5
  db 120
  !ds5
  !loop : dw .sub2EF9 : db 2
  !loop : dw .sub2F1B : db 1
  db 72,$7F
  !gs5
  db 24
  !as5
  db 48
  !fs5
  db 24
  !gs5
  !as5
  !loop : dw .sub2F1B : db 1
  !instr,!instr1E
  !volume,160
  !transpose,3
  !loop : dw .sub2ECF : db 3
  !transpose,0
  db 12,$7F
  !ds6
  !ds7
  !gs6
  !as6
  !cs7
  !gs6
  !ds6
  !as6
  !gs6
  !cs7
  !ds7
  !ds6
  !g6
  !gs6
  !as6
  !b6
  !end

.pattern1_1
  !instr,!instr1F
  !volume,204
  !loop : dw .sub2F58 : db 4
  db 24,$7F
  !ds5
  !cs5
  !ds5
  !fs5
  !rest
  db 12
  !f5
  !cs5
  db 48
  !gs4
  !ds5
  !rest
  db 24
  !ds5
  !f5
  !fs5
  !gs5
  !loop : dw .sub2F7D : db 1
  db 72,$7F
  !f6
  db 24
  !ds6
  !ds6
  !ds5
  !f5
  !fs5
  !loop : dw .sub2F7D : db 1
  db 72,$7F
  !f6
  db 24
  !ds6
  !ds6
  !ds5
  !f5
  !fs5
  !loop : dw .sub2F7D : db 1
  db 72,$7F
  !f6
  db 24
  !ds6
  !ds6
  !ds5
  !f5
  !fs5
  !loop : dw .sub2F7D : db 1
  db 48,$7F
  !f6
  db 24
  !rest
  db 18
  !ds6
  db 6
  !rest
  db 96
  !ds6
  !tie
  db 48
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  db 48
  !g4
  !end

.pattern1_2
  !loop : dw .sub2FC5 : db 2
  !vibrato,24,12,64
  !instr,!instr25
  !volume,198
  !pan,9
  db 12,$7F
  !b4
  db 60
  !rest
  db 12
  !cs5
  db 36
  !rest
  db 12
  !cs5
  !rest
  !cs5
  !cs5
  !rest
  !cs5
  !ds5
  db 60
  !rest
  db 12
  !ds5
  db 36
  !rest
  db 12
  !ds5
  !rest
  !ds5
  !ds5
  !rest
  !ds5
  !loop : dw .sub3011 : db 1
  db 12,$7F
  !ds5
  db 60
  !rest
  db 12
  !ds5
  db 36
  !rest
  db 12
  !ds5
  !rest
  !ds5
  !ds5
  !rest
  !ds5
  !loop : dw .sub3011 : db 1
  db 12,$7F
  !ds5
  db 60
  !rest
  db 12
  !ds5
  db 36
  !rest
  db 12
  !ds5
  !rest
  !ds5
  !ds5
  !rest
  !ds5
  !loop : dw .sub3011 : db 1
  db 12,$7F
  !ds5
  db 60
  !rest
  db 12
  !ds5
  db 36
  !rest
  db 12
  !ds5
  !rest
  !ds5
  !ds5
  !rest
  !ds5
  !loop : dw .sub3011 : db 1
  !endVibrato
  !instr,!instr22
  !volume,208
  db 96,$7F
  !ds4
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

.pattern1_3
  !instr,!instr25
  !volume,198
  !loop : dw .sub3076 : db 4
  db 12,$7F
  !ds5
  db 60
  !rest
  db 12
  !f5
  db 36
  !rest
  db 12
  !f5
  !rest
  !f5
  !f5
  !rest
  !f5
  !fs5
  db 60
  !rest
  db 12
  !fs5
  db 36
  !rest
  db 12
  !fs5
  !rest
  !fs5
  !fs5
  !rest
  !fs5
  !loop : dw .sub3087 : db 1
  db 12,$7F
  !fs5
  db 60
  !rest
  db 12
  !fs5
  db 36
  !rest
  db 12
  !fs5
  !rest
  !fs5
  !fs5
  !rest
  !fs5
  !loop : dw .sub3087 : db 1
  db 12,$7F
  !fs5
  db 60
  !rest
  db 12
  !fs5
  db 36
  !rest
  db 12
  !fs5
  !rest
  !fs5
  !fs5
  !rest
  !fs5
  !loop : dw .sub3087 : db 1
  db 12,$7F
  !fs5
  db 60
  !rest
  db 12
  !fs5
  db 36
  !rest
  db 12
  !fs5
  !rest
  !fs5
  !fs5
  !rest
  !fs5
  !loop : dw .sub3087 : db 1
  db 96,$7F
  !fs5
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

.pattern1_4
  !instr,!instr23
  !volume,192
  !loop : dw .sub30EC : db 2
  db 24,$7F
  !b3
  !ds4
  !fs4
  !cs5
  !rest
  !f4
  !gs4
  !cs4
  !ds4
  !as4
  !as3
  !ds4
  !rest
  !fs4
  !as4
  !ds4
  !loop : dw .sub313D : db 1
  !loop : dw .sub3161 : db 1
  !loop : dw .sub313D : db 1
  db 24,$7F
  !ds4
  !fs4
  !ds5
  db 36
  !ds4
  db 12
  !rest
  db 24
  !as4
  !ds4
  !cs4
  !loop : dw .sub313D : db 1
  !loop : dw .sub3161 : db 1
  !loop : dw .sub313D : db 1
  db 24,$7F
  !ds4
  !fs4
  !ds5
  db 36
  !ds4
  db 12
  !rest
  db 24
  !as4
  !ds4
  !cs4
  !loop : dw .sub313D : db 1
  !loop : dw .sub3161 : db 1
  !loop : dw .sub313D : db 1
  db 24,$7F
  !ds4
  !fs4
  !ds5
  db 36
  !ds4
  db 12
  !rest
  db 24
  !as4
  !ds4
  !cs4
  !loop : dw .sub313D : db 1
  !loop : dw .sub3161 : db 1
  !loop : dw .sub313D : db 1
  !loop : dw .sub316F : db 3
  db 12,$7F
  !ds3
  !ds4
  !gs3
  !as3
  !cs4
  !gs3
  !ds3
  !as3
  !gs3
  !cs4
  !ds4
  !ds3
  !g3
  !gs3
  !as3
  !b3
  !end

.pattern1_5
  !instr,!instr21
  !volume,192
  !loop : dw .sub3182 : db 1
  !instr,!instr21
  !volume,192
  db 12,$7F
  !e4
  !e4
  db 24
  !e4
  !loop : dw .sub3182 : db 1
  !instr,!instr21
  !volume,192
  db 24,$7F
  !e4
  db 12
  !e4
  !e4
  !loop : dw .sub3182 : db 1
  !instr,!instr21
  !volume,192
  db 12,$7F
  !e4
  !e4
  db 24
  !e4
  !loop : dw .sub3182 : db 1
  !instr,!instr21
  !volume,192
  db 24,$7F
  !e4
  db 12
  !e4
  !e4
  !instr,!instr20
  !volume,224
  db 48,$7F
  !e4
  db 72
  !e4
  db 24
  !e4
  !instr,!instr21
  !volume,192
  db 36
  !e4
  !instr,!instr20
  !volume,224
  db 12
  !e4
  !e4
  db 24
  !e4
  db 12
  !e4
  !instr,!instr21
  !volume,192
  db 24
  !e4
  !instr,!instr20
  !volume,224
  db 36
  !e4
  db 12
  !e4
  !instr,!instr21
  !volume,192
  db 24
  !e4
  !e4
  db 12
  !e4
  !e4
  !loop : dw .sub31CA : db 15
  !instr,!instr20
  !volume,224
  db 12,$7F
  !e4
  db 24
  !e4
  db 12
  !e4
  !instr,!instr21
  !volume,192
  db 24
  !e4
  !e4
  !instr,!instr26
  !volume,212
  db 12
  !cs5
  !a4
  !f4
  !cs4
  !a3
  !instr,!instr21
  !volume,192
  !e4
  db 96
  !e4
  !tie
  !tie
  !tie
  db 24
  !tie
  db 96
  !e4
  !tie
  !instr,!instr20
  !volume,224
  db 24
  !e4
  !e4
  !instr,!instr21
  !volume,192
  db 48
  !e4
  !instr,!instr20
  !volume,224
  db 12
  !e4
  !e4
  db 24
  !e4
  !instr,!instr21
  !volume,192
  !e4
  db 12
  !e4
  !e4
  !end

.pattern1_6
  !loop : dw .sub3200 : db 4
  db 72,$7F
  !rest
  !loop : dw .sub320B : db 16
  db 96,$7F
  !f4
  !tie
  !tie
  db 24
  !tie
  db 96
  !b4
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

.sub2ECF
  db 12,$7F
  !c6
  !c7
  !f6
  !g6
  !as6
  !f6
  !c6
  !g6
  !f6
  !as6
  !c7
  !c6
  !f6
  !as6
  !f6
  !g6
  !end

.sub2EE2
  db 96,$7F
  !g5
  !tie
  !tie
  !tie
  db 96
  !g5
  !tie
  !tie
  !tie
  db 96
  !ds5
  !tie
  !tie
  !tie
  db 96
  !ds5
  !tie
  db 96
  !f5
  !tie
  !end

.sub2EF9
  db 72,$7F
  !ds5
  db 120
  !cs5
  db 72
  !c5
  db 120
  !c5
  db 72
  !b4
  db 120
  !cs5
  db 72
  !as4
  db 120
  !as4
  db 72
  !ds5
  db 120
  !cs5
  db 72
  !c5
  db 120
  !c5
  db 72
  !b4
  db 120
  !cs5
  db 72
  !ds5
  db 120
  !ds5
  !end

.sub2F1B
  db 72,$7F
  !fs5
  db 24
  !fs5
  !as4
  !fs5
  db 12
  !gs4
  !as4
  db 24
  !gs4
  db 96
  !fs4
  db 48
  !tie
  db 24
  !as4
  !fs5
  db 72
  !as5
  db 24
  !as5
  !f5
  !fs5
  db 12
  !f5
  !fs5
  db 24
  !cs5
  db 96
  !d5
  db 48
  !tie
  !gs5
  db 72
  !fs5
  db 24
  !fs5
  !gs5
  !as5
  !cs6
  !gs5
  !ds6
  !c6
  !gs5
  !ds6
  !c6
  !gs5
  db 48
  !cs6
  db 24
  !as5
  !fs5
  !ds5
  !as5
  !gs5
  !f5
  !cs5
  !gs5
  !end

.sub2F58
  db 36,$7F
  !c5
  !as4
  db 24
  !c5
  db 48
  !ds5
  !rest
  db 24
  !c5
  !as4
  !c5
  db 48
  !ds5
  db 24
  !f5
  !c5
  !as4
  !c5
  !as4
  !c5
  db 48
  !ds5
  db 72
  !rest
  db 24
  !c5
  !as4
  !c5
  db 48
  !g5
  db 24
  !g5
  db 48
  !f5
  !end

.sub2F7D
  db 24,$7F
  !as5
  db 48
  !rest
  db 24
  !as5
  !fs5
  !as5
  db 8
  !fs5
  !f5
  !fs5
  db 12
  !f5
  !rest
  db 48
  !ds5
  db 72
  !rest
  db 24
  !ds5
  !fs5
  !as5
  !ds6
  db 48
  !rest
  db 24
  !ds6
  !cs6
  !ds6
  db 8
  !cs6
  !ds6
  !cs6
  db 12
  !gs5
  !rest
  db 48
  !as5
  db 96
  !rest
  db 48
  !f6
  db 24
  !fs6
  db 48
  !rest
  db 24
  !fs6
  !f6
  !fs6
  !as6
  !f6
  !gs6
  !ds6
  !c6
  !gs6
  !ds6
  !c6
  db 48
  !f6
  db 24
  !fs6
  !ds6
  !as5
  !fs6
  !f6
  !cs6
  !gs5
  !f6
  !end

.sub2FC5
  !instr,!instr22
  !volume,208
  !pan,10
  !endVibrato
  db 120,$7F
  !c5
  !vibrato,24,12,64
  !instr,!instr25
  !volume,198
  !pan,9
  db 12
  !g5
  !g5
  !g5
  db 96
  !rest
  !tie
  db 36
  !tie
  !instr,!instr22
  !volume,208
  !pan,10
  !endVibrato
  db 96
  !c5
  !tie
  !tie
  !tie
  db 120
  !gs4
  !vibrato,24,12,64
  !instr,!instr25
  !volume,198
  !pan,9
  db 12
  !g5
  !g5
  !g5
  db 96
  !rest
  !tie
  db 36
  !tie
  !instr,!instr22
  !volume,208
  !pan,10
  !endVibrato
  db 96
  !gs4
  !tie
  db 96
  !as4
  !tie
  !end

.sub3011
  db 12,$7F
  !ds5
  db 60
  !rest
  db 12
  !cs5
  db 36
  !rest
  db 12
  !cs5
  !rest
  !cs5
  !cs5
  !rest
  !cs5
  !c5
  db 60
  !rest
  db 12
  !c5
  db 36
  !rest
  db 12
  !c5
  !rest
  !c5
  !c5
  !rest
  !c5
  !b4
  db 60
  !rest
  db 12
  !cs5
  db 36
  !rest
  db 12
  !cs5
  !rest
  !cs5
  !cs5
  !rest
  !cs5
  !as4
  db 60
  !rest
  db 12
  !as4
  db 36
  !rest
  db 12
  !as4
  !rest
  !as4
  !as4
  !rest
  !as4
  !ds5
  db 60
  !rest
  db 12
  !cs5
  db 36
  !rest
  db 12
  !cs5
  !rest
  !cs5
  !cs5
  !rest
  !cs5
  !c5
  db 60
  !rest
  db 12
  !c5
  db 36
  !rest
  db 12
  !c5
  !rest
  !c5
  !c5
  !rest
  !c5
  !b4
  db 60
  !rest
  db 12
  !cs5
  db 36
  !rest
  db 12
  !cs5
  !rest
  !cs5
  !cs5
  !rest
  !cs5
  !end

.sub3076
  db 120,$7F
  !rest
  db 12
  !as5
  !as5
  !as5
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  db 36
  !tie
  !end

.sub3087
  db 12,$7F
  !fs5
  db 60
  !rest
  db 12
  !f5
  db 36
  !rest
  db 12
  !f5
  !rest
  !f5
  !f5
  !rest
  !f5
  !ds5
  db 60
  !rest
  db 12
  !ds5
  db 36
  !rest
  db 12
  !ds5
  !rest
  !ds5
  !ds5
  !rest
  !ds5
  !ds5
  db 60
  !rest
  db 12
  !f5
  db 36
  !rest
  db 12
  !f5
  !rest
  !f5
  !f5
  !rest
  !f5
  !d5
  db 60
  !rest
  db 12
  !d5
  db 36
  !rest
  db 12
  !d5
  !rest
  !d5
  !d5
  !rest
  !d5
  !fs5
  db 60
  !rest
  db 12
  !f5
  db 36
  !rest
  db 12
  !f5
  !rest
  !f5
  !f5
  !rest
  !f5
  !ds5
  db 60
  !rest
  db 12
  !ds5
  db 36
  !rest
  db 12
  !ds5
  !rest
  !ds5
  !ds5
  !rest
  !ds5
  !ds5
  db 60
  !rest
  db 12
  !f5
  db 36
  !rest
  db 12
  !f5
  !rest
  !f5
  !f5
  !rest
  !f5
  !end

.sub30EC
  db 24,$7F
  !c4
  db 48
  !rest
  db 24
  !c4
  !rest
  db 12
  !c4
  !rest
  db 24
  !c4
  !rest
  !c4
  db 48
  !rest
  db 24
  !c4
  !rest
  db 12
  !c4
  !rest
  db 24
  !as3
  !rest
  db 24,$7F
  !c4
  db 48
  !rest
  db 24
  !c4
  !rest
  db 12
  !c4
  !rest
  db 24
  !c4
  !rest
  !c4
  db 48
  !rest
  db 24
  !c4
  !rest
  db 12
  !c4
  !rest
  db 24
  !as3
  !rest
  db 24,$7F
  !gs3
  db 48
  !rest
  db 24
  !gs3
  !rest
  db 12
  !gs3
  !rest
  db 24
  !gs3
  !rest
  !gs3
  db 48
  !rest
  db 24
  !gs3
  !rest
  db 12
  !gs3
  !rest
  db 24
  !g3
  !rest
  !gs3
  db 48
  !rest
  db 24
  !gs3
  !rest
  db 12
  !gs3
  !rest
  db 24
  !gs3
  !rest
  !as3
  db 48
  !rest
  db 24
  !as3
  !rest
  db 12
  !as3
  !rest
  db 24
  !b3
  !rest
  !end

.sub313D
  db 24,$7F
  !ds4
  !fs4
  !as4
  db 36
  !cs4
  db 12
  !rest
  db 24
  !cs4
  !f4
  !cs4
  !c4
  !ds4
  !g4
  db 36
  !c5
  db 12
  !rest
  db 24
  !ds4
  !g4
  !c4
  !b3
  !ds4
  !fs4
  db 36
  !cs4
  db 12
  !rest
  db 24
  !cs4
  !f4
  !gs4
  !end

.sub3161
  db 24,$7F
  !as3
  !d4
  !f4
  db 36
  !as3
  db 12
  !rest
  db 24
  !d4
  !f4
  !as3
  !end

.sub316F
  db 12,$7F
  !ds3
  !ds4
  !gs3
  !as3
  !cs4
  !gs3
  !ds3
  !as3
  !gs3
  !cs4
  !ds4
  !ds3
  !gs3
  !cs4
  !gs3
  !as3
  !end

.sub3182
  db 36,$7F
  !rest
  !instr,!instr20
  !volume,224
  !e4
  !instr,!instr21
  !volume,192
  db 48
  !e4
  !instr,!instr20
  !volume,224
  db 24
  !e4
  !instr,!instr21
  !volume,192
  !e4
  !instr,!instr20
  !volume,224
  !e4
  db 36
  !e4
  !e4
  db 48
  !e4
  db 24
  !e4
  !instr,!instr21
  !volume,192
  !e4
  !instr,!instr20
  !volume,224
  !e4
  db 36
  !e4
  !e4
  db 48
  !e4
  db 24
  !e4
  !instr,!instr21
  !volume,192
  !e4
  !instr,!instr20
  !volume,224
  !e4
  db 36
  !e4
  !e4
  db 48
  !e4
  db 24
  !e4
  !end

.sub31CA
  !instr,!instr20
  !volume,224
  db 48,$7F
  !e4
  db 72
  !e4
  db 24
  !e4
  !instr,!instr21
  !volume,192
  db 36
  !e4
  !instr,!instr20
  !volume,224
  db 12
  !e4
  !e4
  db 24
  !e4
  db 12
  !e4
  !instr,!instr21
  !volume,192
  db 24
  !e4
  !instr,!instr20
  !volume,224
  db 36
  !e4
  db 12
  !e4
  !instr,!instr21
  !volume,192
  db 24
  !e4
  db 12
  !e4
  !e4
  db 24
  !e4
  !end

.sub3200
  db 96,$7F
  !f4
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

.sub320B
  db 96,$7F
  !f4
  !tie
  !tie
  !tie
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
