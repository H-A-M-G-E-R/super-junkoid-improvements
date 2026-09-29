asar 1.91
norom : org 0
incsrc "../defines.asm"

!instr03 = $16
!instr06 = $17
!instr1B = $18
!instr1C = $19

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !instr03,$FF,$F0,$B8,$03,$D0
  db !instr06,$BF,$13,$B8,$03,$00
  db !instr1B,$FF,$E0,$B8,$03,$00
  db !instr1C,$FB,$E0,$B8,$03,$D0
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample03,Sample03+2556
  dw Sample05_06,Sample05_06+216
  dw Sample1B,Sample1B+1170
  dw Sample1C,Sample1C+27
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample03: incbin "Sample_30dbe99be68fe8d9fef32d4474bfb594.brr"
  Sample05_06: incbin "Sample_747efcf82250b87828c62d8ff47951c0.brr"
  Sample1B: incbin "Sample_c1874974731487b0f0a7f401e3383652.brr"
  Sample1C: incbin "Sample_6b798d5677b078a0952851718094bf9d.brr"

NoteLengthTable: ; note length table
  db $65,$7F,$98,$B2,$CB,$E5,$F2,$FC
  db $4C,$59,$6D,$7F,$87,$8E,$98,$A0,$A8,$B2,$BF,$CB,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker4739

Tracker4739:
  dw .pattern0
-
  dw .pattern1
  dw $00C8,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, 0, 0, 0
.pattern1: dw .pattern1_0, 0, 0, 0, 0, 0, 0, 0

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !echo,%00011111,26,26
  !echoParameters,4,50,2
  !musicVolume,255
  !tempo,47
  !instr,!instr03
  !pan,11
  !volume,230
  db 6,$77
  !c6
  !f6
  !a6
  db 18,$17
  !c7
  !f7
  !e7
  !d7
  !c7
  !a6
  !as6
  !g6
  !f6
  !rest
  db 18,$07
  !f7
  !rest
  !f6
  db 55
  !rest
  !end

.pattern0_1
  !subtranspose,20
  !instr,!instr06
  !volume,230
  !pan,9
  db 6,$77
  !c6
  !f6
  db 7
  !a6
  db 18,$17
  !c7
  !f7
  !e7
  !d7
  !c7
  !a6
  !as6
  !g6
  !f6
  !rest
  db 18,$07
  !f7
  !rest
  !f6
  db 54
  !rest
  !end

.pattern0_2
  db 19
  !rest
  !instr,!instr1B
  !volume,178
  !pan,5
  db 18,$27
  !g5
  db 54
  !rest
  db 18
  !as5
  !rest
  !c5
  !rest
  !f5
  db 126
  !rest
  !end

.pattern0_3
  db 19
  !rest
  !instr,!instr1B
  !volume,178
  !pan,15
  db 18,$27
  !a5
  db 54
  !rest
  db 18
  !d6
  !rest
  !g5
  !rest
  !a5
  db 126
  !rest
  !end

.pattern0_4
  db 19
  !rest
  !instr,!instr1B
  !volume,178
  !pan,10
  db 18,$27
  !c6
  !instr,!instr1C
  !volume,136
  db 6,$77
  !c6
  !f6
  !a6
  db 36,$47
  !c7
  !instr,!instr1B
  !volume,178
  db 18,$27
  !f6
  !instr,!instr1C
  !volume,131
  !pan,5
  db 6,$77
  !as5
  !d6
  !f6
  !instr,!instr1B
  !pan,10
  !volume,178
  db 18,$27
  !d6
  !instr,!instr1C
  !volume,125
  !pan,15
  db 6,$77
  !g5
  !as5
  !d6
  !instr,!instr1B
  !volume,178
  !pan,10
  db 18,$27
  !c6
  db 126
  !rest
  !end

.pattern1_0
  db 72
  !rest
  !rest
  !loop : dw .sub482C : db 10
  !end

.sub482C
  !rest
  !rest
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
