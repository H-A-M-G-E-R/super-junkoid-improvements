lorom
; wip

;$5A: $CDA5CB..CDC53B
;$33: $CDC53B..CDE526
;gap
;$42: $D892B7..D8C8F4
;$0C: $D8C8F4..D9827A
;$4E: $D9827A..D9BC6F
;$39: $D9BC6F..D9F7AF
;$15: $D9F7AF..DAB363
;$2D: $DAB363..DAF2C5
;$30: $DAF2C5..DBB338
;$54: $DBB338..DBFE4F
;$3F: $DBFE4F..DCC9AA
;$36: $DCC9AA..DD977E
;$63: $DD977E..DDE607
;$3C: $DDE607..DEB52B
;$21: $DEB52B..DF8501
;$48: $DF8501..DFD500
;gap
;$12: $E0C5E6..E19640
;$1B: $E19640..E1E6B3
;$45: $E1E6B3..E2B770
;$27: $E2B770..E38849
;$09: $E38849..E3D935
;$06: $E3D935..E4ABD5
;$03: $E4ABD5..E4FFF2
;$18: $E4FFF2..E5D416
;$4B: $E5D416..E6A870
;$51: $E6A870..E6FD0C
;$0F: $E6FD0C..E7D1E2
;$1E: $E7D1E2..E8A8C8
;$24: $E8A8C8..E98307
;$60: $E98307..E9E242
;$66: $E9E242..EAC600
;$69: $EAC600..EBA9BE
;$6C: $EBA9BE..EC8D7C
;$5D: $EC8D7C..ECF13A
;$6F: $ECF13A..EDD4F8
;$72: $EDD4F8..EEB8B6
;$2A: $EEB8B6..EF9C74
;$75: $EF9C74..F08032
;$78: $F08032..F0E3F0
;$57: $F0E3F0..F1C7AE
;$7B: $F1C7AE..F2AB6C
;$00: $F2AB6C..F48A00

org $B9806B
dl Song00, ; SPC engine
   Song03, ; (used in game over screen but uses song 4)
   Song06,
   Song09, ; statue room
   Song0C,
   Song0F,
   Song12,
   Song15,
   Song18,
   Song1B,
   Song1E, ; tourian (alive idol)
   Song21,
   Song24,
   Song27, ; (penguinmire)
   Song2A, ; (miniboss)
   Song2D,
   Song30,
   Song33, ; zebes boom (used)
   Song36,
   Song39, ; death
   Song3C, ; credits (edited to only use the intro)
   Song3F,
   Song42,
   Song45,
   Song48,
   Song4B, ; (upper outskirts)
   Song4E, ; (lower outskirts)
   Song51, ; (blood bethel)
   Song54, ; (upper deep purple)
   Song57, ; (lower Sheol)
   Song5A, ; (ice castle)
   Song5D, ; (dead idol)
   Song60, ; (lower deep purple)
   Song63, ; (upper Sheol)
   Song66, ; (title screen)
   Song69, ; (touhou area)
   Song6C,
   Song6F, ; (pre-snake)
   Song72, ; (the new mother brain music)
   Song75,
   Song78, ; (credits 2)
   Song7B  ; that song from alttp (used in one true junko room)

org $80845D : dl Song00 ; repoint SPC engine

org $A7EB8C : BRA $00 : LDA #$0032 ; etecoon walljump sound (skip [Samus X position] >= 100h check)
org $A7EA2D : BRA $00 ; another one
org $A7EE34 : BRA $00
org $A7EE8A : BRA $00

org $8191BF : LDA #$FF36 ; game over music
org $8193F3 : LDA #$0005
org $82BB75 : RTL ; no more game over baby metroid

%BEGIN_FREESPACE(8B)
FightSansInFileSelect:
LDA #$FF2D : JSL $808FC1
LDA #$0005 : JSL $808FC1
LDA.w #WaitForFightSansMusic : STA $1F51
RTS

WaitForFightSansMusic:
JSL $808EF4 : BCS +
JSL $80834B
JMP $9F5E
+
RTS
%END_FREESPACE(8B)

org $8B9F5A : JMP FightSansInFileSelect

; room header edits
;org $8FE76A+4 ; clay homonculus, want rumia theme

org $8FD846+4 : db $0F,$05 ; mini penguin
org $8FBFD6+4 : db $0F,$05 ; penguinmire
org $8FDA19+4 : db $0F,$05 ; snowmen
;org $8FDE2F+4 : db $12,$04 ; immodest junko (outdated)

org $8FE274+4 : db $18,$05 ; ninja junko
org $8FE4C6+4 : db $03,$05 ; slasher sisters
;org $8FE332+4 ; long spine
;org $8FCF0F+4 ; obscene junko (outdated)

org $8FD8C5+4 : db $0C,$05 ; gargoyles
;org $8FDBF1+4 : db $15,$04 ; profane junko 1 (outdated)
;org $8FC888+4 : db $09,$04 ; statue room (outdated)

; penguinmire music
org $A490AA : LDA #$0004
org $A497DD : LDA #$0005
org $A49B86 : LDA #$0004
org $A49B9E : LDA #$0004

org $D892B7
check bankcross off
Song00: incbin "main.nspc"
Song03: incbin "TH7Boss5MMX2/TH7Boss5MMX2.nspc"
Song06:
Song09: db $00,$00
Song2A: incbin "TH7Boss3MMX3/TH7Boss3MMX3.nspc"
Song0F: incbin "TH7Boss1(MMX)/TH7Boss1(MMX).nspc"
Song4B: incbin "ut_another_medium_1_0/ut_another_medium_1_0.nspc"
Song54: incbin "Core/Core - Optimized.nspc"
Song5A: incbin "TH7Stage1(MMX)/TH7Stage1(MMX).nspc"
Song0C: incbin "TH7BossEX(MMX)/TH7BossEX(MMX).nspc"
Song1E:
Song21:
Song24:
Song27:
Song30:
Song33:
Song36:
Song3C:
Song3F:
Song42:
Song45:
Song48:
Song4E:
Song51:
Song57:
Song5D:
Song63:
Song6C:
Song6F:
Song72:
Song75:
Song78:
Song7B: incbin "hcq_megalo/hcq_megalo.nspc" ; always use it for final boss music, even if it doesn't fit
%padSafe($DFD500)
check bankcross full

org $E0C5E6
check bankcross off
Song12: incbin "TH6Boss2(MMX)/TH6Boss2(MMX).nspc"
Song15: incbin "TH8_Boss6_MMX/TH8_Boss6_MMX.nspc"
Song18: incbin "TH6Stage3_X1/TH6Stage3_X1.nspc"
Song1B: incbin "Undertale - Battle Against A True Hero (Remix)/Battle Against A True Hero.nspc"
Song2D: incbin "Fight Sans/song that might play when you fight sans.nspc"
Song39: incbin "45 Kirby Lose/45 Kirby Lose.nspc"
Song60: incbin "60/60.nspc"
Song69: incbin "TH10Boss5_X1/TH10Boss5_X1.nspc"
Song66: incbin "TH7Title(MMX)/TH7Title(MMX).nspc"
%padSafe($F48A00)
check bankcross full
