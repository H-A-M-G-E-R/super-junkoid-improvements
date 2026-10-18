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
  db !sample17,$FF,$EC,$B8,$14,$C0
  db !sample15,$FF,$E0,$B8,$05,$02
  db !sample14,$FF,$EC,$B8,$23,$10
  db !sample1A,$FF,$E0,$B8,$08,$9D
  db !sample19,$FF,$F1,$B6,$09,$8A
  db !sample18,$FF,$E0,$B8,$0B,$84
  db !sample16,$FF,$E0,$B8,$07,$9F
  db !sample1B,$FA,$E3,$B8,$07,$F6
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+1809
  dw Sample15,Sample15+2277
  dw Sample16,Sample16+2259
  dw Sample17,Sample17+1746
  dw Sample18,Sample18+3609
  dw Sample19,Sample19+1800
  dw Sample1A,Sample1A+0
  dw Sample1B,Sample1B+27
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "2a.brr":2..0
  Sample15: incbin "2b.brr":2..0
  Sample16: incbin "2c.brr":2..0
  Sample17: incbin "2e.brr":2..0
  Sample18: incbin "25.brr":2..0
  Sample19: incbin "27.brr":2..0
  Sample1A: incbin "Kick.brr":2..0
  Sample1B: incbin "04_saw.brr":2..0

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
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern0_6, 0

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !musicVolume,160
  !tempo,76
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%01001111,96,80
  !echoParameters,2,60,3
  !remoteCode : dw .remoteCode2FEB : db -1,0
  !remoteCode : dw .remoteCode2FEF : db 3,0
.pattern1_0:
  !instr,!instr1E
  !volume,196
  !pan,0
  !loop : dw .sub301B : db 1
  db 36,$7F
  !b3
  !loop : dw .sub3026 : db 1
  db 36,$7F
  !b3
  db 24
  !cs4
  db 36
  !gs3
  !e4
  db 24
  !ds4
  db 36
  !cs4
  !b3
  db 24
  !cs4
  db 96
  !fs3
  db 48
  !tie
  !rest
  !loop : dw .sub301B : db 1
  db 36,$7F
  !gs4
  !loop : dw .sub3026 : db 1
  db 36,$7F
  !fs4
  db 24
  !gs4
  db 96
  !f4
  !tie
  db 96
  !rest
  !tie
  !loop : dw .sub3030 : db 2
  !pan,0
  !instr,!instr1E
  !subtranspose,0
  !volume,162
  db 48,$7F
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 72
  !rest
  db 48
  !ds3
  db 24
  !rest
  db 48
  !ds3
  db 72
  !rest
  db 48
  !e3
  !rest
  !ds3
  !rest
  !subloop,0
  db 48,$7F
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 72
  !rest
  !subloop,1
  db 48,$7F
  !ds3
  db 24
  !rest
  db 48
  !ds3
  db 72
  !rest
  !subloop,0
  db 48,$7F
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 72
  !rest
  !subloop,1
  !end

.pattern0_1
  !remoteCode : dw .remoteCode2FF3 : db -1,0
  !remoteCode : dw .remoteCode2FF7 : db 3,0
.pattern1_1:
  !pan,20
  !instr,!instr1E
  !volume,196
  !loop : dw .sub3090 : db 1
  db 36,$7F
  !fs3
  !loop : dw .sub309B : db 1
  db 36,$7F
  !fs3
  db 24
  !gs3
  db 36
  !e3
  !cs4
  db 24
  !b3
  db 36
  !gs3
  !e3
  db 24
  !fs3
  db 96
  !cs3
  db 48
  !tie
  !rest
  !loop : dw .sub3090 : db 1
  db 36,$7F
  !ds4
  !loop : dw .sub309B : db 1
  db 36,$7F
  !cs4
  db 24
  !ds4
  db 96
  !cs4
  !tie
  db 96
  !rest
  !tie
  !loop : dw .sub30A5 : db 2
  !pan,20
  !subtranspose,0
  !instr,!instr1E
  !volume,162
  db 48,$7F
  !e3
  db 24
  !rest
  db 48
  !e3
  db 72
  !rest
  db 48
  !fs3
  db 24
  !rest
  db 48
  !fs3
  db 72
  !rest
  db 48
  !gs3
  !rest
  !fs3
  !rest
  !subloop,0
  db 48,$7F
  !e3
  db 24
  !rest
  db 48
  !e3
  db 72
  !rest
  !subloop,1
  db 48,$7F
  !fs3
  db 24
  !rest
  db 48
  !fs3
  db 72
  !rest
  !subloop,0
  db 48,$7F
  !e3
  db 24
  !rest
  db 48
  !e3
  db 72
  !rest
  !subloop,1
  !end

.pattern0_2
  !remoteCode : dw .remoteCode2FFB : db -1,0
  !remoteCode : dw .remoteCode2FFF : db 3,0
.pattern1_2:
  !subloop,0
  db 96,$7F
  !rest
  !tie
  !subloop,5
  !instr,!instr25
  !vibrato,16,12,60
  !volume,118
  db 4,$7F
  !cs4
  db 8
  !rest
  db 4
  !ds4
  db 8
  !rest
  db 4
  !f4
  db 8
  !rest
  db 4
  !fs4
  db 8
  !rest
  db 4
  !f4
  db 8
  !rest
  db 4
  !ds4
  db 8
  !rest
  db 4
  !cs4
  db 8
  !rest
  db 4
  !f4
  db 8
  !rest
  db 4
  !cs5
  db 8
  !rest
  db 4
  !ds5
  db 8
  !rest
  db 4
  !gs5
  db 8
  !rest
  db 4
  !cs6
  db 8
  !rest
  db 4
  !cs6
  db 20
  !rest
  db 4
  !f5
  db 8
  !rest
  db 4
  !gs5
  db 8
  !rest
  db 4
  !gs5
  db 8
  !rest
  db 4
  !ds5
  db 8
  !rest
  db 4
  !cs5
  db 8
  !rest
  db 4
  !ds5
  db 8
  !rest
  db 4
  !gs4
  db 8
  !rest
  db 4
  !fs4
  db 8
  !rest
  db 4
  !f4
  db 8
  !rest
  db 4
  !ds4
  db 8
  !rest
  db 4
  !cs4
  db 8
  !rest
  db 4
  !ds4
  db 8
  !rest
  db 4
  !f4
  db 8
  !rest
  db 4
  !fs4
  db 8
  !rest
  db 4
  !gs4
  db 8
  !rest
  db 4
  !fs4
  db 8
  !rest
  db 4
  !f4
  db 8
  !rest
  db 4
  !ds4
  db 8
  !rest
  !volume,141
  !loop : dw .sub3103 : db 1
  !loop : dw .sub3124 : db 1
  db 96,$7F
  !gs5
  !tie
  !tie
  db 48
  !tie
  !rest
  !loop : dw .sub3103 : db 1
  !loop : dw .sub3124 : db 1
  db 96,$7F
  !gs5
  !tie
  !tie
  !instr,!instr1F
  !vibrato,32,11,70
  !volume,124
  db 24
  !gs5
  !rest
  !b5
  !rest
  !loop : dw .sub3134 : db 1
  db 36,$7F
  !b5
  db 24
  !gs5
  !rest
  !gs5
  !e6
  !ds6
  db 36
  !b5
  !fs5
  db 24
  !ds5
  !e5
  !rest
  !ds5
  !b5
  !e5
  !rest
  !ds5
  !b5
  db 96
  !cs6
  !rest
  !loop : dw .sub3134 : db 1
  db 36,$7F
  !gs6
  db 24
  !cs6
  !rest
  !cs6
  !ds6
  !e6
  db 36
  !fs6
  !gs6
  db 24
  !b6
  !gs6
  !e7
  !fs6
  !ds7
  !e6
  !cs7
  !ds6
  !b6
  db 96
  !e6
  db 48
  !tie
  !rest
  !end

.pattern0_3
  !remoteCode : dw .remoteCode3003 : db -1,0
  !remoteCode : dw .remoteCode3007 : db 3,0
.pattern1_3:
  !instr,!instr1F
  !volume,98
  !loop : dw .sub313F : db 16
  !end

.pattern0_4
  !remoteCode : dw .remoteCode3013 : db -1,0
  !remoteCode : dw .remoteCode3017 : db 3,0
  !instr,!instr20
  !volume,224
.pattern1_4:
  !loop : dw .sub3162 : db 1
  db 72,$7F
  !cs3
  db 24
  !rest
  db 72
  !b2
  db 24
  !rest
  db 48
  !as2
  db 24
  !rest
  db 48
  !as2
  db 24
  !rest
  !as2
  !rest
  !loop : dw .sub3162 : db 1
  db 48,$7F
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 24
  !rest
  !cs3
  !rest
  !cs3
  !rest
  !subloop,0
  !loop : dw .sub3178 : db 1
  db 24,$7F
  !a2
  !loop : dw .sub3178 : db 1
  db 24,$7F
  !b2
  !loop : dw .sub3182 : db 2
  db 24,$7F
  !fs2
  !rest
  !fs2
  !rest
  !fs2
  !fs2
  !rest
  !fs2
  !gs2
  !rest
  !gs2
  !rest
  !a2
  !a2
  !rest
  !b2
  !loop : dw .sub318D : db 2
  !subloop,1
  !loop : dw .sub3162 : db 1
  db 72,$7F
  !cs3
  db 24
  !rest
  db 72
  !b2
  db 24
  !rest
  db 48
  !as2
  db 24
  !rest
  db 48
  !as2
  db 24
  !rest
  !as2
  !rest
  !loop : dw .sub3162 : db 1
  db 48,$7F
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 24
  !rest
  !cs3
  !rest
  !cs3
  !rest
  !end

.pattern0_5
  !volume,224
.pattern1_5:
  !instr,!instr21
  !loop : dw .sub3198 : db 1
  db 24,$7F
  !c5
  db 48
  !c5
  !c5
  !instr,!instr23
  db 24
  !c5
  !instr,!instr21
  db 48
  !c5
  !loop : dw .sub3198 : db 1
  db 24,$7F
  !c5
  !c5
  !instr,!instr24
  !e4
  !d4
  !c4
  !instr,!instr21
  db 36
  !c5
  !instr,!instr23
  !c5
  !instr,!instr21
  !loop : dw .sub31A7 : db 1
  db 24,$7F
  !c5
  !c5
  !instr,!instr23
  db 36
  !c5
  !instr,!instr21
  db 12
  !c5
  db 24
  !c5
  !instr,!instr23
  !c5
  !c5
  !instr,!instr21
  !c5
  !loop : dw .sub31A7 : db 1
  db 24,$7F
  !c5
  !c5
  !instr,!instr24
  !e4
  !d4
  !c4
  !instr,!instr23
  !c5
  !c5
  !c5
  !loop : dw .sub31BD : db 1
  !loop : dw .sub31FC : db 1
  !subloop,0
  !loop : dw .sub31BD : db 1
  !loop : dw .sub31FC : db 1
  !subloop,3
  !loop : dw .sub31BD : db 1
  !instr,!instr21
  db 36,$7F
  !c5
  db 12
  !c5
  !instr,!instr23
  db 24
  !c5
  !instr,!instr21
  db 12
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  !instr,!instr23
  db 24
  !c5
  db 12
  !c5
  !c5
  !instr,!instr21
  db 36
  !c5
  db 12
  !c5
  !instr,!instr24
  !g4
  !fs4
  !fs4
  !f4
  !f4
  !e4
  !e4
  !ds4
  !ds4
  !d4
  !d4
  db 11
  !cs4
  db 1,$7F
  !tie
  !end

.pattern0_6
  !remoteCode : dw .remoteCode2FEA : db 0,0
  !volume,224
  !instr,!instr22
  !subloop,0
  db 96,$7F
  !f4
  !tie
  !subloop,2
  db 60,$7F
  !f4
  !instr,!instr24
  !volume,224
  db 24
  !ds4
  db 60
  !cs4
  !instr,!instr23
  db 24
  !c5
  !c5
  !volume,196
  !instr,!instr22
  !subloop,0
  db 96,$7F
  !f4
  !tie
  !subloop,2
  db 60,$7F
  !f4
  !instr,!instr24
  !volume,224
  db 24
  !ds4
  !cs4
  !c4
  !instr,!instr23
  !c5
  !c5
  db 11
  !c5
  db 1,$7F
  !tie
  !instr,!instr22
  !volume,144
  !subloop,0
  db 96,$7F
  !f4
  !tie
  !subloop,14
  db 96,$7F
  !c5
  !instr,!instr25
  !vibrato,16,12,60
  !volume,108
  !instr,!instr1F
  !vibrato,32,11,70
  !remoteCode : dw .remoteCode300B : db -1,0
  !remoteCode : dw .remoteCode300F : db 3,0
  !volume,124
  db 24
  !e5
  !rest
  !fs5
  !rest
  !loop : dw .sub323A : db 1
  db 36,$7F
  !fs5
  db 24
  !ds5
  !rest
  !ds5
  !b5
  !as5
  db 36
  !fs5
  !cs5
  db 24
  !as4
  !b4
  !rest
  !as4
  !fs5
  !b4
  !rest
  !as4
  !fs5
  db 96
  !gs5
  !rest
  !loop : dw .sub323A : db 1
  db 36,$7F
  !ds6
  db 24
  !gs5
  !rest
  !gs5
  !as5
  !b5
  db 36
  !cs6
  !ds6
  db 24
  !fs6
  !ds6
  !b6
  !cs6
  !as6
  !b5
  !gs6
  !as5
  !fs6
  db 96
  !b5
  db 48
  !tie
  !rest
  !end

.sub301B
  db 48,$7F
  !cs4
  db 24
  !rest
  db 12
  !cs4
  !cs4
  db 36
  !cs4
  !end

.sub3026
  db 24,$7F
  !cs4
  !rest
  !cs4
  !cs4
  !rest
  db 36
  !cs4
  !end

.sub3030
  !pan,0
  !instr,!instr1E
  !subtranspose,0
  !volume,162
  !subloop,0
  db 48,$7F
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 72
  !rest
  !subloop,1
  !subloop,0
  db 48,$7F
  !e3
  db 24
  !rest
  db 48
  !e3
  db 72
  !rest
  !subloop,1
  !pan,10
  !subtranspose,8
  !instr,!instr1F
  !volume,118
  db 1,$7F
  !rest
  db 12
  !fs5
  !rest
  !a5
  !rest
  !cs6
  !rest
  !fs5
  !rest
  !a5
  !rest
  !cs6
  !rest
  !fs5
  !rest
  !a5
  !rest
  !gs5
  !rest
  !b5
  !rest
  !ds6
  !rest
  !gs5
  !rest
  !b5
  !rest
  !ds6
  !rest
  !gs5
  !rest
  !b5
  !rest
  !subloop,0
  db 12,$7F
  !cs6
  !rest
  !e6
  !rest
  !gs6
  !rest
  !subloop,4
  db 12,$7F
  !e6
  db 11
  !rest
  !end

.sub3090
  db 48,$7F
  !gs3
  db 24
  !rest
  db 12
  !gs3
  !gs3
  db 36
  !gs3
  !end

.sub309B
  db 24,$7F
  !gs3
  !rest
  !gs3
  !gs3
  !rest
  db 36
  !gs3
  !end

.sub30A5
  !pan,20
  !instr,!instr1E
  !subtranspose,0
  !volume,162
  !subloop,0
  db 48,$7F
  !e3
  db 24
  !rest
  db 48
  !e3
  db 72
  !rest
  !subloop,1
  !subloop,0
  db 48,$7F
  !gs3
  db 24
  !rest
  db 48
  !gs3
  db 72
  !rest
  !subloop,1
  !pan,10
  !subtranspose,32
  !instr,!instr1F
  !volume,81
  db 13,$7F
  !rest
  db 12
  !fs5
  !rest
  !a5
  !rest
  !cs6
  !rest
  !fs5
  !rest
  !a5
  !rest
  !cs6
  !rest
  !fs5
  !rest
  !a5
  !rest
  !gs5
  !rest
  !b5
  !rest
  !ds6
  !rest
  !gs5
  !rest
  !b5
  !rest
  !ds6
  !rest
  !gs5
  !rest
  !b5
  !rest
  !subloop,0
  db 12,$7F
  !cs6
  !rest
  !e6
  !rest
  !gs6
  !rest
  !subloop,4
  db 11,$7F
  !e6
  !end

.sub3103
  db 24,$7F
  !cs5
  !ds5
  !e5
  !gs5
  !rest
  !gs5
  !fs5
  !ds5
  !e5
  !ds5
  db 96
  !cs5
  db 48
  !rest
  db 24
  !cs5
  !ds5
  !e5
  !gs5
  !rest
  !gs5
  !fs5
  !e5
  !fs5
  !rest
  !b5
  !rest
  db 48
  !gs5
  !rest
  !end

.sub3124
  db 24,$7F
  !cs5
  !ds5
  !e5
  !gs5
  !rest
  !gs5
  !ds6
  !e6
  db 72
  !ds6
  !b5
  db 48
  !a5
  !end

.sub3134
  db 48,$7F
  !cs6
  db 24
  !rest
  db 12
  !cs6
  !cs6
  db 36
  !cs6
  !end

.sub313F
  db 12,$7F
  !cs6
  !rest
  !fs6
  !rest
  !gs6
  !rest
  !b6
  !rest
  !gs6
  !rest
  !fs6
  !rest
  !cs6
  !rest
  !fs6
  !rest
  !gs6
  !rest
  !b6
  !rest
  !gs6
  !rest
  !fs6
  !rest
  !ds6
  !rest
  !e6
  !rest
  !ds6
  !rest
  !b5
  !rest
  !end

.sub3162
  db 48,$7F
  !a2
  db 24
  !rest
  db 48
  !a2
  db 24
  !rest
  !a2
  !rest
  db 48
  !b2
  db 24
  !rest
  db 48
  !b2
  db 24
  !rest
  !b2
  !rest
  !end

.sub3178
  db 24,$7F
  !a2
  !rest
  !a2
  !rest
  !a2
  !a2
  !rest
  !end

.sub3182
  db 24,$7F
  !cs3
  !rest
  !cs3
  !rest
  !cs3
  !cs3
  !rest
  !cs3
  !end

.sub318D
  db 24,$7F
  !cs3
  !rest
  !cs3
  !rest
  !cs3
  !cs3
  !rest
  !cs3
  !end

.sub3198
  db 24,$7F
  !c5
  db 48
  !c5
  !c5
  db 24
  !c5
  !instr,!instr23
  !c5
  !instr,!instr21
  !c5
  !end

.sub31A7
  db 24,$7F
  !c5
  !c5
  !instr,!instr23
  db 36
  !c5
  !instr,!instr21
  db 12
  !c5
  db 24
  !c5
  !c5
  !instr,!instr23
  !c5
  !instr,!instr21
  !c5
  !end

.sub31BD
  !instr,!instr21
  db 36,$7F
  !c5
  db 12
  !c5
  !instr,!instr23
  db 24
  !c5
  !instr,!instr21
  db 12
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  !instr,!instr23
  db 24
  !c5
  db 12
  !c5
  db 11
  !c5
  db 1,$7F
  !tie
  !instr,!instr21
  db 24
  !c5
  db 12
  !c5
  !c5
  !instr,!instr23
  db 24
  !c5
  !instr,!instr21
  db 12
  !c5
  !c5
  !c5
  !instr,!instr23
  !c5
  db 24
  !c5
  !c5
  db 12
  !c5
  db 11
  !c5
  db 1,$7F
  !tie
  !end

.sub31FC
  !instr,!instr21
  db 36,$7F
  !c5
  db 12
  !c5
  !instr,!instr23
  db 24
  !c5
  !instr,!instr21
  db 12
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  !instr,!instr23
  db 24
  !c5
  db 12
  !c5
  db 11
  !c5
  db 1,$7F
  !tie
  !instr,!instr21
  db 36
  !c5
  db 12
  !c5
  !instr,!instr23
  db 24
  !c5
  !instr,!instr21
  db 12
  !c5
  !c5
  !instr,!instr23
  !c5
  !c5
  db 24
  !c5
  !c5
  db 12
  !c5
  db 11
  !c5
  db 1,$7F
  !tie
  !end

.sub323A
  db 48,$7F
  !gs5
  db 24
  !rest
  db 12
  !gs5
  !gs5
  db 36
  !gs5
  !end

.remoteCode2FEB
  !setInstrumentByte,$01,$FF ; !addmusicWriteDsp,$05,$FF
  !end

.remoteCode2FEF
  !setInstrumentByte,$01,$00 ; !addmusicWriteDsp,$05,$00
  !end

.remoteCode2FF3
  !setInstrumentByte,$01,$FF ; !addmusicWriteDsp,$15,$FF
  !end

.remoteCode2FF7
  !setInstrumentByte,$01,$00 ; !addmusicWriteDsp,$15,$00
  !end

.remoteCode2FFB
  !setInstrumentByte,$01,$FF ; !addmusicWriteDsp,$25,$FF
  !end

.remoteCode2FFF
  !setInstrumentByte,$01,$00 ; !addmusicWriteDsp,$25,$00
  !end

.remoteCode3003
  !setInstrumentByte,$01,$FF ; !addmusicWriteDsp,$35,$FF
  !end

.remoteCode3007
  !setInstrumentByte,$01,$00 ; !addmusicWriteDsp,$35,$00
  !end

.remoteCode3013
  !setInstrumentByte,$01,$FF ; !addmusicWriteDsp,$45,$FF
  !end

.remoteCode3017
  !setInstrumentByte,$01,$00 ; !addmusicWriteDsp,$45,$00
  !end

.remoteCode2FEA
  !end

.remoteCode300B
  !setInstrumentByte,$01,$FF ; !addmusicWriteDsp,$65,$FF
  !end

.remoteCode300F
  !setInstrumentByte,$01,$00 ; !addmusicWriteDsp,$65,$00
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
