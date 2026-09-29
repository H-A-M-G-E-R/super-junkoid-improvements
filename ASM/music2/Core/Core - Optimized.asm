; Originally by Toby Fox, arranged by Coolmario (https://www.smwcentral.net/?p=section&a=details&id=13442)
; Requires common instrument $0B (Synth Pad) to be removed or replaced by a smaller sample.
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
!instr35 = $2C
!instr36 = $2D
!instr37 = $2E
!instr38 = $2F
!instr39 = $30

!sample02 = $16
!sample08 = $17
!sample14 = $18
!sample15 = $19
!sample16 = $1A
!sample17 = $1B
!sample18 = $1C
!sample19 = $1D
!sample1A = $1E
!sample1B = $1F
!sample1C = $20
!sample1D = $21
!sample1E = $22
!sample1F = $23
!sample20 = $24
!sample21 = $25
!sample22 = $26
!sample23 = $27
!sample24 = $28
!sample25 = $29
!sample26 = $2A
!sample27 = $2B
!sample28 = $2C
!sample29 = $2D
!sample2A = $2E

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  db !sample14,$00,$E0,$FF,$04,$00
  db !sample14,$00,$E0,$FF,$04,$08
  db !sample16,$FF,$EA,$00,$04,$00
  db !sample17,$FF,$EA,$00,$04,$00
  db !sample18,$FF,$EA,$00,$04,$00
  db !sample19,$FF,$E0,$00,$05,$00
  db !sample1A,$FF,$E0,$00,$05,$00
  db !sample1B,$FF,$E0,$00,$05,$00
  db !sample1C,$FF,$E0,$00,$05,$00
  db !sample1D,$FF,$E0,$00,$05,$00
  db !sample1E,$FF,$E0,$00,$05,$00
  db !sample1F,$FF,$E0,$00,$05,$00
  db !sample20,$FF,$E0,$00,$05,$00
  db !sample21,$FF,$E0,$00,$05,$00
  db !sample22,$FF,$E0,$00,$05,$00
  db !sample23,$FF,$E0,$00,$05,$00
  db !sample24,$FF,$E0,$00,$05,$00
  db !sample25,$FF,$E0,$00,$08,$00
  db !sample26,$FF,$F4,$B8,$07,$00
  db !sample27,$FF,$F1,$B8,$08,$00
  db !sample28,$FF,$E0,$00,$0A,$00
  db !sample15,$00,$E0,$FF,$03,$00
  db !sample02,$FF,$F8,$00,$03,$00
  db !sample08,$FF,$E0,$00,$03,$00
  db !sample29,$FF,$E0,$00,$03,$10
  db !sample2A,$FF,$F2,$FF,$03,$15
  db !sample2A,$FF,$E0,$FF,$03,$15
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample02,Sample02+108
  dw Sample08,Sample08+9
  dw Sample14,Sample14+0
  dw Sample15,Sample15+0
  dw Sample16,Sample16+0
  dw Sample17,Sample17+0
  dw Sample18,Sample18+0
  dw Sample19,Sample19+0
  dw Sample1A,Sample1A+0
  dw Sample1B,Sample1B+0
  dw Sample1C,Sample1C+0
  dw Sample1D,Sample1D+0
  dw Sample1E,Sample1E+0
  dw Sample1F,Sample1F+0
  dw Sample20,Sample20+0
  dw Sample21,Sample21+0
  dw Sample22,Sample22+0
  dw Sample23,Sample23+0
  dw Sample24,Sample24+1719
  dw Sample25,Sample25+3654
  dw Sample26,Sample26+0
  dw Sample27,Sample27+2700
  dw Sample28,Sample28+0
  dw Sample29,Sample29+0
  dw Sample2A,Sample2A+405
endspcblock

spcblock !p_songSpecificData nspc ; sample data
  Sample02: incbin "Sample_54449a9813938370a1514e3ae883b1d3.brr"
  Sample08: incbin "Sample_1e19c4d801f63b6a6c9f2a86e3a6e2bb.brr"
  Sample14: incbin "Sample_f9c538722ef52fc7414f7bf81d6d59a8.brr"
  Sample15: incbin "Sample_bd17cc3b011c84cf47d8280361956f23.brr"
  Sample16: incbin "Sample_0fcae3b22f0b58b5e293d0be0aaa0db2.brr"
  Sample17: incbin "Sample_04500995e7e64ea19330c5ddd7d99109.brr"
  Sample18: incbin "Sample_a3c0bc3a1c77448c3c49ca641831c45e.brr"
  Sample19: incbin "Sample_3555807c731a6bdcb8417fb0d4d9715a.brr"
  Sample1A: incbin "Sample_7b81e442f35f0410f5c8552cc0b175d5.brr"
  Sample1B: incbin "Sample_a4528d303b9c1d0b6aeffdf22a73d310.brr"
  Sample1C: incbin "Sample_8789c9601fd199053f11c2828d18108c.brr"
  Sample1D: incbin "Sample_ed7ece15cc9fb921f8ebb601b571090a.brr"
  Sample1E: incbin "Sample_670f33637187342550fe1896c52b7dea.brr"
  Sample1F: incbin "Sample_e2c61c0fc262eb142b1700828e7b3866.brr"
  Sample20: incbin "Sample_d36deae41ee44b7386b1a0004014115e.brr"
  Sample21: incbin "Sample_02922eabd82c75ec22a39a6f12ff8636.brr"
  Sample22: incbin "Sample_8937217c6f77c4e94e5db60a329550f2.brr"
  Sample23: incbin "Sample_04e3196865963fc38a69b1c3557ad982.brr"
  Sample24: incbin "Sample_89cc019a219bacdc1270ba3fd974c26e.brr"
  Sample25: incbin "Sample_3e7bd77850244140d0191dd47ce41fec.brr"
  Sample26: incbin "Sample_045492b6269e847a0805c69859a22166.brr"
  Sample27: incbin "Sample_db70e87e3cd70b86e649f1d8ec7105c0.brr"
  Sample28: incbin "Sample_2872b0fecb22fcb23f8cd78110656ded.brr"
  Sample29: incbin "Sample_4b65199f1695ff2cdb19bf810d4f7e11.brr"
  Sample2A: incbin "Sample_8d75ab2216b5831120b1a9e20b4e7759.brr"

NoteLengthTable: ; note length table
  db $33,$66,$80,$99,$B3,$CC,$E6,$FF
  db $19,$33,$4C,$66,$72,$7F,$8C,$99,$A5,$B2,$BF,$CC,$D8,$E5,$F2,$FC

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2B25

Tracker2B25:
-
  dw .pattern0
  dw $00FF,-

.pattern0: dw .pattern0_0, .pattern0_1, .pattern0_2, .pattern0_3, .pattern0_4, .pattern0_5, .pattern0_6, .pattern0_7

.pattern0_0 ; $2BE3
  !setNoteLengthTable : dw NoteLengthTable
  ;!addmusicFA,4,2
  ;!addmusicFA,6,1
  !echo,%11111111,30,30
  !echoParameters,2,90,0
  !musicVolume,255;220
  !tempo,58
  !instr,!instr1E
  !volume,160
  !pan,10
  !vibrato,0,0,0
  !loop : dw .sub38AC : db 4
  !loop : dw .sub38B1 : db 4
  !instr,!instr31
  !volume,210
  db 96,$7F
  !g4
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
  !volume,170
  !pan,10
  !loop : dw .sub38CC : db 1
  db 24,$7F
  !e6
  !cs6
  !ds6
  !rest
  !loop : dw .sub38CC : db 1
  db 24,$7F
  !e6
  !volume,90
  !tie
  !volume,170
  !gs6
  !volume,90
  !tie
  !volume,170
  !dynamicVolume,80,112
  db 96
  !fs6
  db 48
  !tie
  !dynamicVolume,80,181
  db 96
  !tie
  db 48
  !tie
  !rest
  !volume,170
  !e6
  !a6
  !fs6
  !d6
  !e6
  ;!legato
  db 6
  !cs6
  !tie : !pitchSlide,0,1 : !d6
  !tie : !pitchSlide,0,1 : !cs6
  ;!legato
  db 78
  !tie
  db 96
  !b5
  db 24
  !gs6
  !fs6
  !b6
  db 48
  !e6
  db 24
  !rest
  db 8
  !gs6
  !gs6
  !gs6
  db 24
  !fs6
  !b6
  db 48
  !e6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !gs6
  !volume,90
  !tie
  !volume,170
  !cs7
  !volume,90
  !tie
  !volume,170
  !dynamicVolume,80,112
  db 96
  !b6
  db 48
  !tie
  !dynamicVolume,80,181
  db 96
  !tie
  db 48
  !tie
  !rest
  !volume,170
  !e6
  db 96
  !a6
  !tie
  !tie
  !tie
  !vibrato,24,16,42
  !volume,196
  !loop : dw .sub38DD : db 1
  ;!legato
  db 96,$7F
  !cs7
  db 72
  !tie
  db 12
  !tie : !pitchSlide,0,1 : !d7
  db 6
  !tie : !pitchSlide,0,1 : !cs7
  ;!legato
  !tie
  db 96
  !b6
  !cs7
  !loop : dw .sub38DD : db 1
  ;!legato
  db 96,$7F
  !fs7
  db 72
  !tie
  db 12
  !tie ;: !pitchSlide,0,1 : !fs7
  db 6
  !tie : !pitchSlide,0,1 : !g7
  ;!legato
  !tie
  db 96
  !fs7
  !volume,255
  !instr,!instr33
  !as6
  !instr,!instr31
  !volume,210
  !vibrato,0,0,0
  db 96,$7F
  !g4
  !tie
  !tie
  !tie
  !instr,!instr1F
  !volume,200
  !pan,10
  db 24,$7F
  !cs4
  !gs4
  !ds5
  !b4
  db 12,$2F
  !cs5
  !cs5
  !gs4
  !gs4
  !e4
  !gs4
  !cs4
  !cs4
  !instr,!instr1E
  ;!legato
  db 12,$6F
  !b4
  !tie : !pitchSlide,0,1 : !cs5
  !tie : !pitchSlide,0,1 : !b4
  ;!legato
  !rest
  !gs4
  !rest
  !b4
  !rest
  !cs5
  !rest
  !ds5
  db 36
  !b4
  db 24
  !gs4
  !instr,!instr26
  !volume,210
  !pan,10
  db 24,$1F
  !rest
  !cs5
  !d5
  !instr,!instr27
  !e5
  !slideIn,4,9,2
  !instr,!instr28
  db 48
  !fs5
  !instr,!instr29
  !a4
  !instr,!instr2A
  db 96,$7F
  !fs4
  !instr,!instr2B
  db 48
  !cs5
  !instr,!instr2C
  !d5
  !instr,!instr2D
  db 96
  !e5
  !slideIn,0,0,0
  !instr,!instr33
  !volume,220
  db 12,$1F
  !e6
  !e6
  !e6
  !rest
  !pan,20
  db 6,$5F
  !e6
  !e6
  !pan,0
  !e6
  !e6
  !pan,10
  db 12
  !e6
  !rest
  !volume,190
  db 24,$7F
  !a5
  !pitchSlide,3,16 : !a6
  !tie
  !dynamicVolume,144,0
  db 96
  !tie
  !pitchSlide,28,64 : !a3
  db 48
  !tie
  !instr,!instr1E
  !volume,170
  !pan,10
  !loop : dw .sub38F1 : db 1
  db 24,$7F
  !e6
  !cs6
  !ds6
  !rest
  !loop : dw .sub38F1 : db 1
  db 24,$7F
  !e6
  !volume,90
  !tie
  !volume,170
  !gs6
  !volume,90
  !tie
  !volume,170
  !dynamicVolume,80,112
  db 96
  !fs6
  db 48
  !tie
  !dynamicVolume,80,181
  db 96
  !tie
  db 48
  !tie
  !rest
  !volume,170
  !e6
  !a6
  !fs6
  !d6
  !e6
  ;!legato
  db 6
  !cs6
  !tie : !pitchSlide,0,1 : !d6
  !tie : !pitchSlide,0,1 : !cs6
  ;!legato
  db 78
  !tie
  db 96
  !b5
  !volume,176
  db 24
  !gs6
  !fs6
  !b6
  db 48
  !e6
  db 24
  !rest
  db 8
  !gs6
  !gs6
  !gs6
  db 24
  !fs6
  !b6
  db 48
  !e6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !gs6
  !volume,90
  !tie
  !volume,170
  !cs7
  !volume,90
  !tie
  !volume,176
  !dynamicVolume,80,112
  db 96
  !b6
  db 48
  !tie
  !dynamicVolume,80,181
  db 96
  !tie
  db 48
  !tie
  !rest
  !volume,176
  !fs6
  db 96
  !gs6
  !tie
  !tie
  !tie
  !vibrato,24,16,42
  !volume,196
  !loop : dw .sub3902 : db 1
  ;!legato
  db 96,$7F
  !ds7
  db 72
  !tie
  db 12
  !tie : !pitchSlide,0,1 : !e7
  db 6
  !tie : !pitchSlide,0,1 : !ds7
  ;!legato
  !tie
  db 96
  !cs7
  !ds7
  !loop : dw .sub3902 : db 1
  ;!legato
  db 96,$7F
  !gs7
  db 72
  !tie
  db 12
  !tie ;: !pitchSlide,0,1 : !gs7
  db 6
  !tie : !pitchSlide,0,1 : !a7
  ;!legato
  !tie
  db 96
  !gs7
  !volume,255
  !instr,!instr33
  !c7
  !loop : dw .sub3916 : db 4
  !end

.pattern0_1 ; $2E3A
  !instr,!instr1E
  !volume,90
  !pan,12
  !loop : dw .sub391B : db 4
  db 36,$1F
  !rest
  !loop : dw .sub3920 : db 3
  db 24,$1F
  !cs5
  !gs5
  !ds6
  !b5
  !cs6
  db 12
  !gs5
  db 24
  !e5
  db 12
  !gs5
  db 24
  !cs5
  !rest
  !gs5
  !ds6
  !e6
  !fs6
  db 12
  !e6
  db 24
  !ds6
  !loop : dw .sub393B : db 8
  !instr,!instr1F
  !volume,170
  !pan,10
  !loop : dw .sub3940 : db 1
  db 24,$7F
  !e6
  !cs6
  !ds6
  !rest
  !loop : dw .sub3940 : db 1
  db 24,$7F
  !e6
  !volume,90
  !tie
  !volume,170
  !gs6
  !volume,90
  !tie
  !volume,170
  !dynamicVolume,80,112
  db 96
  !fs6
  db 48
  !tie
  !dynamicVolume,80,181
  db 96
  !tie
  db 48
  !tie
  !rest
  !volume,170
  !e6
  !a6
  !fs6
  !d6
  !e6
  ;!legato
  db 6
  !cs6
  !tie : !pitchSlide,0,1 : !d6
  !tie : !pitchSlide,0,1 : !cs6
  ;!legato
  db 78
  !tie
  db 96
  !b5
  db 24
  !gs6
  !fs6
  !b6
  db 48
  !e6
  db 24
  !rest
  db 8
  !gs6
  !gs6
  !gs6
  db 24
  !fs6
  !b6
  db 48
  !e6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !gs6
  !volume,90
  !tie
  !volume,170
  !cs7
  !volume,90
  !tie
  !volume,170
  !dynamicVolume,80,112
  db 96
  !b6
  db 48
  !tie
  !dynamicVolume,80,181
  db 96
  !tie
  db 48
  !tie
  !rest
  !volume,170
  !e6
  db 96
  !a6
  !tie
  !tie
  !tie
  !instr,!instr31
  !volume,210
  db 96,$7F
  !g4
  !tie
  db 48
  !tie
  !instr,!instr37
  !volume,120
  !pan,8
  !loop : dw .sub3951 : db 1
  db 96,$7F
  !cs4
  db 72
  !tie
  db 12
  !d4
  !cs4
  db 96
  !b3
  !cs4
  db 96
  !b3
  !tie
  db 48
  !rest
  !loop : dw .sub3951 : db 1
  db 96,$7F
  !fs4
  db 72
  !tie
  db 12
  !fs4
  !g4
  db 96
  !fs4
  !as4
  !loop : dw .sub3961 : db 8
  !instr,!instr1F
  !volume,170
  !pan,10
  !loop : dw .sub3966 : db 1
  db 24,$7F
  !e6
  !cs6
  !ds6
  !rest
  !loop : dw .sub3966 : db 1
  db 24,$7F
  !e6
  !volume,90
  !tie
  !volume,170
  !gs6
  !volume,90
  !tie
  !volume,170
  !dynamicVolume,80,112
  db 96
  !fs6
  db 48
  !tie
  !dynamicVolume,80,181
  db 96
  !tie
  db 48
  !tie
  !rest
  !volume,170
  !e6
  !a6
  !fs6
  !d6
  !e6
  ;!legato
  db 6
  !cs6
  !tie : !pitchSlide,0,1 : !d6
  !tie : !pitchSlide,0,1 : !cs6
  ;!legato
  db 78
  !tie
  db 96
  !b5
  !instr,!instr1E
  !volume,176
  !pan,10
  db 24,$7F
  !e6
  !cs6
  !ds6
  db 48
  !cs6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !cs6
  db 24
  !rest
  !cs6
  !gs5
  !b5
  !rest
  !cs6
  !gs5
  !b5
  db 48
  !cs6
  db 24
  !rest
  !cs6
  !gs5
  !b5
  db 48
  !cs6
  db 24
  !rest
  !e6
  !volume,90
  !tie
  !volume,170
  !gs6
  !volume,90
  !tie
  !volume,176
  !dynamicVolume,80,112
  db 96
  !fs6
  db 48
  !tie
  !dynamicVolume,80,181
  db 96
  !tie
  db 48
  !tie
  !rest
  !volume,176
  !cs6
  db 96
  !cs6
  !tie
  !ds6
  !b5
  !instr,!instr31
  !volume,210
  db 96,$7F
  !g4
  !tie
  db 48
  !tie
  !instr,!instr37
  !volume,120
  !pan,8
  !loop : dw .sub3977 : db 1
  db 96,$7F
  !ds4
  db 72
  !tie
  db 12
  !e4
  !ds4
  db 96
  !cs4
  !ds4
  db 96
  !cs4
  !tie
  db 48
  !rest
  !loop : dw .sub3977 : db 1
  db 96,$7F
  !gs4
  db 72
  !tie
  db 12
  !gs4
  !a4
  db 96
  !gs4
  !c5
  !loop : dw .sub3987 : db 4
  !end

.pattern0_2 ; $2FF1
  !instr,!instr1E
  !volume,80
  !pan,8
  !loop : dw .sub398C : db 4
  db 48,$1F
  !rest
  !loop : dw .sub3991 : db 3
  db 24,$1F
  !cs5
  !gs5
  !ds6
  !b5
  !cs6
  db 12
  !gs5
  db 24
  !e5
  db 12
  !gs5
  db 24
  !cs5
  !rest
  !gs5
  !ds6
  !e6
  !fs6
  db 12
  !e6
  !ds6
  !instr,!instr23
  !volume,115
  !pan,12
  db 36,$1F
  !rest
  !instr,!instr23
  db 24
  !cs3
  !gs3
  !instr,!instr25
  !ds4
  !b3
  !instr,!instr26
  !cs4
  db 12
  !gs3
  db 24
  !e3
  !instr,!instr27
  db 12
  !gs3
  db 24
  !cs3
  !rest
  !gs3
  !instr,!instr29
  !ds4
  !e4
  !instr,!instr2B
  !fs4
  db 12
  !e4
  !instr,!instr2D
  db 36
  !ds4
  db 24
  !b3
  !instr,!instr1E
  !cs4
  !gs4
  !instr,!instr2D
  !ds4
  !b3
  !instr,!instr29
  !cs4
  db 12
  !gs3
  db 24
  !e3
  !instr,!instr27
  db 12
  !gs3
  db 24
  !cs3
  !instr,!instr25
  !rest
  !gs3
  !ds4
  !instr,!instr24
  !e4
  !fs4
  db 12
  !e4
  db 36
  !ds4
  db 24
  !b3
  !instr,!instr23
  !b2
  !fs3
  !instr,!instr25
  !cs4
  !a3
  !instr,!instr26
  !b3
  db 12
  !fs3
  db 24
  !d3
  !instr,!instr27
  db 12
  !fs3
  db 24
  !b2
  !rest
  !fs3
  !instr,!instr29
  !cs4
  !d4
  !instr,!instr2B
  !e4
  db 12
  !d4
  !instr,!instr2D
  db 36
  !cs4
  db 24
  !a3
  !instr,!instr1E
  !b3
  !fs4
  !instr,!instr2D
  !cs4
  !a3
  !instr,!instr29
  !b3
  db 12
  !fs3
  db 24
  !d3
  !instr,!instr27
  db 12
  !fs3
  db 24
  !b2
  !instr,!instr25
  !rest
  !fs3
  !cs4
  !instr,!instr24
  !d4
  !e4
  db 12
  !d4
  db 36
  !cs4
  db 24
  !a3
  !instr,!instr1E
  !volume,115
  !pan,12
  !loop : dw .sub39AC : db 1
  db 24,$2F
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !loop : dw .sub39AC : db 1
  db 24,$2F
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 24
  !cs5
  !instr,!instr37
  !volume,120
  !pan,8
  !loop : dw .sub39E1 : db 1
  db 96,$7F
  !e4
  !tie
  !d4
  !e4
  !loop : dw .sub39E1 : db 1
  db 96,$7F
  !e4
  !tie
  !e4
  !fs4
  !instr,!instr23
  !volume,115
  !pan,12
  db 48,$1F
  !rest
  !instr,!instr23
  db 24
  !cs3
  !gs3
  !instr,!instr25
  !ds4
  !b3
  !instr,!instr26
  !cs4
  db 12
  !gs3
  db 24
  !e3
  !instr,!instr27
  db 12
  !gs3
  db 24
  !cs3
  !rest
  !gs3
  !instr,!instr29
  !ds4
  !e4
  !instr,!instr2B
  !fs4
  db 12
  !e4
  !instr,!instr2D
  db 36
  !ds4
  db 24
  !b3
  !instr,!instr1E
  db 24,$7F
  !cs3
  !gs3
  !instr,!instr2D
  !ds4
  !b3
  !instr,!instr29
  db 12,$2F
  !cs4
  !cs4
  !gs3
  !gs3
  !instr,!instr27
  !e3
  !gs3
  !cs3
  !cs3
  ;!legato
  !instr,!instr25
  db 12,$6F
  !ds4
  !tie : !pitchSlide,0,1 : !e4
  db 6
  !tie : !pitchSlide,0,1 : !ds4
  ;!legato
  !tie
  db 12
  !rest
  !instr,!instr24
  !b3
  !rest
  !cs4
  !rest
  !instr,!instr23
  !ds4
  !rest
  !e4
  db 36
  !ds4
  db 24
  !cs4
  !instr,!instr23
  db 24,$1F
  !b2
  !fs3
  !instr,!instr25
  !cs4
  !a3
  !instr,!instr26
  !b3
  db 12
  !fs3
  db 24
  !d3
  !instr,!instr27
  db 12
  !fs3
  db 24
  !b2
  !rest
  !fs3
  !instr,!instr29
  !cs4
  !d4
  !instr,!instr2B
  !e4
  db 12
  !d4
  !instr,!instr2D
  db 36
  !cs4
  db 24
  !a3
  !instr,!instr1E
  !b3
  !fs4
  !instr,!instr2D
  !cs4
  !a3
  !instr,!instr29
  !b3
  db 12
  !fs3
  db 24
  !d3
  !instr,!instr27
  db 12
  !fs3
  db 24
  !b2
  !instr,!instr25
  !rest
  !fs3
  !cs4
  !instr,!instr24
  !d4
  !e4
  db 12
  !d4
  db 36
  !cs4
  db 24
  !a3
  !instr,!instr1E
  !volume,115
  !pan,12
  db 24,$2F
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !fs5
  db 12
  !e5
  db 36
  !ds5
  db 24
  !b4
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !gs5
  db 12
  !e5
  db 24
  !b4
  db 12
  !gs4
  db 24
  !b4
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  !cs5
  !instr,!instr39
  !volume,160
  !pan,8
  db 24,$2F
  !gs4
  !fs4
  !b4
  db 48
  !e4
  db 24
  !rest
  !gs4
  !fs4
  !b4
  db 48
  !e4
  db 24
  !rest
  !e4
  !cs4
  !ds4
  !rest
  !e4
  !cs4
  !ds4
  db 48
  !e4
  db 24
  !rest
  !e4
  !cs4
  !ds4
  db 48
  !e4
  db 24
  !rest
  !gs4
  !volume,90
  !tie
  !volume,190
  !cs5
  !volume,90
  !tie
  !volume,180
  !pan,10
  !instr,!instr35
  !loop : dw .sub39F5 : db 4
  !instr,!instr37
  !volume,120
  !pan,8
  !loop : dw .sub39FC : db 1
  db 96,$7F
  !fs4
  !tie
  !e4
  !fs4
  !loop : dw .sub39FC : db 1
  db 96,$7F
  !fs4
  !tie
  !fs4
  !gs4
  !loop : dw .sub3A10 : db 4
  !end

.pattern0_3 ; $32B5
  !instr,!instr1F
  !volume,160
  !pan,10
  !loop : dw .sub3A15 : db 4
  !loop : dw .sub3A1A : db 4
  !instr,!instr1E
  !volume,180
  !pan,10
  db 24,$2F
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !fs5
  db 12
  !e5
  db 36
  !ds5
  db 24
  !b4
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !fs5
  db 12
  !e5
  db 36
  !ds5
  db 24
  !b4
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !instr,!instr31
  !volume,210
  db 96,$7F
  !f4
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
  !volume,170
  !pan,8
  db 24,$7F
  !e6
  !cs6
  !ds6
  db 48
  !cs6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !cs6
  db 24
  !rest
  !cs6
  !gs5
  !b5
  !rest
  !cs6
  !gs5
  !b5
  db 48
  !cs6
  db 24
  !rest
  !cs6
  !gs5
  !b5
  db 48
  !cs6
  db 24
  !rest
  !e6
  !volume,90
  !tie
  !volume,170
  !gs6
  !volume,90
  !tie
  !volume,170
  !dynamicVolume,80,112
  db 96
  !fs6
  db 48
  !tie
  !dynamicVolume,80,181
  db 96
  !tie
  db 48
  !tie
  !rest
  !volume,170
  !cs6
  db 96
  !d6
  !tie
  !e6
  !cs6
  !instr,!instr36
  !volume,140
  !pan,15
  !loop : dw .sub3A35 : db 4
  !instr,!instr38
  !volume,170
  !pan,11
  !loop : dw .sub3A4D : db 6
  !loop : dw .sub3A78 : db 2
  !instr,!instr1E
  !volume,180
  !pan,10
  db 24,$2F
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !fs5
  db 12
  !e5
  db 36
  !ds5
  db 24
  !b4
  !volume,200
  db 24,$7F
  !cs4
  !gs4
  !ds5
  !b4
  db 12,$2F
  !cs5
  !cs5
  !gs4
  !gs4
  !e4
  !gs4
  !cs4
  !cs4
  ;!legato
  db 12,$6F
  !e5
  !tie : !pitchSlide,0,1 : !fs5
  !tie : !pitchSlide,0,1 : !e5
  ;!legato
  !rest
  !ds5
  !rest
  !e5
  !rest
  !fs5
  !rest
  !gs5
  db 36
  !fs5
  db 24
  !e5
  db 24,$2F
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !instr,!instr31
  !volume,210
  db 96,$7F
  !f4
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
  !instr,!instr39
  !volume,160
  !pan,12
  db 24,$2F
  !cs5
  !b4
  !e5
  db 72
  !gs4
  db 24
  !cs5
  !b4
  !e5
  db 72
  !gs4
  db 24
  !rest
  !e4
  db 48
  !fs4
  db 24
  !gs4
  !e4
  !fs4
  db 72
  !gs4
  db 24
  !gs4
  !e4
  !fs4
  db 72
  !gs4
  db 24
  !cs5
  !volume,90
  !tie
  !volume,190
  !e5
  !volume,90
  !tie
  !volume,100
  db 96,$7F
  !e5
  !tie
  !dynamicVolume,96,160
  !tie
  db 48
  !rest
  !volume,160
  !ds5
  db 96
  !e5
  !tie
  !fs5
  !ds5
  !instr,!instr36
  !volume,140
  !pan,15
  !loop : dw .sub3A7D : db 4
  !instr,!instr38
  !volume,170
  !pan,11
  !loop : dw .sub3A95 : db 6
  !loop : dw .sub3AC0 : db 6
  !end

.pattern0_4 ; $348F
  !volume,205
  !pan,10
  !loop : dw .sub3AC5 : db 5
  !instr,!instr20
  db 48,$7F
  !b3
  !instr,!instr21
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  !b3
  !instr,!instr20
  db 96
  !b3
  !tie
  db 24
  !tie
  !instr,!instr23
  !volume,255
  !pan,10
  !instr,!instr23
  db 24,$1F
  !cs3
  !gs3
  !instr,!instr25
  !ds4
  !b3
  !instr,!instr26
  !cs4
  db 12
  !gs3
  db 24
  !e3
  !instr,!instr27
  db 12
  !gs3
  db 24
  !cs3
  !rest
  !gs3
  !instr,!instr29
  !ds4
  !e4
  !instr,!instr2B
  !fs4
  db 12
  !e4
  !instr,!instr2D
  db 36
  !ds4
  db 24
  !b3
  !instr,!instr1E
  !cs4
  !gs4
  !instr,!instr2D
  !ds4
  !b3
  !instr,!instr29
  !cs4
  db 12
  !gs3
  db 24
  !e3
  !instr,!instr27
  db 12
  !gs3
  db 24
  !cs3
  !instr,!instr25
  !rest
  !gs3
  !ds4
  !instr,!instr24
  !e4
  !fs4
  db 12
  !e4
  db 36
  !ds4
  db 24
  !b3
  !instr,!instr23
  !b2
  !fs3
  !instr,!instr25
  !cs4
  !a3
  !instr,!instr26
  !b3
  db 12
  !fs3
  db 24
  !d3
  !instr,!instr27
  db 12
  !fs3
  db 24
  !b2
  !rest
  !fs3
  !instr,!instr29
  !cs4
  !d4
  !instr,!instr2B
  !e4
  db 12
  !d4
  !instr,!instr2D
  db 36
  !cs4
  db 24
  !a3
  !instr,!instr1E
  !b3
  !fs4
  !instr,!instr2D
  !cs4
  !a3
  !instr,!instr29
  !b3
  db 12
  !fs3
  db 24
  !d3
  !instr,!instr27
  db 12
  !fs3
  db 24
  !b2
  !instr,!instr25
  !rest
  !fs3
  !cs4
  !instr,!instr24
  !d4
  !e4
  db 12
  !d4
  db 36
  !cs4
  db 24
  !a3
  !instr,!instr1E
  !volume,205
  !pan,10
  !loop : dw .sub3AE7 : db 2
  !instr,!instr1E
  !volume,235
  !pan,10
  !loop : dw .sub3B4C : db 8
  !loop : dw .sub3B55 : db 4
  !loop : dw .sub3B5E : db 4
  !loop : dw .sub3B67 : db 16
  !loop : dw .sub3B70 : db 8
  !loop : dw .sub3B79 : db 4
  !loop : dw .sub3B82 : db 4
  !loop : dw .sub3B8B : db 8
  !loop : dw .sub3B94 : db 8
  !instr,!instr23
  !volume,255
  !pan,10
  !instr,!instr23
  db 24,$1F
  !cs3
  !gs3
  !instr,!instr25
  !ds4
  !b3
  !instr,!instr26
  !cs4
  db 12
  !gs3
  db 24
  !e3
  !instr,!instr27
  db 12
  !gs3
  db 24
  !cs3
  !rest
  !gs3
  !instr,!instr29
  !ds4
  !e4
  !instr,!instr2B
  !fs4
  db 12
  !e4
  !instr,!instr2D
  db 36
  !ds4
  db 24
  !b3
  !instr,!instr1E
  db 24,$7F
  !cs3
  !gs3
  !instr,!instr2D
  !ds4
  !b3
  !instr,!instr29
  db 12,$2F
  !cs4
  !cs4
  !gs3
  !gs3
  !instr,!instr27
  !e3
  !gs3
  !cs3
  !cs3
  ;!legato
  !instr,!instr25
  db 12,$6F
  !ds4
  !tie : !pitchSlide,0,1 : !e4
  db 6
  !tie : !pitchSlide,0,1 : !ds4
  ;!legato
  !tie
  db 12
  !rest
  !instr,!instr24
  !b3
  !rest
  !cs4
  !rest
  !instr,!instr23
  !ds4
  !rest
  !e4
  db 36
  !ds4
  db 24
  !cs4
  !instr,!instr23
  db 24,$1F
  !b2
  !fs3
  !instr,!instr25
  !cs4
  !a3
  !instr,!instr26
  !b3
  db 12
  !fs3
  db 24
  !d3
  !instr,!instr27
  db 12
  !fs3
  db 24
  !b2
  !rest
  !fs3
  !instr,!instr29
  !cs4
  !d4
  !instr,!instr2B
  !e4
  db 12
  !d4
  !instr,!instr2D
  db 36
  !cs4
  db 24
  !a3
  !instr,!instr1E
  !b3
  !fs4
  !instr,!instr2D
  !cs4
  !a3
  !instr,!instr29
  !b3
  db 12
  !fs3
  db 24
  !d3
  !instr,!instr27
  db 12
  !fs3
  db 24
  !b2
  !instr,!instr25
  !rest
  !fs3
  !cs4
  !instr,!instr24
  !d4
  !e4
  db 12
  !d4
  db 36
  !cs4
  db 24
  !a3
  !instr,!instr1E
  !volume,205
  !pan,10
  db 24,$2F
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !fs5
  db 12
  !e5
  db 36
  !ds5
  db 24
  !b4
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !gs5
  db 12
  !e5
  db 24
  !b4
  db 12
  !gs4
  db 24
  !b4
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !volume,220
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !fs5
  db 12
  !e5
  db 36
  !ds5
  db 24
  !b4
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !gs5
  db 12
  !e5
  db 24
  !b4
  db 12
  !gs4
  db 24
  !b4
  !a4
  !e4
  !cs5
  !a4
  !e5
  db 12
  !cs5
  db 24
  !a4
  db 12
  !cs5
  db 24
  !a4
  !rest
  !e4
  !cs5
  !ds5
  !e5
  db 12
  !ds5
  db 36
  !cs5
  db 24
  !a4
  !b3
  !fs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !fs4
  !ds5
  !b4
  !fs5
  db 12
  !e5
  db 36
  !ds5
  db 24
  !b4
  !instr,!instr1E
  !volume,235
  !pan,10
  !loop : dw .sub3B9D : db 8
  !loop : dw .sub3BA6 : db 4
  !loop : dw .sub3BAF : db 4
  !loop : dw .sub3BB8 : db 16
  !loop : dw .sub3BC1 : db 8
  !loop : dw .sub3BCA : db 4
  !loop : dw .sub3BD3 : db 4
  !loop : dw .sub3BDC : db 8
  !loop : dw .sub3BE5 : db 6
  !loop : dw .sub3BEE : db 2
  !volume,225
  !pan,10
  !loop : dw .sub3AC5 : db 2
  !end

.pattern0_5 ; $3732
  !volume,90
  !pan,139
  db 36,$7F
  !rest
  !loop : dw .sub3BF7 : db 5
  !instr,!instr20
  db 48,$7F
  !b3
  !instr,!instr21
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  !b3
  !instr,!instr20
  db 96
  !b3
  db 84
  !tie
  !loop : dw .sub3C19 : db 16
  !loop : dw .sub3C2A : db 31
  !volume,210
  !pan,10
  !instr,!instr2E
  db 24,$7F
  !c4
  !volume,210
  !pan,10
  !instr,!instr30
  db 6
  !ds4
  !ds4
  !volume,250
  db 12
  !ds4
  db 24
  !ds4
  !ds4
  !loop : dw .sub3C3B : db 32
  !loop : dw .sub3C4C : db 16
  !loop : dw .sub3C5D : db 31
  !volume,210
  !pan,10
  !instr,!instr2E
  db 24,$7F
  !c4
  !volume,210
  !pan,10
  !instr,!instr30
  db 6
  !ds4
  !ds4
  !volume,250
  db 12
  !ds4
  db 24
  !ds4
  !ds4
  !loop : dw .sub3C6E : db 31
  !volume,220
  !pan,10
  !instr,!instr2E
  db 24,$7F
  !c4
  !volume,250
  !pan,10
  !instr,!instr30
  db 6
  !ds4
  !ds4
  !volume,250
  db 12
  !ds4
  !ds4
  !ds4
  db 24
  !ds4
  !volume,100
  !pan,139
  db 36,$7F
  !rest
  !loop : dw .sub3C7F : db 2
  !end

.pattern0_6 ; $37C2
  !volume,80
  !pan,73
  db 60,$7F
  !rest
  !loop : dw .sub3CA1 : db 5
  !instr,!instr20
  db 48,$7F
  !b3
  !instr,!instr21
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  !b3
  !instr,!instr20
  db 96
  !b3
  db 60
  !tie
  !loop : dw .sub3CC3 : db 8
  !loop : dw .sub3D07 : db 16
  !loop : dw .sub3D4B : db 16
  !loop : dw .sub3D8F : db 8
  !loop : dw .sub3DD3 : db 16
  !loop : dw .sub3E17 : db 16
  !volume,90
  !pan,73
  db 60,$7F
  !rest
  !loop : dw .sub3E5B : db 2
  !end

.pattern0_7 ; $3806
  !loop : dw .sub3E7D : db 4
  !loop : dw .sub3E82 : db 8
  !volume,185
  !pan,10
  !loop : dw .sub3AC5 : db 2
  !loop : dw .sub3E87 : db 2
  !loop : dw .sub3AC5 : db 2
  !loop : dw .sub3E87 : db 2
  !loop : dw .sub3AC5 : db 2
  !loop : dw .sub3E87 : db 2
  !volume,174
  !pan,10
  !instr,!instr35
  !loop : dw .sub3EA9 : db 7
  db 24,$7F
  !as5
  !as6
  !gs6
  db 12
  !as6
  db 24
  !fs6
  db 12
  !fs6
  db 24
  !e6
  !d6
  !e6
  !rest
  !as6
  !gs6
  db 12
  !as6
  db 24
  !fs6
  db 12
  !fs6
  db 24
  !e6
  !fs6
  !as6
  !volume,185
  !pan,10
  !loop : dw .sub3AC5 : db 2
  !loop : dw .sub3E87 : db 2
  !loop : dw .sub3AC5 : db 2
  !loop : dw .sub3E87 : db 2
  !loop : dw .sub3AC5 : db 3
  !instr,!instr21
  db 48,$7F
  !b3
  !instr,!instr22
  !b3
  db 36
  !cs4
  !b3
  !instr,!instr21
  db 48
  !b3
  db 24
  !b3
  !instr,!instr22
  db 48
  !b3
  db 36
  !cs4
  db 60
  !b3
  !volume,174
  !pan,10
  !instr,!instr35
  !loop : dw .sub3EC6 : db 7
  db 24,$7F
  !c6
  !c7
  !as6
  db 12
  !c7
  db 24
  !gs6
  db 12
  !gs6
  db 24
  !fs6
  !e6
  !fs6
  !rest
  !c7
  !as6
  db 12
  !c7
  db 24
  !gs6
  db 12
  !gs6
  db 24
  !fs6
  !gs6
  !c7
  !loop : dw .sub3EE3 : db 4
  !end

.sub38AC ; $38AC
  db 96,$2F
  !rest
  !tie
  !end

.sub38B1 ; $38B1
  db 24,$2F
  !cs5
  !gs5
  !ds6
  !b5
  !cs6
  db 12
  !gs5
  db 24
  !e5
  db 12
  !gs5
  db 24
  !cs5
  !rest
  !gs5
  !ds6
  !e6
  !fs6
  db 12
  !e6
  db 36
  !ds6
  db 24
  !b5
  !end

.sub38CC ; $38CC
  db 24,$7F
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !end

.sub38DD ; $38DD
  db 96,$7F
  !b6
  !tie
  db 48
  !rest
  !cs7
  !d7
  !e7
  db 96
  !fs7
  !tie
  !e7
  !d7
  db 96
  !cs7
  !tie
  !d7
  !e7
  !end

.sub38F1 ; $38F1
  db 24,$7F
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !end

.sub3902 ; $3902
  db 96,$7F
  !cs7
  !tie
  db 48
  !rest
  !ds7
  !e7
  !fs7
  db 96
  !gs7
  !tie
  !fs7
  !e7
  db 96
  !ds7
  !tie
  !e7
  !fs7
  !end

.sub3916 ; $3916
  db 96,$7F
  !rest
  !tie
  !end

.sub391B ; $391B
  db 96,$1F
  !rest
  !tie
  !end

.sub3920 ; $3920
  db 24,$1F
  !cs5
  !gs5
  !ds6
  !b5
  !cs6
  db 12
  !gs5
  db 24
  !e5
  db 12
  !gs5
  db 24
  !cs5
  !rest
  !gs5
  !ds6
  !e6
  !fs6
  db 12
  !e6
  db 36
  !ds6
  db 24
  !b5
  !end

.sub393B ; $393B
  db 96,$1F
  !rest
  !tie
  !end

.sub3940 ; $3940
  db 24,$7F
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !end

.sub3951 ; $3951
  db 48,$7F
  !cs4
  !d4
  !e4
  db 96
  !fs4
  !tie
  !e4
  !d4
  db 96
  !cs4
  !tie
  !d4
  !e4
  !end

.sub3961 ; $3961
  db 96,$7F
  !rest
  !tie
  !end

.sub3966 ; $3966
  db 24,$7F
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !e6
  !cs6
  !ds6
  db 48
  !e6
  db 24
  !rest
  !end

.sub3977 ; $3977
  db 48,$7F
  !ds4
  !e4
  !fs4
  db 96
  !gs4
  !tie
  !fs4
  !e4
  db 96
  !ds4
  !tie
  !e4
  !fs4
  !end

.sub3987 ; $3987
  db 96,$7F
  !rest
  !tie
  !end

.sub398C ; $398C
  db 96,$1F
  !rest
  !tie
  !end

.sub3991 ; $3991
  db 24,$1F
  !cs5
  !gs5
  !ds6
  !b5
  !cs6
  db 12
  !gs5
  db 24
  !e5
  db 12
  !gs5
  db 24
  !cs5
  !rest
  !gs5
  !ds6
  !e6
  !fs6
  db 12
  !e6
  db 36
  !ds6
  db 24
  !b5
  !end

.sub39AC ; $39AC
  db 24,$2F
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !fs5
  db 12
  !e5
  db 36
  !ds5
  db 24
  !b4
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !gs5
  db 12
  !e5
  db 24
  !b4
  db 12
  !gs4
  db 24
  !b4
  !end

.sub39E1 ; $39E1
  db 96,$7F
  !d4
  !tie
  db 48
  !rest
  !e4
  !fs4
  !a4
  db 96
  !b4
  !tie
  !a4
  !fs4
  db 96
  !e4
  !tie
  !fs4
  !b3
  !end

.sub39F5 ; $39F5
  db 48,$7F
  !cs6
  !gs5
  !e5
  !e6
  !end

.sub39FC ; $39FC
  db 96,$7F
  !e4
  !tie
  db 48
  !rest
  !fs4
  !gs4
  !b4
  db 96
  !cs5
  !tie
  !b4
  !gs4
  db 96
  !fs4
  !tie
  !gs4
  !cs4
  !end

.sub3A10 ; $3A10
  db 96,$7F
  !rest
  !tie
  !end

.sub3A15 ; $3A15
  db 96,$1F
  !rest
  !tie
  !end

.sub3A1A ; $3A1A
  db 24,$1F
  !cs5
  !gs5
  !ds6
  !b5
  !cs6
  db 12
  !gs5
  db 24
  !e5
  db 12
  !gs5
  db 24
  !cs5
  !rest
  !gs5
  !ds6
  !e6
  !fs6
  db 12
  !e6
  db 36
  !ds6
  db 24
  !b5
  !end

.sub3A35 ; $3A35
  db 24,$5F
  !b3
  !rest
  !cs4
  !rest
  !d4
  db 12
  !rest
  db 24
  !cs4
  db 12
  !rest
  db 24
  !b3
  !rest
  !b3
  !cs4
  !rest
  !d4
  !rest
  !cs4
  !rest
  !end

.sub3A4D ; $3A4D
  !pan,11
  !volume,200
  db 24,$2F
  !b5
  !volume,110
  !pan,9
  !b5
  !pan,9
  !volume,180
  !b5
  !volume,110
  !pan,11
  !b5
  !pan,11
  !volume,180
  !b5
  !volume,110
  !pan,9
  !b5
  !pan,9
  !volume,180
  !b5
  !volume,110
  !pan,11
  !b5
  !end

.sub3A78 ; $3A78
  db 96,$2F
  !rest
  !tie
  !end

.sub3A7D ; $3A7D
  db 24,$5F
  !cs4
  !rest
  !ds4
  !rest
  !e4
  db 12
  !rest
  db 24
  !ds4
  db 12
  !rest
  db 24
  !cs4
  !rest
  !cs4
  !ds4
  !rest
  !e4
  !rest
  !ds4
  !rest
  !end

.sub3A95 ; $3A95
  !pan,11
  !volume,200
  db 24,$2F
  !cs6
  !volume,110
  !pan,9
  !cs6
  !pan,9
  !volume,180
  !cs6
  !volume,110
  !pan,11
  !cs6
  !pan,11
  !volume,180
  !cs6
  !volume,110
  !pan,9
  !cs6
  !pan,9
  !volume,180
  !cs6
  !volume,110
  !pan,11
  !cs6
  !end

.sub3AC0 ; $3AC0
  db 96,$2F
  !rest
  !tie
  !end

.sub3AC5 ; $3AC5
  !instr,!instr20
  db 48,$7F
  !b3
  !instr,!instr21
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  !b3
  !instr,!instr20
  db 48
  !b3
  db 24
  !b3
  !instr,!instr21
  db 48
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  db 60
  !b3
  !end

.sub3AE7 ; $3AE7
  db 24,$2F
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !fs5
  db 12
  !e5
  db 36
  !ds5
  db 24
  !b4
  !cs4
  !gs4
  !ds5
  !b4
  !cs5
  db 12
  !gs4
  db 24
  !e4
  db 12
  !gs4
  db 24
  !cs4
  !rest
  !gs4
  !ds5
  !e5
  !gs5
  db 12
  !e5
  db 24
  !b4
  db 12
  !gs4
  db 24
  !b4
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !b3
  !fs4
  !cs5
  !a4
  !b4
  db 12
  !fs4
  db 24
  !d4
  db 12
  !fs4
  db 24
  !b3
  !rest
  !fs4
  !cs5
  !d5
  !e5
  db 12
  !d5
  db 36
  !cs5
  db 24
  !a4
  !end

.sub3B4C ; $3B4C
  db 24,$6F
  !g3
  !pitchSlide,21,8 : !g4
  !tie
  !end

.sub3B55 ; $3B55
  db 24,$6F
  !fs3
  !pitchSlide,21,8 : !fs4
  !tie
  !end

.sub3B5E ; $3B5E
  db 24,$6F
  !a3
  !pitchSlide,21,8 : !a4
  !tie
  !end

.sub3B67 ; $3B67
  db 24,$6F
  !gs3
  !pitchSlide,21,8 : !gs4
  !tie
  !end

.sub3B70 ; $3B70
  db 24,$6F
  !g3
  !pitchSlide,21,8 : !g4
  !tie
  !end

.sub3B79 ; $3B79
  db 24,$6F
  !fs3
  !pitchSlide,21,8 : !fs4
  !tie
  !end

.sub3B82 ; $3B82
  db 24,$6F
  !a3
  !pitchSlide,21,8 : !a4
  !tie
  !end

.sub3B8B ; $3B8B
  db 24,$6F
  !gs3
  !pitchSlide,21,8 : !gs4
  !tie
  !end

.sub3B94 ; $3B94
  db 24,$6F
  !fs3
  !pitchSlide,21,8 : !fs4
  !tie
  !end

.sub3B9D ; $3B9D
  db 24,$6F
  !a3
  !pitchSlide,21,8 : !a4
  !tie
  !end

.sub3BA6 ; $3BA6
  db 24,$6F
  !gs3
  !pitchSlide,21,8 : !gs4
  !tie
  !end

.sub3BAF ; $3BAF
  db 24,$6F
  !b3
  !pitchSlide,21,8 : !b4
  !tie
  !end

.sub3BB8 ; $3BB8
  db 24,$6F
  !as3
  !pitchSlide,21,8 : !as4
  !tie
  !end

.sub3BC1 ; $3BC1
  db 24,$6F
  !a3
  !pitchSlide,21,8 : !a4
  !tie
  !end

.sub3BCA ; $3BCA
  db 24,$6F
  !gs3
  !pitchSlide,21,8 : !gs4
  !tie
  !end

.sub3BD3 ; $3BD3
  db 24,$6F
  !b3
  !pitchSlide,21,8 : !b4
  !tie
  !end

.sub3BDC ; $3BDC
  db 24,$6F
  !as3
  !pitchSlide,21,8 : !as4
  !tie
  !end

.sub3BE5 ; $3BE5
  db 24,$6F
  !gs3
  !pitchSlide,21,8 : !gs4
  !tie
  !end

.sub3BEE ; $3BEE
  db 24,$6F
  !c4
  !pitchSlide,21,8 : !c5
  !tie
  !end

.sub3BF7 ; $3BF7
  !instr,!instr20
  db 48,$7F
  !b3
  !instr,!instr21
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  !b3
  !instr,!instr20
  db 48
  !b3
  db 24
  !b3
  !instr,!instr21
  db 48
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  db 60
  !b3
  !end

.sub3C19 ; $3C19
  !volume,210
  !pan,10
  !instr,!instr2E
  db 48,$7F
  !c4
  !volume,250
  !pan,10
  !instr,!instr30
  !ds4
  !end

.sub3C2A ; $3C2A
  !volume,210
  !pan,10
  !instr,!instr2E
  db 48,$7F
  !c4
  !volume,250
  !pan,10
  !instr,!instr30
  !ds4
  !end

.sub3C3B ; $3C3B
  !volume,220
  !pan,10
  !instr,!instr2E
  db 48,$7F
  !c4
  !volume,250
  !pan,10
  !instr,!instr30
  !ds4
  !end

.sub3C4C ; $3C4C
  !volume,210
  !pan,10
  !instr,!instr2E
  db 48,$7F
  !c4
  !volume,250
  !pan,10
  !instr,!instr30
  !ds4
  !end

.sub3C5D ; $3C5D
  !volume,210
  !pan,10
  !instr,!instr2E
  db 48,$7F
  !c4
  !volume,250
  !pan,10
  !instr,!instr30
  !ds4
  !end

.sub3C6E ; $3C6E
  !volume,220
  !pan,10
  !instr,!instr2E
  db 48,$7F
  !c4
  !volume,250
  !pan,10
  !instr,!instr30
  !ds4
  !end

.sub3C7F ; $3C7F
  !instr,!instr20
  db 48,$7F
  !b3
  !instr,!instr21
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  !b3
  !instr,!instr20
  db 48
  !b3
  db 24
  !b3
  !instr,!instr21
  db 48
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  db 60
  !b3
  !end

.sub3CA1 ; $3CA1
  !instr,!instr20
  db 48,$7F
  !b3
  !instr,!instr21
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  !b3
  !instr,!instr20
  db 48
  !b3
  db 24
  !b3
  !instr,!instr21
  db 48
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  db 60
  !b3
  !end

.sub3CC3 ; $3CC3
  !instr,!instr32
  !volume,110
  !pan,12
  !volume,110
  !pan,12
  !instr,!instr32
  db 24,$7F
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 12
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  db 36
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 24
  !c5
  !end

.sub3D07 ; $3D07
  !instr,!instr32
  !volume,110
  !pan,12
  !volume,110
  !pan,12
  !instr,!instr32
  db 24,$7F
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 12
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  db 36
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 24
  !c5
  !end

.sub3D4B ; $3D4B
  !instr,!instr32
  !volume,110
  !pan,12
  !volume,110
  !pan,12
  !instr,!instr32
  db 24,$7F
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 12
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  db 36
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 24
  !c5
  !end

.sub3D8F ; $3D8F
  !instr,!instr32
  !volume,110
  !pan,12
  !volume,110
  !pan,12
  !instr,!instr32
  db 24,$7F
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 12
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  db 36
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 24
  !c5
  !end

.sub3DD3 ; $3DD3
  !instr,!instr32
  !volume,110
  !pan,12
  !volume,110
  !pan,12
  !instr,!instr32
  db 24,$7F
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 12
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  db 36
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 24
  !c5
  !end

.sub3E17 ; $3E17
  !instr,!instr32
  !volume,110
  !pan,12
  !volume,110
  !pan,12
  !instr,!instr32
  db 24,$7F
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 12
  !c5
  !volume,110
  !pan,12
  !instr,!instr32
  db 36
  !b3
  !pan,6
  !instr,!instr2F
  !volume,120
  db 24
  !c5
  !end

.sub3E5B ; $3E5B
  !instr,!instr20
  db 48,$7F
  !b3
  !instr,!instr21
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  !b3
  !instr,!instr20
  db 48
  !b3
  db 24
  !b3
  !instr,!instr21
  db 48
  !b3
  !instr,!instr22
  db 36
  !b3
  !instr,!instr21
  db 60
  !b3
  !end

.sub3E7D ; $3E7D
  db 96,$7F
  !rest
  !tie
  !end

.sub3E82 ; $3E82
  db 96,$7F
  !rest
  !tie
  !end

.sub3E87 ; $3E87
  !instr,!instr20
  db 48,$7F
  !a3
  !instr,!instr21
  !a3
  !instr,!instr22
  db 36
  !a3
  !instr,!instr21
  !a3
  !instr,!instr20
  db 48
  !a3
  db 24
  !a3
  !instr,!instr21
  db 48
  !a3
  !instr,!instr22
  db 36
  !a3
  !instr,!instr21
  db 60
  !a3
  !end

.sub3EA9 ; $3EA9
  db 24,$7F
  !b5
  !b6
  !a6
  db 12
  !b6
  db 24
  !fs6
  db 12
  !fs6
  db 24
  !e6
  !d6
  !e6
  !rest
  !b6
  !a6
  db 12
  !b6
  db 24
  !fs6
  db 12
  !fs6
  db 24
  !e6
  !d6
  !e6
  !end

.sub3EC6 ; $3EC6
  db 24,$7F
  !cs6
  !cs7
  !b6
  db 12
  !cs7
  db 24
  !gs6
  db 12
  !gs6
  db 24
  !fs6
  !e6
  !fs6
  !rest
  !cs7
  !b6
  db 12
  !cs7
  db 24
  !gs6
  db 12
  !gs6
  db 24
  !fs6
  !e6
  !fs6
  !end

.sub3EE3 ; $3EE3
  db 96,$7F
  !rest
  !tie
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
