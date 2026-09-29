; Originally by ZUN, arranged by JX444444 (https://www.smwcentral.net/?p=section&a=details&id=26970)
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
  db !sample15,$FF,$E0,$B8,$12,$30
  db !sample19,$FF,$E0,$B8,$0D,$C5
  db !sample1B,$FF,$F0,$B8,$0E,$06
  db !sample18,$FF,$E0,$B8,$0F,$58
  db !sample17,$FF,$F1,$B8,$09,$64
  db !sample1A,$FF,$E0,$B6,$07,$F5
  db !sample16,$FF,$F2,$B8,$06,$8C
  db !sample14,$FF,$E0,$B7,$05,$FD
  db !sample1C,$FF,$E0,$B8,$07,$7F
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+594
  dw Sample15,Sample15+738
  dw Sample16,Sample16+27
  dw Sample17,Sample17+1179
  dw Sample18,Sample18+2250
  dw Sample19,Sample19+3384
  dw Sample1A,Sample1A+2520
  dw Sample1B,Sample1B+1629
  dw Sample1C,Sample1C+1692
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "1a.brr":2..0
  Sample15: incbin "1f.brr":2..0
  Sample16: incbin "12.brr":2..0
  Sample17: incbin "14.brr":2..0
  Sample18: incbin "15.brr":2..0
  Sample19: incbin "16.brr":2..0
  Sample1A: incbin "18.brr":2..0
  Sample1B: incbin "21.brr":2..0
  Sample1C: incbin "22.brr":2..0

NoteLengthTable: ; note length table
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

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, 0
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, 0

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !musicVolume,191;143
  !tempo,66
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%01100111,-54,54
  !echoParameters,3,68,3
  !toggleKeyOffGain
  db 6,$7F
  !rest
  !vibrato,96,12,64
  !pan,10
  !instr,!instr1E
  !volume,181
  db 12
  !f3
  !gs3
  !loop : dw .sub305F : db 1
  db 48,$7F
  !f3
  !c4
  db 24
  !g3
  db 8
  !rest
  db 16
  !f3
  !rest
  !gs3
  !rest
  !loop : dw .sub305F : db 1
  db 72,$7F
  !f4
  db 24
  !rest
  db 48
  !gs3
  !g3
.pattern1_0
  !pan,5
  !volume,144
  !loop : dw .sub307E : db 4
  !loop : dw .sub308F : db 4
  db 96,$7F
  !rest
  !loop : dw .sub307E : db 8
  !transpose,5
  !loop : dw .sub307E : db 12
  !transpose,6
  !loop : dw .sub307E : db 8
  !transpose,3
  !loop : dw .sub307E : db 4
  !transpose,0
  !end

.pattern0_1
  !toggleKeyOffGain
  db 6,$7F
  !rest
  !vibrato,96,12,64
  !pan,0
  !instr,!instr1E
  !volume,118
  db 12
  !as2
  !c3
  !loop : dw .sub30D2 : db 1
  db 24,$7F
  !e3
  db 8
  !rest
  db 16
  !e3
  !rest
  !e3
  !rest
  !loop : dw .sub30D2 : db 1
  db 24,$7F
  !ds3
  !rest
  !ds3
  !ds3
.pattern1_1
  !pan,15
  !volume,144
  !transpose,5
  !loop : dw .sub307E : db 4
  !transpose,0
  !loop : dw .sub30F4 : db 4
  db 96,$7F
  !rest
  !transpose,5
  !loop : dw .sub307E : db 8
  !transpose,10
  !loop : dw .sub307E : db 12
  !transpose,11
  !loop : dw .sub307E : db 8
  !transpose,8
  !loop : dw .sub307E : db 4
  !end

.pattern0_2
  !toggleKeyOffGain
  db 6,$7F
  !rest
  !vibrato,96,12,64
  !subtranspose,16
  !pan,10
  !instr,!instr1E
  !volume,118
  db 12
  !f3
  !gs3
  db 72
  !as3
  db 24
  !rest
  db 72
  !g3
  db 24
  !rest
  db 48
  !ds3
  db 24
  !rest
  !f3
  db 16
  !f3
  !rest
  !f3
  !rest
  !gs3
  !rest
  db 24
  !as3
  !rest
  !as3
  !c4
  !ds4
  !c4
  !as3
  !c4
  db 48
  !f3
  !c4
  db 24
  !g3
  db 8
  !rest
  db 16
  !f3
  !rest
  !gs3
  !rest
  !vibrato,64,12,64
  !subtranspose,0
  !instr,!instr23
  !volume,255
  !loop : dw .sub3137 : db 1
  db 12,$7F
  !g4
.pattern1_2
  !volume,255
  !loop : dw .sub3179 : db 1
  db 12,$7F
  !f4
  !cs5
  !c5
  !cs5
  !f5
  !cs5
  !c5
  !cs5
  !loop : dw .sub3179 : db 1
  db 12,$7F
  !f4
  !ds5
  !e5
  !f5
  !instr,!instr25
  !volume,172
  !transpose,12
  !loop : dw .sub31B4 : db 1
  !loop : dw .sub31EA : db 1
  !loop : dw .sub31B4 : db 1
  !loop : dw .sub31F0 : db 1
  db 96,$7C
  !rest
  !transpose,0
  !instr,!instr23
  !volume,255
  !loop : dw .sub31F8 : db 1
  db 24,$7F
  !as4
  !instr,!instr25
  !volume,172
  !loop : dw .sub3238 : db 1
  !instr,!instr23
  !volume,255
  !loop : dw .sub326D : db 1
  !loop : dw .sub328D : db 1
  !loop : dw .sub326D : db 1
  db 96,$7F
  !as5
  db 72
  !tie
  db 24
  !rest
  !instr,!instr25
  !volume,172
  !loop : dw .sub329E : db 1
  !instr,!instr23
  !volume,255
  !loop : dw .sub32EE : db 1
  db 96,$7F
  !cs6
  !instr,!instr25
  !volume,172
  !loop : dw .sub3349 : db 1
  !instr,!instr23
  !volume,255
  !transpose,3
  !loop : dw .sub3179 : db 1
  !transpose,0
  db 12,$7F
  !gs4
  !e5
  !ds5
  !e5
  !gs5
  !e5
  !ds5
  !e5
  !transpose,3
  !loop : dw .sub3179 : db 1
  !transpose,0
  db 12,$7F
  !gs4
  !e5
  !ds5
  !e5
  !gs5
  !e5
  !ds5
  !e5
  !end

.pattern0_3
  !vibrato,64,12,64
  !pan,10
  db 30,$7F
  !rest
  !instr,!instr20
  !volume,240
  !loop : dw .sub33F9 : db 1
  db 16,$7F
  !e3
  !rest
  !e3
  !rest
  !e3
  !rest
  !loop : dw .sub33F9 : db 1
  db 12,$7F
  !ds3
  !ds4
  !as3
  !ds3
  !ds3
  !as3
  !g3
  !ds3
.pattern1_3
  !loop : dw .sub341C : db 2
  !loop : dw .sub343F : db 3
  db 24,$7F
  !cs3
  !cs3
  !f3
  !cs3
  !ds3
  !ds3
  !g3
  !ds3
  !c3
  !c3
  !ds3
  !c3
  !cs3
  !cs3
  !f3
  !cs3
  !as2
  !as2
  !cs3
  !as2
  !c3
  !c3
  !ds3
  !c3
  !cs3
  !cs4
  !gs3
  !cs3
  !ds3
  !ds4
  !as3
  !ds3
  db 96
  !rest
  !loop : dw .sub3462 : db 1
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  db 24,$7F
  !cs3
  !loop : dw .sub3462 : db 1
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
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  db 24,$7F
  !d3
  !loop : dw .sub3475 : db 2
  !loop : dw .sub3499 : db 12
  !transpose,1
  !loop : dw .sub3499 : db 8
  !transpose,0
  !loop : dw .sub34AC : db 4
  !end

.pattern0_4
  !pan,10
  db 30,$7F
  !rest
  !instr,!instr21
  !volume,224
  !loop : dw .sub34BF : db 3
  db 48,$7F
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  db 36
  !c4
  db 60
  !c4
.pattern1_4
  db 96
  !c4
  db 24
  !c4
  db 72
  !c4
  db 96
  !c4
  db 24
  !c4
  db 48
  !c4
  db 12
  !c4
  !c4
  !loop : dw .sub34CC : db 3
  db 96,$7F
  !c4
  db 24
  !c4
  db 48
  !c4
  db 12
  !c4
  !c4
  db 96
  !c4
  db 24
  !c4
  db 48
  !c4
  db 12
  !c4
  db 36
  !c4
  db 72
  !c4
  db 96
  !c4
  !loop : dw .sub34D4 : db 4
  db 36,$7F
  !c4
  !c4
  db 24
  !c4
  !loop : dw .sub34F4 : db 5
  !loop : dw .sub3501 : db 1
  db 12,$7F
  !c4
  db 36
  !c4
  db 24
  !c4
  !loop : dw .sub34F4 : db 1
  !loop : dw .sub3501 : db 1
  db 72,$7F
  !c4
  !loop : dw .sub34F4 : db 12
  !loop : dw .sub350E : db 7
  db 72,$7F
  !c4
  db 120
  !c4
  !loop : dw .sub34F4 : db 4
  !loop : dw .sub3513 : db 7
  db 96,$7F
  !c4
  !c4
  !end

.pattern0_5
  !pan,10
  db 6,$7F
  !rest
  !instr,!instr1F
  !volume,224
  db 12
  !c4
  !c4
  !instr,!instr22
  !volume,196
  !loop : dw .sub3518 : db 3
  db 96,$7F
  !c4
  !tie
  !tie
  !instr,!instr1F
  !volume,224
  db 12
  !c4
  !c4
  db 24
  !c4
  db 12
  !c4
  db 24
  !c4
  db 11
  !c4
  db 1,$7F
  !tie
.pattern1_5
  !loop : dw .sub3522 : db 1
  !instr,!instr22
  !volume,196
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr22
  !volume,196
  !c4
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  db 24
  !c4
  !instr,!instr22
  !volume,196
  db 72
  !c4
  db 36
  !c4
  !instr,!instr1F
  !volume,224
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  db 11
  !c4
  db 1,$7F
  !tie
  !loop : dw .sub357D : db 2
  !loop : dw .sub3594 : db 1
  !loop : dw .sub35B3 : db 1
  !loop : dw .sub357D : db 2
  !loop : dw .sub3594 : db 1
  !loop : dw .sub35B3 : db 1
  !loop : dw .sub357D : db 2
  !loop : dw .sub3594 : db 1
  !loop : dw .sub35B3 : db 1
  !loop : dw .sub357D : db 2
  !loop : dw .sub3594 : db 1
  !loop : dw .sub35B3 : db 1
  !instr,!instr22
  !volume,196
  db 36,$7F
  !c4
  !c4
  db 24
  !c4
  !loop : dw .sub3522 : db 2
  !loop : dw .sub35D9 : db 1
  !instr,!instr22
  !volume,196
  db 24,$7F
  !c4
  !loop : dw .sub35D9 : db 1
  db 12,$7F
  !c4
  db 11
  !c4
  db 1,$7F
  !tie
  !loop : dw .sub3522 : db 6
  !instr,!instr22
  !volume,196
  !loop : dw .sub3627 : db 7
  !loop : dw .sub35B3 : db 1
  !loop : dw .sub3522 : db 2
  !instr,!instr22
  !volume,196
  !loop : dw .sub362C : db 7
  db 96,$7F
  !c4
  db 36
  !c4
  !instr,!instr1F
  !volume,224
  db 12
  !c4
  db 24
  !c4
  db 12
  !c4
  db 11
  !c4
  db 1,$7F
  !tie
  !end

.pattern0_6
  !toggleKeyOffGain
  db 6,$7F
  !rest
  !vibrato,96,12,64
  !pan,20
  !instr,!instr1E
  !volume,118
  db 12
  !c3
  !ds3
  !loop : dw .sub3631 : db 1
  db 24,$7F
  !as3
  db 8
  !rest
  db 16
  !as3
  !rest
  !as3
  !rest
  !loop : dw .sub3631 : db 1
  db 24,$7F
  !as3
  !rest
  !as3
  !as3
.pattern1_6
  !subtranspose,53
  !pan,10
  db 25
  !rest
  !instr,!instr23
  !volume,172
  !loop : dw .sub3179 : db 1
  db 12,$7F
  !f4
  !cs5
  !c5
  !cs5
  !f5
  !cs5
  !c5
  !cs5
  !loop : dw .sub3179 : db 1
  db 12,$7F
  !f4
  !ds5
  !instr,!instr25
  !subtranspose,21
  !transpose,12
  !loop : dw .sub31B4 : db 1
  !loop : dw .sub31EA : db 1
  !transpose,0
  !loop : dw .sub31B4 : db 1
  !loop : dw .sub31F0 : db 1
  db 95,$7F
  !rest
  !subtranspose,53
  db 25
  !rest
  !instr,!instr23
  !loop : dw .sub31F8 : db 1
  !subtranspose,21
  !instr,!instr25
  !loop : dw .sub3238 : db 1
  !subtranspose,53
  db 23,$7F
  !rest
  !instr,!instr23
  !loop : dw .sub326D : db 1
  !loop : dw .sub328D : db 1
  !loop : dw .sub326D : db 1
  db 96,$7F
  !as5
  db 72
  !tie
  !subtranspose,21
  db 1
  !rest
  !instr,!instr25
  !loop : dw .sub329E : db 1
  !subtranspose,53
  db 23,$7F
  !rest
  !instr,!instr23
  !loop : dw .sub32EE : db 1
  db 72,$7F
  !cs5
  !subtranspose,21
  db 1
  !rest
  !instr,!instr25
  !loop : dw .sub3349 : db 1
  !subtranspose,53
  db 23,$7F
  !rest
  !instr,!instr23
  !transpose,3
  !loop : dw .sub3179 : db 1
  !transpose,0
  db 12,$7F
  !gs3
  !e4
  !ds4
  !e4
  !gs4
  !e4
  !ds4
  !e4
  !transpose,3
  !loop : dw .sub3179 : db 1
  !transpose,0
  db 12,$7F
  !gs3
  !e4
  !ds4
  !e4
  !gs4
  !e4
  !end

.sub305F
  db 72,$7F
  !as3
  db 24
  !rest
  db 72
  !g3
  db 24
  !rest
  db 48
  !ds3
  db 24
  !rest
  !f3
  db 16
  !f3
  !rest
  !f3
  !rest
  !gs3
  !rest
  db 24
  !as3
  !rest
  !as3
  !c4
  !ds4
  !c4
  !as3
  !c4
  !end

.sub307E
  db 48,$7F
  !c3
  db 24
  !ds3
  !c3
  !f3
  !ds3
  !c3
  db 120
  !ds3
  db 24
  !rest
  !as2
  !rest
  !b2
  !end

.sub308F
  db 12,$7F
  !f3
  !rest
  !f3
  !rest
  !f3
  !rest
  !f3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !ds3
  !rest
  !ds3
  !rest
  !ds3
  !rest
  !ds3
  !rest
  !f3
  !rest
  !f3
  !rest
  !f3
  !rest
  !f3
  !rest
  !cs3
  !rest
  !cs3
  !rest
  !cs3
  !rest
  !cs3
  !rest
  !ds3
  !rest
  !ds3
  !rest
  !ds3
  !rest
  !ds3
  db 36
  !rest
  db 12
  !f3
  !rest
  !f3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !end

.sub30D2
  db 72,$7F
  !cs3
  db 24
  !rest
  db 72
  !ds3
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  !c3
  db 16
  !cs3
  !rest
  !cs3
  !rest
  !cs3
  !rest
  db 24
  !as2
  !rest
  !as2
  !as2
  !c3
  !c3
  !c3
  !c3
  db 48
  !cs3
  !cs3
  !end

.sub30F4
  db 12,$7F
  !gs3
  !rest
  !gs3
  !rest
  !gs3
  !rest
  !gs3
  !rest
  !as3
  !rest
  !as3
  !rest
  !as3
  !rest
  !as3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !gs3
  !rest
  !gs3
  !rest
  !gs3
  !rest
  !gs3
  !rest
  !f3
  !rest
  !f3
  !rest
  !f3
  !rest
  !f3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  db 36
  !rest
  db 12
  !gs3
  !rest
  !gs3
  !rest
  !as3
  !rest
  !as3
  !rest
  !as3
  !rest
  !as3
  !rest
  !as3
  !rest
  !end

.sub3137
  db 12,$7F
  !f5
  !cs5
  !ds5
  !c5
  !gs4
  !g4
  !ds4
  !f4
  !g5
  !gs5
  !as5
  !ds5
  !f5
  !g5
  !g4
  !ds5
  !c4
  !ds4
  !f4
  !c5
  !g3
  !ds4
  !gs4
  !as4
  !gs4
  !g3
  !cs4
  !ds4
  !f4
  !cs4
  !cs3
  !cs4
  !f4
  !c5
  !as4
  !c5
  !ds5
  !c5
  !as4
  !c5
  !c5
  !ds4
  !c5
  !ds4
  !f4
  !ds4
  !c4
  !ds4
  !cs4
  !gs4
  !g4
  !gs4
  !c5
  !gs4
  !g4
  !gs4
  !ds4
  !as4
  !gs4
  !as4
  !g4
  !as4
  !ds5
  !end

.sub3179
  db 12,$7F
  !f4
  !c5
  !as4
  !c5
  !f5
  !c5
  !as4
  !c5
  !f4
  !cs5
  !c5
  !cs5
  !f5
  !cs5
  !c5
  !cs5
  !f4
  !d5
  !cs5
  !d5
  !f5
  !d5
  !cs5
  !d5
  !f4
  !cs5
  !c5
  !cs5
  !f5
  !cs5
  !c5
  !cs5
  !f4
  !c5
  !as4
  !c5
  !f5
  !c5
  !as4
  !c5
  !f4
  !cs5
  !c5
  !cs5
  !f5
  !cs5
  !c5
  !cs5
  !f4
  !d5
  !cs5
  !d5
  !f5
  !d5
  !cs5
  !d5
  !end

.sub31B4
  db 24,$7F
  !f3
  !gs3
  db 96
  !as3
  !g3
  db 72
  !ds3
  db 24
  !f3
  db 48
  !f3
  db 24
  !f3
  !gs3
  db 48
  !as3
  db 24
  !as3
  !c4
  !ds4
  !c4
  !as3
  !c4
  db 48
  !f4
  !c5
  !g4
  db 24
  !f4
  !gs4
  db 96
  !as4
  !g4
  db 72
  !ds4
  db 24
  !f4
  db 48
  !f4
  db 24
  !f4
  !gs4
  db 48
  !as4
  db 24
  !as4
  !c5
  !ds5
  !c5
  !as4
  !c5
  !end

.sub31EA
  db 120,$7C
  !f5
  db 24
  !rest
  !end

.sub31F0
  db 96,$7C
  !f5
  db 72
  !tie
  db 24
  !rest
  !end

.sub31F8
  db 24,$7F
  !f5
  !c5
  !ds5
  !as4
  !c5
  !gs4
  !as4
  !g4
  db 24,$7F
  !f5
  !c5
  !ds5
  !as4
  !c5
  !gs4
  !as4
  !g4
  db 24,$7F
  !f5
  !c5
  !ds5
  !as4
  !c5
  !gs4
  !g5
  !gs5
  !rest
  !c5
  !g5
  !as4
  !f5
  !gs4
  !ds5
  !g4
  db 24,$7F
  !f5
  !c5
  !ds5
  !as4
  !c5
  !gs4
  !as4
  !g4
  db 24,$7F
  !f5
  !c5
  !ds5
  !as4
  !c5
  !gs4
  !as4
  !g4
  db 24,$7F
  !f5
  !c5
  !ds5
  !as4
  !c5
  !gs4
  !g5
  !gs5
  !rest
  !c5
  !as5
  !g5
  !gs5
  !c5
  !g5
  !end

.sub3238
  db 24,$7F
  !f5
  !c5
  !ds5
  !as4
  !c5
  !gs4
  !as4
  !g4
  db 24,$7F
  !f5
  !c5
  !ds5
  !as4
  !c5
  !gs4
  !as4
  !g4
  db 24,$7F
  !f5
  !c5
  !ds5
  !as4
  !c5
  !gs4
  !g5
  !gs5
  !rest
  !c5
  !g5
  !as4
  !f5
  !gs4
  !ds5
  !g4
  db 24,$7F
  !f5
  !c5
  !ds5
  !as4
  !c5
  !gs4
  !as4
  !g4
  db 24,$7F
  !f5
  !c5
  !ds5
  !as4
  !c5
  !gs4
  !as4
  !g4
  db 96,$7F
  !f5
  !tie
  !tie
  !tie
  !end

.sub326D
  db 48,$7F
  !f5
  db 24
  !as4
  !rest
  db 48
  !f5
  db 24
  !as4
  !rest
  !as4
  !ds5
  !f5
  !gs5
  !f5
  !ds5
  db 36
  !as4
  db 12
  !rest
  db 48
  !f5
  db 24
  !as4
  !rest
  db 48
  !f5
  db 24
  !as4
  !gs5
  !end

.sub328D
  db 24,$7F
  !as5
  !f5
  !gs5
  db 12
  !ds5
  !f5
  !c5
  !ds5
  !f5
  !gs4
  !c5
  !cs5
  db 24
  !f4
  !end

.sub329E
  db 48,$7F
  !f5
  db 24
  !as4
  !rest
  db 48
  !f5
  db 24
  !as4
  !rest
  !as4
  !ds5
  !f5
  !gs5
  !f5
  !ds5
  db 36
  !as4
  db 12
  !rest
  db 48
  !f5
  db 24
  !as4
  !rest
  db 48
  !f5
  db 24
  !as4
  !gs5
  db 48
  !as5
  db 24
  !gs5
  db 12
  !ds5
  !f5
  !c5
  !ds5
  !f5
  !gs4
  !c5
  !cs5
  db 24
  !f4
  db 48
  !f5
  db 24
  !as4
  !rest
  db 48
  !f5
  db 24
  !as4
  !rest
  !as4
  !ds5
  !f5
  !gs5
  !f5
  !ds5
  db 36
  !as4
  db 12
  !rest
  db 48
  !f5
  db 24
  !as4
  !rest
  db 48
  !f5
  db 24
  !as4
  !gs5
  db 96
  !as5
  !tie
  !end

.sub32EE
  db 48,$7F
  !as5
  db 24
  !f5
  !rest
  db 48
  !as5
  db 24
  !f5
  !rest
  db 36
  !c6
  !cs6
  db 24
  !ds6
  !cs6
  !c6
  !gs5
  !rest
  db 12
  !cs4
  !fs4
  !gs4
  !as4
  !cs5
  !fs4
  !as4
  !fs4
  !gs3
  !ds4
  !gs4
  !ds5
  !cs5
  !ds5
  !as4
  !c5
  !as3
  !cs4
  !cs4
  !f4
  !as4
  !c5
  !cs5
  !f5
  !as4
  !c5
  !cs5
  !f5
  !cs5
  !c5
  !as4
  !f4
  db 48
  !as5
  db 24
  !f5
  !rest
  db 48
  !as5
  db 24
  !f5
  !rest
  !f5
  !c6
  !cs6
  !ds6
  !cs6
  !c6
  !gs5
  !rest
  db 12
  !cs4
  !fs4
  !gs4
  !as4
  !cs5
  !fs4
  !as4
  !fs4
  !gs3
  !ds4
  !gs4
  !ds5
  !cs5
  !ds5
  !as4
  !c5
  db 96
  !as5
  !end

.sub3349
  db 48,$7F
  !b5
  db 24
  !fs5
  !rest
  db 48
  !b5
  db 24
  !fs5
  !rest
  db 36
  !cs6
  !d6
  db 24
  !e6
  !d6
  !cs6
  !a5
  !rest
  db 12
  !d4
  !g4
  !a4
  !b4
  !d5
  !g4
  !b4
  !g4
  !a3
  !e4
  !a4
  !e5
  !d5
  !e5
  !b4
  !cs5
  !b3
  !d4
  !d4
  !fs4
  !b4
  !cs5
  !d5
  !fs5
  !b4
  !cs5
  !d5
  !fs5
  !d5
  !cs5
  !b4
  !fs4
  db 48
  !b5
  db 24
  !fs5
  !rest
  db 48
  !b5
  db 24
  !fs5
  !rest
  !fs5
  !cs6
  !d6
  !e6
  !d6
  !cs6
  !a5
  !rest
  db 12
  !d4
  !g4
  !a4
  !b4
  !d5
  !g4
  !b4
  !g4
  !a3
  !e4
  !a4
  !e5
  !d5
  !e5
  !b4
  !cs5
  db 72
  !b5
  db 24
  !rest
  db 96
  !d6
  db 48
  !b5
  db 24
  !fs5
  !rest
  db 48
  !b5
  db 24
  !fs5
  !rest
  db 36
  !cs6
  !d6
  db 24
  !e6
  !d6
  !cs6
  !a5
  !rest
  db 48
  !b5
  db 24
  !fs5
  !rest
  db 48
  !b5
  db 24
  !fs5
  !cs6
  !d6
  !fs5
  !cs6
  db 12
  !fs5
  !b5
  !cs5
  !cs5
  !d5
  !d5
  !e5
  !fs5
  db 24
  !a5
  db 48
  !b5
  db 24
  !fs5
  !rest
  db 48
  !b5
  db 24
  !fs5
  !rest
  !fs5
  !cs6
  !d6
  !e6
  !d6
  !cs6
  !a5
  !rest
  db 12
  !d4
  !g4
  !a4
  !b4
  !d5
  !g4
  !b4
  !g4
  !a3
  !e4
  !a4
  !e5
  !d5
  !e5
  !b4
  !cs5
  db 96
  !b5
  !tie
  !end

.sub33F9
  db 24,$7F
  !cs3
  !rest
  !cs3
  !rest
  !ds3
  !rest
  !ds3
  !rest
  !c3
  !rest
  !c3
  !rest
  db 16
  !cs3
  !rest
  !cs3
  !rest
  !cs3
  !rest
  db 24
  !as2
  !rest
  !as2
  !rest
  !c3
  !rest
  !c3
  !rest
  !cs3
  !rest
  !cs3
  !rest
  !end

.sub341C
  db 24,$7F
  !f3
  !f3
  !gs3
  !f3
  !f3
  !f3
  !as3
  !f3
  !f3
  !f3
  !c4
  !f3
  !f3
  !f3
  !as3
  !f3
  !f3
  !f3
  !gs3
  !f3
  !f3
  !f3
  !as3
  !f3
  !f3
  !f3
  !c4
  !f3
  !f3
  !f3
  !as3
  !f3
  !end

.sub343F
  db 24,$7F
  !cs3
  !cs3
  !f3
  !cs3
  !ds3
  !ds3
  !g3
  !ds3
  !c3
  !c3
  !ds3
  !c3
  !cs3
  !cs3
  !f3
  !cs3
  !as2
  !as2
  !cs3
  !as2
  !c3
  !c3
  !ds3
  !c3
  !cs3
  !cs4
  !gs3
  !cs3
  !e3
  !e4
  !as3
  !e3
  !end

.sub3462
  db 24,$7F
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !end

.sub3475
  db 24,$7F
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  db 36
  !f3
  !f3
  db 48
  !f3
  db 24
  !f3
  !f3
  !f3
  !end

.sub3499
  db 24,$7F
  !fs3
  !fs3
  !fs3
  !fs3
  !gs3
  !gs3
  !gs3
  !gs3
  !as3
  !as3
  !as3
  !as3
  !as3
  !as3
  !as3
  !as3
  !end

.sub34AC
  db 24,$7F
  !gs3
  !gs3
  !b3
  !gs3
  !gs3
  !gs3
  !cs4
  !gs3
  !gs3
  !gs3
  !ds4
  !gs3
  !gs3
  !gs3
  !cs4
  !gs3
  !end

.sub34BF
  db 48,$7F
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  db 32
  !c4
  !c4
  !c4
  !end

.sub34CC
  db 96,$7F
  !c4
  db 24
  !c4
  db 72
  !c4
  !end

.sub34D4
  db 84,$7F
  !c4
  db 36
  !c4
  db 12
  !c4
  db 60
  !c4
  db 84
  !c4
  db 36
  !c4
  db 12
  !c4
  db 36
  !c4
  db 24
  !c4
  db 84
  !c4
  db 36
  !c4
  db 12
  !c4
  db 60
  !c4
  db 72
  !c4
  db 120
  !c4
  !end

.sub34F4
  db 96,$7F
  !c4
  db 24
  !c4
  db 72
  !c4
  !c4
  db 48
  !c4
  db 72
  !c4
  !end

.sub3501
  db 96,$7F
  !c4
  db 24
  !c4
  db 72
  !c4
  db 36
  !c4
  !c4
  db 48
  !c4
  !end

.sub350E
  db 96,$7F
  !c4
  !tie
  !end

.sub3513
  db 96,$7F
  !c4
  !tie
  !end

.sub3518
  db 96,$7F
  !c4
  !tie
  !tie
  db 32
  !tie
  !c4
  !c4
  !end

.sub3522
  !instr,!instr22
  !volume,196
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr22
  !volume,196
  !c4
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  db 24
  !c4
  db 12
  !c4
  db 11
  !c4
  db 1,$7F
  !tie
  !end

.sub357D
  !instr,!instr22
  !volume,196
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !end

.sub3594
  !instr,!instr22
  !volume,196
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  db 12
  !c4
  !instr,!instr26
  !volume,224
  !as4
  !g4
  !e4
  !end

.sub35B3
  !instr,!instr22
  !volume,196
  db 24,$7F
  !c4
  !instr,!instr26
  !volume,224
  db 12
  !as4
  !g4
  db 24
  !e4
  !instr,!instr22
  !volume,196
  db 48
  !c4
  !instr,!instr26
  !volume,224
  db 12
  !as4
  !as4
  !g4
  !g4
  !e4
  db 11
  !e4
  db 1,$7F
  !tie
  !end

.sub35D9
  !instr,!instr22
  !volume,196
  db 48,$7F
  !c4
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr22
  !volume,196
  !c4
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr24
  !volume,162
  !c5
  !instr,!instr1F
  !volume,224
  !c4
  !instr,!instr22
  !volume,196
  db 36
  !c4
  !c4
  db 72
  !c4
  !instr,!instr1F
  !volume,224
  db 24
  !c4
  !end

.sub3627
  db 96,$7F
  !c4
  !tie
  !end

.sub362C
  db 96,$7F
  !c4
  !tie
  !end

.sub3631
  db 72,$7F
  !f3
  db 24
  !rest
  db 72
  !as3
  db 24
  !rest
  db 48
  !g3
  db 24
  !rest
  !g3
  db 16
  !gs3
  !rest
  !gs3
  !rest
  !gs3
  !rest
  db 24
  !f3
  !rest
  !f3
  !f3
  !g3
  !g3
  !g3
  !g3
  db 48
  !gs3
  !gs3
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
