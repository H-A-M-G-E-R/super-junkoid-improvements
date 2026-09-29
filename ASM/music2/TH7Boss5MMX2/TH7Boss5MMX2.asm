; Originally by ZUN, arranged by JX444444 (https://www.smwcentral.net/?p=section&a=details&id=26019)

asar 1.91
norom : org 0
incsrc "../defines.asm"

!instr1E = $16
!instr1F = $17
!instr20 = $18
!instr21 = $19
!instr22 = $1A
!instr23 = $1B

!sample14 = $16
!sample15 = $17
!sample16 = $18
!sample17 = $19
!sample18 = $1A
!sample19 = $1B

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample15,$FF,$E0,$B6,$04,$FC
  db !sample19,$FF,$EC,$B8,$07,$92
  db !sample17,$FF,$E0,$B8,$0B,$84
  db !sample18,$FF,$E0,$B8,$08,$9D
  db !sample16,$FF,$EC,$B8,$14,$C0
  db !sample14,$FF,$F0,$B8,$23,$10
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+1809
  dw Sample15,Sample15+2277
  dw Sample16,Sample16+1746
  dw Sample17,Sample17+3609
  dw Sample18,Sample18+0
  dw Sample19,Sample19+1746
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "2a.brr":2..0
  Sample15: incbin "2b.brr":2..0
  Sample16: incbin "2e.brr":2..0
  Sample17: incbin "25.brr":2..0
  Sample18: incbin "Kick.brr":2..0
  Sample19: incbin "17 lowguitar.brr":2..0

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

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, 0, 0
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, 0, 0

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !musicVolume,230;170
  !tempo,69
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%00001111,-60,60
  !echoParameters,2,60,3
  !pan,15
  !toggleKeyOffGain
  !vibrato,32,12,64
  !instr,!instr1E
  !volume,134
  db 16,$7F
  !cs6
  !c6
  !as5
  !c6
  !as5
  !c6
  db 3
  !c6
  !pitchSlide,12,4 : !cs6
  db 69
  !tie
  db 24
  !rest
  db 16
  !f6
  !ds6
  !cs6
  !ds6
  !cs6
  !c6
  db 3
  !c6
  !pitchSlide,12,4 : !cs6
  db 96
  !tie
  !tie
  !tie
  db 21
  !tie
  db 72
  !rest
  !transpose,0
  !loop : dw .sub2DB2 : db 16
  !transpose,3
  !loop : dw .sub2DC3 : db 2
  !transpose,0
  !loop : dw .sub2DC3 : db 1
  !transpose,1
  !loop : dw .sub2DC3 : db 1
  !end

.pattern0_1
  !pan,5
  !toggleKeyOffGain
  !vibrato,32,12,64
  !instr,!instr1E
  !volume,134
  db 16,$7F
  !as5
  !gs5
  !fs5
  !gs5
  !fs5
  !gs5
  db 3
  !gs5
  !pitchSlide,12,4 : !as5
  db 69
  !tie
  db 24
  !rest
  db 16
  !cs6
  !c6
  !as5
  !c6
  !as5
  !gs5
  db 3
  !gs5
  !pitchSlide,12,4 : !as5
  db 96
  !tie
  !tie
  !tie
  db 21
  !tie
  db 72
  !rest
  !transpose,0
  !loop : dw .sub2E45 : db 16
  !transpose,3
  !loop : dw .sub2E56 : db 2
  !transpose,0
  !loop : dw .sub2E56 : db 1
  !transpose,1
  !loop : dw .sub2E56 : db 1
  !end

.pattern0_2
  !toggleKeyOffGain
  !instr,!instr1F
  !volume,192
  db 24,$7F
  !fs4
  !rest
  !gs4
  !rest
  db 84
  !as4
  db 12
  !rest
  db 24
  !as4
  !rest
  !gs4
  !rest
  db 96
  !fs4
  !tie
  !tie
  db 48
  !tie
  !rest
  !instr,!instr1F
  !transpose,0
  !volume,154
  !loop : dw .sub2ED8 : db 4
  !loop : dw .sub2EE7 : db 4
  !loop : dw .sub2ED8 : db 4
  !loop : dw .sub2EE7 : db 4
  !transpose,3
  !loop : dw .sub2EF6 : db 2
  !transpose,0
  !loop : dw .sub2EF6 : db 1
  !transpose,1
  !loop : dw .sub2EF6 : db 1
  !end

.pattern0_3
  !toggleKeyOffGain
  !subloop,0
  db 96,$7F
  !rest
  !subloop,6
  !transpose,0
  !instr,!instr22
  !volume,154
  !loop : dw .sub2F79 : db 3
  !loop : dw .sub2F90 : db 1
  !loop : dw .sub2FA7 : db 4
  !loop : dw .sub2F79 : db 3
  !loop : dw .sub2F90 : db 1
  !loop : dw .sub2FA7 : db 4
  !transpose,3
  !loop : dw .sub2FBE : db 2
  !transpose,0
  !loop : dw .sub2FBE : db 1
  !transpose,1
  !loop : dw .sub2FBE : db 1
  !end

.pattern0_4
  !subloop,0
  db 96,$7F
  !rest
  !subloop,5
  db 60,$7F
  !rest
  !instr,!instr20
  !volume,224
  db 36
  !c5
  !transpose,0
  !instr,!instr23
  !volume,240
  !loop : dw .sub2FD8 : db 2
  !transpose,3
  !loop : dw .sub2FF5 : db 2
  !transpose,0
  !loop : dw .sub2FF5 : db 1
  !transpose,1
  !loop : dw .sub2FF5 : db 1
  !end

.pattern0_5
  !volume,224
  !subloop,0
  db 96,$7F
  !rest
  !subloop,2
  !instr,!instr20
  !subloop,0
  db 48,$7F
  !c5
  !subloop,2
  !loop : dw .sub3038 : db 4
  db 24,$7F
  !c5
  !instr,!instr20
  !c5
  !loop : dw .sub3038 : db 4
  !loop : dw .sub3041 : db 6
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub3038 : db 2
  !instr,!instr20
  db 12,$7F
  !c5
  !c5
  db 24
  !c5
  !subloop,0
  !loop : dw .sub3038 : db 4
  !loop : dw .sub3041 : db 6
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub3038 : db 2
  !instr,!instr20
  db 12,$7F
  !c5
  !c5
  db 24
  !c5
  !subloop,4
  !end

.pattern1_0
  !transpose,0
  !loop : dw .sub2DB2 : db 16
  !transpose,3
  !loop : dw .sub2DC3 : db 2
  !transpose,0
  !loop : dw .sub2DC3 : db 1
  !transpose,1
  !loop : dw .sub2DC3 : db 1
  !end

.pattern1_1
  !transpose,0
  !loop : dw .sub2E45 : db 16
  !transpose,3
  !loop : dw .sub2E56 : db 2
  !transpose,0
  !loop : dw .sub2E56 : db 1
  !transpose,1
  !loop : dw .sub2E56 : db 1
  !end

.pattern1_2
  !transpose,0
  !volume,154
  !loop : dw .sub2ED8 : db 4
  !loop : dw .sub2EE7 : db 4
  !loop : dw .sub2ED8 : db 4
  !loop : dw .sub2EE7 : db 4
  !transpose,3
  !loop : dw .sub2EF6 : db 2
  !transpose,0
  !loop : dw .sub2EF6 : db 1
  !transpose,1
  !loop : dw .sub2EF6 : db 1
  !end

.pattern1_3
  !transpose,0
  !instr,!instr22
  !volume,154
  !loop : dw .sub2F79 : db 3
  !loop : dw .sub2F90 : db 1
  !loop : dw .sub2FA7 : db 4
  !loop : dw .sub2F79 : db 3
  !loop : dw .sub2F90 : db 1
  !loop : dw .sub2FA7 : db 4
  !transpose,3
  !loop : dw .sub2FBE : db 2
  !transpose,0
  !loop : dw .sub2FBE : db 1
  !transpose,1
  !loop : dw .sub2FBE : db 1
  !end

.pattern1_4
  !transpose,0
  !instr,!instr23
  !volume,240
  !loop : dw .sub2FD8 : db 2
  !transpose,3
  !loop : dw .sub2FF5 : db 2
  !transpose,0
  !loop : dw .sub2FF5 : db 1
  !transpose,1
  !loop : dw .sub2FF5 : db 1
  !end

.pattern1_5
  !loop : dw .sub3038 : db 4
  !loop : dw .sub3041 : db 6
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub3038 : db 2
  !instr,!instr20
  db 12,$7F
  !c5
  !c5
  db 24
  !c5
  !subloop,0
  !loop : dw .sub3038 : db 4
  !loop : dw .sub3041 : db 6
  db 24,$7F
  !c5
  !c5
  !loop : dw .sub3038 : db 2
  !instr,!instr20
  db 12,$7F
  !c5
  !c5
  db 24
  !c5
  !subloop,4
  !end

.sub2DB2
  db 24,$7F
  !cs6
  !rest
  db 12
  !cs6
  !rest
  db 24
  !cs6
  !rest
  db 12
  !cs6
  !rest
  db 24
  !ds6
  !rest
  !end

.sub2DC3
  db 24,$7F
  !e6
  db 24,$76
  !e6
  db 24,$7F
  !a5
  !e6
  !d6
  !e6
  !c6
  !e6
  !b5
  !e6
  db 72
  !a5
  db 24,$76
  !a5
  db 24,$7F
  !b5
  db 24,$76
  !b5
  db 24,$7F
  !c6
  db 24,$76
  !c6
  db 24,$7F
  !e5
  !c6
  !b5
  !c6
  !b5
  !g5
  db 96
  !e5
  db 72
  !tie
  db 24,$76
  !e5
  db 24,$7F
  !f5
  db 12,$76
  !f5
  db 24,$7F
  !d5
  db 12,$76
  !d5
  db 24,$7F
  !f5
  db 72
  !e5
  db 24,$76
  !e5
  db 24,$7F
  !f5
  db 12,$76
  !f5
  db 24,$7F
  !g5
  db 12,$76
  !g5
  db 24,$7F
  !a5
  db 72
  !gs5
  db 24,$76
  !gs5
  db 24,$7F
  !a5
  db 12,$76
  !a5
  db 24,$7F
  !e6
  db 12,$76
  !e6
  db 24,$7F
  !d6
  !e6
  db 12,$76
  !e6
  db 24,$7F
  !c6
  db 12,$76
  !c6
  db 24,$7F
  !e6
  !b5
  !e6
  db 72
  !a5
  db 24,$76
  !a5
  db 24,$7F
  !b5
  db 24,$76
  !b5
  !end

.sub2E45
  db 24,$7F
  !as5
  !rest
  db 12
  !as5
  !rest
  db 24
  !as5
  !rest
  db 12
  !as5
  !rest
  db 24
  !c6
  !rest
  !end

.sub2E56
  db 24,$7F
  !c6
  db 24,$76
  !c6
  db 24,$7F
  !e5
  !c6
  !b5
  !c6
  !a5
  !c6
  !g5
  !c6
  db 72
  !e5
  db 24,$76
  !e5
  db 24,$7F
  !g5
  db 24,$76
  !g5
  db 24,$7F
  !a5
  db 24,$76
  !a5
  db 24,$7F
  !c5
  !a5
  !g5
  !a5
  !g5
  !e5
  db 96
  !c5
  db 72
  !tie
  db 24,$76
  !c5
  db 24,$7F
  !c5
  db 12,$76
  !c5
  db 24,$7F
  !a4
  db 12,$76
  !a4
  db 24,$7F
  !c5
  db 72
  !b4
  db 24,$76
  !b4
  db 24,$7F
  !c5
  db 12,$76
  !c5
  db 24,$7F
  !d5
  db 12,$76
  !d5
  db 24,$7F
  !e5
  db 72
  !ds5
  db 24,$76
  !ds5
  db 24,$7F
  !e5
  db 12,$76
  !e5
  db 24,$7F
  !b5
  db 12,$76
  !b5
  db 24,$7F
  !a5
  !b5
  db 12,$76
  !b5
  db 24,$7F
  !g5
  db 12,$76
  !g5
  db 24,$7F
  !b5
  !g5
  !b5
  db 72
  !e5
  db 24,$76
  !e5
  db 24,$7F
  !g5
  db 24,$76
  !g5
  !end

.sub2ED8
  !subloop,0
  db 12,$7F
  !as5
  !rest
  !subloop,5
  db 12,$7F
  !c6
  !rest
  !c6
  !rest
  !end

.sub2EE7
  !subloop,0
  db 12,$7F
  !fs5
  !rest
  !subloop,5
  db 12,$7F
  !gs5
  !rest
  !gs5
  !rest
  !end

.sub2EF6
  db 12,$7F
  !a5
  !rest
  !a5
  !rest
  !a5
  !rest
  !a5
  !rest
  !g5
  !rest
  !g5
  !rest
  !g5
  !rest
  !g5
  !rest
  !fs5
  !rest
  !fs5
  !rest
  !f5
  !rest
  !f5
  !rest
  !f5
  !rest
  !f5
  !rest
  !g5
  !rest
  !g5
  !rest
  !a5
  !rest
  !a5
  !rest
  !a5
  !rest
  !a5
  !rest
  !g5
  !rest
  !g5
  !rest
  !g5
  !rest
  !g5
  !rest
  !f5
  !rest
  !f5
  !rest
  !f5
  !rest
  !f5
  !rest
  !e5
  !rest
  !e5
  !rest
  !e5
  !rest
  !e5
  !rest
  !d5
  !rest
  !d5
  !rest
  !d5
  !rest
  !d5
  !rest
  !e5
  !rest
  !e5
  !rest
  !e5
  !rest
  !e5
  !rest
  !f5
  !rest
  !f5
  !rest
  !f5
  !rest
  !f5
  !rest
  !gs5
  !rest
  !gs5
  !rest
  !gs5
  !rest
  !gs5
  !rest
  !d5
  !rest
  !d5
  !rest
  !d5
  !rest
  !d5
  !rest
  !e5
  !rest
  !e5
  !rest
  !e5
  !rest
  !e5
  !rest
  !f5
  !rest
  !f5
  !rest
  !f5
  !rest
  !f5
  !rest
  !g5
  !rest
  !g5
  !rest
  !g5
  !rest
  !g5
  !rest
  !end

.sub2F79
  !subloop,0
  db 6,$7F
  !f4
  !rest
  !cs4
  !rest
  !as3
  !rest
  !subloop,3
  db 6,$7F
  !fs4
  !rest
  !ds4
  !rest
  !c4
  !rest
  !fs4
  !rest
  !end

.sub2F90
  !subloop,0
  db 6,$7F
  !f4
  !rest
  !cs4
  !rest
  !as3
  !rest
  !subloop,3
  db 6,$7F
  !fs4
  !rest
  !fs3
  !rest
  !c4
  !rest
  !gs3
  !rest
  !end

.sub2FA7
  !subloop,0
  db 6,$7F
  !cs4
  !rest
  !as3
  !rest
  !fs3
  !rest
  !subloop,3
  db 6,$7F
  !ds4
  !rest
  !c4
  !rest
  !gs3
  !rest
  !ds4
  !rest
  !end

.sub2FBE
  db 96,$7F
  !c4
  !b3
  db 96
  !a3
  db 48
  !tie
  !b3
  db 96
  !c4
  !b3
  db 96
  !a3
  !tie
  !subloop,0
  db 96,$7F
  !f3
  !gs3
  !a3
  !b3
  !subloop,1
  !end

.sub2FD8
  !subloop,0
  db 24,$7F
  !as2
  !as2
  !as2
  !as2
  !as2
  !as2
  !c3
  !c3
  !subloop,3
  !subloop,0
  db 24,$7F
  !fs2
  !fs2
  !fs2
  !fs2
  !fs2
  !fs2
  !gs2
  !gs2
  !subloop,3
  !end

.sub2FF5
  db 24,$7F
  !a2
  !a2
  !a2
  !a2
  !g2
  !g2
  !g2
  !g2
  !fs2
  !fs2
  !f2
  !f2
  !f2
  !f2
  !g2
  !g2
  !a2
  !a2
  !a2
  !a2
  !g2
  !g2
  !g2
  !g2
  !f2
  !f2
  !f2
  !f2
  !e2
  !e2
  !e2
  !e2
  !d2
  !d2
  !d2
  !d2
  !e2
  !e2
  !e2
  !e2
  !f2
  !f2
  !f2
  !f2
  !gs2
  !gs2
  !gs2
  !gs2
  !d2
  !d2
  !d2
  !d2
  !e2
  !e2
  !e2
  !e2
  !f2
  !f2
  !f2
  !f2
  !g2
  !g2
  !g2
  !g2
  !end

.sub3038
  !instr,!instr20
  db 24,$7F
  !c5
  !instr,!instr21
  !c5
  !end

.sub3041
  db 24,$7F
  !c5
  !c5
  !instr,!instr20
  !c5
  !instr,!instr21
  !c5
  !instr,!instr20
  !c5
  !instr,!instr21
  !c5
  !instr,!instr20
  !c5
  !instr,!instr21
  !c5
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
