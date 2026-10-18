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
SongPointers:
dl Song03, ; (used in game over screen but uses song 4)
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
   Song6C, ; (greater junko)
   Song6F, ; (pre-snake)
   Song72, ; (the new mother brain music)
   Song75, ; (escape)
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
org $8FE736+4 : db $06,$04 ; clay homonculus
org $8FE76A+4 : db $06,$04 ; clay homonculus (black dress)

org $8FD846+4 : db $0F,$05 ; mini penguin
org $8FBFD6+4 : db $0F,$05 ; penguinmire
org $8FD9FF+4 : db $0F,$05 ; snowmen
org $8FDA19+4 : db $0F,$05
org $8FDA64+4 : db $12,$04 ; immodest junko
org $8FDA7E+4 : db $12,$04

org $8FE25A+4 : db $18,$05 ; ninja junko
org $8FE274+4 : db $18,$05
org $8FE4AC+4 : db $03,$05 ; slasher sisters
org $8FE4C6+4 : db $03,$05
org $8FE318+4 : db $21,$05 ; long spine
org $8FE332+4 : db $21,$05
org $8FE3E2+4 : db $1B,$05 ; obscene junko
org $8FE3FC+4 : db $1B,$05
org $8FE416+4 : db $00,$04

org $8FED8D+4 : db $27,$04 ; defiled junko
org $8FEDA7+4 : db $27,$04

org $8FD8AB+4 : db $0C,$05 ; gargoyles
org $8FD8C5+4 : db $0C,$05
org $8F9214+4 : db $24,$04 ; gold homonculus
org $8F922E+4 : db $24,$04
org $8FEC3C+4 : db $15,$04 ; profane junko 1
org $8FEC56+4 : db $15,$04
org $8FEC70+4 : db $15,$04
;org $8FC888+4 : db $09,$04 ; statue room (outdated)

org $8FCAFE+4 : db $15,$04 ; profane junko 2
org $8FCB18+4 : db $00,$04

; penguinmire music
org $A490AA : LDA #$0004
org $A497DD : LDA #$0005
org $A49B86 : LDA #$0004
org $A49B9E : LDA #$0004

org $A49508 : BRA + : org $A4950F : + ; crocomire doesn't play kraid's roar to not play a mess

; fire in the hole
org $A7AF95 : LDA #$002D

; profane junko roar sfx
org $A6E4BE : LDA #$0059

org $A9CC65 : LDA #$FF30 ; mother brain samus theme

org $D892B7
check bankcross off
Song00: incbin "main.nspc"
Song03: incbin "TH7Boss5MMX2/TH7Boss5MMX2.nspc"
Song06: incbin "hooded_edge/Osana-Reimu/Soul Engulfed by Darkness [1 = Original - Listening-Only].nspc"
Song0C: incbin "TH7BossEX(MMX)/TH7BossEX(MMX).nspc"
Song0F: incbin "TH7Boss1(MMX)/TH7Boss1(MMX).nspc"
Song12: incbin "TH6Boss2(MMX)/TH6Boss2(MMX).nspc"
Song15: incbin "hooded_edge/WAWEE-IS-NEET/Fight Back Against The Moon! [1 = Original] [2 = SMW-Compatible].nspc"
Song18: incbin "hooded_edge/KNUCKLES-BUT-CHINESE/Battle Spirit Of The Devil's Guardian [1 = Remix - Listening-Only] [2 = Voice Disabled].nspc"
Song09:
Song33:
Song36:
Song3C:
Song3F:
Song42:
Song45:
Song48:
Song4E:
Song57:
Song5D:
Song6C:
Song6F:
Song78:
Song7B: incbin "hcq_megalo/hcq_megalo.nspc"
%padSafe($DFD500)
check bankcross full

org $E0C5E6
check bankcross off
Song1B: incbin "Undertale - Battle Against A True Hero (Remix)/Battle Against A True Hero.nspc"
Song1E: incbin "tourian/1E.nspc"
Song21: incbin "hooded_edge/UNO-Reverse-Card/Impossible Youkai Girl, The.nspc"
Song24: incbin "TH7Boss2MMX2/TH7Boss2MMX2.nspc"
Song27: incbin "hooded_edge/PRISMPUNK-SISTERS/Sliver of Punk in the Ghost Harmony, A [1 = Remix] [2 = Voice Disabled].nspc"
Song2A: incbin "TH7Boss3MMX3/TH7Boss3MMX3.nspc"
Song2D: incbin "Fight Sans/song that might play when you fight sans.nspc"
Song30: incbin "hooded_edge/YARE-YARE-DA-ZE/[LCMS] Move And I'll Shoot!! [1 = Original].nspc"
Song39: incbin "45 Kirby Lose/45 Kirby Lose.nspc"
Song4B: incbin "anothertale/anothertale.nspc"
Song51: incbin "hooded_edge/NGL-HISTORY-SUX/Nightmares Of The Past [1 = Remix - Listening-Only] [2 = Voice Disabled].nspc"
Song54: incbin "Core/Core - Optimized.nspc"
Song5A: incbin "TH7Stage1(MMX)/TH7Stage1(MMX).nspc"
Song60: incbin "60/60.nspc"
Song63: incbin "hooded_edge/MUKYU/Danza de la Mente [2 = LOWER Volume] [1 = Remix].nspc"
Song66: incbin "TH7Title(MMX)/TH7Title(MMX).nspc"
Song69: incbin "hooded_edge/AYAYAYAYAYAYAYAYA/Cheating Tengu, The [1 = Original].nspc"
Song72: incbin "megalovania/badtime.nspc" ; always use it for final boss music, even if it doesn't fit
Song75: incbin "hooded_edge/YOU-MUST-BE-NUE-HERE/Search, Kill, & Destroy!!! [1 = Remix] [2 = Voice Disabled].nspc"

%padSafe($F48A00)
check bankcross full

%BEGIN_FREESPACE(81)
SampleTransferDefPointers: ; can't cross banks
dl 0, ; 03 (used in game over screen but uses song 4)
   0, ; 06
   0, ; 09 statue room
   0, ; 0C
   0, ; 0F
   0, ; 12
   0, ; 15
   0, ; 18
   0, ; 1B
   0, ; 1E tourian (alive idol)
   0, ; 21
   0, ; 24
   0, ; 27 (penguinmire)
   0, ; 2A (miniboss)
   0, ; 2D
   0, ; 30
   0, ; 33 zebes boom (used)
   0, ; 36
   0, ; 39 death
   0, ; 3C credits (edited to only use the intro)
   0, ; 3F
   0, ; 42
   0, ; 45
   0, ; 48
   0, ; 4B (upper outskirts)
   0, ; 4E (lower outskirts)
   0, ; 51 (blood bethel)
   0, ; 54 (upper deep purple)
   0, ; 57 (lower Sheol)
   0, ; 5A (ice castle)
   0, ; 5D (dead idol)
   0, ; 60 (lower deep purple)
   0, ; 63 (upper Sheol)
   0, ; 66 (title screen)
   0, ; 69 (touhou area)
   0, ; 6C
   0, ; 6F (pre-snake)
   0, ; 72 (the new mother brain music)
   0, ; 75 (escape)
   0, ; 78 (credits 2)
   0  ; 7B that song from alttp (used in one true junko room)
%END_FREESPACE(81)
