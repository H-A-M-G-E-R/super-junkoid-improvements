; Originally by ZUN, arranged by JX444444 (https://www.smwcentral.net/?p=section&a=details&id=25604)
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
!instr27 = $1F

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
  db !sample14,$FF,$E0,$B8,$06,$02
  db !sample17,$FF,$E0,$B8,$0C,$C4
  db !sample1C,$FF,$F6,$B8,$06,$7E
  db !sample19,$FF,$E0,$B8,$0F,$5E
  db !sample15,$FF,$E0,$B8,$12,$30
  db !sample1A,$FF,$EF,$B8,$0E,$06
  db !sample17,$FF,$F1,$B8,$0C,$C4
  db !sample18,$FF,$E0,$B8,$0F,$58
  db !sample16,$FF,$E0,$80,$07,$9F
  db !sample1B,$FF,$E0,$B4,$06,$02
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+594
  dw Sample15,Sample15+738
  dw Sample16,Sample16+0
  dw Sample17,Sample17+1179
  dw Sample18,Sample18+2250
  dw Sample19,Sample19+3384
  dw Sample1A,Sample1A+1629
  dw Sample1B,Sample1B+513
  dw Sample1C,Sample1C+27
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "1a.brr":2..0
  Sample15: incbin "1f.brr":2..0
  Sample16: incbin "Hit.brr":2..0
  Sample17: incbin "14.brr":2..0
  Sample18: incbin "15.brr":2..0
  Sample19: incbin "16.brr":2..0
  Sample1A: incbin "21.brr":2..0
  Sample1B: incbin "19.brr":2..0
  Sample1C: incbin "12.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2B34

Tracker2B34:
  dw .pattern0
  dw .pattern1
  dw $0000

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, .pattern1_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !musicVolume,137
  !tempo,73
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%11101111,-75,75
  !echoParameters,3,68,3
  !instr,!instr1E
  !volume,216;162
  db 3,$7F
  !d5
  !pitchSlide,24,64 : !c3
  db 93
  !tie
  !instr,!instr27
  !volume,144
  !echo,%10101111,-75,75
  !loop : dw .sub2EF5 : db 2
  db 96,$7F
  !d5
  db 48
  !tie
  !rest
  db 24
  !d5
  !g5
  !a5
  db 48
  !d6
  db 72
  !rest
  db 96
  !d5
  db 48
  !tie
  db 96
  !rest
  db 24
  !d5
  !g5
  !a5
  !d6
  !a5
  !g5
  db 96,$7F
  !f5
  db 48
  !g5
  !f5
  db 96
  !a5
  db 48
  !tie
  !g5
  db 96,$7F
  !f5
  db 48
  !g5
  !f5
  db 96
  !a5
  db 48
  !tie
  !g5
  !volume,151
  db 96,$7F
  !f5
  !e5
  db 96
  !d5
  db 72
  !tie
  db 24
  !rest
  db 96
  !d5
  !e5
  !f5
  !g5
  db 120
  !f5
  db 24
  !rest
  !ds5
  !f5
  db 96
  !rest
  !tie
  !end

.pattern0_1
  !subtranspose,21
  !instr,!instr1E
  !volume,162
  db 3,$7F
  !rest
  !d5
  !pitchSlide,24,64 : !c3
  db 90
  !tie
  !subtranspose,0
  !instr,!instr27
  !volume,144
  !loop : dw .sub2F08 : db 2
  db 96,$7F
  !a4
  db 48
  !tie
  !rest
  db 24
  !a4
  !d5
  !e5
  db 48
  !a5
  db 72
  !rest
  db 96
  !a4
  db 48
  !tie
  db 96
  !rest
  db 24
  !a4
  !d5
  !e5
  !a5
  !e5
  !d5
  db 96,$7F
  !d5
  db 48
  !e5
  !d5
  db 96
  !f5
  db 48
  !tie
  !e5
  db 96,$7F
  !d5
  db 48
  !e5
  !d5
  db 96
  !f5
  db 48
  !tie
  !e5
  !volume,151
  db 96,$7F
  !d5
  !c5
  db 96
  !b4
  db 72
  !tie
  db 24
  !rest
  db 96
  !as4
  !c5
  !cs5
  !ds5
  db 120
  !c5
  db 24
  !rest
  !as4
  !c5
  db 96
  !rest
  !tie
  !end

.pattern0_2
  !toggleKeyOffGain
  db 96,$7F
  !rest
  !instr,!instr22
  !volume,131
  db 24
  !c3
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 48,$7F
  !c3
  !d3
  db 24
  !c3
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 24,$7F
  !a2
  db 48,$7F
  !a2
  !g2
  !loop : dw .sub2F1B : db 2
  !volume,164
  db 24,$7F
  !g2
  !as2
  !d3
  !f3
  !e3
  !rest
  !c3
  !a2
  !d3
  !rest
  !c3
  !a2
  db 96
  !f2
  db 24
  !rest
  !g2
  !as2
  !d3
  db 48
  !a2
  db 24
  !c3
  !e3
  db 96
  !a2
  !rest
  db 24
  !f2
  !a2
  !d3
  !f3
  !e3
  !rest
  !g3
  !e3
  !d3
  !rest
  !c3
  !a2
  db 96
  !f2
  db 24
  !rest
  !f2
  !a2
  !c3
  !g2
  !rest
  !b2
  !d3
  !rest
  !gs2
  !c3
  !ds3
  !as2
  !rest
  !d3
  !f3
  !c3
  !f3
  !gs3
  !c4
  !gs3
  !f3
  !gs3
  !c4
  db 96
  !rest
  !tie
  !end

.pattern0_3
  !toggleKeyOffGain
  db 96,$7F
  !rest
  !instr,!instr22
  !volume,131
  db 24
  !f3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 48,$7F
  !f3
  !g3
  db 24
  !f3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 48,$7F
  !d3
  !c3
  !loop : dw .sub2F2D : db 2
  !volume,164
  db 24,$7F
  !as2
  !d3
  !f3
  !a3
  !g3
  !rest
  !e3
  !c3
  !f3
  !rest
  !e3
  !d3
  db 96
  !a2
  db 24
  !rest
  !as2
  !d3
  !f3
  db 48
  !c3
  db 24
  !e3
  !g3
  db 96
  !d3
  !rest
  db 24
  !a2
  !d3
  !f3
  !a3
  !g3
  !rest
  !c4
  !g3
  !f3
  !rest
  !e3
  !d3
  db 96
  !a2
  db 24
  !rest
  !as2
  !d3
  !f3
  !c3
  !rest
  !e3
  !g3
  !rest
  !cs3
  !f3
  !gs3
  !ds3
  !rest
  !g3
  !as3
  !f3
  !as3
  !c4
  !f4
  !c4
  !as3
  !c4
  !f4
  db 96
  !rest
  !tie
  !end

.pattern0_4
  !instr,!instr23
  !volume,240
  db 96,$7F
  !rest
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 48,$7F
  !f3
  !g3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 48,$7F
  !d3
  !c3
  !loop : dw .sub2F3C : db 2
  !loop : dw .sub2F48 : db 2
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !c3
  db 24,$7F
  !c3
  db 24,$7F
  !c3
  db 24,$7F
  !c3
  db 24,$7F
  !b2
  db 24,$7F
  !b2
  db 24,$7F
  !b2
  db 24,$7F
  !b2
  db 24,$7F
  !b2
  db 24,$7F
  !b2
  db 24,$7F
  !b2
  db 24,$7F
  !b2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !c3
  db 24,$7F
  !c3
  db 24,$7F
  !c3
  db 24,$7F
  !c3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !ds3
  db 24,$7F
  !ds3
  db 24,$7F
  !ds3
  db 24,$7F
  !ds3
  db 120,$7F
  !f3
  db 24
  !rest
  !ds3
  !f3
  db 96
  !rest
  !tie
  !end

.pattern0_5
  !instr,!instr1F
  !volume,118
  !dynamicVolume,48,192
  db 95,$7F
  !a3
  db 1,$7F
  !tie
  !loop : dw .sub2F65 : db 8
  db 24,$7F
  !c4
  !instr,!instr20
  !volume,118
  !dynamicVolume,96,192
  db 12,$7F
  !c5
  db 12,$7F
  !c5
  db 12,$7F
  !c5
  db 12,$7F
  !c5
  db 12,$7F
  !c5
  db 12,$7F
  !c5
  db 12,$7F
  !c5
  db 12,$7F
  !c5
  db 24,$7F
  !c5
  !volume,224
  !c4
  !instr,!instr21
  !volume,224
  db 96
  !c4
  !tie
  db 24
  !tie
  !end

.pattern0_6
  db 24,$7F
  !rest
  !instr,!instr20
  !volume,162
  db 12,$7F
  !c5
  db 12,$7F
  !c5
  !instr,!instr21
  !volume,224
  db 48,$7F
  !c4
  !instr,!instr25
  !volume,224
  db 96,$7F
  !c4
  db 24
  !c4
  db 72
  !c4
  db 96
  !c4
  !c4
  db 96,$7F
  !c4
  db 24
  !c4
  db 72
  !c4
  db 96
  !c4
  !c4
  db 96,$7F
  !c4
  db 24
  !c4
  db 72
  !c4
  db 96
  !c4
  !c4
  db 96,$7F
  !c4
  db 24
  !c4
  db 72
  !c4
  db 96
  !c4
  !c4
  db 96,$7F
  !c4
  db 24
  !c4
  db 72
  !c4
  db 96
  !c4
  !c4
  db 96,$7F
  !c4
  db 24
  !c4
  db 72
  !c4
  db 96
  !c4
  !c4
  db 96,$7F
  !c4
  db 24
  !c4
  db 72
  !c4
  db 96
  !c4
  !c4
  db 96,$7F
  !c4
  db 24
  !c4
  db 72
  !c4
  db 96
  !c4
  !c4
  !instr,!instr24
  !volume,144
  db 96,$7F
  !c4
  db 48
  !tie
  !instr,!instr25
  !volume,224
  db 24
  !c4
  !instr,!instr24
  !volume,144
  db 96
  !c4
  !tie
  db 24
  !tie
  !end

.pattern0_7
  !toggleKeyOffGain
  db 96,$7F
  !rest
  !instr,!instr26
  !volume,220
  db 24,$7F
  !d4
  !volume,190
  !d4
  !volume,160
  !d4
  !volume,130
  !d4
  !volume,100
  db 96
  !d4
  !tie
  !tie
  !volume,220
  db 24,$7F
  !d4
  !volume,190
  !d4
  !volume,160
  !d4
  !volume,130
  !d4
  !volume,100
  db 96
  !d4
  !tie
  !tie
  !volume,220
  db 24,$7F
  !as3
  !volume,190
  !as3
  !volume,160
  !as3
  !volume,130
  !as3
  !volume,100
  db 96
  !as3
  !tie
  !tie
  !volume,220
  db 24,$7F
  !as3
  !volume,190
  !as3
  !volume,160
  !as3
  !volume,130
  !as3
  !volume,100
  db 96
  !as3
  !tie
  !tie
  !subtranspose,21
  !instr,!instr22
  db 3,$7F
  !rest
  !volume,111
  db 24
  !as2
  !d3
  !f3
  !a3
  !g3
  !rest
  !e3
  !c3
  !f3
  !rest
  !e3
  !d3
  db 96
  !a2
  db 24
  !rest
  !as2
  !d3
  !f3
  db 48
  !c3
  db 24
  !e3
  !g3
  db 96
  !d3
  !rest
  db 24
  !a2
  !d3
  !f3
  !a3
  db 48
  !g3
  db 24
  !c4
  !g3
  db 48
  !f3
  db 24
  !e3
  !d3
  db 96
  !a2
  db 24
  !rest
  !as2
  !d3
  !f3
  !c3
  !rest
  !e3
  !g3
  !rest
  !cs3
  !f3
  !gs3
  !ds3
  !rest
  !g3
  !as3
  !f3
  !as3
  !c4
  !f4
  !c4
  !as3
  db 21
  !c4
  !subtranspose,0
  !instr,!instr26
  !volume,196
  db 24
  !f4
  !volume,185
  !dynamicVolume,192,16
  db 24,$7F
  !f4
  db 24,$7F
  !f4
  db 24,$7F
  !f4
  db 24,$7F
  !f4
  db 24,$7F
  !f4
  db 24,$7F
  !f4
  db 48,$7F
  !f4
  !end

.pattern1_0
  !end

.pattern1_1
  !subtranspose,21
  !instr,!instr1E
  !volume,162
  db 3,$7F
  !rest
  !end

.pattern1_2
  db 96,$7F
  !rest
  !end

.pattern1_3
  db 96,$7F
  !rest
  !end

.pattern1_4
  !instr,!instr23
  !volume,240
  db 96,$7F
  !rest
  !end

.pattern1_5
  !instr,!instr1F
  !volume,118
  !dynamicVolume,48,192
  db 95,$7F
  !a3
  !end

.pattern1_6
  db 24,$7F
  !rest
  !end

.pattern1_7
  db 96,$7F
  !rest
  !end

.sub2EF5
  db 48,$7F
  !rest
  db 24
  !d5
  !g5
  !a5
  db 48
  !d6
  db 24
  !rest
  !d5
  !g5
  !a5
  db 48
  !d6
  db 72
  !rest
  !end

.sub2F08
  db 48,$7F
  !rest
  db 24
  !a4
  !d5
  !f5
  db 48
  !a5
  db 24
  !rest
  !a4
  !d5
  !f5
  db 48
  !a5
  db 72
  !rest
  !end

.sub2F1B
  db 24,$7F
  !a2
  !f2
  !f2
  !f2
  !f2
  !f2
  !f2
  !f2
  !f2
  !f2
  !f2
  !f2
  db 48
  !f2
  !g2
  !end

.sub2F2D
  db 24,$7F
  !d3
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 48,$7F
  !as2
  !c3
  !end

.sub2F3C
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 48,$7F
  !as2
  !c3
  !end

.sub2F48
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !as2
  db 24,$7F
  !c3
  db 24,$7F
  !c3
  db 24,$7F
  !c3
  db 24,$7F
  !c3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !c3
  db 24,$7F
  !c3
  !end

.sub2F65
  !instr,!instr24
  !volume,144
  db 48,$7F
  !c4
  !instr,!instr21
  !volume,224
  db 96
  !c4
  !c4
  db 48
  !c4
  !instr,!instr24
  !volume,144
  !c4
  !instr,!instr21
  !volume,224
  !c4
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
