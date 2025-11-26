lorom

; the red in the background doesn't actually glow in mb2 because the fireflea fx doesn't affect bg1

; BG (i extracted the level data using Mesen2's debugger so that's why it looks this way)
;org $849505
;db $0D,$00,$09,$81,$B4,$89,$B6,$8D,$7A,$89,$B7,$89,$7A,$89,$76,$85,$09,$81,$09,$81,$B4,$89,$B6,$8D,$B4,$8D,$09,$81,$00,$00
;db $0D,$00,$76,$81,$98,$15,$7D,$09,$7E,$09,$7E,$09,$58,$05,$98,$11,$7A,$8D,$97,$15,$96,$15,$7E,$09,$98,$11,$B7,$89,$00,$00
;db $0D,$00,$98,$15,$FF,$00,$FF,$00,$38,$09,$58,$05,$FF,$00,$FF,$00,$7D,$09,$36,$01,$37,$01,$38,$0D,$FF,$00,$7E,$09,$00,$00
;db $0D,$00,$FF,$00,$FF,$00,$38,$09,$58,$05,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$58,$01,$38,$0D,$FF,$00,$00,$00
;db $0D,$00,$38,$09,$37,$05,$36,$05,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$58,$01,$38,$0D,$00,$00
;db $0D,$00,$58,$05,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$58,$01,$00,$00

;org $A98C87
;Row23:
;JSL $8483D7
;db $02,$02 : dw $B67B
;JSL $8483D7
;db $02,$03 : dw $B67F
;LDA #Row45 : STA $0FA8 : RTS
;Row45:
;JSL $8483D7
;db $02,$04 : dw $B683
;JSL $8483D7
;db $02,$05 : dw $B687
;LDA #Row67 : STA $0FA8 : RTS
;Row67:
;JSL $8483D7
;db $02,$06 : dw $B68B
;JSL $8483D7
;db $02,$07 : dw $B68F
;LDA #$8D11 : STA $0FA8 : RTS

; escape door
;org $8494B1
;dw $8004,$90FF,$D0FF,$D0FF,$D0FF
;db $01,$00
;dw $8004,$00FF,$0938,$0558,$00FF
;dw $0000

; fill in wall
org $ADE396
BRA +
org $ADE3AA
+

org $A995A5
LDA #$0016 : JSL $80914D : RTS ; restore mb's footstep sfx

org $A9B4F2 : SEC : RTS ; let me spark mother brain lol, wait she's immune to it lol

; fast intro
org $A988CD : JMP $8C02
org $A98C30 : RTS
org $A98D73 : LDA #$0001
org $A98D85 : LDA #$0001
org $A98DAE : LDA #$0001
