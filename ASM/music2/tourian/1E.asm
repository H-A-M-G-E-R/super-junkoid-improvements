asar 1.91
norom : org 0
incsrc "../defines.asm"

!instr0E = $0E
!instr18 = $16
!instr1A = $17
!instr1B = $18
!instr22 = $19

!sample18 = $16
!sample1A = $17
!sample1B = $18
!sample22 = $19

spcblock !sound2InstructionLists_low+$12-1 nspc
  db Sound12, Sound13, Sound14
endspcblock

spcblock !sound2InstructionLists_high+$12-1 nspc
  db Sound12>>8, Sound13>>8, Sound14>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample18,$FF,$E0,$B8,$00,$80
  db !sample1A,$FF,$E0,$B8,$03,$80
  db !sample1B,$FF,$E0,$B8,$01,$10
  db !sample22,$FF,$E0,$B8,$03,$40
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample18,Sample18+27
  dw Sample19_1A,Sample19_1A+3978
  dw Sample1B,Sample1B+2871
  dw Sample22,Sample22+774
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample18: incbin "Sample_5d8ae2e34af3ae5f446adba2e3b84921.brr"
  Sample19_1A: incbin "Sample_aa4e05b9fc330a7518ab73cdd936acf4.brr"
  Sample1B: incbin "Sample_48b31480aa5d8012ee670aa9bf39dad8.brr"
  Sample22: incbin "lava_bubbling.brr"

; Sound 12h: Lava bubbling 1
Sound12:
db $01 : dw .voice0
.voice0 : db !instr22, $84,$60,$1C, $90,$60,$19, $0E, $80,$60,$10, !instr22, $89,$60,$19, $0E, $80,$60,$07, $84,$60,$10, !instr22, $8B,$60,$1B, $FF

; Sound 13h: Lava bubbling 2
Sound13:
db $01 : dw .voice0
.voice0 : db $0E, $80,$60,$0A, $84,$60,$07, !instr22, $8B,$60,$1F, $89,$60,$16, $0E, $80,$60,$0A, $87,$60,$10, $FF

; Sound 14h: Lava bubbling 3
Sound14:
db $01 : dw .voice0
.voice0 : db $0E, $80,$60,$0A, $87,$60,$10, !instr22, $84,$60,$1A, $0E, $80,$60,$0A, $84,$60,$07, !instr22, $91,$60,$16, $0E, $80,$60,$0A, $87,$60,$10, $FF

TrackerSilence:
dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker582C, TrackerSilence

Tracker582C:
  dw .pattern0
-
  dw .pattern1
  dw .pattern2
  dw .pattern3
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, 0
.pattern1: dw .pattern1_0, .pattern1_1, .pattern1_2, .pattern1_3, .pattern1_4, .pattern1_5, .pattern1_6, 0
.pattern2: dw .pattern2_0, .pattern2_1, .pattern2_2, .pattern2_3, .pattern2_4, .pattern2_5, .pattern2_6, 0
.pattern3: dw .pattern3_0, .pattern3_1, .pattern3_2, .pattern3_3, .pattern3_4, .pattern3_5, .pattern3_6, 0

.pattern0_0
  !musicVolume,200
  !tempo,16
  !instr,!instr18
  !subtranspose,10
  !pan,10
  !volume,30
  !echo,%00000011,38,38
  !echoParameters,2,80,0
  db 12
.sub623A:
  !rest
  !end

.pattern0_1
  !loop : dw .sub6326 : db 1
  !end

.pattern0_2
  !loop : dw .sub6326 : db 1
  !end

.pattern0_3
  !loop : dw .sub6326 : db 1
  !end

.pattern0_4
  !loop : dw .sub6326 : db 1
  !end

.pattern0_5
  !loop : dw .sub6326 : db 1
  !end

.pattern0_6
  !loop : dw .sub6326 : db 1
  !end

.pattern1_0
  !musicVolume,200
  !tempo,16
  !instr,!instr18
  !subtranspose,10
  !pan,10
  !volume,240
  !loop : dw .sub60FF : db 1
  !loop : dw .sub617F : db 9
  !end

.pattern1_1
  !instr,!instr1A
  !subtranspose,0
  !volume,180
  !pan,10
  db 96
  !rest
  !rest
  db 96,$7F
  !g3
  db 72
  !tie
  db 96
  !f3
  db 72
  !tie
  db 96
  !rest
  !g3
  db 72
  !tie
  db 96
  !rest
  db 72
  !rest
  !end

.pattern1_2
  !instr,!instr0E
  !subtranspose,0
  !volume,230
  !pan,16
  db 4,$7F
  !f2
  !pan,8
  !g2
  !pan,10
  !gs2
  !volume,230
  !dynamicVolume,12,255
  !pan,14
  !c3
  !pan,3
  !ds3
  !pan,5
  !g3
  db 75
  !rest
  !volume,245
  !pan,12
  db 4
  !f2
  !pan,16
  !g2
  !pan,10
  !gs2
  !volume,245
  !dynamicVolume,12,200
  !pan,4
  !c3
  !pan,16
  !ds3
  !pan,8
  !g3
  db 75
  !rest
  !volume,245
  !pan,3
  db 4
  !f2
  !pan,12
  !g2
  !pan,4
  !gs2
  !pan,10
  !c3
  !pan,12
  !ds3
  !pan,16
  !g3
  db 75
  !rest
  !volume,230
  !pan,16
  db 4
  !f2
  !pan,10
  !g2
  !pan,13
  !gs2
  !volume,230
  !dynamicVolume,12,255
  !pan,3
  !c3
  !pan,16
  !ds3
  !pan,8
  !g3
  db 75
  !rest
  !volume,230
  !pan,6
  db 4
  !f2
  !pan,14
  !g2
  !pan,10
  !gs2
  !pan,16
  !c3
  !pan,5
  !ds3
  !pan,10
  !g3
  db 75
  !rest
  !volume,230
  !pan,16
  db 4
  !f2
  !pan,7
  !g2
  !pan,10
  !gs2
  !volume,230
  !dynamicVolume,12,255
  !pan,16
  !c3
  !pan,10
  !ds3
  !pan,16
  !g3
  db 75
  !rest
  !pan,10
  db 4
  !f2
  !pan,14
  !g2
  !pan,3
  !gs2
  !pan,13
  !c3
  !pan,8
  !ds3
  !pan,17
  !g3
  db 75
  !rest
  !volume,255
  !pan,10
  db 4
  !f2
  !pan,5
  !g2
  !pan,13
  !gs2
  !volume,230
  !dynamicVolume,12,230
  !pan,12
  !c3
  !pan,16
  !ds3
  !pan,6
  !g3
  db 75
  !rest
  !pan,12
  db 4
  !f2
  !pan,5
  !g2
  !pan,10
  !gs2
  !pan,4
  !c3
  !pan,8
  !ds3
  !pan,13
  !g3
  db 75
  !rest
  !volume,230
  !pan,12
  db 4
  !f2
  !pan,10
  !g2
  !pan,5
  !gs2
  !volume,230
  !dynamicVolume,12,255
  !pan,15
  !c3
  !pan,10
  !ds3
  !pan,12
  !g3
  db 45
  !rest
  !end

.pattern1_3
  !instr,!instr0E
  !subtranspose,0
  !volume,220
  !pan,5
  db 6,$7F
  !d2
  !pan,12
  db 5
  !ds2
  !pan,10
  db 6
  !a2
  !pan,15
  db 3
  !c2
  !pan,7
  db 6
  !f3
  !volume,220
  !dynamicVolume,240,170
  !pan,4
  !a2
  !pan,12
  db 4
  !d2
  !pan,16
  db 5
  !as2
  !pan,10
  db 4
  !f3
  !pan,16
  db 6
  !d2
  !pan,5
  !e3
  !pan,7
  !c2
  !pan,5
  db 3
  !ds2
  !pan,16
  db 6
  !f2
  !pan,10
  db 5
  !as2
  !pan,13
  db 6
  !d2
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !pan,16
  !d2
  !pan,5
  db 5
  !ds2
  !pan,10
  db 6
  !a2
  !pan,12
  db 3
  !c2
  !pan,16
  db 6
  !f3
  !pan,5
  !a2
  !pan,6
  db 4
  !d2
  !pan,16
  db 5
  !as2
  !pan,4
  db 4
  !f3
  !pan,10
  db 6
  !d2
  !pan,4
  !e3
  !pan,12
  !c2
  !pan,6
  db 3
  !ds2
  !pan,4
  db 6
  !f2
  !pan,10
  db 5
  !as2
  !pan,16
  db 6
  !d2
  !loop : dw .sub6181 : db 1
  !d2
  db 5
  !ds2
  !pan,5
  db 6
  !a2
  !pan,12
  db 3
  !c2
  !pan,4
  db 6
  !f3
  !pan,8
  db 4
  !d2
  !volume,220
  !dynamicVolume,25,160
  db 5
  !as2
  !pan,16
  db 4
  !f3
  !pan,4
  db 6
  !d2
  !pan,10
  !e3
  !pan,8
  !c2
  !pan,13
  db 3
  !ds2
  !pan,4
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !pan,12
  !d2
  db 5
  !ds2
  !pan,10
  db 6
  !a2
  !pan,16
  db 3
  !c2
  !pan,8
  db 6
  !f3
  !pan,4
  !a2
  !pan,10
  db 4
  !d2
  !pan,12
  db 5
  !as2
  !pan,16
  db 4
  !f3
  !pan,12
  db 6
  !d2
  !pan,10
  !e3
  !pan,4
  !c2
  !pan,9
  !f2
  !pan,16
  db 5
  !as2
  !pan,8
  db 6
  !d2
  !volume,160
  !dynamicVolume,96,230
  !d2
  db 5
  !ds2
  !pan,10
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !a2
  !pan,5
  db 4
  !d2
  !pan,12
  db 5
  !as2
  !pan,8
  db 4
  !f3
  !pan,5
  db 6
  !d2
  !pan,10
  !e3
  !pan,13
  !c2
  !pan,10
  db 3
  !ds2
  db 6
  !f2
  !pan,16
  db 5
  !as2
  db 6
  !d2
  !pan,10
  !d2
  db 5
  !ds2
  db 6
  !a2
  !volume,230
  !dynamicVolume,20,180
  !pan,5
  db 3
  !c2
  !pan,13
  db 6
  !f3
  !pan,8
  !a2
  !pan,16
  db 4
  !d2
  !pan,9
  db 5
  !as2
  !pan,4
  db 4
  !f3
  !pan,16
  db 6
  !d2
  !pan,10
  !e3
  !c2
  db 3
  !ds2
  !pan,12
  db 6
  !f2
  db 5
  !as2
  !pan,8
  db 6
  !d2
  !d2
  db 5
  !ds2
  db 6
  !a2
  !volume,180
  !dynamicVolume,20,230
  !pan,10
  db 3
  !c2
  !pan,16
  db 6
  !f3
  !pan,5
  !a2
  !pan,12
  db 4
  !d2
  !pan,4
  db 5
  !as2
  !pan,12
  db 4
  !f3
  db 6
  !d2
  !pan,6
  !e3
  !pan,7
  !c2
  !pan,16
  db 3
  !ds2
  !pan,5
  db 6
  !f2
  !pan,12
  db 5
  !as2
  !pan,13
  db 6
  !d2
  !pan,10
  !a2
  !pan,4
  !f3
  !pan,13
  !a2
  !pan,10
  db 4
  !d2
  !f3
  db 6
  !d2
  !pan,4
  !e3
  !pan,3
  !d2
  db 12
  !rest
  !end

.pattern1_4
  !instr,!instr1A
  !subtranspose,0
  !volume,240
  !pan,10
  db 96
  !rest
  !rest
  db 96,$7F
  !g3
  db 72
  !tie
  db 96
  !f3
  db 72
  !tie
  db 96
  !rest
  !g3
  db 72
  !tie
  db 96
  !rest
  db 72
  !rest
  !end

.pattern1_5
  !instr,!instr1A
  !subtranspose,0
  !volume,180
  !pan,10
  db 96
  !rest
  !loop : dw .sub623A : db 9
  !end

.pattern1_6
  !instr,!instr1A
  !subtranspose,0
  !volume,10
  !pan,10
  db 96
  !rest
  !loop : dw .sub623A : db 9
  !end

.pattern2_0
  !musicVolume,200
  !tempo,16
  !instr,!instr18
  !subtranspose,10
  !volume,200
  !loop : dw .sub60FF : db 1
  !tie
  !tie
  !volume,200
  !dynamicVolume,96,240
  !tie
  !volume,240
  !dynamicVolume,96,200
  !tie
  !volume,200
  !dynamicVolume,192,240
  !tie
  !tie
  !volume,240
  !dynamicVolume,192,200
  !tie
  !tie
  !tie
  !volume,200
  !dynamicVolume,192,240
  !tie
  !tie
  !tie
.sub617F:
  !tie
  !end

.pattern2_1
  !instr,!instr1A
  !subtranspose,0
  !volume,170
  db 96,$7F
  !g3
  !loop : dw .sub610B : db 3
  db 72
  !tie
  db 96
  !gs3
  db 72
  !tie
  db 96
  !a3
  !as3
  !g3
  !loop : dw .sub610B : db 1
  db 48
  !tie
  !end

.pattern2_2
  !loop : dw .sub6110 : db 1
  db 75
  !rest
  !volume,245
  db 4
  !f2
  !g2
  !gs2
  !volume,245
  !dynamicVolume,12,200
  !c3
  !ds3
  !g3
  db 75
  !rest
  !loop : dw .sub6126 : db 1
  !loop : dw .sub6132 : db 1
  !volume,230
  db 4
  !f2
  !g2
  !gs2
  !c3
  !ds3
  !g3
  db 75
  !rest
  !volume,230
  !dynamicVolume,12,255
  db 4
  !f2
  !g2
  !gs2
  !volume,255
  !dynamicVolume,12,230
  !c3
  !ds3
  !g3
  !loop : dw .sub6143 : db 1
  !loop : dw .sub6126 : db 1
  !volume,255
  !dynamicVolume,24,230
  db 4
  !f2
  !g2
  !gs2
  !c3
  !ds3
  !g3
  !loop : dw .sub6143 : db 1
  !loop : dw .sub6126 : db 1
  !volume,255
  db 4
  !f2
  !g2
  !gs2
  !c3
  !ds3
  !g3
  !loop : dw .sub6143 : db 1
  !volume,255
  !dynamicVolume,24,230
  db 4
  !f2
  !g2
  !gs2
  !c3
  !ds3
  !g3
  db 33
  !rest
  !end

.pattern2_3
  !instr,!instr0E
  !subtranspose,0
  !volume,170
  !pan,10
  db 6,$7F
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !volume,170
  !dynamicVolume,240,220
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !loop : dw .sub614F : db 2
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  !volume,240
  !dynamicVolume,70,180
  db 6
  !f3
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !volume,180
  !dynamicVolume,36,230
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  !volume,230
  !dynamicVolume,36,180
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !a2
  db 4
  !d2
  !volume,180
  !dynamicVolume,70,220
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !a2
  db 4
  !d2
  !volume,220
  !dynamicVolume,25,180
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !volume,180
  !dynamicVolume,96,210
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !d2
  db 5
  !ds2
  db 6
  !a2
  !volume,210
  !dynamicVolume,20,180
  db 3
  !c2
  db 6
  !f3
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !loop : dw .sub614F : db 2
  !volume,180
  !dynamicVolume,80,210
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !volume,210
  !dynamicVolume,80,180
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !volume,180
  !dynamicVolume,30,240
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !d2
  !volume,240
  !dynamicVolume,10,180
  db 5
  !ds2
  !a2
  !end

.pattern2_4
  !instr,!instr1B
  !subtranspose,0
  !volume,255
  !vibrato,8,40,170
  db 48,$7F
  !a5
  db 24
  !gs5
  !c6
  !loop : dw .sub616C : db 1
  db 96
  !rest
  !rest
  !rest
  db 48
  !a5
  db 24
  !gs5
  !c6
  !loop : dw .sub616C : db 1
  db 96
  !rest
  !end

.pattern2_5
  !instr,!instr1B
  !subtranspose,0
  !volume,255
  !vibrato,8,20,230
  db 48,$7F
  !a5
  db 24
  !gs5
  !c6
  !loop : dw .sub616C : db 1
  db 96
  !rest
  !rest
  !rest
  db 48
  !a5
  db 24
  !gs5
  !c6
  !loop : dw .sub616C : db 1
  db 96
  !rest
  !end

.pattern2_6
  !instr,!instr1A
  !subtranspose,0
  !volume,245
  !pan,10
  db 96,$7F
  !g3
  !loop : dw .sub610B : db 3
  db 72
  !tie
  db 96
  !gs3
  db 72
  !tie
  db 96
  !a3
  !as3
  !g3
  !loop : dw .sub610B : db 1
  db 48
  !tie
  !end

.pattern3_0
  !musicVolume,200
  !tempo,16
  !instr,!instr18
  !subtranspose,10
  !pan,10
  !volume,200
  !loop : dw .sub60FF : db 1
  !tie
  !tie
  !volume,200
  !dynamicVolume,96,240
  !tie
  !volume,240
  !dynamicVolume,96,200
  !tie
  !volume,200
  !dynamicVolume,192,240
  !tie
  !tie
  !volume,240
  !dynamicVolume,192,200
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

.pattern3_1
  !instr,!instr1A
  !subtranspose,0
  !volume,170
  !pan,10
  db 96
  !rest
  !rest
  db 96,$7F
  !g3
  db 72
  !tie
  db 96
  !f3
  db 72
  !tie
  db 96
  !rest
  !g3
  db 72
  !tie
  db 96
  !rest
  db 72
  !rest
  db 96
  !f3
  !tie
  !end

.pattern3_2
  !loop : dw .sub6110 : db 1
  db 75
  !rest
  !volume,245
  db 4
  !f2
  !g2
  !gs2
  !volume,245
  !dynamicVolume,12,200
  !c3
  !ds3
  !g3
  db 75
  !rest
  !loop : dw .sub6126 : db 1
  !loop : dw .sub6132 : db 1
  !volume,230
  db 4
  !f2
  !g2
  !gs2
  !c3
  !ds3
  !g3
  db 75
  !rest
  !loop : dw .sub6132 : db 1
  !loop : dw .sub623C : db 1
  !volume,255
  db 4
  !f2
  !g2
  !gs2
  !volume,230
  !dynamicVolume,12,230
  !c3
  !ds3
  !g3
  !loop : dw .sub6143 : db 1
  !volume,230
  db 4
  !f2
  !g2
  !gs2
  !volume,230
  !dynamicVolume,12,255
  !c3
  !ds3
  !g3
  db 45
  !rest
  db 4
  !f2
  !g2
  !gs2
  !c3
  !ds3
  !g3
  db 72
  !rest
  !volume,230
  db 4
  !f2
  !g2
  !gs2
  !volume,230
  !dynamicVolume,12,255
  !c3
  !ds3
  !g3
  db 72
  !rest
  !end

.pattern3_3
  !instr,!instr0E
  !subtranspose,0
  !volume,220
  !pan,10
  !pan,16
  db 6,$7F
  !d2
  !pan,5
  db 5
  !ds2
  !pan,10
  db 6
  !a2
  !pan,12
  db 3
  !c2
  !pan,16
  db 6
  !f3
  !pan,5
  !a2
  !pan,6
  db 4
  !d2
  !pan,16
  db 5
  !as2
  !pan,4
  db 4
  !f3
  !pan,10
  db 6
  !d2
  !pan,4
  !e3
  !pan,12
  !c2
  !pan,6
  db 3
  !ds2
  !pan,4
  db 6
  !f2
  !pan,10
  db 5
  !as2
  !pan,16
  db 6
  !d2
  !loop : dw .sub6181 : db 1
  !loop : dw .sub6246 : db 1
  !pan,10
  !d2
  db 5
  !ds2
  db 6
  !a2
  !volume,230
  !dynamicVolume,20,180
  !pan,5
  db 3
  !c2
  !pan,13
  db 6
  !f3
  !pan,8
  !a2
  !pan,16
  db 4
  !d2
  !pan,9
  db 5
  !as2
  !pan,4
  db 4
  !f3
  !pan,16
  db 6
  !d2
  !pan,10
  !e3
  !c2
  db 3
  !ds2
  !pan,12
  db 6
  !f2
  db 5
  !as2
  !pan,8
  db 6
  !d2
  !pan,13
  !d2
  !pan,6
  db 5
  !ds2
  !pan,8
  db 6
  !a2
  !pan,10
  db 3
  !c2
  !pan,16
  db 6
  !f3
  !pan,5
  !a2
  !pan,8
  db 4
  !d2
  !volume,180
  !dynamicVolume,70,220
  !pan,10
  db 5
  !as2
  !pan,5
  db 4
  !f3
  !pan,12
  db 6
  !d2
  !pan,6
  !e3
  !pan,8
  !c2
  !pan,16
  db 3
  !ds2
  !pan,10
  db 6
  !f2
  !pan,13
  db 5
  !as2
  !pan,10
  db 6
  !d2
  !loop : dw .sub6246 : db 1
  !pan,10
  !d2
  !pan,16
  db 5
  !ds2
  !pan,5
  db 6
  !a2
  !pan,14
  db 3
  !c2
  !volume,170
  !dynamicVolume,70,140
  !pan,10
  db 6
  !f3
  !pan,12
  !a2
  !pan,16
  db 4
  !d2
  !pan,4
  db 5
  !as2
  !pan,10
  db 4
  !f3
  !pan,6
  db 6
  !d2
  !pan,12
  !e3
  !pan,10
  !c2
  !pan,8
  db 3
  !ds2
  !pan,6
  db 6
  !f2
  !pan,13
  db 5
  !as2
  !pan,16
  db 6
  !d2
  !pan,10
  !a2
  !volume,230
  !dynamicVolume,20,180
  !pan,8
  !a2
  !pan,16
  db 4
  !d2
  !pan,9
  db 5
  !as2
  !pan,16
  db 6
  !d2
  !pan,10
  !e3
  db 3
  !ds2
  !pan,12
  db 5
  !as2
  !pan,8
  db 6
  !d2
  !pan,10
  db 3
  !c2
  !pan,5
  db 6
  !a2
  !volume,180
  !dynamicVolume,70,220
  !pan,12
  !d2
  !pan,6
  !c2
  !pan,13
  db 5
  !as2
  !end

.pattern3_4
  !loop : dw .sub62E6 : db 1
  !b5
  !pitchSlide,1,24 : !e5
  db 24
  !tie
  !pitchSlide,12,12 : !ds5
  db 96
  !rest
  !rest
  !rest
  !loop : dw .sub62FD : db 1
  !end

.pattern3_5
  !loop : dw .sub62E6 : db 1
  !b5
  !pitchSlide,24,12 : !e5
  db 24
  !tie
  !pitchSlide,12,12 : !ds5
  db 96
  !rest
  !rest
  !rest
  !loop : dw .sub62FD : db 1
  !end

.pattern3_6
  !instr,!instr1A
  !subtranspose,0
  !volume,245
  !pan,10
  db 96
  !rest
  !rest
  db 96,$7F
  !g3
  db 72
  !tie
  db 96
  !f3
  db 72
  !tie
  db 96
  !rest
  !g3
  db 72
  !tie
  db 96
  !rest
  db 72
  !rest
  db 96
  !f3
  !tie
  !end

.sub6326
  !instr,!instr18
  !subtranspose,10
  !pan,10
  !volume,30
  db 12
  !rest
  !end

.sub60FF
  !echo,%00000011,38,38
  !echoParameters,2,80,0
  db 96,$7F
  !b4
  !end

.sub6181
  !pan,10
  !d2
  !pan,16
  db 5
  !ds2
  !pan,5
  db 6
  !a2
  !pan,14
  db 3
  !c2
  !volume,170
  !dynamicVolume,70,140
  !pan,10
  db 6
  !f3
  !pan,12
  !a2
  !pan,16
  db 4
  !d2
  !pan,4
  db 5
  !as2
  !pan,10
  db 4
  !f3
  !pan,6
  db 6
  !d2
  !pan,12
  !e3
  !pan,10
  !c2
  !pan,8
  db 3
  !ds2
  !pan,6
  db 6
  !f2
  !pan,13
  db 5
  !as2
  !pan,16
  db 6
  !d2
  !pan,12
  !d2
  !pan,6
  db 5
  !ds2
  !pan,16
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !volume,140
  !dynamicVolume,36,230
  !pan,10
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  !pan,5
  db 6
  !d2
  !e3
  !c2
  !volume,230
  !dynamicVolume,36,180
  !pan,16
  db 3
  !ds2
  !pan,8
  db 6
  !f2
  !pan,10
  db 5
  !as2
  db 6
  !d2
  !pan,13
  !d2
  !pan,6
  db 5
  !ds2
  !pan,8
  db 6
  !a2
  !pan,10
  db 3
  !c2
  !pan,16
  db 6
  !f3
  !pan,5
  !a2
  !pan,8
  db 4
  !d2
  !volume,180
  !dynamicVolume,70,220
  !pan,10
  db 5
  !as2
  !pan,5
  db 4
  !f3
  !pan,12
  db 6
  !d2
  !pan,6
  !e3
  !pan,8
  !c2
  !pan,16
  db 3
  !ds2
  !pan,10
  db 6
  !f2
  !pan,13
  db 5
  !as2
  !pan,10
  db 6
  !d2
  !end

.sub610B
  db 72
  !tie
  db 96
  !g3
  !end

.sub6110
  !instr,!instr0E
  !subtranspose,0
  !volume,230
  !pan,10
  db 4,$7F
  !f2
  !g2
  !gs2
  !volume,230
  !dynamicVolume,12,255
  !c3
  !ds3
  !g3
  !end

.sub6126
  !volume,245
.sub623C:
  db 4
  !f2
  !g2
  !gs2
  !c3
  !ds3
  !g3
  db 75
  !rest
  !end

.sub6132
  !volume,230
  db 4
  !f2
  !g2
  !gs2
  !volume,230
  !dynamicVolume,12,255
  !c3
  !ds3
  !g3
  db 75
  !rest
  !end

.sub6143
  db 75
  !rest
  db 4
  !f2
  !g2
  !gs2
  !c3
  !ds3
  !g3
  db 75
  !rest
  !end

.sub614F
  !d2
  db 5
  !ds2
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !a2
  db 4
  !d2
  db 5
  !as2
  db 4
  !f3
  db 6
  !d2
  !e3
  !c2
  db 3
  !ds2
  db 6
  !f2
  db 5
  !as2
  db 6
  !d2
  !end

.sub616C
  !b5
  !f5
  db 48
  !as5
  !a5
  db 24
  !gs5
  !d5
  !g5
  !cs5
  db 48
  !fs5
  !pitchSlide,3,48 : !e5
  !tie
  !rest
  !end

.sub6246
  !d2
  db 5
  !ds2
  !pan,5
  db 6
  !a2
  !pan,12
  db 3
  !c2
  !pan,4
  db 6
  !f3
  !pan,8
  db 4
  !d2
  !volume,220
  !dynamicVolume,25,160
  db 5
  !as2
  !pan,16
  db 4
  !f3
  !pan,4
  db 6
  !d2
  !pan,10
  !e3
  !pan,8
  !c2
  !pan,13
  db 3
  !ds2
  !pan,4
  db 6
  !ds2
  !f2
  db 5
  !as2
  db 6
  !d2
  !pan,12
  !d2
  db 5
  !ds2
  !pan,10
  db 6
  !a2
  !pan,16
  db 4
  !c2
  !pan,8
  db 6
  !f3
  !pan,4
  !a2
  !pan,10
  db 4
  !d2
  !pan,12
  db 5
  !as2
  !pan,16
  db 4
  !f3
  !pan,12
  db 6
  !d2
  !pan,10
  !e3
  !pan,4
  db 8
  !c2
  !pan,9
  db 6
  !f2
  !pan,16
  db 5
  !as2
  !pan,8
  db 6
  !d2
  !volume,160
  !dynamicVolume,96,230
  !d2
  db 5
  !ds2
  !pan,10
  db 6
  !a2
  db 3
  !c2
  db 6
  !f3
  !a2
  !pan,5
  db 4
  !d2
  !pan,12
  db 5
  !as2
  !pan,8
  db 4
  !f3
  !pan,5
  db 6
  !d2
  !pan,10
  !e3
  !pan,13
  !c2
  !pan,10
  db 3
  !ds2
  db 6
  !f2
  !pan,16
  db 5
  !as2
  db 6
  !d2
  !end

.sub62E6
  !instr,!instr1B
  !subtranspose,0
  !volume,240
  !pan,10
  db 96
  !rest
  !endVibrato
  db 96,$7F
  !ds6
  !pitchSlide,60,36 : !f5
  db 24
  !tie
  db 72
  !rest
  !end

.sub62FD
  !volume,240
  !dynamicVolume,24,100
  db 24
  !g5
  !volume,255
  !dynamicVolume,72,0
  db 72
  !g5
  !volume,240
  !dynamicVolume,72,0
  !fs5
  db 24
  !rest
  db 96
  !rest
  !volume,255
  !g5
  !pitchSlide,24,48 : !f5
  !volume,255
  !dynamicVolume,72,100
  db 72
  !f5
  db 24
  !rest
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
