; Originally by ZUN, arranged by JX444444 (https://www.smwcentral.net/?p=section&a=details&id=25704)
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
!sample1D = $1F

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample1D,$FF,$E0,$B8,$04,$80
  db !sample1B,$FF,$ED,$B8,$04,$79
  db !sample16,$FF,$E0,$B8,$0F,$58
  db !sample1C,$FF,$F5,$B8,$03,$FA
  db !sample17,$FF,$E0,$B8,$0F,$5E
  db !sample1A,$FF,$E8,$B4,$07,$A5
  db !sample18,$FF,$E0,$B8,$07,$E5
  db !sample15,$FF,$F3,$B8,$05,$C4
  db !sample14,$FF,$F6,$B8,$07,$7E
  db !sample19,$FF,$E0,$B4,$06,$02
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample14,Sample14+27
  dw Sample15,Sample15+1179
  dw Sample16,Sample16+2250
  dw Sample17,Sample17+3384
  dw Sample18,Sample18+2520
  dw Sample19,Sample19+513
  dw Sample1A,Sample1A+0
  dw Sample1B,Sample1B+702
  dw Sample1C,Sample1C+27
  dw Sample1D,Sample1D+27
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample14: incbin "12.brr":2..0
  Sample15: incbin "14.brr":2..0
  Sample16: incbin "15.brr":2..0
  Sample17: incbin "16.brr":2..0
  Sample18: incbin "18.brr":2..0
  Sample19: incbin "19.brr":2..0
  Sample1A: incbin "Hit.brr":2..0
  Sample1B: incbin "bass.brr":2..0
  Sample1C: incbin "sawtooth.brr":2..0
  Sample1D: incbin "synth strings.brr":2..0

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
  !musicVolume,170;130
  !tempo,58
  !setDPMiscCommand,!noteEndInTicks,1
  !echo,%00101111,-75,75
  !echoParameters,3,68,3
  !toggleKeyOffGain
  !instr,!instr1E
  !volume,144
  !loop : dw .sub2F92 : db 1
  db 24,$7F
  !rest
  db 96
  !b4
  db 96
  !rest
  !tie
  !tie
  db 24
  !tie
  !subtranspose,69
  !instr,!instr21
  !volume,70
  !loop : dw .sub2FFC : db 1
  db 12,$7F
  !b6
  !b6
  !fs6
  !a6
  !b6
  !fs6
  !rest
  !a6
  !rest
  !b6
  !fs6
  !a6
  !b6
  !b6
  !subtranspose,0
  !instr,!instr23
  !loop : dw .sub300F : db 2
  db 48,$7F
  !rest
  !volume,181
  db 24
  !b3
  !instr,!instr27
  !volume,144
  !fs4
  !b4
  !fs5
  db 36
  !e5
  !d5
  db 24
  !cs5
  db 96
  !b4
  !tie
  !instr,!instr23
  !volume,181
  db 24
  !g3
  !instr,!instr27
  !volume,144
  !fs4
  !b4
  !d5
  db 36
  !cs5
  !b4
  db 24
  !a4
  db 96
  !fs4
  !tie
  db 24
  !fs4
  db 48
  !b4
  db 72
  !b4
  db 48
  !d5
  db 96
  !cs5
  !tie
  db 36
  !cs5
  !fs5
  db 24
  !e5
  db 96
  !fs5
  !instr,!instr23
  !loop : dw .sub300F : db 2
  db 48,$7F
  !rest
  !volume,181
  db 24
  !b3
  !instr,!instr27
  !volume,144
  !fs4
  !b4
  !fs5
  db 36
  !e5
  !d5
  db 24
  !cs5
  db 96
  !b4
  !tie
  !instr,!instr23
  !volume,181
  db 24
  !g3
  !instr,!instr27
  !volume,144
  !fs4
  !b4
  !d5
  db 36
  !cs5
  !b4
  db 24
  !a4
  db 96
  !fs4
  !tie
  db 24
  !fs4
  db 48
  !b4
  db 72
  !b4
  db 48
  !d5
  db 96
  !cs5
  !tie
  db 36
  !cs5
  !fs5
  db 24
  !e5
  db 96
  !fs5
  db 12
  !rest
  !subtranspose,37
  !instr,!instr21
  !volume,98
  !loop : dw .sub2FFC : db 15
  db 12,$7F
  !b6
  !b6
  !fs6
  !a6
  !b6
  !fs6
  !rest
  !a6
  !rest
  !b6
  !fs6
  !a6
  !b6
  !b6
  !fs6
  !end

.pattern0_1
  !toggleKeyOffGain
  db 12,$7F
  !rest
  !instr,!instr1E
  !volume,118
  !loop : dw .sub2F92 : db 1
  db 12,$7F
  !rest
  !subtranspose,37
  !instr,!instr21
  !loop : dw .sub2FFC : db 2
  !tempo,60
  !subtranspose,0
  !loop : dw .sub2FFC : db 2
  !loop : dw .sub2FFC : db 6
  !loop : dw .sub301B : db 1
  !loop : dw .sub3026 : db 1
  !loop : dw .sub301B : db 1
  !loop : dw .sub3026 : db 1
  !loop : dw .sub2FFC : db 6
  !loop : dw .sub301B : db 1
  !loop : dw .sub3026 : db 1
  !loop : dw .sub301B : db 1
  !instr,!instr25
  !volume,162
  db 48,$7F
  !c5
  !c5
  !instr,!instr21
  !volume,124
  !loop : dw .sub2FFC : db 16
  !end

.pattern0_2
  !toggleKeyOffGain
  !subtranspose,37
  db 96,$7F
  !rest
  !instr,!instr1E
  !volume,144
  !loop : dw .sub3031 : db 1
  db 48,$7F
  !fs4
  db 24
  !rest
  !fs4
  !rest
  db 48
  !fs4
  db 24
  !rest
  db 48
  !gs4
  db 24
  !rest
  !gs4
  !rest
  db 48
  !gs4
  db 24
  !rest
  !loop : dw .sub3031 : db 1
  !volume,162
  !subloop,0
  db 12,$7F
  !d4
  !rest
  db 24
  !d4
  !d4
  !d4
  !subloop,7
  !instr,!instr24
  !volume,208
  !loop : dw .sub3047 : db 1
  !loop : dw .sub3063 : db 1
  !loop : dw .sub3047 : db 1
  !loop : dw .sub3072 : db 1
  !loop : dw .sub307E : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3090 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub30A3 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3090 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3072 : db 1
  db 24,$7F
  !rest
  !volume,187
  db 48
  !a4
  !loop : dw .sub30B6 : db 1
  !loop : dw .sub30CE : db 1
  !loop : dw .sub30B6 : db 1
  db 12,$7F
  !b4
  !rest
  !b4
  !b4
  db 24
  !rest
  !b4
  !rest
  !d5
  !cs5
  !a4
  !b4
  db 12
  !rest
  db 60
  !b4
  db 24
  !rest
  !fs4
  !fs4
  !a4
  !loop : dw .sub30B6 : db 1
  !loop : dw .sub30CE : db 1
  !loop : dw .sub30B6 : db 1
  db 12,$7F
  !b4
  !rest
  !b4
  !b4
  db 24
  !rest
  !b4
  !rest
  !d5
  !cs5
  !a4
  !b4
  db 12
  !rest
  db 48
  !b4
  db 12
  !rest
  !instr,!instr23
  !volume,208
  !b3
  !rest
  !b3
  !rest
  !b3
  db 24
  !b3
  db 12
  !rest
  !end

.pattern0_3
  !toggleKeyOffGain
  db 96,$7F
  !rest
  !instr,!instr1E
  !volume,144
  !loop : dw .sub30E6 : db 1
  db 48,$7F
  !b3
  db 24
  !rest
  !b3
  !rest
  db 48
  !b3
  db 24
  !rest
  db 48
  !d4
  db 24
  !rest
  !d4
  !rest
  db 48
  !d4
  db 24
  !rest
  !loop : dw .sub30E6 : db 1
  !volume,162
  !loop : dw .sub30FC : db 2
  !subtranspose,37
  !instr,!instr24
  !volume,131
  db 24,$7F
  !d5
  !loop : dw .sub3047 : db 1
  !loop : dw .sub3063 : db 1
  !loop : dw .sub3047 : db 1
  !loop : dw .sub3072 : db 1
  !loop : dw .sub307E : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3090 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub30A3 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3090 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3072 : db 1
  !volume,187
  db 48,$7F
  !fs4
  !subtranspose,0
  !loop : dw .sub311A : db 1
  db 12,$7F
  !g4
  !rest
  !g4
  !g4
  db 24
  !rest
  !g4
  !rest
  !b4
  !a4
  !fs4
  !d4
  db 12
  !rest
  db 60
  !d4
  db 24
  !rest
  !d4
  !d4
  !fs4
  !loop : dw .sub311A : db 1
  db 12,$7F
  !g4
  !rest
  !g4
  !g4
  db 24
  !rest
  !g4
  !rest
  !b4
  !a4
  !fs4
  !fs4
  db 12
  !rest
  db 60
  !fs4
  db 24
  !rest
  !d5
  !d5
  !e5
  !loop : dw .sub3132 : db 1
  db 24,$7F
  !b5
  !a5
  !e5
  !d5
  db 12
  !rest
  db 60
  !d5
  db 24
  !rest
  !d5
  !d5
  !e5
  !loop : dw .sub3132 : db 1
  db 24,$7F
  !d6
  !cs6
  !a5
  !b5
  db 12
  !rest
  db 48
  !b5
  db 12
  !rest
  !instr,!instr23
  !volume,208
  !d4
  !rest
  !d4
  !rest
  !d4
  db 24
  !d4
  db 12
  !rest
  !end

.pattern0_4
  !subloop,0
  db 96,$7F
  !rest
  !subloop,8
  !instr,!instr1F
  !volume,224
  db 24,$7F
  !g3
  db 48
  !rest
  db 24
  !g3
  db 96
  !rest
  db 24
  !a3
  db 48
  !rest
  db 24
  !a3
  !subloop,0
  db 96,$7F
  !rest
  db 24
  !b3
  db 48
  !rest
  db 24
  !b3
  !subloop,3
  db 12,$7F
  !b3
  !b4
  !fs4
  !a4
  !b4
  !b3
  !fs4
  !d4
  !loop : dw .sub3153 : db 2
  !loop : dw .sub3164 : db 2
  !loop : dw .sub3175 : db 2
  !loop : dw .sub3186 : db 2
  !loop : dw .sub3153 : db 2
  !loop : dw .sub3164 : db 2
  !loop : dw .sub3175 : db 2
  !loop : dw .sub3186 : db 2
  !loop : dw .sub3197 : db 1
  !loop : dw .sub31A8 : db 1
  !loop : dw .sub3197 : db 1
  !loop : dw .sub31A8 : db 1
  !loop : dw .sub3175 : db 1
  !loop : dw .sub3186 : db 1
  !subloop,0
  !loop : dw .sub3197 : db 1
  !loop : dw .sub31A8 : db 1
  !subloop,2
  !loop : dw .sub3175 : db 1
  !loop : dw .sub3186 : db 1
  !loop : dw .sub3197 : db 1
  !loop : dw .sub31A8 : db 1
  !end

.pattern0_5
  !subloop,0
  db 96,$7F
  !rest
  !subloop,12
  db 12,$7F
  !tie
  !subtranspose,37
  !instr,!instr21
  !volume,91
  !loop : dw .sub2FFC : db 3
  db 12,$7F
  !b6
  !b6
  !fs6
  !a6
  !b6
  !fs6
  !rest
  !a6
  !subtranspose,0
  !instr,!instr22
  !echo,%00101111,-75,75
  !volume,224
  !c4
  db 24
  !c4
  !c4
  db 12
  !c4
  !c4
  !loop : dw .sub31B9 : db 4
  !end

.pattern0_6
  !subloop,0
  db 96,$7F
  !rest
  !subloop,8
  !instr,!instr20
  !volume,224
  !subloop,0
  db 48,$7F
  !c4
  !subloop,21
  db 36,$7F
  !c4
  db 60
  !c4
  !loop : dw .sub31E4 : db 8
  !end

.pattern1_0
  !subtranspose,0
  !instr,!instr23
  !loop : dw .sub300F : db 2
  db 48,$7F
  !rest
  !volume,181
  db 24
  !b3
  !instr,!instr27
  !volume,144
  !fs4
  !b4
  !fs5
  db 36
  !e5
  !d5
  db 24
  !cs5
  db 96
  !b4
  !tie
  !instr,!instr23
  !volume,181
  db 24
  !g3
  !instr,!instr27
  !volume,144
  !fs4
  !b4
  !d5
  db 36
  !cs5
  !b4
  db 24
  !a4
  db 96
  !fs4
  !tie
  db 24
  !fs4
  db 48
  !b4
  db 72
  !b4
  db 48
  !d5
  db 96
  !cs5
  !tie
  db 36
  !cs5
  !fs5
  db 24
  !e5
  db 96
  !fs5
  !instr,!instr23
  !loop : dw .sub300F : db 2
  db 48,$7F
  !rest
  !volume,181
  db 24
  !b3
  !instr,!instr27
  !volume,144
  !fs4
  !b4
  !fs5
  db 36
  !e5
  !d5
  db 24
  !cs5
  db 96
  !b4
  !tie
  !instr,!instr23
  !volume,181
  db 24
  !g3
  !instr,!instr27
  !volume,144
  !fs4
  !b4
  !d5
  db 36
  !cs5
  !b4
  db 24
  !a4
  db 96
  !fs4
  !tie
  db 24
  !fs4
  db 48
  !b4
  db 72
  !b4
  db 48
  !d5
  db 96
  !cs5
  !tie
  db 36
  !cs5
  !fs5
  db 24
  !e5
  db 96
  !fs5
  db 12
  !rest
  !subtranspose,37
  !instr,!instr21
  !volume,98
  !loop : dw .sub2FFC : db 15
  db 12,$7F
  !b6
  !b6
  !fs6
  !a6
  !b6
  !fs6
  !rest
  !a6
  !rest
  !b6
  !fs6
  !a6
  !b6
  !b6
  !fs6
  !end

.pattern1_1
  !loop : dw .sub2FFC : db 6
  !loop : dw .sub301B : db 1
  !loop : dw .sub3026 : db 1
  !loop : dw .sub301B : db 1
  !loop : dw .sub3026 : db 1
  !loop : dw .sub2FFC : db 6
  !loop : dw .sub301B : db 1
  !loop : dw .sub3026 : db 1
  !loop : dw .sub301B : db 1
  !instr,!instr25
  !volume,162
  db 48,$7F
  !c5
  !c5
  !instr,!instr21
  !volume,124
  !loop : dw .sub2FFC : db 16
  !end

.pattern1_2
  !instr,!instr24
  !volume,208
  !loop : dw .sub3047 : db 1
  !loop : dw .sub3063 : db 1
  !loop : dw .sub3047 : db 1
  !loop : dw .sub3072 : db 1
  !loop : dw .sub307E : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3090 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub30A3 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3090 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3072 : db 1
  db 24,$7F
  !rest
  !volume,187
  db 48
  !a4
  !loop : dw .sub30B6 : db 1
  !loop : dw .sub30CE : db 1
  !loop : dw .sub30B6 : db 1
  db 12,$7F
  !b4
  !rest
  !b4
  !b4
  db 24
  !rest
  !b4
  !rest
  !d5
  !cs5
  !a4
  !b4
  db 12
  !rest
  db 60
  !b4
  db 24
  !rest
  !fs4
  !fs4
  !a4
  !loop : dw .sub30B6 : db 1
  !loop : dw .sub30CE : db 1
  !loop : dw .sub30B6 : db 1
  db 12,$7F
  !b4
  !rest
  !b4
  !b4
  db 24
  !rest
  !b4
  !rest
  !d5
  !cs5
  !a4
  !b4
  db 12
  !rest
  db 48
  !b4
  db 12
  !rest
  !instr,!instr23
  !volume,208
  !b3
  !rest
  !b3
  !rest
  !b3
  db 24
  !b3
  db 12
  !rest
  !end

.pattern1_3
  !subtranspose,37
  !instr,!instr24
  !volume,131
  db 24,$7F
  !d5
  !loop : dw .sub3047 : db 1
  !loop : dw .sub3063 : db 1
  !loop : dw .sub3047 : db 1
  !loop : dw .sub3072 : db 1
  !loop : dw .sub307E : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3090 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub30A3 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3090 : db 1
  !loop : dw .sub3084 : db 1
  !loop : dw .sub3072 : db 1
  !volume,187
  db 48,$7F
  !fs4
  !subtranspose,0
  !loop : dw .sub311A : db 1
  db 12,$7F
  !g4
  !rest
  !g4
  !g4
  db 24
  !rest
  !g4
  !rest
  !b4
  !a4
  !fs4
  !d4
  db 12
  !rest
  db 60
  !d4
  db 24
  !rest
  !d4
  !d4
  !fs4
  !loop : dw .sub311A : db 1
  db 12,$7F
  !g4
  !rest
  !g4
  !g4
  db 24
  !rest
  !g4
  !rest
  !b4
  !a4
  !fs4
  !fs4
  db 12
  !rest
  db 60
  !fs4
  db 24
  !rest
  !d5
  !d5
  !e5
  !loop : dw .sub3132 : db 1
  db 24,$7F
  !b5
  !a5
  !e5
  !d5
  db 12
  !rest
  db 60
  !d5
  db 24
  !rest
  !d5
  !d5
  !e5
  !loop : dw .sub3132 : db 1
  db 24,$7F
  !d6
  !cs6
  !a5
  !b5
  db 12
  !rest
  db 48
  !b5
  db 12
  !rest
  !instr,!instr23
  !volume,208
  !d4
  !rest
  !d4
  !rest
  !d4
  db 24
  !d4
  db 12
  !rest
  !end

.pattern1_4
  !loop : dw .sub3153 : db 2
  !loop : dw .sub3164 : db 2
  !loop : dw .sub3175 : db 2
  !loop : dw .sub3186 : db 2
  !loop : dw .sub3153 : db 2
  !loop : dw .sub3164 : db 2
  !loop : dw .sub3175 : db 2
  !loop : dw .sub3186 : db 2
  !loop : dw .sub3197 : db 1
  !loop : dw .sub31A8 : db 1
  !loop : dw .sub3197 : db 1
  !loop : dw .sub31A8 : db 1
  !loop : dw .sub3175 : db 1
  !loop : dw .sub3186 : db 1
  !subloop,0
  !loop : dw .sub3197 : db 1
  !loop : dw .sub31A8 : db 1
  !subloop,2
  !loop : dw .sub3175 : db 1
  !loop : dw .sub3186 : db 1
  !loop : dw .sub3197 : db 1
  !loop : dw .sub31A8 : db 1
  !end

.pattern1_5
  !loop : dw .sub31B9 : db 4
  !end

.pattern1_6
  !loop : dw .sub31E4 : db 8
  !end

.sub2F92
  db 24,$7F
  !b4
  !rest
  !d5
  !rest
  !fs5
  !vibrato,0,12,30
  db 48
  !tie
  db 24
  !rest
  !endVibrato
  !e5
  !rest
  !a5
  !rest
  !fs5
  !vibrato,0,12,30
  db 48
  !tie
  db 24
  !rest
  !endVibrato
  !e5
  !rest
  !b5
  !rest
  !fs5
  !vibrato,0,12,30
  db 48
  !tie
  db 24
  !rest
  !endVibrato
  !cs6
  !vibrato,0,12,30
  db 48
  !tie
  db 24
  !rest
  !endVibrato
  db 6
  !b5
  !cs6
  db 36
  !d6
  !vibrato,0,12,30
  db 72
  !tie
  db 24
  !rest
  !endVibrato
  db 12
  !b4
  !rest
  !cs5
  !rest
  db 24
  !d5
  !vibrato,0,12,30
  db 48
  !tie
  db 24
  !rest
  !endVibrato
  !fs4
  !rest
  !d5
  !rest
  !cs5
  !vibrato,0,12,30
  !tie
  !rest
  !endVibrato
  !e5
  !vibrato,0,12,30
  !tie
  !rest
  !endVibrato
  !fs5
  !end

.sub2FFC
  db 12,$7F
  !b6
  !b6
  !fs6
  !a6
  !b6
  !fs6
  !rest
  !a6
  !rest
  !b6
  !fs6
  !a6
  !b6
  !b6
  !fs6
  !a6
  !end

.sub300F
  !volume,181
  db 24,$7F
  !b3
  !volume,144
  !b3
  !volume,91
  !b3
  !end

.sub301B
  db 12,$7F
  !cs7
  !cs7
  !fs6
  !as6
  !cs7
  !fs6
  !rest
  !as6
  !end

.sub3026
  db 12,$7F
  !rest
  !cs7
  !fs6
  !as6
  !cs7
  !cs7
  !fs6
  !as6
  !end

.sub3031
  db 48,$7F
  !d4
  db 24
  !rest
  !d4
  !rest
  db 48
  !d4
  db 24
  !rest
  db 48
  !e4
  db 24
  !rest
  !e4
  !rest
  db 48
  !e4
  db 24
  !rest
  !end

.sub3047
  db 48,$7F
  !fs5
  db 24
  !rest
  !fs5
  !rest
  !fs5
  !e5
  !fs5
  !b4
  db 12
  !rest
  db 60
  !b4
  db 24
  !rest
  !b4
  !cs5
  !d5
  db 48
  !fs5
  db 24
  !rest
  !fs5
  !rest
  !fs5
  !end

.sub3063
  db 24,$7F
  !a5
  !b5
  !fs5
  db 12
  !rest
  db 60
  !fs5
  db 24
  !rest
  !d5
  !d5
  !e5
  !end

.sub3072
  db 24,$7F
  !as5
  !b5
  !cs6
  db 12
  !rest
  db 24
  !fs6
  db 60
  !rest
  !end

.sub307E
  db 24,$7F
  !rest
  db 48
  !e5
  !end

.sub3084
  db 12,$7F
  !fs5
  !rest
  !fs5
  !fs5
  db 24
  !rest
  !fs5
  !rest
  !fs5
  !end

.sub3090
  db 24,$7F
  !e5
  !fs5
  !b4
  db 12
  !rest
  db 60
  !b4
  db 24
  !rest
  db 12
  !b4
  !fs4
  !cs5
  !b4
  !d5
  !e5
  !end

.sub30A3
  db 24,$7F
  !a5
  !b5
  !fs5
  db 12
  !rest
  db 60
  !fs5
  db 24
  !rest
  db 12
  !b4
  !fs5
  !e5
  !d5
  !cs5
  !e5
  !end

.sub30B6
  db 12,$7F
  !b4
  !rest
  !b4
  !b4
  db 24
  !rest
  !b4
  !rest
  !b4
  !a4
  !b4
  !fs4
  db 12
  !rest
  db 60
  !fs4
  db 24
  !rest
  !fs4
  !fs4
  !a4
  !end

.sub30CE
  db 12,$7F
  !b4
  !rest
  !b4
  !b4
  db 24
  !rest
  !b4
  !rest
  !d5
  !cs5
  !a4
  !fs4
  db 12
  !rest
  db 60
  !fs4
  db 24
  !rest
  !fs4
  !fs4
  !a4
  !end

.sub30E6
  db 48,$7F
  !g3
  db 24
  !rest
  !g3
  !rest
  db 48
  !g3
  db 24
  !rest
  db 48
  !a3
  db 24
  !rest
  !a3
  !rest
  db 48
  !a3
  db 24
  !rest
  !end

.sub30FC
  db 12,$7F
  !b3
  !rest
  db 24
  !fs4
  !fs4
  !fs4
  db 12
  !b3
  !rest
  db 24
  !gs4
  !gs4
  !gs4
  db 12
  !b3
  !rest
  db 24
  !a4
  !a4
  !a4
  db 12
  !b3
  !rest
  db 24
  !gs4
  !gs4
  !gs4
  !end

.sub311A
  db 12,$7F
  !g4
  !rest
  !g4
  !g4
  db 24
  !rest
  !g4
  !rest
  !g4
  !fs4
  !g4
  !d4
  db 12
  !rest
  db 60
  !d4
  db 24
  !rest
  !d4
  !d4
  !fs4
  !end

.sub3132
  db 12,$7F
  !fs5
  !rest
  !fs5
  !fs5
  db 24
  !rest
  !fs5
  !rest
  !fs5
  !e5
  !fs5
  !b4
  db 12
  !rest
  db 60
  !b4
  db 24
  !rest
  !d5
  !d5
  !e5
  db 12
  !fs5
  !rest
  !fs5
  !fs5
  db 24
  !rest
  !fs5
  !rest
  !end

.sub3153
  db 24,$7F
  !b3
  !b3
  !b3
  db 12
  !b3
  !b3
  !rest
  !b3
  !b3
  !rest
  !b3
  !rest
  !b3
  !b3
  !end

.sub3164
  db 24,$7F
  !g3
  !g3
  !g3
  db 12
  !g3
  !g3
  !rest
  !g3
  !g3
  !rest
  !g3
  !rest
  !g3
  !g3
  !end

.sub3175
  db 24,$7F
  !e3
  !e3
  !e3
  db 12
  !e3
  !e3
  !rest
  !e3
  !e3
  !rest
  !e3
  !rest
  !e3
  !e3
  !end

.sub3186
  db 24,$7F
  !fs3
  !fs3
  !fs3
  db 12
  !fs3
  !fs3
  !rest
  !fs3
  !fs3
  !rest
  !fs3
  !rest
  !fs3
  !fs3
  !end

.sub3197
  db 24,$7F
  !g3
  !g3
  !g3
  db 12
  !g3
  !g3
  !rest
  !g3
  !g3
  !rest
  !a3
  !rest
  !a3
  !a3
  !end

.sub31A8
  db 24,$7F
  !b3
  !b3
  !b3
  db 12
  !b3
  !b3
  !rest
  !b3
  !b3
  !rest
  !b3
  !rest
  !b3
  !b3
  !end

.sub31B9
  !subloop,0
  !instr,!instr20
  !echo,%00001111,-75,75
  db 48,$7F
  !c4
  !instr,!instr22
  !echo,%00101111,-75,75
  !c4
  !subloop,14
  !instr,!instr20
  !echo,%00001111,-75,75
  db 12,$7F
  !c4
  !instr,!instr22
  !echo,%00101111,-75,75
  !c4
  db 24
  !c4
  !c4
  db 12
  !c4
  !c4
  !end

.sub31E4
  !instr,!instr25
  !volume,224
  db 48,$7F
  !c5
  !instr,!instr26
  !volume,118
  !subloop,0
  db 12,$7F
  !c5
  !subloop,59
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
