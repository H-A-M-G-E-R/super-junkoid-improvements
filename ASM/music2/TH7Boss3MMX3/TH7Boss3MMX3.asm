; Originally by ZUN, arranged by JX444444 (https://www.smwcentral.net/?p=section&a=details&id=26227)
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
  db !sample19,$FF,$E0,$B8,$09,$C3
  db !sample1A,$FF,$E0,$B6,$07,$6A
  db !sample18,$FF,$E0,$B8,$07,$58
  db !sample16,$FF,$E0,$B8,$07,$BE
  db !sample15,$FF,$F5,$B8,$07,$FD
  db !sample17,$FF,$E0,$B8,$07,$BE
  db !sample1B,$FF,$F4,$B8,$08,$04
  db !sample1C,$FF,$E0,$B8,$07,$3E
  db !sample14,$FF,$F6,$B8,$07,$FD
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+630
  dw Sample15,Sample15+1179
  dw Sample16,Sample16+0
  dw Sample17,Sample17+0
  dw Sample18,Sample18+1818
  dw Sample19,Sample19+2277
  dw Sample1A,Sample1A+1746
  dw Sample1B,Sample1B+1800
  dw Sample1C,Sample1C+0
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "40_Hihat.brr":2..0
  Sample15: incbin "41_Cymbal.brr":2..0
  Sample16: incbin "42_Kick.brr":2..0
  Sample17: incbin "43_Snarelulz.brr":2..0
  Sample18: incbin "44_Bass.brr":2..0
  Sample19: incbin "45_Lead_guitar.brr":2..0
  Sample1A: incbin "46_Overdriven_guitar.brr":2..0
  Sample1B: incbin "CrashCymbal.brr":2..0
  Sample1C: incbin "Tom.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2B06

Tracker2B06:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, 0
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, 0

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !musicVolume,215;160
  !tempo,78
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%00000001,-60,60
  !echoParameters,2,60,3
  !toggleKeyOffGain
  !instr,!instr1E
  !volume,164
  db 12,$7F
  !ds4
  !rest
  !as4
  !rest
  !f4
  !rest
  !as4
  !rest
  !fs4
  !rest
  !as4
  !rest
  !gs4
  !rest
  !as4
  !rest
  !ds4
  !rest
  !as4
  !rest
  !f4
  !rest
  !as4
  !rest
  !fs4
  !rest
  !cs5
  !rest
  db 12,$7D
  !cs5
  db 36
  !rest
  db 12,$7F
  !g4
  !rest
  !d5
  !rest
  !a4
  !rest
  !d5
  !rest
  !as4
  !rest
  !d5
  !rest
  !c5
  !rest
  !d5
  !rest
  !g4
  !rest
  !d5
  !rest
  !a4
  !rest
  !d5
  !rest
  !as4
  !rest
  !g5
  !rest
  db 12,$7D
  !g5
  db 36
  !rest
  db 12,$7F
  !e4
  !rest
  !b4
  !rest
  !fs4
  !rest
  !b4
  !rest
  !g4
  !rest
  !b4
  !rest
  !a4
  !rest
  !b4
  !rest
  !e4
  !rest
  !b4
  !rest
  !fs4
  !rest
  !b4
  !rest
  !g4
  !rest
  !e5
  !rest
  db 12,$7D
  !e5
  db 36
  !rest
  !loop : dw .sub2EC1 : db 1
  db 12,$7F
  !gs4
  !rest
  !as4
  !rest
  !d4
  !rest
  !as4
  !rest
  !loop : dw .sub2EC1 : db 1
  !volume,144
  !pan,5
  !loop : dw .sub2ED0 : db 1
  !pan,10
  !instr,!instr1F
  !volume,194
  !loop : dw .sub2F05 : db 2
  !volume,164
  !loop : dw .sub2F31 : db 1
  !volume,164
  !loop : dw .sub2F96 : db 1
  !loop : dw .sub2FCF : db 2
  !end

.pattern0_1
  !toggleKeyOffGain
  !volume,144
  !loop : dw .sub2FDA : db 1
  db 12,$7F
  !ds5
  !rest
  !f5
  !rest
  !fs5
  !rest
  !as5
  !rest
  !ds6
  !rest
  !instr,!instr1E
  !fs5
  !rest
  db 12,$7D
  !fs5
  db 36
  !rest
  !instr,!instr1F
  db 12,$7F
  !g4
  !rest
  !a4
  !rest
  !as4
  !rest
  !d5
  !rest
  !g5
  !rest
  !a5
  !rest
  !as5
  !rest
  !d6
  !rest
  !g4
  !rest
  !a4
  !rest
  !as4
  !rest
  !d5
  !rest
  !g5
  !rest
  !instr,!instr1E
  !as5
  !rest
  db 12,$7D
  !as5
  db 36
  !rest
  !instr,!instr1F
  db 12,$7F
  !e5
  !rest
  !fs5
  !rest
  !g5
  !rest
  !b5
  !rest
  !e6
  !rest
  !fs6
  !rest
  !g6
  !rest
  !b6
  !rest
  !e5
  !rest
  !fs5
  !rest
  !g5
  !rest
  !b5
  !rest
  !e6
  !rest
  !instr,!instr1E
  !g5
  !rest
  db 12,$7D
  !g5
  db 36
  !rest
  !loop : dw .sub2FDA : db 1
  db 12,$7F
  !d5
  !rest
  !ds5
  !rest
  !f5
  !rest
  !as5
  !rest
  !d6
  !rest
  !ds6
  !rest
  !f6
  !rest
  !as6
  !rest
  !pan,15
  !instr,!instr1E
  !volume,144
  !subloop,0
  db 24,$7F
  !fs4
  !cs4
  !ds4
  !as3
  !subloop,3
  !subloop,0
  db 24,$7F
  !as4
  !f4
  !g4
  !d4
  !subloop,3
  !loop : dw .sub2FEF : db 2
  !loop : dw .sub2FFA : db 1
  db 24,$7F
  !cs4
  !f4
  !ds4
  !f4
  !loop : dw .sub2FFA : db 1
  db 24,$7F
  !d4
  !f4
  !ds4
  !f4
  !pan,10
  !volume,128
  !loop : dw .sub2ED0 : db 2
  !subtranspose,37
  db 24,$7F
  !rest
  !volume,85
  !loop : dw .sub2F31 : db 1
  !volume,114
  !loop : dw .sub2F96 : db 1
  db 12,$7F
  !d5
  !rest
  !gs4
  !rest
  !as4
  !rest
  !d4
  !rest
  !d5
  !rest
  !gs4
  !rest
  !as4
  !rest
  !end

.pattern0_2
  !toggleKeyOffGain
  !instr,!instr1F
  !volume,162
  !loop : dw .sub3001 : db 1
  !loop : dw .sub3075 : db 3
  !loop : dw .sub30E2 : db 1
  !loop : dw .sub311F : db 2
  !loop : dw .sub30E2 : db 1
  !loop : dw .sub3144 : db 1
  !transpose,2
  !loop : dw .sub3144 : db 1
  !transpose,3
  !loop : dw .sub3144 : db 1
  !transpose,5
  !loop : dw .sub3144 : db 1
  !transpose,0
  !loop : dw .sub3001 : db 1
  !end

.pattern0_3
  !toggleKeyOffGain
  !instr,!instr1F
  !volume,162
  !loop : dw .sub3157 : db 1
  !loop : dw .sub31B6 : db 3
  !loop : dw .sub3207 : db 1
  !loop : dw .sub3244 : db 1
  !subloop,0
  db 24,$7D
  !cs6
  db 12
  !cs6
  !rest
  !cs6
  !rest
  !subloop,1
  db 24,$7D
  !cs6
  db 12
  !cs6
  !rest
  !loop : dw .sub3244 : db 1
  !subloop,0
  db 24,$7D
  !d6
  db 12
  !d6
  !rest
  !d6
  !rest
  !subloop,1
  db 24,$7D
  !d6
  db 12
  !d6
  !rest
  !loop : dw .sub3207 : db 1
  !loop : dw .sub3257 : db 1
  !transpose,2
  !loop : dw .sub3257 : db 1
  !transpose,3
  !loop : dw .sub3257 : db 1
  !transpose,5
  !loop : dw .sub3257 : db 1
  !transpose,0
  !loop : dw .sub3157 : db 1
  !end

.pattern0_4
  !instr,!instr20
  !volume,214
  !loop : dw .sub326A : db 1
  !loop : dw .sub3291 : db 3
  !loop : dw .sub32D3 : db 1
  !subloop,0
  db 24,$7F
  !b4
  !subloop,7
  !subloop,0
  db 24,$7F
  !cs5
  !subloop,7
  !subloop,0
  db 24,$7F
  !b4
  !subloop,7
  !subloop,0
  db 24,$7F
  !d5
  !subloop,7
  !loop : dw .sub32D3 : db 1
  !subloop,0
  db 24,$7F
  !gs4
  !subloop,7
  !subloop,0
  db 24,$7F
  !as4
  !subloop,7
  !subloop,0
  db 24,$7F
  !b4
  !subloop,7
  !subloop,0
  db 24,$7F
  !cs5
  !subloop,7
  !loop : dw .sub326A : db 1
  !end

.pattern0_5
  !volume,255
  !loop : dw .sub32E9 : db 3
  !loop : dw .sub3312 : db 1
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 48,$7F
  !a4
  !instr,!instr23
  !a4
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 24,$7F
  !a4
  !instr,!instr23
  !a4
  !a4
  !a4
  !subloop,0
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 48,$7F
  !a4
  !instr,!instr23
  !a4
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 24,$7F
  !a4
  !instr,!instr23
  !a4
  !a4
  !a4
  !subloop,1
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 48,$7F
  !a4
  !instr,!instr23
  !a4
  !loop : dw .sub3377 : db 2
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 48,$7F
  !a4
  !instr,!instr23
  !a4
  !loop : dw .sub3377 : db 2
  !loop : dw .sub3398 : db 2
  !loop : dw .sub32E9 : db 1
  !loop : dw .sub3312 : db 1
  !end

.pattern0_6
  !instr,!instr22
  !volume,144
  !subloop,0
  db 48,$7F
  !c4
  !subloop,31
  !instr,!instr26
  !volume,124
  !loop : dw .sub33A8 : db 5
  !instr,!instr22
  !volume,144
  !subloop,0
  db 48,$7F
  !c4
  !subloop,31
  !end

.pattern1_0
  !volume,144
  !pan,5
  !loop : dw .sub2ED0 : db 1
  !pan,10
  !instr,!instr1F
  !volume,194
  !loop : dw .sub2F05 : db 2
  !volume,164
  !loop : dw .sub2F31 : db 1
  !volume,164
  !loop : dw .sub2F96 : db 1
  !loop : dw .sub2FCF : db 2
  !end

.pattern1_1
  !pan,15
  !instr,!instr1E
  !volume,144
  !subloop,0
  db 24,$7F
  !fs4
  !cs4
  !ds4
  !as3
  !subloop,3
  !subloop,0
  db 24,$7F
  !as4
  !f4
  !g4
  !d4
  !subloop,3
  !loop : dw .sub2FEF : db 2
  !loop : dw .sub2FFA : db 1
  db 24,$7F
  !cs4
  !f4
  !ds4
  !f4
  !loop : dw .sub2FFA : db 1
  db 24,$7F
  !d4
  !f4
  !ds4
  !f4
  !pan,10
  !volume,128
  !loop : dw .sub2ED0 : db 2
  !subtranspose,37
  db 24,$7F
  !rest
  !volume,85
  !loop : dw .sub2F31 : db 1
  !volume,114
  !loop : dw .sub2F96 : db 1
  db 12,$7F
  !d5
  !rest
  !gs4
  !rest
  !as4
  !rest
  !d4
  !rest
  !d5
  !rest
  !gs4
  !rest
  !as4
  !rest
  !end

.pattern1_2
  !loop : dw .sub3075 : db 3
  !loop : dw .sub30E2 : db 1
  !loop : dw .sub311F : db 2
  !loop : dw .sub30E2 : db 1
  !loop : dw .sub3144 : db 1
  !transpose,2
  !loop : dw .sub3144 : db 1
  !transpose,3
  !loop : dw .sub3144 : db 1
  !transpose,5
  !loop : dw .sub3144 : db 1
  !transpose,0
  !loop : dw .sub3001 : db 1
  !end

.pattern1_3
  !loop : dw .sub31B6 : db 3
  !loop : dw .sub3207 : db 1
  !loop : dw .sub3244 : db 1
  !subloop,0
  db 24,$7D
  !cs6
  db 12
  !cs6
  !rest
  !cs6
  !rest
  !subloop,1
  db 24,$7D
  !cs6
  db 12
  !cs6
  !rest
  !loop : dw .sub3244 : db 1
  !subloop,0
  db 24,$7D
  !d6
  db 12
  !d6
  !rest
  !d6
  !rest
  !subloop,1
  db 24,$7D
  !d6
  db 12
  !d6
  !rest
  !loop : dw .sub3207 : db 1
  !loop : dw .sub3257 : db 1
  !transpose,2
  !loop : dw .sub3257 : db 1
  !transpose,3
  !loop : dw .sub3257 : db 1
  !transpose,5
  !loop : dw .sub3257 : db 1
  !transpose,0
  !loop : dw .sub3157 : db 1
  !end

.pattern1_4
  !loop : dw .sub3291 : db 3
  !loop : dw .sub32D3 : db 1
  !subloop,0
  db 24,$7F
  !b4
  !subloop,7
  !subloop,0
  db 24,$7F
  !cs5
  !subloop,7
  !subloop,0
  db 24,$7F
  !b4
  !subloop,7
  !subloop,0
  db 24,$7F
  !d5
  !subloop,7
  !loop : dw .sub32D3 : db 1
  !subloop,0
  db 24,$7F
  !gs4
  !subloop,7
  !subloop,0
  db 24,$7F
  !as4
  !subloop,7
  !subloop,0
  db 24,$7F
  !b4
  !subloop,7
  !subloop,0
  db 24,$7F
  !cs5
  !subloop,7
  !loop : dw .sub326A : db 1
  !end

.pattern1_5
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 48,$7F
  !a4
  !instr,!instr23
  !a4
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 24,$7F
  !a4
  !instr,!instr23
  !a4
  !a4
  !a4
  !subloop,0
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 48,$7F
  !a4
  !instr,!instr23
  !a4
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 24,$7F
  !a4
  !instr,!instr23
  !a4
  !a4
  !a4
  !subloop,1
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 48,$7F
  !a4
  !instr,!instr23
  !a4
  !loop : dw .sub3377 : db 2
  !loop : dw .sub333C : db 1
  !instr,!instr21
  db 48,$7F
  !a4
  !instr,!instr23
  !a4
  !loop : dw .sub3377 : db 2
  !loop : dw .sub3398 : db 2
  !loop : dw .sub32E9 : db 1
  !loop : dw .sub3312 : db 1
  !end

.pattern1_6
  !instr,!instr26
  !volume,124
  !loop : dw .sub33A8 : db 5
  !instr,!instr22
  !volume,144
  !subloop,0
  db 48,$7F
  !c4
  !subloop,31
  !end

.sub2EC1
  db 12,$7F
  !ds4
  !rest
  !as4
  !rest
  !f4
  !rest
  !as4
  !rest
  !fs4
  !rest
  !as4
  !rest
  !end

.sub2ED0
  !subloop,0
  db 24,$7F
  !as4
  !f4
  !fs4
  !ds4
  !subloop,3
  !subloop,0
  db 24,$7F
  !d5
  !a4
  !as4
  !g4
  !subloop,3
  !subloop,0
  db 24,$7F
  !e4
  !b4
  !fs4
  !b4
  !g4
  !b4
  !a4
  !b4
  !subloop,1
  db 24,$7F
  !ds4
  !as4
  !f4
  !as4
  !fs4
  !as4
  !gs4
  !as4
  !d4
  !as4
  !ds4
  !as4
  !f4
  !as4
  !fs4
  !as4
  !end

.sub2F05
  db 96,$7F
  !ds5
  db 48
  !tie
  !gs5
  db 96
  !as5
  !ds6
  !d6
  !c6
  !as5
  db 24
  !rest
  !d6
  !c6
  !d6
  db 96
  !g5
  db 48
  !tie
  db 24
  !a5
  !b5
  db 96
  !e5
  db 24
  !g5
  !b5
  !a5
  !b5
  db 96
  !as5
  db 48
  !tie
  db 24
  !gs5
  !as5
  db 48
  !as5
  !gs5
  !fs5
  !f5
  !end

.sub2F31
  !instr,!instr1E
  db 96,$7F
  !fs4
  db 72
  !tie
  db 12
  !f4
  !fs4
  db 96
  !gs4
  !cs5
  db 96
  !as4
  db 72
  !tie
  db 24
  !rest
  !fs5
  !as4
  !f5
  !gs4
  db 48
  !as4
  !cs5
  db 96
  !ds5
  db 48
  !ds5
  !fs5
  db 72
  !f5
  !cs5
  db 48
  !gs4
  db 72
  !fs4
  !gs4
  db 48
  !as4
  db 96
  !f4
  db 36
  !f4
  !fs4
  db 24
  !gs4
  db 96
  !fs4
  db 72
  !tie
  db 12
  !f4
  !fs4
  db 96
  !gs4
  !cs5
  db 96
  !ds5
  !tie
  db 24
  !rest
  !fs5
  db 48
  !f5
  db 36
  !ds5
  !as4
  db 24
  !cs5
  db 72
  !cs5
  !b4
  db 48
  !gs4
  db 72
  !d5
  !ds5
  db 48
  !f5
  db 72
  !f5
  db 120
  !ds5
  db 48
  !f5
  db 24
  !rest
  db 12
  !fs6
  !f6
  !cs6
  !gs5
  !fs5
  !f5
  !cs5
  !gs4
  !fs4
  !f4
  !end

.sub2F96
  !subloop,0
  db 12,$7F
  !as4
  !rest
  !f4
  !rest
  !fs4
  !rest
  !ds4
  !rest
  !subloop,3
  !subloop,0
  db 12,$7F
  !d5
  !rest
  !a4
  !rest
  !as4
  !rest
  !g4
  !rest
  !subloop,3
  !subloop,0
  db 12,$7F
  !b4
  !rest
  !fs4
  !rest
  !g4
  !rest
  !e4
  !rest
  !subloop,3
  !subloop,0
  db 12,$7F
  !ds5
  !rest
  !gs4
  !rest
  !as4
  !rest
  !ds4
  !rest
  !subloop,1
  !end

.sub2FCF
  db 12,$7F
  !d5
  !rest
  !gs4
  !rest
  !as4
  !rest
  !d4
  !rest
  !end

.sub2FDA
  !instr,!instr1F
  db 12,$7F
  !ds5
  !rest
  !f5
  !rest
  !fs5
  !rest
  !as5
  !rest
  !ds6
  !rest
  !f6
  !rest
  !fs6
  !rest
  !as6
  !rest
  !end

.sub2FEF
  db 24,$7F
  !b3
  !g4
  !d4
  !g4
  !e4
  !g4
  !fs4
  !g4
  !end

.sub2FFA
  db 24,$7F
  !as3
  !f4
  !c4
  !f4
  !end

.sub3001
  !subloop,0
  db 24,$7F
  !as4
  db 12
  !as4
  !rest
  !as4
  !rest
  db 24
  !as4
  db 12
  !as4
  !rest
  !as4
  !rest
  !subloop,1
  db 24,$7F
  !as4
  db 12
  !as4
  !rest
  db 48
  !as4
  !subloop,0
  db 24,$7F
  !d5
  db 12
  !d5
  !rest
  !d5
  !rest
  db 24
  !d5
  db 12
  !d5
  !rest
  !d5
  !rest
  !subloop,1
  db 24,$7F
  !d5
  db 12
  !d5
  !rest
  db 48
  !d5
  !subloop,0
  db 24,$7F
  !b4
  db 12
  !b4
  !rest
  !b4
  !rest
  db 24
  !b4
  db 12
  !b4
  !rest
  !b4
  !rest
  !subloop,1
  db 24,$7F
  !b4
  db 12
  !b4
  !rest
  db 48
  !b4
  !subloop,0
  db 24,$7F
  !as4
  db 12
  !as4
  !rest
  !as4
  !rest
  !subloop,1
  db 24,$7F
  !as4
  db 12
  !as4
  !rest
  !f4
  !rest
  db 24
  !f4
  db 12
  !f4
  !rest
  !f4
  !rest
  db 24
  !as4
  db 12
  !as4
  !rest
  db 48
  !as4
  !end

.sub3075
  !subloop,0
  db 24,$7F
  !as4
  db 12
  !as4
  !rest
  !as4
  !rest
  db 24
  !as4
  db 12
  !as4
  !rest
  !as4
  !rest
  !subloop,1
  db 24,$7F
  !as4
  db 12
  !as4
  !rest
  db 48
  !as4
  !subloop,0
  db 24,$7F
  !d5
  db 12
  !d5
  !rest
  !d5
  !rest
  db 24
  !d5
  db 12
  !d5
  !rest
  !d5
  !rest
  !subloop,1
  db 24,$7F
  !d5
  db 12
  !d5
  !rest
  db 48
  !d5
  !subloop,0
  db 24,$7F
  !b4
  db 12
  !b4
  !rest
  !b4
  !rest
  db 24
  !b4
  db 12
  !b4
  !rest
  !b4
  !rest
  !subloop,1
  db 24,$7F
  !b4
  db 12
  !b4
  !rest
  db 48
  !b4
  !subloop,0
  db 24,$7F
  !d5
  db 12
  !d5
  !rest
  !d5
  !rest
  db 24
  !d5
  db 12
  !d5
  !rest
  !d5
  !rest
  !subloop,1
  db 24,$7F
  !d5
  db 12
  !d5
  !rest
  db 48
  !d5
  !end

.sub30E2
  !subloop,0
  db 24,$7D
  !as5
  db 12
  !as5
  !rest
  !as5
  !rest
  !subloop,1
  db 24,$7D
  !as5
  db 12
  !as5
  !rest
  !subloop,0
  db 24,$7D
  !gs5
  db 12
  !gs5
  !rest
  !gs5
  !rest
  !subloop,1
  db 24,$7D
  !gs5
  db 12
  !gs5
  !rest
  !subloop,0
  db 24,$7D
  !g5
  db 12
  !g5
  !rest
  !g5
  !rest
  db 24
  !g5
  db 12
  !g5
  !rest
  !g5
  !rest
  db 24
  !g5
  db 12
  !g5
  !rest
  !subloop,1
  !end

.sub311F
  !subloop,0
  db 24,$7D
  !fs5
  db 12
  !fs5
  !rest
  !fs5
  !rest
  !subloop,1
  db 24,$7D
  !fs5
  db 12
  !fs5
  !rest
  !subloop,0
  db 24,$7D
  !gs5
  db 12
  !gs5
  !rest
  !gs5
  !rest
  !subloop,1
  db 24,$7D
  !gs5
  db 12
  !gs5
  !rest
  !end

.sub3144
  !subloop,0
  db 24,$7F
  !ds5
  db 12
  !ds5
  !rest
  !ds5
  !rest
  !subloop,1
  db 24,$7F
  !ds5
  db 12
  !ds5
  !rest
  !end

.sub3157
  !subloop,0
  db 24,$7F
  !ds5
  db 12
  !ds5
  !rest
  !ds5
  !rest
  !subloop,3
  db 24,$7F
  !ds5
  db 12
  !ds5
  !rest
  db 48
  !ds5
  !subloop,0
  db 24,$7F
  !g5
  db 12
  !g5
  !rest
  !g5
  !rest
  !subloop,3
  db 24,$7F
  !g5
  db 12
  !g5
  !rest
  db 48
  !g5
  !subloop,0
  db 24,$7F
  !e5
  db 12
  !e5
  !rest
  !e5
  !rest
  !subloop,3
  db 24,$7F
  !e5
  db 12
  !e5
  !rest
  db 48
  !e5
  !subloop,0
  db 24,$7F
  !ds5
  db 12
  !ds5
  !rest
  !ds5
  !rest
  !subloop,1
  db 24,$7F
  !ds5
  db 12
  !ds5
  !rest
  !as4
  !rest
  db 24
  !as4
  db 12
  !as4
  !rest
  !as4
  !rest
  db 24
  !d5
  db 12
  !d5
  !rest
  db 48
  !d5
  !end

.sub31B6
  !subloop,0
  db 24,$7F
  !ds5
  db 12
  !ds5
  !rest
  !ds5
  !rest
  !subloop,3
  db 24,$7F
  !ds5
  db 12
  !ds5
  !rest
  db 48
  !ds5
  !subloop,0
  db 24,$7F
  !g5
  db 12
  !g5
  !rest
  !g5
  !rest
  !subloop,3
  db 24,$7F
  !g5
  db 12
  !g5
  !rest
  db 48
  !g5
  !subloop,0
  db 24,$7F
  !e5
  db 12
  !e5
  !rest
  !e5
  !rest
  !subloop,3
  db 24,$7F
  !e5
  db 12
  !e5
  !rest
  db 48
  !e5
  !subloop,0
  db 24,$7F
  !f5
  db 12
  !f5
  !rest
  !f5
  !rest
  !subloop,3
  db 24,$7F
  !f5
  db 12
  !f5
  !rest
  db 48
  !f5
  !end

.sub3207
  !subloop,0
  db 24,$7D
  !ds6
  db 12
  !ds6
  !rest
  !ds6
  !rest
  !subloop,1
  db 24,$7D
  !ds6
  db 12
  !ds6
  !rest
  !subloop,0
  db 24,$7D
  !cs6
  db 12
  !cs6
  !rest
  !cs6
  !rest
  !subloop,1
  db 24,$7D
  !cs6
  db 12
  !cs6
  !rest
  !subloop,0
  db 24,$7D
  !c6
  db 12
  !c6
  !rest
  !c6
  !rest
  db 24
  !c6
  db 12
  !c6
  !rest
  !c6
  !rest
  db 24
  !c6
  db 12
  !c6
  !rest
  !subloop,1
  !end

.sub3244
  !subloop,0
  db 24,$7D
  !b5
  db 12
  !b5
  !rest
  !b5
  !rest
  !subloop,1
  db 24,$7D
  !b5
  db 12
  !b5
  !rest
  !end

.sub3257
  !subloop,0
  db 24,$7F
  !gs5
  db 12
  !gs5
  !rest
  !gs5
  !rest
  !subloop,1
  db 24,$7F
  !gs5
  db 12
  !gs5
  !rest
  !end

.sub326A
  !subloop,0
  db 24,$7F
  !ds5
  !subloop,15
  !subloop,0
  db 24,$7F
  !g4
  !subloop,15
  !subloop,0
  db 24,$7F
  !e5
  !subloop,15
  !subloop,0
  db 24,$7F
  !ds5
  !subloop,7
  db 24,$7F
  !as4
  !as4
  !as4
  !as4
  !d5
  !d5
  !d5
  !d5
  !end

.sub3291
  db 24,$7F
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !ds5
  !f5
  !f5
  !fs5
  !fs5
  !fs5
  !fs5
  !as4
  !as4
  !as4
  !as4
  !g4
  !g4
  !g4
  !g4
  !g4
  !g4
  !a4
  !a4
  !as4
  !as4
  !as4
  !as4
  !d4
  !d4
  !d4
  !d4
  !e5
  !e5
  !e5
  !e5
  !e5
  !e5
  !fs5
  !fs5
  !g5
  !g5
  !g5
  !g5
  !b4
  !b4
  !b4
  !b4
  !subloop,0
  db 24,$7F
  !as4
  !subloop,9
  db 24,$7F
  !gs5
  !gs5
  !fs5
  !fs5
  !f5
  !f5
  !end

.sub32D3
  !subloop,0
  db 24,$7F
  !ds5
  !subloop,7
  !subloop,0
  db 24,$7F
  !cs5
  !subloop,7
  !subloop,0
  db 24,$7F
  !c5
  !subloop,15
  !end

.sub32E9
  !instr,!instr21
  db 48,$7F
  !a4
  !instr,!instr23
  !a4
  !instr,!instr21
  db 24
  !a4
  !a4
  !instr,!instr23
  !a4
  !instr,!instr21
  db 48
  !a4
  db 24
  !a4
  !instr,!instr23
  db 48
  !a4
  !instr,!instr21
  db 24
  !a4
  !instr,!instr24
  db 24,$7C
  !c5
  !instr,!instr23
  db 48,$7F
  !a4
  !end

.sub3312
  !instr,!instr21
  db 48,$7F
  !a4
  !instr,!instr23
  !a4
  !instr,!instr21
  db 24
  !a4
  !a4
  !instr,!instr23
  !a4
  !instr,!instr21
  db 48
  !a4
  db 24
  !a4
  !instr,!instr23
  db 48
  !a4
  !instr,!instr25
  db 12
  !a4
  !gs4
  !fs4
  !f4
  !e4
  !ds4
  !d4
  db 11
  !cs4
  db 1,$7F
  !tie
  !end

.sub333C
  !instr,!instr24
  db 48,$7C
  !c5
  !instr,!instr23
  db 48,$7F
  !a4
  !instr,!instr21
  db 24
  !a4
  !a4
  !instr,!instr23
  !a4
  !instr,!instr21
  db 48
  !a4
  db 24
  !a4
  !instr,!instr23
  db 48
  !a4
  !instr,!instr21
  !a4
  !instr,!instr23
  !a4
  !instr,!instr21
  !a4
  !instr,!instr23
  !a4
  !instr,!instr21
  db 24
  !a4
  !a4
  !instr,!instr23
  !a4
  !instr,!instr21
  db 48
  !a4
  db 24
  !a4
  !instr,!instr23
  db 48
  !a4
  !end

.sub3377
  !instr,!instr21
  db 48,$7F
  !a4
  !instr,!instr23
  !a4
  !instr,!instr21
  db 24
  !a4
  !a4
  !instr,!instr23
  !a4
  !instr,!instr21
  db 48
  !a4
  db 24
  !a4
  !instr,!instr23
  db 48
  !a4
  !instr,!instr21
  !a4
  !instr,!instr23
  !a4
  !end

.sub3398
  !instr,!instr24
  db 72,$7C
  !c5
  !instr,!instr21
  db 72,$7F
  !a4
  !a4
  !a4
  db 48
  !a4
  !a4
  !end

.sub33A8
  !subloop,0
  db 24,$7F
  !c5
  !subloop,63
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
