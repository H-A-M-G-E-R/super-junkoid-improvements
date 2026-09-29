; Originally by Toby Fox, arranged by qantuum (https://www.smwcentral.net/?p=section&a=details&id=26036)
; Requires noise instruments to be enabled
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

!sample00 = $16
!sample08 = $17
!sample0C = $18
!sample13 = $19
!sample14 = $1A
!sample15 = $1B
!sample16 = $1C
!sample17 = $1D

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample00,$FF,$60,$00,$06,$00
  db !sample08,$FC,$81,$00,$03,$00
  db !sample14,$EF,$E0,$7F,$06,$00
  db !sample0C,$CB,$E0,$B8,$03,$00
  db !sample15,$FF,$A0,$00,$06,$80
  db !sample16,$FF,$E0,$00,$04,$80
  db !sample13,$00,$00,$DF,$13,$00
  db $9F,$CF,$1D,$00,$06,$00
  db !sample17,$FF,$F2,$00,$05,$80
  db !sample0C,$DF,$6E,$B8,$03,$00
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample00,Sample00+36
  dw Sample08,Sample08+36
  dw Sample0C,Sample0C+36
  dw Sample13,Sample13+0
  dw Sample14,Sample14+27
  dw Sample15,Sample15+8433
  dw Sample16,Sample16+3150
  dw Sample17,Sample17+1206
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample00: incbin "Sample_22402e2a3eb504d235368cf3d8515aec.brr"
  Sample08: incbin "Sample_76cf21864e2caf209c0abf24ad7c26f3.brr"
  Sample0C: incbin "Sample_410da31f00acd2c10200c79c31c5c32d.brr"
  Sample13: incbin "Sample_a04ae8fd63f3bc0e9355dc70e10cdda3.brr"
  Sample14: incbin "Sample_71cbe2ad4f36e473ab8d2e4ba9a101e9.brr"
  Sample15: incbin "Sample_6605e59ed09b10086a7318a867faaee9.brr"
  Sample16: incbin "Sample_0e98ebb7211aab174863c3b3e09db844.brr"
  Sample17: incbin "Sample_cef895ad4985cd832bdb41b962c48489.brr"

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2E6A

Tracker2E6A:
-
  dw .pattern0
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  ;!addmusicFA,4,3
  ;!addmusicFA,6,1
  !echo,%00100110,67,67
  !echoParameters,3,80,0
  !musicVolume,255;185
  !tempo,52
  !instr,!instr1E
  !pan,9
  !volume,35
  !dynamicVolume,192,64
  !loop : dw .sub3259 : db 1
  !dynamicVolume,192,100
  !loop : dw .sub326C : db 1
  !dynamicVolume,192,150
  !loop : dw .sub3259 : db 1
  !dynamicVolume,192,200
  !loop : dw .sub326C : db 1
  !volume,200
  !loop : dw .sub327F : db 1
  !loop : dw .sub32A2 : db 1
  !loop : dw .sub32C5 : db 2
  !loop : dw .sub327F : db 1
  !loop : dw .sub32A2 : db 1
  !loop : dw .sub32C5 : db 2
  !loop : dw .sub32A2 : db 2
  !loop : dw .sub3259 : db 1
  !loop : dw .sub326C : db 1
  !loop : dw .sub32E8 : db 1
  !instr,!instr1F
  !volume,155
  !loop : dw .sub330B : db 1
  !instr,!instr1E
  !volume,200
  !loop : dw .sub3259 : db 1
  !loop : dw .sub326C : db 1
  !loop : dw .sub3259 : db 1
  !loop : dw .sub326C : db 1
  !loop : dw .sub327F : db 2
  !loop : dw .sub32A2 : db 1
  !loop : dw .sub3339 : db 1
  !loop : dw .sub335E : db 16
  !loop : dw .sub3362 : db 1
  !loop : dw .sub32A2 : db 2
  !loop : dw .sub3259 : db 1
  !loop : dw .sub326C : db 1
  !loop : dw .sub3385 : db 1
  !loop : dw .sub32A2 : db 2
  db 96,$6F
  !ds4
  !tie
  !tie
  db 48
  !tie
  !cs4
  !loop : dw .sub33A8 : db 2
  !loop : dw .sub33AC : db 4
  db 2,$6F
  !rest
  !end

.pattern0_1
  !loop : dw .sub33B0 : db 8
  !instr,!instr20
  !vibrato,9,24,15
  !loop : dw .sub33B4 : db 1
  !instr,!instr21
  !volume,200
  !pan,10
  db 96,$7F
  !as5
  !tie
  db 48
  !tie
  !c6
  !cs6
  !ds6
  !pitchSlide,48,48 : !f6
  db 96
  !tie
  !tie
  !ds6
  !cs6
  db 96
  !c6
  !tie
  !tie
  db 48
  !tie
  !as5
  !pitchSlide,48,48 : !c6
  db 96
  !tie
  !tie
  db 48
  !tie
  !as5
  !c6
  !ds6
  !volume,145
  !loop : dw .sub33D4 : db 1
  db 96,$7F
  !ds7
  !tie
  db 48
  !tie
  !as6
  !c7
  !ds7
  !instr,!instr20
  !volume,255
  !pan,9
  !transpose,1
  !loop : dw .sub340D : db 1
  !transpose,3
  !loop : dw .sub340D : db 1
  !transpose,0
  !loop : dw .sub340D : db 1
  !loop : dw .sub341B : db 8
  !instr,!instr21
  !volume,145
  !pan,10
  !loop : dw .sub33D4 : db 1
  db 96,$7F
  !ds7
  !tie
  !tie
  !tie
  !loop : dw .sub341F : db 1
  !volume,200
  db 96,$7F
  !as5
  !tie
  db 48
  !tie
  !c6
  !cs6
  !ds6
  !pitchSlide,48,48 : !f6
  db 96
  !tie
  !tie
  !ds6
  !cs6
  db 96
  !c6
  !tie
  !tie
  db 48
  !tie
  !gs5
  !pitchSlide,42,42 : !as5
  db 96
  !tie
  !tie
  !tie
  !tie
  !loop : dw .sub341F : db 1
  !instr,!instr20
  !volume,255
  !pan,9
  !transpose,254
  !loop : dw .sub340D : db 1
  !transpose,0
  !loop : dw .sub3444 : db 1
  !loop : dw .sub3455 : db 1
  db 2,$7F
  !rest
  !end

.pattern0_2
  !loop : dw .sub3467 : db 24
  !instr,!instr20
  !vibrato,9,24,15
  !loop : dw .sub33B4 : db 1
  !transpose,254
  !loop : dw .sub340D : db 1
  !transpose,0
  !loop : dw .sub3444 : db 1
  db 96,$7F
  !f3
  !tie
  !tie
  db 48
  !tie
  !ds3
  db 96
  !f3
  !tie
  db 48
  !tie
  !ds3
  !f3
  !gs3
  !instr,!instr1F
  !vibrato,9,4,20
  !volume,255
  !transpose,12
  !loop : dw .sub330B : db 1
  !transpose,0
  !loop : dw .sub346B : db 1
  !loop : dw .sub3485 : db 1
  !loop : dw .sub346B : db 1
  !instr,!instr20
  !vibrato,9,24,15
  !volume,255
  db 96,$7F
  !fs3
  !tie
  !tie
  !tie
  db 96
  !gs3
  !tie
  !tie
  !tie
  db 96
  !f3
  !tie
  !tie
  !tie
  db 96
  !as3
  !tie
  db 96
  !gs3
  !tie
  !transpose,1
  !loop : dw .sub340D : db 1
  !transpose,3
  !loop : dw .sub340D : db 1
  !transpose,0
  !loop : dw .sub340D : db 1
  !loop : dw .sub34B3 : db 8
  !transpose,254
  !loop : dw .sub340D : db 1
  !transpose,0
  !loop : dw .sub3444 : db 1
  !loop : dw .sub3455 : db 1
  !instr,!instr1F
  !vibrato,9,4,20
  !volume,255
  !loop : dw .sub3485 : db 1
  !loop : dw .sub346B : db 1
  db 2,$7F
  !rest
  !end

.pattern0_3
  !instr,!instr27
  !transpose,12
  !pan,13
  !volume,35
  db 2,$6F
  !rest
  !dynamicVolume,192,53
  !loop : dw .sub3259 : db 1
  !dynamicVolume,192,80
  !loop : dw .sub326C : db 1
  !dynamicVolume,192,100
  !loop : dw .sub3259 : db 1
  !dynamicVolume,192,150
  !loop : dw .sub326C : db 1
  !volume,150
  !loop : dw .sub327F : db 1
  !loop : dw .sub32A2 : db 1
  !loop : dw .sub32C5 : db 2
  !loop : dw .sub327F : db 1
  !loop : dw .sub32A2 : db 1
  !loop : dw .sub32C5 : db 2
  !loop : dw .sub32A2 : db 2
  !loop : dw .sub3259 : db 1
  !loop : dw .sub326C : db 1
  !loop : dw .sub32E8 : db 1
  !loop : dw .sub34B7 : db 8
  !loop : dw .sub3259 : db 1
  !loop : dw .sub326C : db 1
  !loop : dw .sub3259 : db 1
  !loop : dw .sub326C : db 1
  !loop : dw .sub327F : db 2
  !loop : dw .sub32A2 : db 1
  !loop : dw .sub3339 : db 1
  !loop : dw .sub34BB : db 16
  !loop : dw .sub3362 : db 1
  !loop : dw .sub32A2 : db 2
  !loop : dw .sub3259 : db 1
  !loop : dw .sub326C : db 1
  !loop : dw .sub3385 : db 1
  !loop : dw .sub32A2 : db 2
  !transpose,0
  db 96,$6F
  !ds5
  !tie
  !tie
  db 48
  !tie
  !cs5
  !loop : dw .sub34BF : db 2
  !loop : dw .sub34C3 : db 4
  !end

.pattern0_4
  !loop : dw .sub34C7 : db 24
  !loop : dw .sub34CB : db 8
  !loop : dw .sub34DB : db 31
  !loop : dw .sub34E6 : db 1
  !loop : dw .sub34DB : db 15
  !loop : dw .sub34E6 : db 1
  !loop : dw .sub34CB : db 16
  !loop : dw .sub34DB : db 24
  !loop : dw .sub34F7 : db 8
  db 2,$7F
  !rest
  !end

.pattern0_5
  !loop : dw .sub34FB : db 24
  !volume,200
  !loop : dw .sub34FF : db 8
  !volume,220
  !loop : dw .sub350D : db 32
  !volume,200
  !loop : dw .sub3516 : db 4
  !loop : dw .sub351D : db 2
  !loop : dw .sub3516 : db 2
  !volume,160
  !loop : dw .sub34FF : db 16
  !volume,220
  !loop : dw .sub350D : db 16
  !volume,200
  !loop : dw .sub3516 : db 4
  !loop : dw .sub3526 : db 8
  db 2,$7F
  !rest
  !end

.pattern0_6
  !instr,!instr25
  !volume,100
  !pan,8
  !loop : dw .sub352A : db 40
  !loop : dw .sub352E : db 4
  !loop : dw .sub3539 : db 2
  !loop : dw .sub352E : db 10
  !instr,!instr20
  !vibrato,9,24,15
  !volume,255
  !pan,9
  !loop : dw .sub3544 : db 7
  db 12,$7F
  !ds3
  !ds3
  !ds3
  !ds3
  !loop : dw .sub3548 : db 4
  !loop : dw .sub354C : db 4
  db 96,$7F
  !f3
  !tie
  db 96
  !f3
  db 48
  !tie
  !gs3
  db 96
  !f3
  !tie
  db 48
  !tie
  !ds3
  !f3
  !gs3
  !instr,!instr25
  !volume,100
  !pan,8
  !loop : dw .sub3550 : db 32
  !loop : dw .sub352E : db 4
  !loop : dw .sub3539 : db 2
  !loop : dw .sub352E : db 6
  !loop : dw .sub3554 : db 8
  db 2,$7F
  !rest
  !end

.pattern0_7
  !instr,!instr25
  !volume,100
  !pan,8
  !loop : dw .sub3558 : db 72
  !loop : dw .sub352E : db 4
  !loop : dw .sub3539 : db 2
  !loop : dw .sub352E : db 2
  !loop : dw .sub355C : db 64
  db 2,$7F
  !rest
  !end

.sub3259
  db 12,$6F
  !f5
  !c5
  !c6
  !g5
  !g6
  !g5
  !ds6
  !g5
  !f6
  !as5
  !c6
  !f5
  !gs5
  !ds5
  !c6
  !gs5
  !end

.sub326C
  db 12,$6F
  !f5
  !c5
  !gs5
  !f5
  !g6
  !c6
  !gs6
  !cs6
  !as6
  !ds6
  !gs6
  !cs6
  !g6
  !c6
  !ds6
  !gs5
  !end

.sub327F
  db 12,$6F
  !f5
  !ds5
  !as5
  !fs5
  !gs6
  !cs6
  !fs6
  !as5
  !f6
  !fs5
  !cs6
  !gs5
  !as5
  !ds5
  !cs6
  !gs5
  !fs5
  !ds5
  !cs6
  !fs5
  !ds6
  !gs5
  !cs6
  !fs5
  !c6
  !ds5
  !gs5
  !cs5
  !f5
  !ds5
  !gs5
  !cs5
  !end

.sub32A2
  db 12,$6F
  !fs5
  !ds5
  !as5
  !fs5
  !gs6
  !cs6
  !fs6
  !as5
  !f6
  !fs5
  !cs6
  !gs5
  !as5
  !ds5
  !cs6
  !gs5
  !fs5
  !ds5
  !cs6
  !fs5
  !ds6
  !gs5
  !cs6
  !fs5
  !c6
  !ds5
  !gs5
  !cs5
  !f5
  !c5
  !gs5
  !cs5
  !end

.sub32C5
  db 12,$6F
  !f5
  !c5
  !c6
  !g5
  !g6
  !g5
  !ds6
  !g5
  !f6
  !as5
  !c6
  !f5
  !gs5
  !ds5
  !c6
  !gs5
  !f5
  !c5
  !gs5
  !f5
  !g6
  !c6
  !gs6
  !cs6
  !as6
  !ds6
  !gs6
  !cs6
  !g6
  !c6
  !ds6
  !gs5
  !end

.sub32E8
  db 12,$6F
  !c5
  !rest
  !c6
  !g5
  !g6
  !rest
  !ds6
  !g5
  !c5
  !rest
  !c6
  !rest
  !g6
  !rest
  !ds6
  !g5
  !c5
  !rest
  !c6
  !g5
  !g6
  !c6
  !ds6
  !g5
  !g6
  !c6
  !ds6
  !rest
  !ds6
  !ds6
  !ds6
  !ds6
  !end

.sub330B
  !subloop,0
  db 24,$7F
  !cs4
  db 12
  !as3
  !rest
  !c4
  !rest
  db 72
  !cs4
  !subloop,1
  db 24,$7F
  !rest
  db 12
  !as3
  !rest
  db 48
  !c4
  db 24
  !cs4
  db 12
  !as3
  !rest
  !c4
  !rest
  db 72
  !cs4
  db 12
  !as3
  !rest
  !c4
  !rest
  !cs4
  !rest
  db 72
  !f4
  db 24
  !cs4
  !rest
  !f4
  !rest
  !end

.sub3339
  db 24,$6F
  !rest
  db 12
  !c6
  !g5
  !g6
  !rest
  !ds6
  !g5
  db 24
  !rest
  db 12
  !c6
  !rest
  !g6
  !rest
  !ds6
  !g5
  db 24
  !rest
  db 12
  !c6
  !g5
  !g6
  !c6
  !ds6
  !g5
  !g6
  !c6
  !ds6
  !rest
  !ds6
  !ds6
  !ds6
  !ds6
  !end

.sub335E
  db 96,$6F
  !rest
  !end

.sub3362
  db 48,$6F
  !as5
  !cs6
  !gs6
  !fs6
  !f6
  !f5
  !as5
  !c6
  !as5
  !cs6
  !gs6
  !fs6
  !ds6
  !c6
  !gs5
  !c6
  !gs5
  !c6
  !gs6
  !fs6
  !ds6
  !f5
  !c6
  !f6
  !ds6
  !cs6
  !c6
  !cs6
  !f6
  !c6
  !as5
  !c6
  !end

.sub3385
  db 12,$6F
  !c5
  !rest
  !cs6
  !as5
  !gs6
  !rest
  !f6
  !f5
  !cs5
  !rest
  !cs6
  !as5
  !rest
  !ds6
  !fs6
  !ds6
  !ds5
  !c5
  !rest
  !gs5
  !gs6
  !rest
  !ds6
  !rest
  !ds5
  !c5
  !rest
  !ds5
  !ds6
  !ds6
  !ds6
  !ds6
  !end

.sub33A8
  db 96,$6F
  !ds4
  !end

.sub33AC
  db 48,$6F
  !ds4
  !end

.sub33B0
  db 96,$7F
  !rest
  !end

.sub33B4
  !volume,255
  !pan,9
  db 96,$7F
  !ds3
  !tie
  !tie
  !tie
  db 96
  !fs3
  !tie
  db 96
  !gs3
  !tie
  db 96
  !f3
  !tie
  !tie
  db 48
  !tie
  !ds3
  db 96
  !f3
  !tie
  db 48
  !tie
  !ds3
  !f3
  !gs3
  !end

.sub33D4
  db 24,$7F
  !fs7
  !pitchSlide,3,24 : !gs7
  db 96
  !tie
  db 72
  !tie
  db 24
  !g7
  !pitchSlide,3,24 : !f7
  db 96
  !tie
  db 72
  !tie
  db 24
  !fs7
  !pitchSlide,3,24 : !gs7
  db 96
  !tie
  db 72
  !tie
  db 24
  !g7
  !pitchSlide,3,24 : !f7
  db 72
  !tie
  db 48
  !cs7
  !f7
  db 24
  !f7
  !pitchSlide,3,9 : !ds7
  db 96
  !tie
  !tie
  !tie
  db 24
  !tie
  db 48
  !cs7
  !end

.sub340D
  !subloop,0
  db 48,$7F
  !f3
  !subloop,6
  db 12,$7F
  !f3
  !f3
  !f3
  !f3
  !end

.sub341B
  db 48,$7F
  !f3
  !end

.sub341F
  !volume,200
  db 96,$7F
  !as5
  !tie
  db 48
  !tie
  !c6
  !cs6
  !ds6
  !pitchSlide,48,48 : !f6
  db 96
  !tie
  !tie
  !ds6
  !cs6
  db 96
  !c6
  !tie
  !tie
  db 48
  !tie
  !as5
  !pitchSlide,48,48 : !c6
  db 96
  !tie
  !tie
  !tie
  !tie
  !end

.sub3444
  !subloop,0
  db 48,$7F
  !fs3
  !fs3
  !subloop,1
  !subloop,0
  db 48,$7F
  !gs3
  !gs3
  !subloop,1
  !end

.sub3455
  db 96,$7F
  !f3
  !tie
  db 96
  !f3
  db 48
  !tie
  !ds3
  db 96
  !f3
  !tie
  db 48
  !tie
  !ds3
  !f3
  !gs3
  !end

.sub3467
  db 96,$7F
  !rest
  !end

.sub346B
  db 96,$7F
  !ds5
  db 72
  !tie
  db 96
  !ds5
  db 72
  !tie
  db 48
  !cs5
  db 96
  !ds5
  db 72
  !ds5
  db 24
  !ds5
  !subloop,0
  db 48,$7F
  !ds5
  !ds5
  !subloop,1
  !end

.sub3485
  !subloop,0
  db 24,$7F
  !f5
  db 12
  !ds5
  !rest
  !gs5
  !rest
  db 72
  !cs5
  !subloop,1
  db 24,$7F
  !rest
  db 12
  !as4
  !rest
  db 48
  !c5
  db 24
  !cs5
  db 12
  !as4
  !rest
  !c5
  !rest
  db 72
  !cs5
  db 12
  !as4
  !rest
  !c5
  !rest
  !cs5
  !rest
  db 72
  !f5
  db 24
  !cs5
  !rest
  !f5
  !rest
  !end

.sub34B3
  db 48,$7F
  !f3
  !end

.sub34B7
  db 96,$6F
  !rest
  !end

.sub34BB
  db 96,$6F
  !rest
  !end

.sub34BF
  db 96,$6F
  !ds5
  !end

.sub34C3
  db 48,$6F
  !ds5
  !end

.sub34C7
  db 96,$7F
  !rest
  !end

.sub34CB
  !volume,160
  db 96,$7F
  !rest
  !instr,!instr22
  !dynamicVolume,96,111
  db 24
  !e5
  !e5
  !e5
  !e5
  !end

.sub34DB
  !volume,160
  !instr,!instr23
  db 48,$5F
  !b4
  !instr,!instr22
  !d5
  !end

.sub34E6
  !volume,255
  !instr,!instr23
  db 24,$77
  !b4
  !instr,!instr24
  db 24,$7F
  !ds5
  !ds5
  db 12
  !ds5
  !ds5
  !end

.sub34F7
  db 96,$7F
  !rest
  !end

.sub34FB
  db 96,$7F
  !rest
  !end

.sub34FF
  !instr,!instr23
  db 36,$7F
  !b4
  !b4
  !instr,!instr22
  db 24,$7A
  !c4
  db 96
  !rest
  !end

.sub350D
  !instr,!instr23
  db 48,$7F
  !b4
  !instr,!instr26
  !e4
  !end

.sub3516
  !instr,!instr23
  db 96,$7F
  !b4
  !b4
  !end

.sub351D
  !instr,!instr23
  db 48,$7F
  !b4
  !b4
  !b4
  !b4
  !end

.sub3526
  db 96,$7F
  !rest
  !end

.sub352A
  db 96,$7F
  !rest
  !end

.sub352E
  db 24,$7F
  !rest
  !c4
  !rest
  !c4
  !rest
  !c4
  !rest
  !c4
  !end

.sub3539
  !subloop,0
  db 24,$7F
  !rest
  db 12
  !c4
  !c4
  !subloop,3
  !end

.sub3544
  db 48,$7F
  !ds3
  !end

.sub3548
  db 48,$7F
  !fs3
  !end

.sub354C
  db 48,$7F
  !gs3
  !end

.sub3550
  db 96,$7F
  !rest
  !end

.sub3554
  db 96,$7F
  !rest
  !end

.sub3558
  db 96,$7F
  !rest
  !end

.sub355C
  db 96,$7F
  !rest
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
