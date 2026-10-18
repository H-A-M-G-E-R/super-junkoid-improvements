; Originally by Toby Fox, ported by Torchkas (https://www.smwcentral.net/?p=section&a=details&id=35592)
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
!instr28 = $20
!instr29 = $21
!instr2A = $22
!instr2B = $23
!instr2C = $24
!instr2D = $25
!instr2E = $26
!instr2F = $27
!instr30 = $28
!instr31 = $29
!instr32 = $2A
!instr33 = $2B
!instr34 = $2C
!instr35 = $2D
!instr36 = $2E
!instr37 = $2F
!instr38 = $30
!instr39 = $31
!instr3A = $32
!instr3B = $33
!instr3C = $34
!instr3D = $35
!instr3E = $36
!instr3F = $37

!sample00 = $16
!sample01 = $17
!sample02 = $18
!sample03 = $19
!sample04 = $1A
!sample05 = $1B
!sample06 = $1C
!sample07 = $1D
!sample08 = $1E
!sample09 = $1F
!sample0A = $20
!sample0B = $21
!sample0C = $22
!sample0D = $23
!sample0E = $24
!sample0F = $25
!sample10 = $26
!sample11 = $27
!sample12 = $28
!sample13 = $29
!sample14 = $2A
!sample15 = $2B
!sample16 = $2C
!sample17 = $2D
!sample18 = $2E
!sample19 = $2F

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample00,$8C,$E0,$00,$03,$DF
  db !sample01,$8C,$E0,$00,$03,$41
  db !sample02,$00,$00,$60,$04,$0E
  db !sample03,$00,$00,$60,$04,$0E
  db !sample04,$00,$00,$60,$04,$0E
  db !sample05,$00,$00,$60,$04,$0E
  db !sample06,$00,$00,$60,$04,$0E
  db !sample07,$00,$00,$60,$04,$0E
  db !sample08,$00,$00,$60,$04,$0E
  db !sample09,$00,$00,$60,$04,$0E
  db !sample0A,$00,$00,$60,$04,$0E
  db !sample0B,$00,$00,$60,$04,$0E
  db !sample0C,$00,$00,$60,$04,$0E
  db !sample0D,$00,$00,$60,$04,$0E
  db !sample0E,$00,$00,$60,$04,$0E
  db !sample0F,$00,$00,$60,$04,$0E
  db !sample10,$00,$00,$60,$04,$0E
  db !sample11,$00,$00,$60,$04,$0E
  db !sample12,$00,$00,$60,$04,$0E
  db !sample13,$8C,$E0,$00,$02,$71
  db !sample14,$9A,$A0,$00,$02,$6D
  db !sample14,$9A,$B2,$00,$02,$6D
  db !sample15,$83,$F7,$00,$04,$1D
  db !sample15,$88,$F5,$00,$04,$1D
  db !sample16,$00,$00,$7F,$05,$47
  db !sample17,$00,$00,$3A,$05,$47
  db !sample18,$00,$00,$CE,$04,$0E
  db !sample18,$00,$00,$AB,$04,$0E
  db !sample19,$00,$00,$60,$04,$0E
  db !sample15,$AF,$6F,$00,$04,$1D
  db $9E,$8F,$F7,$00,$01,$00
  db !sample17,$00,$00,$60,$05,$47
  db $9E,$8F,$F9,$00,$01,$00
  db $9E,$00,$00,$27,$01,$00
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample00,Sample00+9
  dw Sample01,Sample01+9
  dw Sample02,Sample02+45
  dw Sample03,Sample03+45
  dw Sample04,Sample04+45
  dw Sample05,Sample05+45
  dw Sample06,Sample06+45
  dw Sample07,Sample07+45
  dw Sample08,Sample08+45
  dw Sample09,Sample09+45
  dw Sample0A,Sample0A+45
  dw Sample0B,Sample0B+45
  dw Sample0C,Sample0C+45
  dw Sample0D,Sample0D+45
  dw Sample0E,Sample0E+45
  dw Sample0F,Sample0F+45
  dw Sample10,Sample10+45
  dw Sample11,Sample11+45
  dw Sample12,Sample12+45
  dw Sample13,Sample13+27
  dw Sample14,Sample14+27
  dw Sample15,Sample15+18
  dw Sample16,Sample16+0
  dw Sample17,Sample17+0
  dw Sample18,Sample18+45
  dw Sample19,Sample19+18
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample00: incbin "piano1.brr":2..0
  Sample01: incbin "piano2.brr":2..0
  Sample02: incbin "square01.brr":2..0
  Sample03: incbin "square02.brr":2..0
  Sample04: incbin "square03.brr":2..0
  Sample05: incbin "square04.brr":2..0
  Sample06: incbin "square05.brr":2..0
  Sample07: incbin "square06.brr":2..0
  Sample08: incbin "square07.brr":2..0
  Sample09: incbin "square08.brr":2..0
  Sample0A: incbin "square09.brr":2..0
  Sample0B: incbin "square10.brr":2..0
  Sample0C: incbin "square11.brr":2..0
  Sample0D: incbin "square12.brr":2..0
  Sample0E: incbin "square13.brr":2..0
  Sample0F: incbin "square14.brr":2..0
  Sample10: incbin "square15.brr":2..0
  Sample11: incbin "square16.brr":2..0
  Sample12: incbin "square17.brr":2..0
  Sample13: incbin "losaw.brr":2..0
  Sample14: incbin "choir_a.brr":2..0
  Sample15: incbin "cymbal.brr":2..0
  Sample16: incbin "kick.brr":2..0
  Sample17: incbin "snare.brr":2..0
  Sample18: incbin "voice_sweep.brr":2..0
  Sample19: incbin "synth_lead2.brr":2..0

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

FirFilters: ; FIR filters
  db 96,9,7,0,253,252,253,255

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2BE6

Tracker2BE6:
  dw .pattern0
-
  dw .pattern1
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7
.pattern1: dw .pattern1_0, .pattern1_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7

.pattern0_0
  !setNoteLengthTable : dw NoteLengthTable
  !musicVolume,220
  !tempo,52
  !setEchoFirFilters : dw FirFilters
  !echoParameters,6,96,0
  !setDPMiscCommand,!noteEndInTicks,1
.pattern1_0:
  !echo,%11111111,84,84
  !volume,60
  !dynamicVolume,192,85
  !dynamicEcho,192,74,74
  !instr,!instr1E
  !adsrGain,$0F,$E0
  !pan,7
  db 24,$7F
  !c5
  !pan,10
  !g5
  !instr,!instr1F
  !adsrGain,$0F,$E0
  !pan,13
  !d6
  !pan,7
  !as5
  !pan,10
  !c6
  !instr,!instr1E
  !adsrGain,$0F,$E0
  !pan,13
  !g5
  !pan,7
  !ds5
  !pan,10
  !g5
  !dynamicVolume,192,110
  !dynamicEcho,192,64,64
  !pan,13
  !c5
  !pan,7
  !ds5
  !instr,!instr1F
  !adsrGain,$0F,$E0
  !pan,10
  !d6
  !pan,13
  !ds6
  !pan,7
  !f6
  !pan,10
  !ds6
  !pan,13
  !d6
  !pan,7
  !as5
  !dynamicVolume,192,135
  !dynamicEcho,192,55,55
  !instr,!instr1E
  !adsrGain,$0E,$E0
  !pan,7
  !c5
  !pan,10
  !g5
  !instr,!instr1F
  !adsrGain,$0E,$E0
  !pan,13
  !d6
  !pan,7
  !as5
  !pan,10
  !c6
  !instr,!instr1E
  !adsrGain,$0E,$E0
  !pan,13
  !g5
  !pan,7
  !ds5
  !pan,10
  !g5
  !dynamicVolume,192,160
  !dynamicEcho,192,47,47
  !adsrGain,$0D,$E0
  !pan,13
  !c5
  !pan,7
  !ds5
  !instr,!instr1F
  !adsrGain,$0D,$E0
  !pan,10
  !d6
  !pan,13
  !ds6
  !pan,7
  !f6
  !pan,10
  !ds6
  !pan,13
  !d6
  !pan,7
  !as5
  !loop : dw .sub3D38 : db 1
  !pan,10
  !volume,180
  !instr,!instr38
  !adsrGain,$80,$C9
  !vibrato,24,14,59
  db 96,$7F
  !as4
  !tie
  db 48
  !tie
  !tie
  !pitchSlide,0,15 : !c5
  !tie
  !pitchSlide,0,15 : !cs5
  !tie
  !pitchSlide,0,15 : !ds5
  db 96
  !tie
  !pitchSlide,0,15 : !f5
  db 95
  !tie
  db 1
  !rest
  !loop : dw .sub3F9F : db 1
  !toggleLegato
  db 96,$7F
  !tie
  db 48
  !tie
  !volume,157
  !instr,!instr38
  !vibrato,36,14,66
  db 36
  !fs6
  !pitchSlide,0,36 : !gs6
  db 96
  !tie
  db 59
  !tie
  db 1
  !rest
  !loop : dw .sub3FBF : db 1
  !loop : dw .sub3FDF : db 1
  db 48,$7F
  !tie
  !instr,!instr39
  !toggleLegato
  db 96
  !tie
  !volume,160
  !instr,!instr3A
  !vibrato,24,14,32
  db 24
  !cs6
  db 12
  !as5
  !rest
  db 6
  !c6
  db 18
  !rest
  db 96
  !c6
  !pitchSlide,0,18 : !cs6
  db 12
  !as5
  !rest
  db 6
  !c6
  db 18
  !rest
  db 48
  !c6
  !pitchSlide,0,18 : !cs6
  db 30
  !tie
  db 18
  !rest
  db 12
  !as5
  !rest
  db 48
  !b5
  !pitchSlide,0,12 : !c6
  db 24
  !cs6
  db 12
  !as5
  !rest
  db 6
  !c6
  db 18
  !rest
  db 96
  !c6
  !pitchSlide,0,18 : !cs6
  db 12
  !as5
  !rest
  db 6
  !ds6
  db 18
  !rest
  db 72
  !e6
  !pitchSlide,0,18 : !f6
  db 24
  !cs6
  !rest
  !e6
  !pitchSlide,0,12 : !f6
  !rest
  db 96
  !ds6
  !tie
  !dynamicVolume,144,32
  db 96
  !tie
  db 48
  !tie
  !volume,160
  !cs6
  db 96
  !ds6
  !tie
  db 48
  !tie
  !dynamicVolume,144,32
  db 96
  !tie
  db 48
  !tie
  !volume,160
  !loop : dw .sub4012 : db 1
  !volume,160
  db 48,$7F
  !cs6
  !ds6
  !dynamicVolume,48,32
  !tie
  !volume,160
  !ds6
  !dynamicVolume,48,32
  !tie
  !volume,160
  db 24
  !ds6
  !dynamicVolume,24,32
  !tie
  !volume,148
  !ds6
  !dynamicVolume,24,32
  !tie
  !volume,135
  !ds6
  !dynamicVolume,24,32
  !tie
  !volume,122
  !ds6
  !dynamicVolume,24,32
  !tie
  !volume,160
  !pan,10
  !volume,170
  !instr,!instr38
  !adsrGain,$80,$C9
  !vibrato,24,14,59
  db 96,$7F
  !as4
  !tie
  db 48
  !tie
  !tie
  !pitchSlide,0,15 : !c5
  !tie
  !pitchSlide,0,15 : !cs5
  !tie
  !pitchSlide,0,15 : !ds5
  db 96
  !tie
  !pitchSlide,0,15 : !f5
  db 95
  !tie
  db 1
  !rest
  !loop : dw .sub3F9F : db 1
  !toggleLegato
  db 96,$7F
  !tie
  db 48
  !tie
  !instr,!instr38
  !adsrGain,$80,$C9
  db 96,$7F
  !as4
  !tie
  db 48
  !tie
  !tie
  !pitchSlide,0,15 : !c5
  !tie
  !pitchSlide,0,15 : !cs5
  !tie
  !pitchSlide,0,15 : !ds5
  db 96
  !tie
  !pitchSlide,0,15 : !f5
  db 95
  !tie
  db 1
  !rest
  db 96
  !ds5
  db 48
  !tie
  !pitchSlide,0,15 : !cs5
  !tie
  db 96
  !c5
  !tie
  !tie
  db 48
  !tie
  !toggleLegato
  !gs4
  db 96
  !tie
  !pitchSlide,0,15 : !as4
  !tie
  !instr,!instr39
  db 48
  !tie
  !toggleLegato
  db 96
  !tie
  db 48
  !tie
  !instr,!instr38
  !adsrGain,$80,$C9
  db 96,$7F
  !as4
  !tie
  db 48
  !tie
  !tie
  !pitchSlide,0,15 : !c5
  !tie
  !pitchSlide,0,15 : !cs5
  !tie
  !pitchSlide,0,15 : !ds5
  db 96
  !tie
  !pitchSlide,0,15 : !f5
  db 95
  !tie
  db 1
  !rest
  !loop : dw .sub3F9F : db 1
  !toggleLegato
  db 96,$7F
  !tie
  db 48
  !tie
  !volume,135
  !instr,!instr38
  !vibrato,36,14,66
  db 36
  !fs6
  !pitchSlide,0,36 : !gs6
  db 96
  !tie
  db 59
  !tie
  db 1
  !rest
  !loop : dw .sub3FBF : db 1
  !loop : dw .sub3FDF : db 1
  db 48,$7F
  !tie
  !instr,!instr39
  !toggleLegato
  db 96
  !tie
  !tie
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  db 48
  !tie
  !loop : dw .sub4071 : db 2
  !end

.pattern0_1
  !toggleLegato
.pattern1_1:
  !toggleLegato
  !volume,60
  !dynamicVolume,192,85
  db 12,$7C
  !rest
  !instr,!instr1E
  !adsrGain,$0F,$E0
  !pan,7
  db 24
  !g4
  !pan,10
  !d5
  !pan,13
  !g5
  !pan,7
  !d5
  !pan,10
  !f5
  !pan,13
  !c5
  !pan,7
  !as4
  !pan,10
  !ds5
  !dynamicVolume,192,110
  !pan,13
  !g4
  !pan,7
  !c5
  !pan,10
  !g5
  !pan,13
  !gs5
  !pan,7
  !as5
  !pan,10
  !gs5
  !pan,13
  !g5
  !pan,7
  !ds5
  !dynamicVolume,192,135
  !adsrGain,$0E,$E0
  !pan,7
  !g4
  !pan,10
  !d5
  !pan,13
  !g5
  !pan,7
  !d5
  !pan,10
  !f5
  !pan,13
  !c5
  !pan,7
  !as4
  !pan,10
  !ds5
  !dynamicVolume,180,160
  !adsrGain,$0D,$E0
  !pan,13
  !g4
  !pan,7
  !c5
  !pan,10
  !g5
  !pan,13
  !gs5
  !pan,7
  !as5
  !pan,10
  !gs5
  !pan,13
  !g5
  !pan,7
  db 12
  !ds5
  !pan,10
  !volume,230
  !instr,!instr31
  !toggleLegato
  !loop : dw .sub4076 : db 2
  !amplify,24
  !loop : dw .sub409B : db 1
  !amplify,0
  !loop : dw .sub4112 : db 1
  !amplify,24
  !loop : dw .sub409B : db 1
  !loop : dw .sub4146 : db 2
  !loop : dw .sub409B : db 1
  !amplify,0
  !loop : dw .sub4112 : db 1
  !volume,230
  !loop : dw .sub418C : db 2
  !loop : dw .sub41A6 : db 1
  !volume,250
  db 24,$7C
  !f4
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  db 6
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  db 24
  !as4
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !gs4
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !rest
  !loop : dw .sub41A6 : db 1
  !volume,240
  db 96,$7C
  !f4
  !dynamicVolume,96,128
  !toggleLegato
  !tie
  !toggleLegato
  !volume,250
  !f4
  !toggleLegato
  !tie
  !toggleLegato
  !volume,220
  db 96
  !f4
  !tie
  db 48
  !tie
  !volume,235
  !ds4
  !f4
  !gs4
  db 36,$77
  !gs4
  db 36,$75
  !gs4
  db 36,$73
  !gs4
  db 36,$72
  !gs4
  db 48
  !rest
  !end

.pattern0_2
  !toggleLegato
  !volume,0
  !dynamicVolume,192,48
  !pan,7
  !instr,!instr2A
  db 12,$7F
  !f5
  !instr,!instr20
  !c5
  !pan,10
  !c6
  !g5
  !pan,13
  !instr,!instr21
  !g6
  !c6
  !pan,7
  !ds6
  !g5
  !pan,10
  !instr,!instr22
  !f6
  !as5
  !pan,13
  !c6
  !f5
  !pan,7
  !instr,!instr23
  !gs5
  !ds5
  !pan,10
  !c6
  !gs5
  !dynamicVolume,192,80
  !pan,13
  !instr,!instr24
  !f5
  !c5
  !pan,7
  !gs5
  !f5
  !pan,10
  !instr,!instr25
  !g6
  !c6
  !pan,13
  !gs6
  !cs6
  !pan,7
  !instr,!instr26
  !as6
  !ds6
  !pan,10
  !gs6
  !cs6
  !pan,13
  !instr,!instr27
  !g6
  !c6
  !pan,7
  !ds6
  !gs5
  !dynamicVolume,192,112
  !pan,7
  !instr,!instr28
  !f5
  !c5
  !pan,10
  !c6
  !g5
  !pan,13
  !instr,!instr29
  !g6
  !c6
  !pan,7
  !ds6
  !g5
  !pan,10
  !instr,!instr2A
  !f6
  !as5
  !pan,13
  !c6
  !f5
  !pan,7
  !instr,!instr2B
  !gs5
  !ds5
  !pan,10
  !c6
  db 6
  !gs5
  !toggleLegato
  !tie
  !toggleLegato
  !dynamicVolume,192,142
  !pan,13
  !instr,!instr2C
  db 12
  !f5
  !c5
  !pan,7
  !gs5
  !f5
  !pan,10
  !instr,!instr2D
  !g6
  !c6
  !pan,13
  !gs6
  !cs6
  !pan,7
  !instr,!instr2E
  !as6
  !ds6
  !pan,10
  !gs6
  !cs6
  !pan,13
  !instr,!instr2F
  !g6
  !c6
  !pan,7
  !ds6
  !gs5
  !loop : dw .sub421B : db 1
  !loop : dw .sub42C2 : db 1
  !volume,133
  !loop : dw .sub421B : db 1
  !loop : dw .sub42C2 : db 1
  !volume,142
  !loop : dw .sub4369 : db 1
  !loop : dw .sub451F : db 4
  !toggleLegato
  !amplify,40
  !loop : dw .sub42C2 : db 1
  !loop : dw .sub4369 : db 1
  !amplify,0
  !pan,11
  !volume,88
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !instr,!instr32
  db 96,$7F
  !as4
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !c5
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !gs4
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !cs5
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !c5
  db 84
  !tie
  db 12
  !rest
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !pan,8
  !volume,235
  !instr,!instr1E
  !loop : dw .sub4524 : db 1
  !volume,142
  !toggleLegato
  !loop : dw .sub421B : db 1
  !pan,7
  !instr,!instr30
  db 12,$7F
  !f5
  !c5
  !pan,10
  !c6
  !g5
  !pan,13
  !instr,!instr2F
  !g6
  !c6
  !pan,7
  !ds6
  !g5
  !pan,10
  !instr,!instr2E
  !f6
  !as5
  !pan,13
  !c6
  !f5
  !pan,7
  !instr,!instr2D
  !gs5
  !ds5
  !pan,10
  !c6
  !gs5
  !pan,13
  !instr,!instr2C
  !f5
  !c5
  !pan,7
  !gs5
  !f5
  !pan,10
  !instr,!instr2B
  !g6
  !c6
  !pan,13
  !gs6
  !cs6
  !pan,7
  !instr,!instr2A
  !as6
  !ds6
  !pan,10
  !gs6
  !cs6
  !pan,13
  !instr,!instr29
  !g6
  !c6
  !pan,7
  !ds6
  !c6
  !pan,7
  !instr,!instr28
  !as5
  !instr,!instr29
  !cs5
  !pan,10
  !instr,!instr2A
  !cs6
  !instr,!instr2B
  !as5
  !pan,13
  !instr,!instr2C
  !gs6
  !instr,!instr2D
  !cs6
  !pan,7
  !instr,!instr2E
  !fs6
  !instr,!instr2F
  db 6
  !f5
  !toggleLegato
  !tie
  !remoteCode : dw .remoteCode3D2C : db 1,2
  !volume,175
  !pan,10
  !instr,!instr30
  db 12
  !as5
  !instr,!instr2F
  !cs5
  !pan,13
  !instr,!instr2E
  !cs6
  !instr,!instr2D
  !as5
  !pan,7
  !instr,!instr2C
  !gs6
  !instr,!instr2B
  !cs6
  !pan,10
  !instr,!instr2A
  !fs6
  !instr,!instr29
  !f5
  !remoteCode : dw .remoteCode3D2C : db 0,0
  !volume,142
  !toggleLegato
  !pan,13
  !instr,!instr28
  !ds5
  !instr,!instr29
  !c5
  !pan,7
  !instr,!instr2A
  !c6
  !instr,!instr2B
  db 6
  !gs5
  !toggleLegato
  !tie
  !remoteCode : dw .remoteCode3D34 : db 1,2
  !volume,155
  !pan,10
  !instr,!instr2C
  db 12
  !gs6
  !instr,!instr2D
  !c6
  !remoteCode : dw .remoteCode3D30 : db 1,2
  !volume,162
  !pan,13
  !instr,!instr2E
  !ds6
  !instr,!instr2F
  !gs5
  !remoteCode : dw .remoteCode3D2C : db 1,2
  !volume,175
  !pan,7
  !instr,!instr30
  !ds5
  !instr,!instr2F
  !c5
  !pan,10
  !instr,!instr2E
  !c6
  !instr,!instr2D
  !gs5
  !pan,13
  !instr,!instr2C
  db 12,$7F
  !ds6
  !instr,!instr2A
  db 12,$7C
  !ds6
  !pan,7
  !instr,!instr28
  db 12,$7A
  !ds6
  !instr,!instr26
  db 12,$78
  !ds6
  !remoteCode : dw .remoteCode3D2C : db 0,0
  !volume,142
  !toggleLegato
  !pan,10
  !instr,!instr30
  db 12,$7F
  !fs5
  !ds5
  !pan,13
  !as5
  !fs5
  !pan,7
  !instr,!instr2F
  !gs6
  !cs6
  !pan,10
  !fs6
  !as5
  !pan,13
  !instr,!instr2E
  !f6
  !fs5
  !pan,7
  !cs6
  !gs5
  !pan,10
  !instr,!instr2D
  !as5
  !ds5
  !pan,13
  !cs6
  !gs5
  !pan,7
  !instr,!instr2C
  !fs5
  !ds5
  !pan,10
  !cs6
  !fs5
  !pan,13
  !instr,!instr2B
  !ds6
  !gs5
  !pan,7
  !cs6
  !fs5
  !pan,10
  !instr,!instr2A
  !c6
  !ds5
  !pan,13
  !gs5
  !cs5
  !pan,7
  !instr,!instr29
  !f5
  !ds5
  !pan,10
  !gs5
  !cs5
  !instr,!instr28
  !fs5
  !ds5
  !pan,13
  !as5
  !fs5
  !pan,7
  !instr,!instr29
  !gs6
  !cs6
  !pan,10
  !fs6
  !as5
  !pan,13
  !instr,!instr2A
  !f6
  !fs5
  !pan,7
  !cs6
  !gs5
  !pan,10
  !instr,!instr2B
  !as5
  !ds5
  !pan,13
  !cs6
  !gs5
  !dynamicVolume,192,0
  !pan,7
  !instr,!instr2C
  !fs5
  !ds5
  !pan,10
  !cs6
  !fs5
  !pan,13
  !instr,!instr2D
  !ds6
  !gs5
  !pan,7
  !cs6
  !fs5
  !pan,10
  !instr,!instr2E
  !c6
  !ds5
  !pan,13
  !gs5
  !cs5
  !pan,7
  !instr,!instr2F
  !f5
  !c5
  !pan,10
  !gs5
  db 6
  !cs5
  !toggleLegato
  !tie
  !pan,11
  !volume,83
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  db 96,$7F
  !gs4
  db 48
  !tie
  !rest
  !instr,!instr32
  db 96
  !gs4
  !tie
  !tie
  !tie
  db 48
  !tie
  !instr,!instr32
  !g4
  !instr,!instr32
  !gs4
  !instr,!instr32
  !c5
  db 36,$77
  !tie
  db 36,$75
  !tie
  db 36,$73
  !tie
  db 36,$72
  !tie
  db 48
  !rest
  !end

.pattern0_3
  !loop : dw .sub45E5 : db 4
  !pan,11
  !volume,125
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !loop : dw .sub45EA : db 2
  !volume,112
  !loop : dw .sub4624 : db 7
  db 6,$7F
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub4624 : db 4
  !loop : dw .sub462F : db 4
  db 96,$7F
  !c5
  db 48
  !tie
  !rest
  !instr,!instr32
  db 96
  !c5
  db 48
  !tie
  !instr,!instr32
  !as4
  !instr,!instr32
  !c5
  !rest
  !instr,!instr32
  !c5
  !rest
  !instr,!instr32
  !c5
  !instr,!instr32
  !as4
  !instr,!instr32
  !c5
  !instr,!instr32
  !ds5
  !loop : dw .sub4624 : db 7
  db 6,$7F
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub4624 : db 4
  !loop : dw .sub462F : db 4
  !loop : dw .sub463A : db 7
  db 6,$7F
  !c5
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !c5
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !c5
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !c5
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub463A : db 7
  !pan,10
  !volume,180
  !instr,!instr3F
  !remoteCode : dw .remoteCode3D29 : db 0,0
  db 1,$7F
  !c5
  !rest
  !c5
  !rest
  !c5
  db 4
  !c5
  db 3
  !rest
  db 1,$78
  !c5
  !rest
  !c5
  !rest
  !c5
  db 4
  !c5
  db 3
  !rest
  db 1,$7C
  !c5
  !rest
  !c5
  !rest
  !c5
  db 4
  !c5
  db 3
  !rest
  db 1,$78
  !c5
  !rest
  !c5
  !rest
  !c5
  db 4
  !c5
  db 3
  !rest
  !pan,11
  !volume,112
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !loop : dw .sub4624 : db 7
  db 6,$7F
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub4624 : db 4
  !loop : dw .sub462F : db 2
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !pan,10
  !volume,138
  !instr,!instr3A
  !vibrato,24,14,32
  db 24,$7D
  !f6
  !rest
  db 24,$7E
  !a6
  !pitchSlide,0,12 : !as6
  !rest
  db 96,$7F
  !gs6
  !tie
  !dynamicVolume,144,32
  db 96
  !tie
  db 48
  !tie
  !volume,145
  !f6
  !gs6
  !dynamicVolume,48,32
  !tie
  !volume,145
  !gs6
  !dynamicVolume,48,32
  !tie
  !volume,145
  db 24
  !gs6
  !dynamicVolume,24,32
  !tie
  !volume,132
  !gs6
  !dynamicVolume,24,32
  !tie
  !volume,120
  !gs6
  !dynamicVolume,24,32
  !tie
  !volume,108
  !gs6
  !dynamicVolume,24,32
  !tie
  !pan,11
  !volume,125
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !endVibrato
  !loop : dw .sub4645 : db 2
  !pan,10
  !volume,135
  !instr,!instr38
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !vibrato,36,14,66
  db 36,$7F
  !fs6
  !pitchSlide,0,36 : !gs6
  db 96
  !tie
  db 59
  !tie
  db 1
  !rest
  !loop : dw .sub3FBF : db 1
  !loop : dw .sub3FDF : db 1
  db 48,$7F
  !tie
  !instr,!instr39
  !toggleLegato
  db 96
  !tie
  !volume,160
  !instr,!instr3A
  !vibrato,24,14,32
  !loop : dw .sub4012 : db 1
  db 96,$7F
  !rest
  !tie
  !tie
  !tie
  db 48
  !tie
  !loop : dw .sub4675 : db 2
  !end

.pattern0_4
  !loop : dw .sub467A : db 4
  !pan,9
  !volume,112
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !loop : dw .sub467F : db 2
  !volume,112
  !loop : dw .sub46B9 : db 7
  db 6,$7F
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub46B9 : db 4
  !loop : dw .sub46C4 : db 4
  db 96,$7F
  !f4
  db 48
  !tie
  !rest
  !instr,!instr32
  db 96
  !f4
  db 48
  !tie
  !instr,!instr32
  !ds4
  !instr,!instr32
  !f4
  !rest
  !instr,!instr32
  !f4
  !rest
  !instr,!instr32
  !f4
  !instr,!instr32
  !ds4
  !instr,!instr32
  !f4
  !pan,10
  !volume,180
  !instr,!instr3F
  !remoteCode : dw .remoteCode3D29 : db 0,0
  db 1,$7F
  !c4
  !rest
  !c4
  !rest
  !c4
  db 4
  !c4
  db 3
  !rest
  db 1,$78
  !c4
  !rest
  !c4
  !rest
  !c4
  db 4
  !c4
  db 3
  !rest
  db 1,$7C
  !c4
  !rest
  !c4
  !rest
  !c4
  db 4
  !c4
  db 3
  !rest
  db 1,$78
  !c4
  !rest
  !c4
  !rest
  !c4
  db 4
  !c4
  db 3
  !rest
  !pan,9
  !volume,112
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !loop : dw .sub46B9 : db 7
  db 6,$7F
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub46B9 : db 4
  !loop : dw .sub46C4 : db 2
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !pan,10
  !volume,145
  !instr,!instr3A
  !vibrato,24,14,32
  db 24,$7F
  !as5
  !rest
  !c6
  !pitchSlide,0,12 : !cs6
  !rest
  db 96
  !c6
  !tie
  !dynamicVolume,144,32
  db 96
  !tie
  db 48
  !tie
  !volume,140
  !as5
  db 96
  !c6
  !tie
  db 48
  !tie
  !dynamicVolume,144,32
  db 96
  !tie
  db 48
  !tie
  !volume,135
  !instr,!instr38
  !vibrato,36,14,66
  db 36
  !fs6
  !pitchSlide,0,36 : !gs6
  db 96
  !tie
  db 59
  !tie
  db 1
  !rest
  !loop : dw .sub3FBF : db 1
  db 24,$7F
  !tie
  !toggleLegato
  !tie
  !volume,140
  !adsrGain,$80,$D0
  !ds6
  !pitchSlide,0,24 : !cs6
  !tie
  !ds6
  !pitchSlide,0,24 : !f6
  !tie
  !f6
  !pitchSlide,0,24 : !ds6
  db 96
  !tie
  !tie
  !tie
  db 24
  !tie
  !ds6
  !pitchSlide,0,24 : !cs6
  !tie
  !cs6
  !pitchSlide,0,24 : !ds6
  db 96
  !tie
  !tie
  db 72
  !tie
  !instr,!instr39
  db 48
  !tie
  !pan,10
  !volume,180
  !instr,!instr3F
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !endVibrato
  db 1,$7F
  !c6
  !rest
  !c6
  !rest
  !c6
  db 4
  !c6
  db 3
  !rest
  db 1,$78
  !c6
  !rest
  !c6
  !rest
  !c6
  db 4
  !c6
  db 3
  !rest
  db 1,$7C
  !c6
  !rest
  !c6
  !rest
  !c6
  db 4
  !c6
  db 3
  !rest
  db 1,$78
  !c6
  !rest
  !c6
  !rest
  !c6
  db 4
  !c6
  db 3
  !rest
  !pan,9
  !volume,112
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !loop : dw .sub46CF : db 2
  !pan,11
  !volume,112
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !loop : dw .sub46FF : db 7
  db 6,$7F
  !fs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !fs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !fs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !fs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub470A : db 8
  !loop : dw .sub46B9 : db 7
  db 6,$7F
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub4715 : db 4
  !loop : dw .sub470A : db 3
  !pan,10
  !volume,180
  !instr,!instr3F
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !endVibrato
  db 1,$7F
  !c4
  !rest
  !c4
  !rest
  !c4
  db 4
  !c4
  db 3
  !rest
  db 1,$78
  !c4
  !rest
  !c4
  !rest
  !c4
  db 4
  !c4
  db 3
  !rest
  db 1,$7C
  !c4
  !rest
  !c4
  !rest
  !c4
  db 4
  !c4
  db 3
  !rest
  db 1,$78
  !c4
  !rest
  !c4
  !rest
  !c4
  db 4
  !c4
  db 3
  !rest
  !pan,11
  !volume,112
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !loop : dw .sub46FF : db 7
  db 6,$7F
  !fs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !fs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !fs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !fs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub470A : db 8
  !pan,9
  db 96,$7F
  !f4
  db 48
  !tie
  !rest
  !instr,!instr32
  db 96
  !f4
  !tie
  !tie
  !tie
  db 48
  !tie
  !instr,!instr32
  !ds4
  !instr,!instr32
  !f4
  !instr,!instr32
  !gs4
  db 36,$77
  !tie
  db 36,$75
  !tie
  db 36,$73
  !tie
  db 36,$72
  !tie
  db 48
  !rest
  !end

.pattern0_5
  !loop : dw .sub4720 : db 4
  !pan,11
  !volume,65
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  db 96,$7F
  !f5
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !gs5
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !as5
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !g5
  !tie
  !tie
  db 36
  !tie
  db 12
  !rest
  !instr,!instr32
  db 48
  !f5
  db 96
  !g5
  !tie
  db 36
  !tie
  db 12
  !rest
  !instr,!instr32
  db 48
  !f5
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !pan,12
  !volume,122
  !instr,!instr34
  !vibrato,0,18,80
  !amplify,44
  db 96
  !c5
  !endVibrato
  !toggleEcho
  !pan,10
  !volume,255
  !amplify,46
  !loop : dw .sub4725 : db 7
  !instr,!instr36
  db 36,$7F
  !c5
  db 36,$77
  !c5
  db 24,$74
  !c5
  !instr,!instr37
  db 24,$76
  !c5
  db 24,$79
  !c5
  db 24,$7C
  !c5
  db 24,$7F
  !c5
  !loop : dw .sub473F : db 4
  !loop : dw .sub4788 : db 2
  !loop : dw .sub473F : db 2
  !loop : dw .sub473F : db 8
  !loop : dw .sub473F : db 4
  !loop : dw .sub4788 : db 2
  !loop : dw .sub473F : db 2
  !pan,10
  !loop : dw .sub4725 : db 16
  !loop : dw .sub473F : db 12
  !pan,11
  !volume,112
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !amplify,0
  db 96,$7F
  !c5
  db 48
  !tie
  !rest
  !instr,!instr32
  db 96
  !c5
  !tie
  !tie
  !tie
  db 48
  !tie
  !instr,!instr32
  !as4
  !instr,!instr32
  !c5
  !instr,!instr32
  !ds5
  db 36,$77
  !tie
  db 36,$75
  !tie
  db 36,$73
  !tie
  db 36,$72
  !tie
  db 48
  !rest
  !loop : dw .sub47D5 : db 5
  !end

.pattern0_6
  !loop : dw .sub47DA : db 4
  !pan,9
  !volume,75
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  db 96,$7F
  !as3
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !cs4
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !ds4
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !c4
  !tie
  !tie
  db 36
  !tie
  db 12
  !rest
  !instr,!instr32
  db 48
  !as3
  db 96
  !c4
  !tie
  db 36
  !tie
  db 12
  !rest
  !instr,!instr32
  db 48
  !as3
  !c4
  db 36
  !ds4
  db 12
  !rest
  !volume,150
  !loop : dw .sub3D38 : db 1
  db 48,$7F
  !rest
  !pan,10
  !volume,70
  !instr,!instr38
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !vibrato,36,14,66
  db 36
  !fs6
  !pitchSlide,0,36 : !gs6
  db 96
  !tie
  db 59
  !tie
  db 1
  !rest
  !loop : dw .sub3FBF : db 1
  db 24,$7F
  !tie
  !toggleLegato
  !tie
  db 96
  !rest
  !loop : dw .sub47DF : db 3
  db 72,$7F
  !rest
  !loop : dw .sub47E4 : db 1
  !loop : dw .sub482B : db 3
  db 96,$7F
  !rest
  !pan,9
  !volume,112
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !loop : dw .sub46C4 : db 2
  !loop : dw .sub4830 : db 7
  db 6,$7F
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub4830 : db 6
  db 24,$7F
  !f4
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !loop : dw .sub483B : db 1
  !pan,9
  !volume,112
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !loop : dw .sub46B9 : db 7
  db 6,$7F
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub46B9 : db 4
  !loop : dw .sub46C4 : db 4
  db 96,$7F
  !f4
  db 48
  !tie
  !rest
  !instr,!instr32
  db 96
  !f4
  db 48
  !tie
  !instr,!instr32
  !ds4
  !instr,!instr32
  !f4
  !rest
  !instr,!instr32
  !f4
  !rest
  !instr,!instr32
  !f4
  !instr,!instr32
  !ds4
  !instr,!instr32
  db 23
  !f4
  !remoteCode : dw .remoteCode3D29 : db 0,0
  db 1
  !rest
  !loop : dw .sub47E4 : db 1
  db 48,$7F
  !rest
  !pan,10
  !volume,90
  !instr,!instr38
  !adsrGain,$80,$C9
  !vibrato,24,14,59
  db 96,$7F
  !as4
  !tie
  db 48
  !tie
  !tie
  !pitchSlide,0,15 : !c5
  !tie
  !pitchSlide,0,15 : !cs5
  !tie
  !pitchSlide,0,15 : !ds5
  db 96
  !tie
  !pitchSlide,0,15 : !f5
  db 95
  !tie
  db 1
  !rest
  !loop : dw .sub3F9F : db 1
  !toggleLegato
  db 96,$7F
  !tie
  db 48
  !tie
  !instr,!instr38
  db 96
  !as4
  !tie
  db 48
  !tie
  !tie
  !pitchSlide,0,15 : !c5
  !tie
  !pitchSlide,0,15 : !cs5
  !tie
  !pitchSlide,0,15 : !ds5
  db 96
  !tie
  !pitchSlide,0,15 : !f5
  db 95
  !tie
  db 1
  !rest
  db 96
  !ds5
  db 48
  !tie
  !pitchSlide,0,15 : !cs5
  !tie
  db 96
  !c5
  !tie
  !tie
  db 48
  !tie
  !toggleLegato
  !gs4
  db 96
  !tie
  !pitchSlide,0,15 : !as4
  !tie
  !instr,!instr39
  db 24
  !tie
  !toggleLegato
  !tie
  !loop : dw .sub4882 : db 1
  !pan,10
  !volume,70
  !instr,!instr38
  !vibrato,36,14,66
  db 95,$7F
  !gs6
  db 1
  !rest
  !loop : dw .sub3FBF : db 1
  !loop : dw .sub3FDF : db 1
  db 12,$7F
  !tie
  !toggleLegato
  !tie
  !endVibrato
  !loop : dw .sub483B : db 1
  !pan,10
  !volume,70
  !instr,!instr38
  !vibrato,36,14,66
  db 48,$7F
  !rest
  db 36
  !fs6
  !pitchSlide,0,36 : !gs6
  db 96
  !tie
  db 59
  !tie
  db 1
  !rest
  !loop : dw .sub3FBF : db 1
  !loop : dw .sub3FDF : db 1
  db 48,$7F
  !tie
  !instr,!instr39
  !toggleLegato
  db 96
  !tie
  !tie
  !tie
  !loop : dw .sub48A3 : db 5
  !end

.pattern0_7
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !loop : dw .sub48A8 : db 23
  !pan,11
  !volume,65
  !instr,!instr32
  db 48,$7F
  !g5
  db 36
  !as5
  !instr,!instr33
  db 12
  !tie
  !pan,12
  !volume,122
  !instr,!instr35
  !vibrato,0,18,80
  !amplify,44
  db 36,$7F
  !c5
  db 36,$78
  !c5
  db 36,$75
  !c5
  !pan,10
  !volume,90
  !instr,!instr38
  !adsrGain,$80,$C9
  !vibrato,24,14,59
  db 96,$7F
  !as4
  db 84
  !tie
  db 48
  !tie
  !pitchSlide,0,15 : !c5
  !tie
  !pitchSlide,0,15 : !cs5
  !tie
  !pitchSlide,0,15 : !ds5
  db 96
  !tie
  !pitchSlide,0,15 : !f5
  db 95
  !tie
  db 1
  !rest
  !loop : dw .sub3F9F : db 1
  !toggleLegato
  !pan,12
  !volume,122
  !instr,!instr34
  db 96,$7F
  !c5
  !pan,8
  !volume,208
  !instr,!instr3B
  !subtranspose,128
  db 96
  !cs5
  !tie
  !subtranspose,0
  !loop : dw .sub48AC : db 2
  !pan,10
  !volume,70
  !instr,!instr38
  !vibrato,36,14,66
  !amplify,0
  db 96,$7F
  !rest
  !toggleLegato
  !loop : dw .sub3FDF : db 1
  !toggleLegato
  !amplify,44
  !loop : dw .sub4882 : db 1
  db 48,$7F
  !rest
  !loop : dw .sub48B1 : db 6
  db 96,$7F
  !rest
  !pan,12
  !volume,122
  !instr,!instr34
  !setInstrumentByte,$01,$F7 ; !adsrGain,$05,$F7
  db 48
  !c5
  !rest
  !pan,8
  !volume,208
  !instr,!instr3B
  !subtranspose,128
  db 96
  !cs5
  db 48
  !tie
  !subtranspose,0
  !pan,10
  !volume,70
  !instr,!instr38
  !vibrato,36,14,66
  db 95
  !gs6
  db 1
  !rest
  !loop : dw .sub3FBF : db 1
  !toggleLegato
  !pan,11
  !volume,122
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !endVibrato
  !amplify,0
  !loop : dw .sub462F : db 2
  db 96,$7F
  !c5
  db 48
  !tie
  !rest
  !instr,!instr32
  db 96
  !c5
  db 48
  !tie
  !instr,!instr32
  !as4
  !instr,!instr32
  !c5
  !rest
  !instr,!instr32
  !c5
  !rest
  !instr,!instr32
  !c5
  !instr,!instr32
  !as4
  !vibrato,0,18,80
  !amplify,44
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !loop : dw .sub4882 : db 1
  db 48,$7F
  !rest
  !loop : dw .sub48B6 : db 7
  !pan,11
  !volume,193
  !instr,!instr1E
  !transpose,116
  !endVibrato
  !loop : dw .sub4524 : db 1
  !pan,9
  !volume,112
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !transpose,0
  !amplify,0
  !loop : dw .sub48BB : db 7
  db 6,$7F
  !cs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !cs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !cs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !cs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub48C6 : db 8
  !loop : dw .sub48D1 : db 7
  db 6,$7F
  !c4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !c4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !c4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !c4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub48DC : db 4
  !loop : dw .sub48C6 : db 2
  !remoteCode : dw .remoteCode3D29 : db 0,0
  !loop : dw .sub4882 : db 1
  !pan,9
  !volume,112
  !instr,!instr32
  !remoteCode : dw .remoteCode3D29 : db 3,0
  !loop : dw .sub48BB : db 4
  db 6,$7F
  !cs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !cs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !cs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !cs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !loop : dw .sub48C6 : db 8
  !loop : dw .sub48E7 : db 5
  !end

.sub3D38
  !instr,!instr1E
  !pan,10
  db 12,$7F
  !cs5
  db 12,$7C
  !as4
  !pan,13
  db 12,$7F
  !f5
  db 12,$7C
  !cs5
  !instr,!instr1F
  !pan,7
  db 12,$7F
  !ds6
  !instr,!instr1E
  db 12,$7C
  !gs5
  !instr,!instr1F
  !pan,10
  db 12,$7F
  !cs6
  !instr,!instr1E
  db 12,$7C
  !f5
  !instr,!instr1F
  !pan,13
  db 12,$7F
  !c6
  !instr,!instr1E
  db 12,$7C
  !cs5
  !pan,7
  db 12,$7F
  !gs5
  db 12,$7C
  !ds5
  !pan,10
  db 12,$7F
  !f5
  db 12,$7C
  !as4
  !pan,13
  db 12,$7F
  !gs5
  db 12,$7C
  !ds5
  !pan,7
  db 12,$7F
  !cs5
  db 12,$7C
  !as4
  !pan,10
  db 12,$7F
  !gs5
  db 12,$7C
  !cs5
  !instr,!instr1F
  !pan,13
  db 12,$7F
  !as5
  !instr,!instr1E
  db 12,$7C
  !ds5
  !pan,7
  db 12,$7F
  !gs5
  db 12,$7C
  !cs5
  !pan,10
  db 12,$7F
  !g5
  db 12,$7C
  !as4
  !pan,13
  db 12,$7F
  !ds5
  db 12,$7C
  !gs4
  !pan,7
  db 12,$7F
  !c5
  db 12,$7C
  !as4
  !pan,10
  db 12,$7F
  !ds5
  db 12,$7C
  !gs4
  db 12,$7F
  !cs5
  db 12,$7C
  !as4
  !pan,13
  db 12,$7F
  !f5
  db 12,$7C
  !cs5
  !instr,!instr1F
  !pan,7
  db 12,$7F
  !ds6
  !instr,!instr1E
  db 12,$7C
  !gs5
  !instr,!instr1F
  !pan,10
  db 12,$7F
  !cs6
  !instr,!instr1E
  db 12,$7C
  !f5
  !instr,!instr1F
  !pan,13
  db 12,$7F
  !c6
  !instr,!instr1E
  db 12,$7C
  !cs5
  !pan,7
  db 12,$7F
  !gs5
  db 12,$7C
  !ds5
  !pan,10
  db 12,$7F
  !f5
  db 12,$7C
  !as4
  !pan,13
  db 12,$7F
  !gs5
  db 12,$7C
  !ds5
  !pan,7
  db 12,$7F
  !cs5
  db 12,$7C
  !as4
  !pan,10
  db 12,$7F
  !gs5
  db 12,$7C
  !cs5
  !instr,!instr1F
  !pan,13
  db 12,$7F
  !as5
  !instr,!instr1E
  db 12,$7C
  !ds5
  !pan,7
  db 12,$7F
  !gs5
  db 12,$7C
  !cs5
  !pan,10
  db 12,$7F
  !g5
  db 12,$7C
  !as4
  !pan,13
  db 12,$7F
  !ds5
  db 12,$7C
  !gs4
  !pan,7
  db 12,$7F
  !c5
  db 12,$7C
  !g4
  !pan,10
  db 12,$7F
  !ds5
  db 12,$7C
  !gs4
  !pan,7
  db 12,$7F
  !c5
  db 12,$7C
  !g4
  !pan,10
  db 12,$7F
  !g5
  db 12,$7C
  !d5
  !instr,!instr1F
  !pan,13
  db 12,$7F
  !d6
  !instr,!instr1E
  db 12,$7C
  !g5
  !instr,!instr1F
  !pan,7
  db 12,$7F
  !as5
  !instr,!instr1E
  db 12,$7C
  !d5
  !instr,!instr1F
  !pan,10
  db 12,$7F
  !c6
  !instr,!instr1E
  db 12,$7C
  !f5
  !pan,13
  db 12,$7F
  !g5
  db 12,$7C
  !c5
  !pan,7
  db 12,$7F
  !ds5
  db 12,$7C
  !as4
  !pan,10
  db 12,$7F
  !g5
  db 12,$7C
  !ds5
  !pan,13
  db 12,$7F
  !c5
  db 12,$7C
  !g4
  !pan,7
  db 12,$7F
  !ds5
  db 12,$7C
  !c5
  !instr,!instr1F
  !pan,10
  db 12,$7F
  !d6
  !instr,!instr1E
  db 12,$7C
  !g5
  !instr,!instr1F
  !pan,13
  db 12,$7F
  !ds6
  !instr,!instr1E
  db 12,$7C
  !gs5
  !instr,!instr1F
  !pan,7
  db 12,$7F
  !f6
  !instr,!instr1E
  db 12,$7C
  !as5
  !instr,!instr1F
  !pan,10
  db 12,$7F
  !ds6
  !instr,!instr1E
  db 12,$7C
  !gs5
  !instr,!instr1F
  !pan,13
  db 12,$7F
  !d6
  !instr,!instr1E
  db 12,$7C
  !g5
  !instr,!instr1F
  !pan,7
  db 12,$7F
  !as5
  !instr,!instr1E
  db 12,$7C
  !ds5
  db 12,$7F
  !c5
  db 12,$7C
  !g4
  !pan,10
  db 12,$7F
  !g5
  db 12,$7C
  !d5
  !instr,!instr1F
  !pan,13
  db 12,$7F
  !d6
  !instr,!instr1E
  db 12,$7C
  !g5
  !instr,!instr1F
  !pan,7
  db 12,$7F
  !as5
  !instr,!instr1E
  db 12,$7C
  !d5
  !instr,!instr1F
  !pan,10
  db 12,$7F
  !c6
  !instr,!instr1E
  db 12,$7C
  !f5
  !pan,13
  db 12,$7F
  !g5
  db 12,$7C
  !c5
  !pan,7
  db 12,$7F
  !ds5
  db 12,$7C
  !as4
  !pan,10
  db 12,$7F
  !g5
  db 12,$7C
  !ds5
  !pan,13
  db 12,$7F
  !c5
  db 12,$7C
  !g4
  !pan,7
  db 12,$7F
  !ds5
  db 12,$7C
  !c5
  !instr,!instr1F
  !pan,10
  db 12,$7F
  !d6
  !instr,!instr1E
  db 12,$7C
  !g5
  !instr,!instr1F
  !pan,13
  db 12,$7F
  !ds6
  !instr,!instr1E
  db 12,$7C
  !gs5
  !instr,!instr1F
  !pan,7
  db 12,$7F
  !f6
  !instr,!instr1E
  db 12,$7C
  !as5
  !instr,!instr1F
  !pan,10
  db 12,$7F
  !ds6
  !instr,!instr1E
  db 12,$7C
  !gs5
  !instr,!instr1F
  !pan,13
  db 12,$7F
  !d6
  !instr,!instr1E
  db 12,$7C
  !g5
  !instr,!instr1F
  !pan,7
  db 12,$7F
  !as5
  !instr,!instr1E
  db 12,$7C
  !ds5
  !end

.sub3F9F
  db 96,$7F
  !ds5
  db 48
  !tie
  !pitchSlide,0,15 : !cs5
  !tie
  db 96
  !c5
  !tie
  !tie
  db 48
  !tie
  !toggleLegato
  !as4
  db 96
  !tie
  !pitchSlide,0,15 : !c5
  !instr,!instr39
  db 96
  !tie
  db 48
  !tie
  !end

.sub3FBF
  db 36,$7F
  !g6
  !pitchSlide,0,36 : !f6
  db 96
  !tie
  db 60
  !tie
  db 36
  !fs6
  !pitchSlide,0,36 : !gs6
  db 96
  !tie
  db 60
  !tie
  !toggleLegato
  db 36
  !g6
  !pitchSlide,0,36 : !f6
  db 12
  !tie
  !end

.sub3FDF
  db 24,$7F
  !tie
  !toggleLegato
  !tie
  !adsrGain,$80,$D0
  !ds6
  !pitchSlide,0,24 : !cs6
  !tie
  !ds6
  !pitchSlide,0,24 : !f6
  !tie
  !f6
  !pitchSlide,0,24 : !ds6
  db 96
  !tie
  !tie
  !tie
  db 24
  !tie
  !ds6
  !pitchSlide,0,24 : !cs6
  !tie
  !toggleLegato
  !cs6
  !pitchSlide,0,24 : !ds6
  db 96
  !tie
  !tie
  db 24
  !tie
  !end

.sub4012
  db 24,$7F
  !f6
  db 12
  !ds6
  !rest
  db 6
  !gs6
  db 18
  !rest
  db 72
  !c6
  !pitchSlide,0,18 : !cs6
  db 24
  !f6
  db 12
  !ds6
  !rest
  db 6
  !gs6
  db 18
  !rest
  db 72
  !c6
  !pitchSlide,0,18 : !cs6
  db 6
  !tie
  db 18
  !rest
  db 6
  !as5
  db 18
  !rest
  db 48
  !b5
  !pitchSlide,0,12 : !c6
  db 24
  !cs6
  db 12
  !as5
  !rest
  db 6
  !c6
  db 18
  !rest
  db 72
  !c6
  !pitchSlide,0,18 : !cs6
  db 24
  !as5
  db 12
  !c6
  !rest
  db 6
  !cs6
  db 18
  !rest
  db 72
  !e6
  !pitchSlide,0,18 : !f6
  db 24
  !cs6
  !rest
  !e6
  !pitchSlide,0,12 : !f6
  !rest
  db 96
  !ds6
  !tie
  !dynamicVolume,144,32
  db 96
  !tie
  db 48
  !tie
  !end

.sub4071
  db 96,$7F
  !rest
  !tie
  !end

.sub4076
  db 96,$7C
  !ds4
  !tie
  !tie
  !tie
  db 96
  !fs4
  !tie
  !gs4
  !toggleLegato
  !tie
  !toggleLegato
  db 96
  !f4
  !tie
  !tie
  db 48
  !tie
  !ds4
  db 96
  !f4
  !tie
  db 48
  !tie
  !ds4
  !f4
  db 24
  !gs4
  !toggleLegato
  !tie
  !toggleLegato
  !end

.sub409B
  !volume,250
  db 24,$7C
  !ds4
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  db 6
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !rest
  !volume,250
  db 24
  !fs4
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !gs4
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !rest
  !end

.sub4112
  !volume,250
  db 96,$7C
  !f4
  !tie
  db 96
  !f4
  db 48
  !tie
  db 48,$7C
  !ds4
  db 48,$7D
  !f4
  !dynamicVolume,48,128
  !tie
  !volume,250
  db 48,$7F
  !f4
  !dynamicVolume,48,128
  !tie
  !volume,250
  db 48,$7D
  !f4
  !volume,128
  !dynamicVolume,48,250
  db 48,$7F
  !ds4
  !f4
  db 24,$7C
  !gs4
  !toggleLegato
  !tie
  !toggleLegato
  !end

.sub4146
  !volume,250
  db 24,$7C
  !f4
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  db 6
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !rest
  !end

.sub418C
  db 96,$7C
  !fs4
  !tie
  !tie
  !tie
  db 96
  !gs4
  !tie
  !tie
  !tie
  db 96
  !f4
  !tie
  !tie
  !tie
  db 96
  !as4
  !tie
  !gs4
  !toggleLegato
  !tie
  !toggleLegato
  !end

.sub41A6
  !volume,250
  db 24,$7C
  !fs4
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  db 6
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  db 24
  !gs4
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !volume,0
  !tie
  !volume,250
  !tie
  !rest
  !end

.sub421B
  !pan,10
  !instr,!instr30
  db 12,$7F
  !fs5
  !ds5
  !pan,13
  !as5
  !fs5
  !pan,7
  !instr,!instr2F
  !gs6
  !cs6
  !pan,10
  !fs6
  !as5
  !pan,13
  !instr,!instr2E
  !f6
  !fs5
  !pan,7
  !cs6
  !gs5
  !pan,10
  !instr,!instr2D
  !as5
  !ds5
  !pan,13
  !cs6
  !gs5
  !pan,7
  !instr,!instr2C
  !fs5
  !ds5
  !pan,10
  !cs6
  !fs5
  !pan,13
  !instr,!instr2B
  !ds6
  !gs5
  !pan,7
  !cs6
  !fs5
  !pan,10
  !instr,!instr2A
  !c6
  !ds5
  !pan,13
  !gs5
  !cs5
  !pan,7
  !instr,!instr29
  !f5
  !ds5
  !pan,10
  !gs5
  !cs5
  !instr,!instr28
  !fs5
  !ds5
  !pan,13
  !as5
  !fs5
  !pan,7
  !instr,!instr29
  !gs6
  !cs6
  !pan,10
  !fs6
  !as5
  !pan,13
  !instr,!instr2A
  !f6
  !fs5
  !pan,7
  !cs6
  !gs5
  !pan,10
  !instr,!instr2B
  !as5
  !ds5
  !pan,13
  !cs6
  !gs5
  !pan,7
  !instr,!instr2C
  !fs5
  !ds5
  !pan,10
  !cs6
  !fs5
  !pan,13
  !instr,!instr2D
  !ds6
  !gs5
  !pan,7
  !cs6
  !fs5
  !pan,10
  !instr,!instr2E
  !c6
  !ds5
  !pan,13
  !gs5
  !cs5
  !pan,7
  !instr,!instr2F
  !f5
  !c5
  !pan,10
  !gs5
  db 6
  !cs5
  !toggleLegato
  !tie
  !toggleLegato
  !end

.sub42C2
  !pan,7
  !instr,!instr30
  db 12,$7F
  !f5
  !c5
  !pan,10
  !c6
  !g5
  !pan,13
  !instr,!instr2F
  !g6
  !c6
  !pan,7
  !ds6
  !g5
  !pan,10
  !instr,!instr2E
  !f6
  !as5
  !pan,13
  !c6
  !f5
  !pan,7
  !instr,!instr2D
  !gs5
  !ds5
  !pan,10
  !c6
  !gs5
  !pan,13
  !instr,!instr2C
  !f5
  !c5
  !pan,7
  !gs5
  !f5
  !pan,10
  !instr,!instr2B
  !g6
  !c6
  !pan,13
  !gs6
  !cs6
  !pan,7
  !instr,!instr2A
  !as6
  !ds6
  !pan,10
  !gs6
  !cs6
  !pan,13
  !instr,!instr29
  !g6
  !c6
  !pan,7
  !ds6
  !gs5
  !instr,!instr28
  !f5
  !c5
  !pan,10
  !c6
  !g5
  !pan,13
  !instr,!instr29
  !g6
  !c6
  !pan,7
  !ds6
  !g5
  !pan,10
  !instr,!instr2A
  !f6
  !as5
  !pan,13
  !c6
  !f5
  !pan,7
  !instr,!instr2B
  !gs5
  !ds5
  !pan,10
  !c6
  !gs5
  !pan,13
  !instr,!instr2C
  !f5
  !c5
  !pan,7
  !gs5
  !f5
  !pan,10
  !instr,!instr2D
  !g6
  !c6
  !pan,13
  !gs6
  !cs6
  !pan,7
  !instr,!instr2E
  !as6
  !ds6
  !pan,10
  !gs6
  !cs6
  !pan,13
  !instr,!instr2F
  !g6
  !c6
  !pan,7
  !ds6
  db 6
  !gs5
  !toggleLegato
  !tie
  !toggleLegato
  !end

.sub4369
  !pan,10
  !instr,!instr30
  db 12,$7F
  !fs5
  !ds5
  !pan,13
  !as5
  !fs5
  !pan,7
  !instr,!instr2F
  !gs6
  !cs6
  !pan,10
  !fs6
  !as5
  !pan,13
  !instr,!instr2E
  !f6
  !fs5
  !pan,7
  !cs6
  !gs5
  !pan,10
  !instr,!instr2D
  !as5
  !ds5
  !pan,13
  !cs6
  !gs5
  !pan,7
  !instr,!instr2C
  !fs5
  !ds5
  !pan,10
  !cs6
  !fs5
  !pan,13
  !instr,!instr2B
  !ds6
  !gs5
  !pan,7
  !cs6
  !fs5
  !pan,10
  !instr,!instr2A
  !c6
  !ds5
  !pan,13
  !gs5
  !cs5
  !pan,7
  !instr,!instr29
  !f5
  !ds5
  !pan,10
  !gs5
  !cs5
  !instr,!instr28
  !fs5
  !ds5
  !pan,13
  !as5
  !fs5
  !pan,7
  !instr,!instr29
  !gs6
  !cs6
  !pan,10
  !fs6
  !as5
  !pan,13
  !instr,!instr2A
  !f6
  !fs5
  !pan,7
  !cs6
  !gs5
  !pan,10
  !instr,!instr2B
  !as5
  !ds5
  !pan,13
  !cs6
  !gs5
  !pan,7
  !instr,!instr2C
  !fs5
  !ds5
  !pan,10
  !cs6
  !fs5
  !pan,13
  !instr,!instr2D
  !ds6
  !gs5
  !pan,7
  !cs6
  !fs5
  !pan,10
  !instr,!instr2E
  !c6
  !ds5
  !pan,13
  !gs5
  !cs5
  !pan,7
  !instr,!instr2F
  !f5
  !c5
  !pan,10
  !gs5
  db 6
  !cs5
  !toggleLegato
  !tie
  !toggleLegato
  !pan,7
  !instr,!instr30
  db 12
  !f5
  !c5
  !pan,10
  !c6
  !g5
  !pan,13
  !instr,!instr2F
  !g6
  !c6
  !pan,7
  !ds6
  !g5
  !pan,10
  !instr,!instr2E
  !f6
  !as5
  !pan,13
  !c6
  !f5
  !pan,7
  !instr,!instr2D
  !gs5
  !ds5
  !pan,10
  !c6
  !gs5
  !pan,13
  !instr,!instr2C
  !f5
  !c5
  !pan,7
  !gs5
  !f5
  !pan,10
  !instr,!instr2B
  !g6
  !c6
  !pan,13
  !gs6
  !cs6
  !pan,7
  !instr,!instr2A
  !as6
  !ds6
  !pan,10
  !gs6
  !cs6
  !pan,13
  !instr,!instr29
  !g6
  !c6
  !pan,7
  !ds6
  !gs5
  !pan,7
  !instr,!instr28
  !f5
  !instr,!instr29
  !c5
  !pan,10
  !instr,!instr2A
  !c6
  !instr,!instr2B
  !g5
  !pan,13
  !instr,!instr2C
  !g6
  !instr,!instr2D
  !c6
  !pan,7
  !instr,!instr2E
  !ds6
  !instr,!instr2F
  db 6
  !g5
  !toggleLegato
  !tie
  !remoteCode : dw .remoteCode3D2C : db 1,2
  !volume,175
  !pan,10
  !instr,!instr30
  db 12
  !f5
  !instr,!instr2F
  !c5
  !pan,13
  !instr,!instr2E
  !c6
  !instr,!instr2D
  !g5
  !pan,7
  !instr,!instr2C
  !g6
  !instr,!instr2B
  !c6
  !pan,10
  !instr,!instr2A
  !ds6
  !instr,!instr29
  !g5
  !remoteCode : dw .remoteCode3D2C : db 0,0
  !volume,142
  !toggleLegato
  !pan,13
  !instr,!instr28
  !f5
  !instr,!instr29
  !c5
  !pan,7
  !instr,!instr2A
  !c6
  !instr,!instr2B
  db 6
  !g5
  !toggleLegato
  !tie
  !remoteCode : dw .remoteCode3D34 : db 1,2
  !volume,155
  !pan,10
  !instr,!instr2C
  db 12
  !g6
  !instr,!instr2D
  !c6
  !remoteCode : dw .remoteCode3D30 : db 1,2
  !volume,162
  !pan,13
  !instr,!instr2E
  !ds6
  !instr,!instr2F
  !g5
  !remoteCode : dw .remoteCode3D2C : db 1,2
  !volume,175
  !pan,7
  !instr,!instr30
  !g6
  !instr,!instr2F
  !c6
  !pan,10
  !instr,!instr2E
  !ds6
  !instr,!instr2D
  !g5
  !pan,13
  !instr,!instr2C
  db 12,$7F
  !ds6
  !instr,!instr2A
  db 12,$7C
  !ds6
  !pan,7
  !instr,!instr28
  db 12,$7A
  !ds6
  !instr,!instr26
  db 12,$78
  !ds6
  !remoteCode : dw .remoteCode3D2C : db 0,0
  !volume,142
  !end

.sub451F
  db 96,$78
  !rest
  !tie
  !end

.sub4524
  db 24,$7F
  !as4
  db 24,$77
  !as4
  db 24,$7F
  !cs5
  db 24,$77
  !cs5
  db 24,$7F
  !gs5
  db 24,$77
  !gs5
  db 24,$7F
  !fs5
  db 24,$77
  !fs5
  db 24,$7F
  !f5
  db 24,$77
  !f5
  db 24,$7F
  !f4
  db 24,$77
  !f4
  db 24,$7F
  !as4
  db 24,$77
  !as4
  db 24,$7F
  !c5
  db 24,$77
  !c5
  db 24,$7F
  !as4
  db 24,$77
  !as4
  db 24,$7F
  !cs5
  db 24,$77
  !cs5
  db 24,$7F
  !gs5
  db 24,$77
  !gs5
  db 24,$7F
  !fs5
  db 24,$77
  !fs5
  db 24,$7F
  !ds5
  db 24,$77
  !ds5
  db 24,$7F
  !c5
  db 24,$77
  !c5
  db 24,$7F
  !gs4
  db 24,$77
  !gs4
  db 24,$7F
  !c5
  db 24,$77
  !c5
  db 24,$7F
  !gs4
  db 24,$77
  !gs4
  db 24,$7F
  !c5
  db 24,$77
  !c5
  db 24,$7F
  !gs5
  db 24,$77
  !gs5
  db 24,$7F
  !fs5
  db 24,$77
  !fs5
  db 24,$7F
  !ds5
  db 24,$77
  !ds5
  db 24,$7F
  !f4
  db 24,$77
  !f4
  db 24,$7F
  !c5
  db 24,$77
  !c5
  db 24,$7F
  !f5
  db 24,$77
  !f5
  db 24,$7F
  !ds5
  db 24,$77
  !ds5
  db 24,$7F
  !cs5
  db 24,$77
  !cs5
  db 24,$7F
  !c5
  db 24,$77
  !c5
  db 24,$7F
  !cs5
  db 24,$77
  !cs5
  db 24,$7F
  !f5
  db 24,$77
  !f5
  db 24,$7F
  !c5
  db 24,$77
  !c5
  db 24,$7F
  !as4
  db 24,$77
  !as4
  db 24,$7F
  !c5
  db 24,$77
  !c5
  !end

.sub45E5
  db 96,$7F
  !rest
  !tie
  !end

.sub45EA
  db 96,$7F
  !as4
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !cs5
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !ds5
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !c5
  !tie
  !tie
  db 36
  !tie
  db 12
  !rest
  !instr,!instr32
  db 48
  !as4
  db 96
  !c5
  !tie
  db 36
  !tie
  db 12
  !rest
  !instr,!instr32
  db 48
  !as4
  !c5
  db 36
  !ds5
  db 12
  !rest
  !instr,!instr32
  !end

.sub4624
  db 24,$7F
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub462F
  db 24,$7F
  !ds5
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub463A
  db 24,$7F
  !c5
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub4645
  !instr,!instr32
  db 96,$7F
  !fs4
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !gs4
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !f4
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !as4
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !gs4
  db 84
  !tie
  db 12
  !rest
  !end

.sub4675
  db 96,$7F
  !rest
  !tie
  !end

.sub467A
  db 96,$7F
  !rest
  !tie
  !end

.sub467F
  db 96,$7F
  !ds4
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !fs4
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !gs4
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !f4
  !tie
  !tie
  db 36
  !tie
  db 12
  !rest
  !instr,!instr32
  db 48
  !ds4
  db 96
  !f4
  !tie
  db 36
  !tie
  db 12
  !rest
  !instr,!instr32
  db 48
  !ds4
  !f4
  db 36
  !gs4
  db 12
  !rest
  !instr,!instr32
  !end

.sub46B9
  db 24,$7F
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub46C4
  db 24,$7F
  !gs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub46CF
  !instr,!instr32
  db 96,$7F
  !cs4
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !ds4
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !c4
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !f4
  db 84
  !tie
  db 12
  !rest
  !instr,!instr32
  db 96
  !ds4
  db 84
  !tie
  db 12
  !rest
  !end

.sub46FF
  db 24,$7F
  !fs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub470A
  db 24,$7F
  !gs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub4715
  db 24,$7F
  !as4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub4720
  db 96,$7F
  !rest
  !tie
  !end

.sub4725
  !instr,!instr36
  db 36,$7F
  !c5
  db 36,$77
  !c5
  db 24,$74
  !c5
  !instr,!instr37
  db 24,$7F
  !c5
  db 24,$79
  !c5
  db 24,$76
  !c5
  db 24,$73
  !c5
  !end

.sub473F
  !pan,10
  !instr,!instr36
  db 24,$7F
  !c5
  !pan,12
  !instr,!instr3C
  db 24,$73
  !c5
  !pan,10
  !instr,!instr3D
  db 24,$7F
  !c5
  !pan,12
  !instr,!instr3C
  db 24,$73
  !c5
  !pan,10
  !instr,!instr36
  db 24,$7F
  !c5
  !toggleEcho
  !pan,8
  !instr,!instr3C
  db 24,$73
  !c5
  !toggleEcho
  !pan,10
  !instr,!instr3D
  db 24,$7F
  !c5
  !toggleEcho
  !pan,8
  !instr,!instr3C
  db 24,$73
  !c5
  !toggleEcho
  !end

.sub4788
  !pan,10
  !instr,!instr36
  db 24,$7F
  !c5
  !pan,12
  !instr,!instr3E
  db 12,$73
  !c5
  !c5
  !pan,10
  !instr,!instr3D
  db 24,$7F
  !c5
  !pan,12
  !instr,!instr3E
  db 12,$73
  !c5
  !c5
  !pan,10
  !instr,!instr36
  db 24,$7F
  !c5
  !toggleEcho
  !pan,8
  !instr,!instr3E
  db 12,$73
  !c5
  !c5
  !toggleEcho
  !pan,10
  !instr,!instr3D
  db 24,$7F
  !c5
  !toggleEcho
  !pan,8
  !instr,!instr3E
  db 12,$73
  !c5
  !c5
  !toggleEcho
  !end

.sub47D5
  db 96,$72
  !rest
  !tie
  !end

.sub47DA
  db 96,$7F
  !rest
  !tie
  !end

.sub47DF
  db 96,$7F
  !rest
  !tie
  !end

.sub47E4
  !volume,137
  !instr,!instr20
  !adsrGain,$5F,$57
  !pan,7
  db 4,$7F
  !a6
  !pitchSlide,0,4 : !d6
  db 18
  !tie
  !pitchSlide,0,20 : !c6
  db 2
  !tie
  !pan,13
  db 4
  !ds6
  !pitchSlide,0,4 : !a5
  db 18
  !tie
  !pitchSlide,0,20 : !g5
  db 2
  !tie
  !pan,10
  db 4
  !b5
  !pitchSlide,0,4 : !e5
  db 6
  !tie
  !pitchSlide,0,8 : !ds5
  db 2
  !tie
  db 4
  !b5
  !pitchSlide,0,4 : !e5
  db 6
  !tie
  !pitchSlide,0,8 : !ds5
  db 2
  !tie
  !end

.sub482B
  db 96,$7F
  !rest
  !tie
  !end

.sub4830
  db 24,$7F
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub483B
  !volume,142
  !instr,!instr20
  !adsrGain,$5F,$57
  !pan,7
  db 4,$7F
  !f6
  !pitchSlide,0,4 : !as5
  db 18
  !tie
  !pitchSlide,0,20 : !gs5
  db 2
  !tie
  !pan,13
  db 4
  !b5
  !pitchSlide,0,4 : !f5
  db 18
  !tie
  !pitchSlide,0,20 : !ds5
  db 2
  !tie
  !pan,10
  db 4
  !g5
  !pitchSlide,0,4 : !c5
  db 6
  !tie
  !pitchSlide,0,8 : !b4
  db 2
  !tie
  db 4
  !g5
  !pitchSlide,0,4 : !c5
  db 6
  !tie
  !pitchSlide,0,8 : !b4
  db 2
  !tie
  !end

.sub4882
  !pan,12
  !volume,122
  !instr,!instr34
  !setInstrumentByte,$01,$F7 ; !adsrGain,$05,$F7
  db 12,$7F
  !rest
  db 60
  !c5
  !instr,!instr35
  db 24
  !c5
  !pan,8
  !volume,208
  !instr,!instr3B
  !subtranspose,128
  db 96
  !cs5
  db 48
  !tie
  !subtranspose,0
  !end

.sub48A3
  db 96,$7F
  !rest
  !tie
  !end

.sub48A8
  db 96,$7F
  !rest
  !end

.sub48AC
  db 96,$7F
  !rest
  !tie
  !end

.sub48B1
  db 96,$7F
  !rest
  !tie
  !end

.sub48B6
  db 96,$7F
  !rest
  !tie
  !end

.sub48BB
  db 24,$7F
  !cs4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub48C6
  db 24,$7F
  !ds4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub48D1
  db 24,$7F
  !c4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub48DC
  db 24,$7F
  !f4
  !volume,0
  !rest
  !instr,!instr32
  !volume,112
  !end

.sub48E7
  db 96,$7F
  !rest
  !tie
  !end

.remoteCode3D29
  !instr,!instr33
  !end

.remoteCode3D2C
  !adsrGain,$80,$B7
  !end

.remoteCode3D34
  !adsrGain,$80,$B3
  !end

.remoteCode3D30
  !adsrGain,$80,$B5
  !end

assert pc() <= $10000-(6*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
