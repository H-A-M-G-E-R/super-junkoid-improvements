; Originally by ZUN, arranged by JX444444 (https://www.smwcentral.net/?p=section&a=details&id=25651)
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

!sample14 = $16
!sample15 = $17
!sample16 = $18
!sample17 = $19
!sample18 = $1A
!sample19 = $1B
!sample1A = $1C
!sample1B = $1D

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample14,$FF,$E0,$B8,$0F,$58
  db !sample15,$FF,$E0,$B8,$0E,$C0
  db !sample17,$FF,$F4,$B8,$03,$F6
  db !sample16,$FF,$E0,$B4,$06,$02
  db !sample19,$FF,$ED,$B8,$04,$79
  db !sample1A,$FF,$E0,$B8,$04,$80
  db !sample18,$FF,$E0,$80,$07,$9F
  db !sample1B,$FF,$E0,$B8,$07,$F3
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+2250
  dw Sample15,Sample15+3384
  dw Sample16,Sample16+513
  dw Sample17,Sample17+1035
  dw Sample18,Sample18+0
  dw Sample19,Sample19+702
  dw Sample1A,Sample1A+27
  dw Sample1B,Sample1B+27
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "15.brr":2..0
  Sample15: incbin "16.brr":2..0
  Sample16: incbin "19.brr":2..0
  Sample17: incbin "23.brr":2..0
  Sample18: incbin "Hit.brr":2..0
  Sample19: incbin "bass.brr":2..0
  Sample1A: incbin "synth strings.brr":2..0
  Sample1B: incbin "pulseV2.brr":2..0

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

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !musicVolume,200;150
  !tempo,58
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%11010111,-75,75
  !echoParameters,3,68,3
  !toggleKeyOffGain
  db 96,$7F
  !rest
  !instr,!instr20
  !volume,224
  !loop : dw .sub2DA8 : db 1
  !volume,162
  !loop : dw .sub2DE9 : db 2
  !loop : dw .sub2E2D : db 1
  !loop : dw .sub2E41 : db 1
  !loop : dw .sub2E2D : db 1
  db 96,$7F
  !e5
  db 72
  !tie
  db 24
  !rest
  !endVibrato
  db 48
  !e4
  !e4
  !fs4
  !fs4
  !end

.pattern0_1
  !toggleKeyOffGain
  db 96,$7F
  !rest
  !instr,!instr24
  !volume,162
  !loop : dw .sub2E4E : db 4
  !loop : dw .sub2E59 : db 2
  !loop : dw .sub2E82 : db 1
  db 24,$7F
  !rest
  db 36
  !c4
  !c4
  !e4
  !g4
  !e4
  !c4
  !e4
  !g4
  db 24
  !fs4
  !e4
  !b3
  !loop : dw .sub2E82 : db 1
  db 24,$7F
  !rest
  db 36
  !cs4
  !cs4
  !e4
  !g4
  !e4
  !c4
  db 24
  !e4
  db 36
  !g4
  !d4
  db 24
  !fs4
  db 23
  !a4
  db 1,$7F
  !tie
  !end

.pattern0_2
  db 96,$7F
  !rest
  !instr,!instr21
  !volume,162
  !loop : dw .sub2E95 : db 4
  !loop : dw .sub2EA8 : db 1
  !subloop,0
  !loop : dw .sub2E95 : db 1
  !loop : dw .sub2EA8 : db 1
  !subloop,2
  !loop : dw .sub2EBB : db 1
  !subloop,0
  !loop : dw .sub2EA8 : db 1
  !loop : dw .sub2E95 : db 1
  !subloop,2
  !loop : dw .sub2EA8 : db 1
  !loop : dw .sub2EBB : db 1
  !loop : dw .sub2E95 : db 1
  !loop : dw .sub2ECE : db 1
  !loop : dw .sub2EE1 : db 2
  !loop : dw .sub2E95 : db 1
  !loop : dw .sub2ECE : db 1
  !subloop,0
  db 12,$7F
  !e5
  !cs5
  !g4
  !cs5
  !subloop,3
  !loop : dw .sub2EA8 : db 1
  !end

.pattern0_3
  !instr,!instr22
  !volume,204
  db 96,$7F
  !rest
  !loop : dw .sub2EF4 : db 4
  !loop : dw .sub2F00 : db 2
  !loop : dw .sub2F42 : db 1
  !loop : dw .sub2F54 : db 2
  !loop : dw .sub2F42 : db 1
  db 36,$7F
  !cs4
  !cs4
  !cs5
  !cs4
  db 24
  !cs5
  !g4
  db 36
  !c4
  !c5
  !c4
  !d4
  db 24
  !a4
  db 23
  !d4
  db 1,$7F
  !tie
  !end

.pattern0_4
  db 12,$7F
  !rest
  !instr,!instr1F
  !volume,174
  !c4
  db 24
  !c4
  !c4
  db 12
  !c4
  !c4
  !loop : dw .sub2F5E : db 7
  !end

.pattern0_5
  !instr,!instr1E
  !volume,204
  !subloop,0
  db 12,$7F
  !c4
  db 12,$7C
  !c4
  db 24,$79
  !c4
  !subloop,1
  !subloop,0
  db 12,$7F
  !c4
  db 12,$7C
  !c4
  db 24,$79
  !c4
  !subloop,110
  db 12,$7F
  !c4
  db 12,$7C
  !c4
  db 23,$79
  !c4
  db 1,$7F
  !tie
  !end

.pattern0_6
  db 96,$7F
  !rest
  !instr,!instr23
  !volume,132
  !subloop,0
  db 96,$7F
  !g4
  !tie
  !tie
  !tie
  !subloop,1
  !loop : dw .sub2F7A : db 2
  !loop : dw .sub2F82 : db 1
  !loop : dw .sub2F7A : db 2
  !loop : dw .sub2F82 : db 1
  db 96,$7F
  !g4
  !tie
  db 96
  !fs4
  !tie
  db 96
  !e4
  !tie
  !tie
  !tie
  db 96
  !g4
  !tie
  db 96
  !fs4
  !tie
  db 96
  !e4
  !tie
  !e4
  !fs4
  !end

.pattern0_7
  !toggleKeyOffGain
  !subtranspose,48
  db 96,$7F
  !rest
  !instr,!instr20
  !volume,112
  db 24
  !rest
  !loop : dw .sub2DA8 : db 1
  !volume,96
  !loop : dw .sub2DE9 : db 2
  !loop : dw .sub2E2D : db 1
  !loop : dw .sub2E41 : db 1
  !loop : dw .sub2E2D : db 1
  db 96,$7F
  !e5
  db 72
  !tie
  db 24
  !rest
  !instr,!instr25
  !vibrato,44,12,120
  !endVibrato
  db 48
  !e5
  !e5
  !fs5
  db 24
  !fs5
  !end

.pattern1_0
  !instr,!instr20
  !volume,224
  !loop : dw .sub2DA8 : db 1
  !volume,162
  !loop : dw .sub2DE9 : db 2
  !loop : dw .sub2E2D : db 1
  !loop : dw .sub2E41 : db 1
  !loop : dw .sub2E2D : db 1
  db 96,$7F
  !e5
  db 72
  !tie
  db 24
  !rest
  !endVibrato
  db 48
  !e4
  !e4
  !fs4
  !fs4
  !end

.pattern1_1
  !instr,!instr24
  !volume,162
  !loop : dw .sub2E4E : db 4
  !loop : dw .sub2E59 : db 2
  !loop : dw .sub2E82 : db 1
  db 24,$7F
  !rest
  db 36
  !c4
  !c4
  !e4
  !g4
  !e4
  !c4
  !e4
  !g4
  db 24
  !fs4
  !e4
  !b3
  !loop : dw .sub2E82 : db 1
  db 24,$7F
  !rest
  db 36
  !cs4
  !cs4
  !e4
  !g4
  !e4
  !c4
  db 24
  !e4
  db 36
  !g4
  !d4
  db 24
  !fs4
  db 23
  !a4
  db 1,$7F
  !tie
  !end

.pattern1_2
  !instr,!instr21
  !volume,162
  !loop : dw .sub2E95 : db 4
  !loop : dw .sub2EA8 : db 1
  !subloop,0
  !loop : dw .sub2E95 : db 1
  !loop : dw .sub2EA8 : db 1
  !subloop,2
  !loop : dw .sub2EBB : db 1
  !subloop,0
  !loop : dw .sub2EA8 : db 1
  !loop : dw .sub2E95 : db 1
  !subloop,2
  !loop : dw .sub2EA8 : db 1
  !loop : dw .sub2EBB : db 1
  !loop : dw .sub2E95 : db 1
  !loop : dw .sub2ECE : db 1
  !loop : dw .sub2EE1 : db 2
  !loop : dw .sub2E95 : db 1
  !loop : dw .sub2ECE : db 1
  !subloop,0
  db 12,$7F
  !e5
  !cs5
  !g4
  !cs5
  !subloop,3
  !loop : dw .sub2EA8 : db 1
  !end

.pattern1_3
  !loop : dw .sub2EF4 : db 4
  !loop : dw .sub2F00 : db 2
  !loop : dw .sub2F42 : db 1
  !loop : dw .sub2F54 : db 2
  !loop : dw .sub2F42 : db 1
  db 36,$7F
  !cs4
  !cs4
  !cs5
  !cs4
  db 24
  !cs5
  !g4
  db 36
  !c4
  !c5
  !c4
  !d4
  db 24
  !a4
  db 23
  !d4
  db 1,$7F
  !tie
  !end

.pattern1_4
  !loop : dw .sub2F5E : db 7
  !end

.pattern1_5
  !subloop,0
  db 12,$7F
  !c4
  db 12,$7C
  !c4
  db 24,$79
  !c4
  !subloop,110
  db 12,$7F
  !c4
  db 12,$7C
  !c4
  db 23,$79
  !c4
  db 1,$7F
  !tie
  !end

.pattern1_6
  !instr,!instr23
  !volume,132
  !subloop,0
  db 96,$7F
  !g4
  !tie
  !tie
  !tie
  !subloop,1
  !loop : dw .sub2F7A : db 2
  !loop : dw .sub2F82 : db 1
  !loop : dw .sub2F7A : db 2
  !loop : dw .sub2F82 : db 1
  db 96,$7F
  !g4
  !tie
  db 96
  !fs4
  !tie
  db 96
  !e4
  !tie
  !tie
  !tie
  db 96
  !g4
  !tie
  db 96
  !fs4
  !tie
  db 96
  !e4
  !tie
  !e4
  !fs4
  !end

.pattern1_7
  !instr,!instr20
  !volume,112
  db 24
  !rest
  !loop : dw .sub2DA8 : db 1
  !volume,96
  !loop : dw .sub2DE9 : db 2
  !loop : dw .sub2E2D : db 1
  !loop : dw .sub2E41 : db 1
  !loop : dw .sub2E2D : db 1
  db 96,$7F
  !e5
  db 72
  !tie
  db 24
  !rest
  !instr,!instr25
  !vibrato,44,12,120
  !endVibrato
  db 48
  !e5
  !e5
  !fs5
  db 24
  !fs5
  !end

.sub2DA8
  db 12,$7F
  !e5
  !g5
  !fs5
  !g5
  !a5
  !e5
  !d5
  db 24
  !c5
  db 24,$7C
  !c5
  db 12,$79
  !c5
  db 24,$7F
  !a4
  db 24,$7C
  !a4
  db 36,$7F
  !b4
  !d5
  db 24
  !e5
  !d5
  !a5
  !g5
  !fs5
  db 12
  !e5
  !fs5
  !g5
  !b4
  !d5
  !e5
  !g4
  !b4
  !d5
  !b4
  !g4
  !b4
  db 24
  !e4
  !g4
  !e4
  !g4
  db 12
  !e4
  !fs4
  !g4
  !b4
  !e5
  !fs5
  !g5
  !b5
  !e6
  !fs6
  !g6
  !b6
  !end

.sub2DE9
  db 48,$7F
  !rest
  !instr,!instr25
  !vibrato,44,12,120
  !e4
  db 36
  !d4
  !e4
  db 24
  !fs4
  db 36
  !g4
  !fs4
  db 48
  !e4
  db 24
  !e4
  !d4
  !e4
  db 48
  !rest
  !e4
  db 36
  !d4
  !e4
  db 24
  !fs4
  db 96
  !g4
  !tie
  db 48
  !rest
  !e4
  db 36
  !d4
  !e4
  db 24
  !fs4
  db 36
  !g4
  !fs4
  db 72
  !e4
  db 24
  !b3
  !d4
  !e4
  !d4
  !b3
  !d4
  db 72
  !e4
  db 12
  !d4
  !fs4
  db 24
  !e4
  !fs4
  !g4
  !b4
  db 96
  !as4
  !end

.sub2E2D
  db 48,$7F
  !rest
  db 24
  !b4
  !g4
  !e4
  db 72
  !d5
  db 48
  !rest
  db 24
  !b4
  !g4
  !e4
  db 48
  !d5
  db 24
  !e5
  !end

.sub2E41
  db 24,$7F
  !b4
  !d5
  !a4
  !b4
  db 96
  !g4
  !tie
  db 48
  !tie
  !rest
  !end

.sub2E4E
  db 24,$7F
  !tie
  db 36
  !e4
  !e4
  !f4
  !d4
  db 24
  !e4
  !end

.sub2E59
  !subloop,0
  db 24,$7F
  !rest
  db 36
  !c4
  !c4
  !d4
  !fs4
  db 24
  !d4
  !rest
  db 36
  !e4
  !e4
  !g4
  !e4
  db 24
  !g4
  !subloop,2
  db 24,$7F
  !rest
  db 36
  !c4
  !c4
  !d4
  !fs4
  db 24
  !d4
  !rest
  db 36
  !c4
  !c4
  !ds4
  !ds4
  db 24
  !ds4
  !end

.sub2E82
  db 24,$7F
  !rest
  db 36
  !e4
  !e4
  !g4
  !b4
  db 24
  !g4
  !rest
  db 36
  !d4
  !d4
  !fs4
  !a4
  db 24
  !fs4
  !end

.sub2E95
  db 12,$7F
  !g5
  !e5
  !b4
  !e5
  !g5
  !e5
  !b4
  !e5
  !g5
  !e5
  !b4
  !e5
  !g5
  !e5
  !b4
  !e5
  !end

.sub2EA8
  db 12,$7F
  !e5
  !c5
  !g4
  !c5
  !e5
  !c5
  !g4
  !c5
  !fs5
  !d5
  !a4
  !d5
  !fs5
  !d5
  !a4
  !d5
  !end

.sub2EBB
  db 12,$7F
  !e5
  !c5
  !g4
  !c5
  !e5
  !c5
  !g4
  !c5
  !g5
  !ds5
  !as4
  !ds5
  !g5
  !ds5
  !as4
  !ds5
  !end

.sub2ECE
  db 12,$7F
  !fs5
  !d5
  !a4
  !d5
  !fs5
  !d5
  !a4
  !d5
  !fs5
  !d5
  !a4
  !d5
  !fs5
  !d5
  !a4
  !d5
  !end

.sub2EE1
  db 12,$7F
  !e5
  !c5
  !g4
  !c5
  !e5
  !c5
  !g4
  !c5
  !e5
  !c5
  !g4
  !c5
  !e5
  !c5
  !g4
  !c5
  !end

.sub2EF4
  db 24,$7F
  !e3
  !e3
  !b3
  !e4
  db 36
  !g4
  !fs4
  db 24
  !e4
  !end

.sub2F00
  db 36,$7F
  !c4
  !e4
  !g4
  !d4
  db 24
  !fs4
  !a4
  db 36
  !e3
  !fs3
  !g3
  !e3
  db 24
  !fs3
  !g3
  db 36
  !c4
  !e4
  !g4
  !d4
  db 24
  !fs4
  !a4
  db 36
  !e3
  !fs3
  !g3
  !g3
  db 24
  !a3
  !b3
  db 36
  !c4
  !e4
  !g4
  !d4
  db 24
  !fs4
  !a4
  db 36
  !e3
  !fs3
  !g3
  !e3
  db 24
  !fs3
  !g3
  db 36
  !c4
  !e4
  !g4
  !d4
  db 24
  !fs4
  !a4
  db 36
  !c4
  !e4
  !g4
  !ds3
  db 24
  !as3
  !ds3
  !end

.sub2F42
  db 36,$7F
  !e3
  !e3
  !e4
  !e3
  db 24
  !e4
  !b3
  db 36
  !d3
  !d3
  !d4
  !d3
  db 24
  !d4
  !a3
  !end

.sub2F54
  db 36,$7F
  !c4
  !c4
  !c5
  !c4
  db 24
  !c5
  !g4
  !end

.sub2F5E
  !subloop,0
  db 48,$7F
  !rest
  db 72
  !c4
  db 36
  !c4
  !c4
  !subloop,2
  db 48,$7F
  !rest
  db 36
  !c4
  db 12
  !c4
  !c4
  db 24
  !c4
  !c4
  db 12
  !c4
  db 24
  !c4
  !end

.sub2F7A
  db 96,$7F
  !e4
  !fs4
  db 96
  !g4
  !tie
  !end

.sub2F82
  db 96,$7F
  !e4
  !fs4
  db 96
  !g4
  !tie
  !e4
  !fs4
  !e4
  !g4
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
