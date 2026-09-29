; Originally by Toby Fox, arranged by EstrelaRadiosa (https://www.smwcentral.net/?p=section&a=details&id=38200)
; Requires common instrument $0B (Synth Pad) to be removed or replaced by a smaller sample.
asar 1.91
norom : org 0
incsrc "../defines.asm"

!instr08 = $16
!instr0A = $17
!instr17 = $18

!instr1E = $19
!instr1F = $1A
!instr20 = $1B
!instr21 = $1C
!instr22 = $1D
!instr23 = $1E
!instr24 = $1F
!instr25 = $20
!instr26 = $21
!instr27 = $22
!instr28 = $23
!instr29 = $24
!instr2A = $25

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !instr08,$AE,$26,$B8,$1E,$00
  db !instr0A,$FE,$6A,$B8,$08,$00
  db !instr17,$8C,$E0,$70,$07,$00

  db !instr1E,$03,$FC,$FF,$05,$3B
  db !instr1F,$8F,$CC,$7F,$05,$7F
  db !instr20,$8F,$E0,$B8,$03,$00
  db !instr21,$0C,$12,$7F,$07,$F0
  db !instr22,$8F,$E0,$B8,$04,$00
  db !instr23,$8F,$CC,$7F,$09,$20
  db !instr24,$8F,$C0,$7F,$05,$70
  db !instr1E,$88,$E4,$7F,$05,$3B
  db !instr25,$8F,$E0,$7F,$07,$27
  db !instr26,$8F,$E0,$7F,$07,$26
  db !instr27,$8F,$E0,$7F,$03,$C7
  db !instr28,$8F,$E0,$7F,$04,$2C
  db !instr29,$8F,$E0,$7F,$05,$37
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample05,Sample05+9
  dw Sample0B,Sample0B+9
  dw Sample06,Sample06+0

  dw Sample14,Sample14+900
  dw Sample15,Sample15+1683
  dw Sample16,Sample16+54
  dw Sample17,Sample17+81
  dw Sample18,Sample18+9
  dw Sample19,Sample19+1044
  dw Sample1A,Sample1A+1125
  dw Sample1B,Sample1B+1683
  dw Sample1C,Sample1C+0
  dw Sample1D,Sample1D+0
  dw Sample1E,Sample1E+0
  dw Sample1F,Sample1F+0
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample05: incbin "05 SMW @8.brr":2..0
  Sample0B: incbin "0B SMW @10.brr":2..0
  Sample06: incbin "06 SMW @22.brr":2..0

  Sample14: incbin "Sample_dd798316f6e55b0320115ab48e947093.brr"
  Sample15: incbin "Sample_8a5b2bbfb130023f944d6950d1bcfd77.brr"
  Sample16: incbin "Sample_a95f173859b9a118b98fbd790bebf80c.brr"
  Sample17: incbin "Sample_b592d5a8993b1fcb1279eecd565b1da9.brr"
  Sample18: incbin "Sample_dbbef21d6f63db89b2542135be7474e7.brr"
  Sample19: incbin "Sample_58f9bb25ec0b7c4e540fa5ce39aa1a6b.brr"
  Sample1A: incbin "Sample_72b99168f39a649fecf8f1da543a3a8a.brr"
  Sample1B: incbin "Sample_8ff0e643ebd469da49a12d7c8d45b7ac.brr"
  Sample1C: incbin "Sample_ff4c9b5c5960d0485b754e1039f825ef.brr"
  Sample1D: incbin "Sample_5a06c109715e7c0aa634d6122e5bbbd4.brr"
  Sample1E: incbin "Sample_e84990d1b1a36392c28a36fd8f2c1abc.brr"
  Sample1F: incbin "Sample_b101b38d0d3712ed50fa6c40b5c26aa2.brr"

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2A50,Tracker2A50,Tracker2A50

Tracker2A50:
-
  dw .pattern0
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !tempo,49
  !musicVolume,255;248
  !echoParameters,6,70,0
  !echo,%00000000,0,0
  !instr,!instr1E
  !volume,149
  !loop : dw .sub30A7 : db 1
  !loop : dw .sub30A7 : db 1
  !loop : dw .sub30BC : db 1
  !loop : dw .sub30D1 : db 1
  !loop : dw .sub30A7 : db 1
  !loop : dw .sub30D1 : db 1
  !loop : dw .sub30E6 : db 1
  !loop : dw .sub30BC : db 1
  !echo,%00000010,38,-60
  !loop : dw .sub30A7 : db 1
  !loop : dw .sub30D1 : db 1
  !loop : dw .sub30E6 : db 1
  !loop : dw .sub30BC : db 1
  !loop : dw .sub30A7 : db 1
  !loop : dw .sub30FB : db 1
  !loop : dw .sub30E6 : db 1
  !loop : dw .sub3110 : db 1
  db 24,$7F
  !d5
  db 12
  !cs5
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 12
  !tie
  !echo,%01000010,38,-60
  !loop : dw .sub30A7 : db 1
  !loop : dw .sub30D1 : db 1
  !loop : dw .sub30E6 : db 1
  !loop : dw .sub30BC : db 1
  !instr,!instr1F
  !volume,137
  !echo,%00000011,38,-60
  !loop : dw .sub3121 : db 1
  db 18,$7F
  !f5
  db 6
  !rest
  db 18
  !g5
  db 6
  !rest
  db 18
  !a5
  db 6
  !rest
  db 18
  !c6
  db 6
  !rest
  db 18
  !cs6
  db 6
  !rest
  !gs5
  db 18
  !rest
  !loop : dw .sub314B : db 1
  !loop : dw .sub315C : db 1
  db 48,$7F
  !e5
  !f5
  !g5
  !e5
  db 96
  !a5
  db 6
  !a5
  !rest
  !gs5
  !rest
  !g5
  !rest
  !fs5
  !rest
  !f5
  !rest
  !e5
  !rest
  !ds5
  !rest
  !d5
  !rest
  db 96
  !cs5
  !pitchSlide,36,21 : !d5
  !d5
  !instr,!instr20
  !pan,15
  !volume,122
  !loop : dw .sub3121 : db 1
  db 18,$7F
  !f5
  db 6
  !rest
  db 18
  !g5
  db 6
  !rest
  db 18
  !a5
  db 6
  !rest
  db 18
  !c6
  db 6
  !rest
  db 18
  !d6
  db 6
  !rest
  !a5
  db 18
  !rest
  !loop : dw .sub314B : db 1
  !loop : dw .sub315C : db 1
  db 48,$7F
  !e5
  !f5
  !g5
  !e5
  db 96
  !a5
  db 6
  !a5
  !gs5
  !g5
  !fs5
  !f5
  !e5
  !ds5
  !d5
  !cs5
  !c5
  !b4
  !as4
  !a4
  !gs4
  !g4
  db 3
  !fs4
  !rest
  db 96
  !f4
  !tie
  !pitchSlide,10,54 : !f3
  !pan,10
  !echo,%10010010,38,-60
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,!instr1E
  !volume,149
  !loop : dw .sub30BC : db 1
  !loop : dw .sub30D1 : db 1
  !loop : dw .sub30E6 : db 2
  !loop : dw .sub30BC : db 1
  !loop : dw .sub30D1 : db 1
  !loop : dw .sub30A7 : db 2
  !echo,%00000000,0,0
  !subloop,0
  db 96,$7F
  !rest
  !subloop,27
  !loop : dw .sub30A7 : db 2
  !loop : dw .sub30BC : db 1
  !loop : dw .sub30D1 : db 1
  !end

.pattern0_1
  !instr,!instr1E
  !volume,110
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !loop : dw .sub3166 : db 1
  !instr,!instr21
  !loop : dw .sub30A7 : db 1
  !loop : dw .sub30D1 : db 1
  !loop : dw .sub30E6 : db 1
  !loop : dw .sub30BC : db 1
  !loop : dw .sub30A7 : db 1
  !loop : dw .sub30FB : db 1
  !loop : dw .sub30E6 : db 1
  !loop : dw .sub3110 : db 1
  !instr,!instr22
  !volume,82
  db 48,$7F
  !d6
  !pitchSlide,18,5 : !f6
  !loop : dw .sub31A1 : db 1
  db 6,$7F
  !f6
  db 18
  !rest
  db 6
  !f6
  !rest
  !f6
  db 18
  !rest
  db 6
  !g6
  db 18
  !rest
  db 6
  !gs6
  db 18
  !rest
  db 6
  !a6
  db 18
  !rest
  db 6
  !c7
  db 18
  !rest
  db 36
  !a6
  db 48
  !d7
  !pitchSlide,10,48 : !cs7
  !a6
  !as6
  !pitchSlide,10,48 : !a6
  !g6
  !loop : dw .sub31A1 : db 1
  db 96,$7F
  !rest
  db 18
  !f7
  db 6
  !rest
  db 18
  !e7
  db 6
  !rest
  db 18
  !d7
  db 6
  !rest
  db 18
  !c7
  db 6
  !rest
  db 18
  !as5
  db 6
  !rest
  !c6
  !rest
  !d6
  db 18
  !rest
  db 6
  !f6
  db 18
  !rest
  db 108
  !e6
  !instr,!instr24
  !volume,158
  db 24
  !as2
  !d3
  !f3
  !d3
  !instr,!instr1F
  !volume,137
  db 12
  !c5
  !a4
  !c5
  !d5
  !ds5
  !d5
  !c5
  !a4
  !ds5
  !a4
  db 24
  !ds5
  db 96
  !d5
  db 12
  !rest
  db 24
  !gs4
  db 12
  !a4
  db 6
  !c5
  db 18
  !rest
  db 6
  !a4
  !rest
  !gs4
  !rest
  !g4
  !rest
  !f4
  !rest
  !d4
  !rest
  !e4
  !rest
  db 18
  !f4
  db 6
  !rest
  db 18
  !g4
  db 6
  !rest
  db 18
  !a4
  db 6
  !rest
  db 18
  !c5
  db 6
  !rest
  db 18
  !cs5
  db 6
  !rest
  !gs4
  db 18
  !rest
  db 6
  !gs4
  !rest
  !g4
  !rest
  !f4
  !rest
  db 12
  !g4
  db 96
  !tie
  !pitchSlide,36,21 : !c4
  db 24
  !d4
  !e4
  !f4
  !d5
  db 48
  !c5
  !a4
  !cs5
  !d5
  !e5
  !cs5
  db 96
  !d5
  !rest
  !gs4
  !pitchSlide,36,21 : !a4
  !a4
  !instr,!instr23
  !volume,113
  !loop : dw .sub3121 : db 1
  db 48,$7F
  !f5
  !g5
  !a5
  !c6
  db 96
  !d6
  !loop : dw .sub315C : db 1
  db 48,$7F
  !a5
  !g5
  !c6
  !a5
  db 96
  !f6
  !tie
  !tie
  !tie
  !volume,137
  !instr,!instr25
  !loop : dw .sub31E0 : db 1
  !loop : dw .sub31E0 : db 1
  !subloop,0
  db 96,$7F
  !rest
  !subloop,35
  !end

.pattern0_2
  !volume,206
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,!instr29
  db 24
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  db 12
  !c5
  db 24
  !c5
  !c5
  db 12
  !c5
  db 24
  !c5
  !loop : dw .sub3206 : db 8
  !instr,!instr0A
  !loop : dw .sub3275 : db 7
  db 96,$7F
  !rest
  !tie
  !instr,!instr29
  db 24
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  db 12
  !c5
  db 24
  !c5
  !c5
  db 12
  !c5
  db 24
  !c5
  !loop : dw .sub3292 : db 4
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !end

.pattern0_3
  !volume,206
  !pan,9
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,!instr17
  !c5
  db 12
  !c5
  db 24
  !c5
  db 12
  !c5
  !loop : dw .sub3309 : db 32
  !loop : dw .sub331D : db 7
  db 96,$7F
  !rest
  !tie
  !tie
  db 12
  !c5
  !c5
  !c5
  !c5
  db 24
  !c5
  !c5
  !loop : dw .sub3309 : db 4
  !loop : dw .sub3309 : db 4
  !loop : dw .sub3309 : db 4
  !loop : dw .sub3309 : db 4
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !end

.pattern0_4
  !volume,131
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !loop : dw .sub3330 : db 1
  !loop : dw .sub3330 : db 1
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !loop : dw .sub3330 : db 1
  db 96,$7F
  !rest
  !loop : dw .sub3396 : db 1
  db 24,$7F
  !as3
  !as3
  !instr,!instr27
  db 12
  !as3
  !instr,!instr26
  db 24
  !as3
  db 12
  !as3
  !loop : dw .sub3396 : db 1
  !loop : dw .sub33EB : db 1
  !loop : dw .sub33EB : db 1
  !volume,178
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,!instr28
  !f5
  db 36
  !e5
  db 24
  !c5
  !e5
  !d5
  db 12
  !g4
  !a4
  db 36
  !c5
  db 24
  !f5
  db 36
  !e5
  db 24
  !c5
  !e5
  !d5
  db 12
  !g4
  !a4
  !c5
  !volume,131
  !instr,!instr26
  !loop : dw .sub3449 : db 1
  !loop : dw .sub33EB : db 1
  !loop : dw .sub3449 : db 1
  !loop : dw .sub33EB : db 1
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !end

.pattern0_5
  !volume,101
  !instr,!instr1E
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  db 12
  !tie
  db 96
  !as4
  db 84
  !tie
  db 12
  !rest
  db 84
  !c5
  db 96
  !c5
  !loop : dw .sub34A7 : db 1
  !instr,!instr08
  !volume,250
  !loop : dw .sub34C1 : db 4
  db 96,$7F
  !rest
  !loop : dw .sub34FC : db 1
  db 24,$7F
  !as2
  !as2
  db 12
  !as2
  db 24
  !as2
  db 12
  !as2
  !loop : dw .sub34FC : db 1
  !loop : dw .sub3535 : db 1
  !loop : dw .sub3535 : db 1
  !loop : dw .sub3573 : db 1
  !loop : dw .sub3535 : db 1
  !loop : dw .sub3573 : db 1
  db 24,$7F
  !as2
  !as2
  db 12
  !as2
  db 24
  !as2
  !as2
  !as2
  db 12
  !as2
  !as2
  !as2
  !as2
  !as2
  db 24
  !c3
  !c3
  db 12
  !c3
  db 24
  !c3
  !c3
  !c3
  db 12
  !c3
  !c3
  !c3
  !c3
  !c3
  db 96
  !rest
  !tie
  !tie
  !tie
  !loop : dw .sub35B1 : db 1
  !loop : dw .sub3535 : db 1
  !loop : dw .sub35B1 : db 1
  !loop : dw .sub3535 : db 1
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !end

.pattern0_6
  !volume,101
  !instr,!instr1E
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !loop : dw .sub34A7 : db 2
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,!instr22
  !volume,82
  db 18
  !a6
  db 6
  !rest
  !a6
  !rest
  !a6
  db 18
  !rest
  db 6
  !a6
  db 18
  !rest
  db 24
  !a6
  db 6
  !g6
  db 18
  !rest
  db 60
  !g6
  db 18
  !a6
  db 6
  !rest
  !a6
  !rest
  !a6
  db 18
  !rest
  db 6
  !a6
  db 18
  !rest
  db 6
  !g6
  db 18
  !rest
  db 6
  !a6
  db 18
  !rest
  db 6
  !d7
  db 18
  !rest
  db 6
  !a6
  !rest
  !g6
  !rest
  !d6
  !rest
  db 12
  !d7
  db 6
  !b5
  !rest
  db 12
  !a6
  db 6
  !d6
  !rest
  db 12
  !g6
  db 6
  !b5
  !rest
  db 12
  !f6
  db 6
  !d6
  !rest
  db 12
  !c7
  db 6
  !b5
  !rest
  db 12
  !g6
  db 6
  !g5
  !rest
  db 12
  !f6
  db 6
  !b5
  !rest
  db 12
  !e6
  db 6
  !g5
  db 90
  !rest
  db 108
  !c7
  !volume,101
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,!instr1E
  !loop : dw .sub35EF : db 1
  !loop : dw .sub35EF : db 1
  !subloop,0
  db 96,$7F
  !rest
  !subloop,35
  !end

.pattern0_7
  !volume,110
  !instr,!instr24
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !loop : dw .sub3621 : db 1
  !loop : dw .sub3621 : db 1
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !loop : dw .sub3621 : db 1
  db 96,$7F
  !rest
  !volume,110
  !instr,!instr24
  !volume,108
  !pan,15
  db 24
  !f3
  !as3
  !d4
  !as3
  db 6
  !f4
  !e4
  !d4
  !c4
  db 24
  !a3
  !g3
  !a3
  !g3
  !e3
  !c3
  !e3
  !a2
  !c3
  !d3
  !f3
  !d3
  !f3
  !d3
  !a2
  !f3
  !b2
  !f3
  !gs3
  db 96
  !b3
  db 24
  !d3
  !e3
  !f3
  !a3
  db 48
  !g3
  !f3
  db 24
  !e3
  !g3
  !a3
  !a3
  !g3
  !f3
  !e3
  !c3
  !a2
  !c3
  !d3
  !f3
  !d3
  !f3
  !d3
  !a2
  !f3
  !b2
  !f3
  !b2
  db 96
  !b3
  !pan,10
  db 96
  !as3
  !tie
  db 96
  !c4
  !tie
  db 96
  !d4
  !tie
  db 96
  !d4
  !tie
  db 96
  !as3
  !tie
  db 96
  !c4
  !tie
  db 96
  !d4
  !tie
  db 96
  !d4
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !volume,110
  !pan,8
  !instr,!instr21
  !loop : dw .sub30BC : db 1
  !loop : dw .sub30D1 : db 1
  !loop : dw .sub30E6 : db 1
  db 12,$7F
  !b4
  !d5
  !f5
  !d5
  !g5
  !rest
  !f5
  !rest
  !d5
  !c5
  !rest
  !a4
  !rest
  !g4
  !a4
  !c5
  !loop : dw .sub30BC : db 1
  !loop : dw .sub30D1 : db 1
  !loop : dw .sub362E : db 1
  !loop : dw .sub362E : db 1
  !pan,10
  !subloop,0
  db 96,$7F
  !rest
  !subloop,35
  !end

.sub30A7
  db 12,$7F
  !d5
  !d5
  !d6
  !rest
  !a5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !g5
  !rest
  db 24
  !f5
  db 12
  !d5
  !f5
  !g5
  !end

.sub30BC
  db 12,$7F
  !as4
  !as4
  !d6
  !rest
  !a5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !g5
  !rest
  db 24
  !f5
  db 12
  !d5
  !f5
  !g5
  !end

.sub30D1
  db 12,$7F
  !c5
  !c5
  !d6
  !rest
  !a5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !g5
  !rest
  db 24
  !f5
  db 12
  !d5
  !f5
  !g5
  !end

.sub30E6
  db 12,$7F
  !b4
  !b4
  !d6
  !rest
  !a5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !g5
  !rest
  db 24
  !f5
  db 12
  !d5
  !f5
  !g5
  !end

.sub30FB
  db 12,$7F
  !c5
  !c5
  !d6
  !rest
  !a5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !g5
  !rest
  db 24
  !c6
  db 12
  !a5
  !gs5
  !g5
  !end

.sub3110
  db 12,$7F
  !gs5
  !g5
  !f5
  db 24
  !g5
  db 12
  !f5
  !d5
  !f5
  db 24
  !f5
  db 12
  !e5
  !rest
  !end

.sub3121
  db 96,$7F
  !rest
  db 12
  !f5
  !d5
  !f5
  !g5
  !gs5
  !g5
  !f5
  !d5
  !gs5
  !d5
  db 24
  !gs5
  db 96
  !g5
  db 12
  !rest
  db 24
  !gs5
  db 12
  !a5
  db 6
  !c6
  db 18
  !rest
  db 6
  !a5
  !rest
  !gs5
  !rest
  !g5
  !rest
  !f5
  !rest
  !d5
  !rest
  !e5
  !rest
  !end

.sub314B
  db 6,$7F
  !gs5
  !rest
  !g5
  !rest
  !f5
  !rest
  db 12
  !g5
  db 96
  !tie
  !pitchSlide,36,21 : !c5
  !end

.sub315C
  db 24,$7F
  !f4
  !g4
  !a4
  !f5
  db 48
  !e5
  !d5
  !end

.sub3166
  db 24,$7F
  !d4
  !d4
  db 12
  !d4
  db 24
  !d4
  !d4
  !d4
  db 12
  !d4
  !d4
  !d4
  db 24
  !d4
  !c4
  !c4
  db 12
  !c4
  db 24
  !c4
  !c4
  !c4
  db 12
  !c4
  !c4
  !c4
  db 24
  !c4
  !b3
  !b3
  db 12
  !b3
  db 24
  !b3
  !b3
  !b3
  db 12
  !b3
  !b3
  !b3
  db 24
  !b3
  !as3
  !as3
  db 12
  !as3
  db 24
  !as3
  !c4
  !c4
  db 12
  !c4
  !c4
  !c4
  db 24
  !c4
  !end

.sub31A1
  db 18,$7F
  !f6
  db 6
  !rest
  !f6
  !rest
  !f6
  db 18
  !rest
  db 6
  !f6
  db 18
  !rest
  db 24
  !e6
  !pitchSlide,1,1 : !f6
  db 6
  !d6
  db 18
  !rest
  db 12
  !d6
  db 48
  !tie
  !pitchSlide,2,48 : !cs6
  db 18
  !f6
  db 6
  !rest
  !f6
  !rest
  !f6
  db 18
  !rest
  db 6
  !g6
  db 18
  !rest
  db 27
  !gs6
  db 3
  !g6
  !gs6
  !g6
  db 6
  !f6
  !rest
  !d6
  !rest
  db 12
  !f6
  db 6
  !g6
  db 30
  !rest
  !end

.sub31E0
  db 96,$7F
  !as4
  db 48
  !tie
  !f5
  db 96
  !e5
  !d5
  db 96
  !f5
  !tie
  db 96
  !tie
  !tie
  !pitchSlide,1,96 : !e5
  db 96
  !as4
  db 48
  !tie
  !f5
  db 96
  !e5
  !d5
  db 96
  !d5
  !tie
  db 96
  !tie
  !tie
  !pitchSlide,0,192 : !as4
  !end

.sub3206
  !instr,!instr29
  db 24,$7F
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  db 12
  !c5
  !instr,!instr29
  db 24
  !c5
  db 12
  !c5
  !instr,!instr2A
  db 24
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  db 12
  !c5
  !instr,!instr29
  db 24
  !c5
  db 12
  !c5
  !instr,!instr2A
  db 24
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  db 12
  !c5
  !instr,!instr29
  db 24
  !c5
  db 12
  !c5
  !instr,!instr2A
  db 24
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  db 12
  !c5
  db 24
  !c5
  !c5
  db 12
  !c5
  db 24
  !c5
  !end

.sub3275
  db 24,$7F
  !fs3
  !fs3
  !gs3
  !fs3
  db 12
  !fs3
  db 24
  !fs3
  db 12
  !fs3
  db 24
  !gs3
  !fs3
  !fs3
  !fs3
  !gs3
  !fs3
  db 12
  !fs3
  db 24
  !fs3
  db 12
  !fs3
  db 24
  !gs3
  !fs3
  !end

.sub3292
  !instr,!instr29
  db 24,$7F
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  db 12
  !c5
  !instr,!instr29
  db 24
  !c5
  db 12
  !c5
  !instr,!instr2A
  db 24
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  db 12
  !c5
  !instr,!instr29
  db 24
  !c5
  db 12
  !c5
  !instr,!instr2A
  db 24
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  db 12
  !c5
  !instr,!instr29
  db 24
  !c5
  db 12
  !c5
  !instr,!instr2A
  db 24
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  !c5
  !instr,!instr29
  !c5
  !instr,!instr2A
  db 12
  !c5
  !instr,!instr29
  db 24
  !c5
  db 12
  !c5
  !instr,!instr2A
  db 24
  !c5
  !end

.sub3309
  db 12,$7F
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  db 24
  !c5
  db 12
  !c5
  !c5
  !c5
  !c5
  db 24
  !c5
  !c5
  !end

.sub331D
  db 24,$7F
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !c5
  !end

.sub3330
  !instr,!instr26
  db 24,$7F
  !d4
  !d4
  !instr,!instr27
  db 12
  !d4
  !instr,!instr26
  db 24
  !d4
  !d4
  !d4
  !instr,!instr27
  db 12
  !d4
  !d4
  !d4
  !instr,!instr26
  !d5
  !d5
  !instr,!instr26
  db 24
  !c4
  !c4
  !instr,!instr27
  db 12
  !c4
  !instr,!instr26
  db 24
  !c4
  !c4
  !c4
  !instr,!instr27
  db 12
  !c4
  !c4
  !c4
  !instr,!instr26
  !c4
  !c4
  !instr,!instr26
  db 24
  !b3
  !b3
  !instr,!instr27
  db 12
  !b3
  !instr,!instr26
  db 24
  !b3
  !b3
  !b3
  !instr,!instr27
  db 12
  !b3
  !b3
  !b3
  !instr,!instr26
  !b3
  !b3
  !instr,!instr26
  db 24
  !as3
  !as3
  !instr,!instr27
  db 12
  !as3
  !instr,!instr26
  db 24
  !as3
  !c4
  !c4
  !instr,!instr27
  db 12
  !c4
  !c4
  !c4
  !instr,!instr26
  !c4
  !c4
  !end

.sub3396
  db 12,$7F
  !rest
  db 24
  !as3
  !instr,!instr27
  db 12
  !as3
  !as3
  !as3
  !instr,!instr26
  !as4
  !as4
  db 24
  !a3
  !a3
  !instr,!instr27
  db 12
  !a3
  !instr,!instr26
  db 24
  !a3
  !a3
  !a3
  !instr,!instr27
  db 12
  !a3
  !a3
  !a3
  !instr,!instr26
  !a3
  !a3
  db 24
  !d4
  !d4
  !instr,!instr27
  db 12
  !d4
  !instr,!instr26
  db 24
  !d4
  !d4
  !d4
  !instr,!instr27
  db 12
  !d4
  !d4
  !d4
  !instr,!instr26
  !d4
  !d4
  db 24
  !b3
  !b3
  !instr,!instr27
  db 12
  !b3
  !instr,!instr26
  db 24
  !b3
  !b3
  !b3
  !instr,!instr27
  db 12
  !b3
  !b3
  !b3
  !instr,!instr26
  !b3
  !b3
  !end

.sub33EB
  db 24,$7F
  !as3
  !as3
  !instr,!instr27
  db 12
  !as3
  !instr,!instr26
  db 24
  !as3
  !as3
  !as3
  !instr,!instr27
  db 12
  !as3
  !as3
  !as3
  !instr,!instr26
  !as4
  !as4
  db 24
  !c4
  !c4
  !instr,!instr27
  db 12
  !c4
  !instr,!instr26
  db 24
  !c4
  !c4
  !c4
  !instr,!instr27
  db 12
  !c4
  !c4
  !c4
  !instr,!instr26
  !c4
  !c4
  db 24
  !d4
  !d4
  !instr,!instr27
  db 12
  !d4
  !instr,!instr26
  db 24
  !d4
  !d4
  !d4
  !instr,!instr27
  db 12
  !d4
  !d4
  !d4
  !instr,!instr26
  !d4
  !d4
  db 24
  !d4
  !d4
  !instr,!instr27
  db 12
  !d4
  !instr,!instr26
  db 24
  !d4
  !d4
  !d4
  !instr,!instr27
  db 12
  !d4
  !d4
  !d4
  !instr,!instr26
  !d4
  !d4
  !end

.sub3449
  db 24,$7F
  !as3
  !as3
  !instr,!instr27
  db 12
  !as3
  !instr,!instr26
  db 24
  !as3
  !as3
  !as3
  !instr,!instr27
  db 12
  !as3
  !as3
  !as3
  !instr,!instr26
  !as4
  !as4
  db 24
  !c4
  !c4
  !instr,!instr27
  db 12
  !c4
  !instr,!instr26
  db 24
  !c4
  !c4
  !c4
  !instr,!instr27
  db 12
  !c4
  !c4
  !c4
  !instr,!instr26
  !c4
  !c4
  db 24
  !d4
  !d4
  !instr,!instr27
  db 12
  !d4
  !instr,!instr26
  db 24
  !d4
  !cs4
  !cs4
  !instr,!instr27
  db 12
  !cs4
  !cs4
  !cs4
  !instr,!instr26
  !cs4
  !cs4
  db 24
  !c4
  !c4
  !instr,!instr27
  db 12
  !c4
  !instr,!instr26
  db 24
  !c4
  !b3
  !b3
  !instr,!instr27
  db 12
  !b3
  !b3
  !b3
  !instr,!instr26
  !b3
  !b3
  !end

.sub34A7
  db 12,$7F
  !rest
  db 96
  !d5
  db 84
  !tie
  db 12
  !rest
  db 96
  !c5
  db 84
  !tie
  db 12
  !rest
  db 96
  !b4
  db 84
  !tie
  db 12
  !rest
  db 84
  !as4
  db 96
  !c5
  !end

.sub34C1
  db 24,$7F
  !d3
  !d3
  db 12
  !d3
  db 24
  !d3
  !d3
  !d3
  db 12
  !d3
  !d3
  !d3
  db 24
  !d3
  !c3
  !c3
  db 12
  !c3
  db 24
  !c3
  !c3
  !c3
  db 12
  !c3
  !c3
  !c3
  db 24
  !c3
  !b2
  !b2
  db 12
  !b2
  db 24
  !b2
  !b2
  !b2
  db 12
  !b2
  !b2
  !b2
  db 24
  !b2
  !as2
  !as2
  db 12
  !as2
  db 24
  !as2
  !c3
  !c3
  db 12
  !c3
  !c3
  !c3
  db 24
  !c3
  !end

.sub34FC
  db 12,$7F
  !rest
  db 24
  !as2
  db 12
  !as2
  !as2
  !as2
  !as2
  !as2
  db 24
  !a2
  !a2
  db 12
  !a2
  db 24
  !a2
  !a2
  !a2
  db 12
  !a2
  !a2
  !a2
  !a2
  !a2
  db 24
  !d3
  !d3
  db 12
  !d3
  db 24
  !d3
  !d3
  !d3
  db 12
  !d3
  !d3
  !d3
  !d3
  !d3
  db 24
  !b2
  !b2
  db 12
  !b2
  db 24
  !b2
  !b2
  !b2
  db 12
  !b2
  !b2
  !b2
  !b2
  !b2
  !end

.sub3535
  db 24,$7F
  !as2
  !as2
  db 12
  !as2
  db 24
  !as2
  !as2
  !as2
  db 12
  !as2
  !as2
  !as2
  !as2
  !as2
  db 24
  !c3
  !c3
  db 12
  !c3
  db 24
  !c3
  !c3
  !c3
  db 12
  !c3
  !c3
  !c3
  !c3
  !c3
  db 24
  !d3
  !d3
  db 12
  !d3
  db 24
  !d3
  !d3
  !d3
  db 12
  !d3
  !d3
  !d3
  !d3
  !d3
  db 24
  !d3
  !d3
  db 12
  !d3
  db 24
  !d3
  !d3
  !d3
  db 12
  !d3
  !d3
  !d3
  !d3
  !d3
  !end

.sub3573
  db 24,$7F
  !as2
  !as2
  db 12
  !as2
  db 24
  !as2
  !as2
  !as2
  db 12
  !as2
  !as2
  !as2
  !as2
  !as2
  db 24
  !c3
  !c3
  db 12
  !c3
  db 24
  !c3
  !c3
  !c3
  db 12
  !c3
  !c3
  !c3
  !c3
  !c3
  db 24
  !b2
  !b2
  db 12
  !b2
  db 24
  !b2
  !b2
  !b2
  db 12
  !b2
  !b2
  !b2
  !b2
  !b2
  db 24
  !b2
  !b2
  db 12
  !b2
  db 24
  !b2
  !b2
  !b2
  db 12
  !b2
  !b2
  !b2
  !b2
  !b2
  !end

.sub35B1
  db 24,$7F
  !as2
  !as2
  db 12
  !as2
  db 24
  !as2
  !as2
  !as2
  db 12
  !as2
  !as2
  !as2
  !as2
  !as2
  db 24
  !c3
  !c3
  db 12
  !c3
  db 24
  !c3
  !c3
  !c3
  db 12
  !c3
  !c3
  !c3
  !c3
  !c3
  db 24
  !d3
  !d3
  db 12
  !d3
  db 24
  !d3
  !cs3
  !cs3
  db 12
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  db 24
  !c3
  !c3
  db 12
  !c3
  db 24
  !c3
  !b2
  !b2
  db 12
  !b2
  !b2
  !b2
  !b2
  !b2
  !end

.sub35EF
  db 12,$7F
  !rest
  db 96
  !as4
  db 84
  !tie
  db 12
  !rest
  db 96
  !c5
  db 84
  !tie
  db 12
  !rest
  db 96
  !b4
  db 84
  !tie
  db 12
  !rest
  db 84
  !b4
  db 96
  !b4
  db 12
  !rest
  db 96
  !as4
  db 84
  !tie
  db 12
  !rest
  db 96
  !c5
  db 84
  !tie
  db 12
  !rest
  db 96
  !d5
  db 84
  !tie
  db 12
  !rest
  db 84
  !d5
  db 96
  !d5
  !end

.sub3621
  db 96,$7F
  !a3
  !tie
  db 96
  !a3
  !tie
  db 96
  !g3
  !tie
  !d3
  !e3
  !end

.sub362E
  db 12,$7F
  !d5
  !d5
  !f5
  !rest
  !e5
  db 24
  !rest
  db 12
  !c5
  !rest
  !e5
  !rest
  !d5
  !rest
  !g4
  !a4
  !c5
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
