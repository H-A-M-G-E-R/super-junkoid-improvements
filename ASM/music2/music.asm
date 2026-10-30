lorom
incsrc "defines.asm"
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
org $8FD860+4 : db $0F,$05
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
Song1B: incbin "Undertale - Battle Against A True Hero (Remix)/Battle Against A True Hero.nspc"
Song1E: incbin "tourian/1E.nspc"
Song21: incbin "hooded_edge/UNO-Reverse-Card/Impossible Youkai Girl, The.nspc"
Song24: incbin "TH7Boss2MMX2/TH7Boss2MMX2.nspc"
Song27: incbin "hooded_edge/PRISMPUNK-SISTERS/Sliver of Punk in the Ghost Harmony, A [1 = Remix] [2 = Voice Disabled].nspc"
Song09:
Song3C:
Song3F:
Song42:
Song45:
Song48:
Song4E:
Song57:
Song6C:
Song6F:
Song78:
Song7B: incbin "hcq_megalo/hcq_megalo.nspc"
%padSafe($DFD500)
check bankcross full

org $E0C5E6
check bankcross off
Song2A: incbin "TH7Boss3MMX3/TH7Boss3MMX3.nspc"
Song2D: incbin "Fight Sans/song that might play when you fight sans.nspc"
Song30: incbin "hooded_edge/YARE-YARE-DA-ZE/[LCMS] Move And I'll Shoot!! [1 = Original].nspc"
Song33: incbin "H A M/H A M.nspc"
Song36: incbin "hooded_edge/RightRoundHina/Roulette of Misery [1 = Remix].nspc"
Song39: incbin "45 Kirby Lose/45 Kirby Lose.nspc"
Song4B: incbin "anothertale/anothertale.nspc"
Song51: incbin "hooded_edge/NGL-HISTORY-SUX/Nightmares Of The Past [1 = Remix - Listening-Only] [2 = Voice Disabled].nspc"
Song54: incbin "Core/Core - Optimized.nspc"
Song5A: incbin "TH7Stage1(MMX)/TH7Stage1(MMX).nspc"
Song5D: incbin "hooded_edge/GAP-HAG/Lovestruck Kiss Of Phantasm [1 = Remix].nspc"
Song60: incbin "60/60.nspc"
Song63: incbin "hooded_edge/MUKYU/Danza de la Mente [2 = LOWER Volume] [1 = Remix].nspc"
Song66: incbin "TH7Title(MMX)/TH7Title(MMX).nspc"
Song69: incbin "hooded_edge/AYAYAYAYAYAYAYAYA/Cheating Tengu, The [1 = Original].nspc"
Song72: incbin "megalovania/badtime.nspc" ; always use it for final boss music, even if it doesn't fit
Song75: incbin "hooded_edge/YOU-MUST-BE-NUE-HERE/Search, Kill, & Destroy!!! [1 = Remix] [2 = Voice Disabled].nspc"

macro importHeaderedBrr(path)
   dw filesize("<path>")-2 : incbin "<path>":2..0
endmacro

SampleDefaultSMW00: %importHeaderedBrr("default/00 SMW @0.brr")
SampleDefaultSMW01: %importHeaderedBrr("default/01 SMW @1.brr")
SampleDefaultSMW02: %importHeaderedBrr("default/02 SMW @2.brr")
SampleDefaultSMW04: %importHeaderedBrr("default/04 SMW @4.brr")
SampleDefaultSMW06: %importHeaderedBrr("default/06 SMW @22.brr")
SampleDefaultSMW08: %importHeaderedBrr("default/08 SMW @6.brr")
SampleDefaultSMW0C: %importHeaderedBrr("default/0C SMW @13.brr")

SampleBDH1SawWave: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/BDH1 Saw Wave.brr")
SampleCoolStringEns: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/Cool String Ens.brr")
SampleDR880Kick: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/DR-880 Kick.brr")
SampleMM7HiHat1: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/MM7 Hi-Hat 1.brr")
SampleMM7Sawtooth: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/MM7 Sawtooth.brr")
SampleR8CrashCym: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/R-8 Crash Cym.brr")
SampleRS1Oboe: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/RS1 Oboe.brr")
SampleS2SynthBrass: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/S2 Synth Brass.brr")
SampleS3SlapBassII: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/S3 Slap Bass II.brr")
SampleSomeOrgans: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/Some Organs.brr")
SampleTopPiano: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/Top Piano.brr")
SampleXGSawtooth: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/XG Sawtooth.brr")
SampleYasuiSnare: %importHeaderedBrr("hooded_edge/AYAYAYAYAYAYAYAYA/Yasui Snare.brr")

Sample02SMW2Plus3: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/02 SMW @2+3.brr")
SampleAquariusLead: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/Aquarius Lead.brr")
SampleDKNI4SynthBrass: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/DKNI4 Synth Brass.brr")
SampleDR660Kick: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/DR-660 Kick.brr")
SampleEBElecPiano: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/EB Elec Piano.brr")
SampleR8Tom2: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/R-8 Tom 2.brr")
SampleSawtoothX: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/Sawtooth X.brr")
SampleSOIFatPunchAltSmall: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/SOI Fat Punch Alt (Small).brr")
SampleSOIFMElecPiano2: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/SOI FM Elec Piano 2.brr")
SampleSOILoudLead: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/SOI Loud Lead.brr")
SampleSOIPianoMed2: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/SOI Piano Med 2.brr")
SampleSOIPulse50O4High: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/SOI Pulse 50% O4 High.brr")
SampleXR10Clap: %importHeaderedBrr("hooded_edge/KNUCKLES-BUT-CHINESE/XR-10 Clap.brr")

SampleChipVoice9VL: %importHeaderedBrr("hooded_edge/NGL-HISTORY-SUX/Chip Voice 9 VL.brr")
SampleDNBBassDrum: %importHeaderedBrr("hooded_edge/NGL-HISTORY-SUX/DNB Bass Drum.brr")
SampleKenPulseWave: %importHeaderedBrr("hooded_edge/NGL-HISTORY-SUX/Ken Pulse Wave.brr")
SampleKirbClarinet: %importHeaderedBrr("hooded_edge/NGL-HISTORY-SUX/Kirb Clarinet.brr")
SampleMM7Pulse50: %importHeaderedBrr("hooded_edge/NGL-HISTORY-SUX/MM7 Pulse 50%.brr")
SampleRudraSawtooth: %importHeaderedBrr("hooded_edge/NGL-HISTORY-SUX/Rudra Sawtooth.brr")
SampleS550LATom: %importHeaderedBrr("hooded_edge/NGL-HISTORY-SUX/S-550 LA Tom.brr")
SampleScarletPiano3p: %importHeaderedBrr("hooded_edge/NGL-HISTORY-SUX/Scarlet Piano 3+.brr")
SampleTR909HiHat: %importHeaderedBrr("hooded_edge/NGL-HISTORY-SUX/TR-909 Hi-Hat.brr")
SampleWindStringEns: %importHeaderedBrr("hooded_edge/NGL-HISTORY-SUX/Wind String Ens.brr")

SampleUltimaHiHat: %importHeaderedBrr("hooded_edge/Osana-Reimu/Ultima Hi-Hat.brr")
SampleChronoPulseWidthMod: %importHeaderedBrr("hooded_edge/Osana-Reimu/Chrono Pulse-Width Mod.brr")
SampleJV1080Square: %importHeaderedBrr("hooded_edge/Osana-Reimu/JV1080 Square.brr")
SampleMM7Pulse1875: %importHeaderedBrr("hooded_edge/Osana-Reimu/MM7 Pulse 18.75%.brr")
SampleShinobiFMSynthBass: %importHeaderedBrr("hooded_edge/Osana-Reimu/Shinobi FM Synth Bass.brr")

SampleMMX1StringEns: %importHeaderedBrr("hooded_edge/PRISMPUNK-SISTERS/MMX1 String Ens.brr")
SampleMMX1TechnologyNoise: %importHeaderedBrr("hooded_edge/PRISMPUNK-SISTERS/MMX1 Technology Noise.brr")
SamplePopfulMailOverdrive: %importHeaderedBrr("hooded_edge/PRISMPUNK-SISTERS/PM Overdrive.brr")
SampleSOIHardSync1AltSmall: %importHeaderedBrr("hooded_edge/PRISMPUNK-SISTERS/SOI HardSync 1 Alt (Small).brr")
SampleSOISpicyGuitar: %importHeaderedBrr("hooded_edge/PRISMPUNK-SISTERS/SOI Spicy Guitar.brr")
SampleSOMElecPiano: %importHeaderedBrr("hooded_edge/PRISMPUNK-SISTERS/SOM Elec Piano.brr")
SampleVCR7NylonGuitarLow: %importHeaderedBrr("hooded_edge/PRISMPUNK-SISTERS/VCR7 Nylon Guitar (Low).brr")

SampleKDL3Trumpet: %importHeaderedBrr("hooded_edge/UNO-Reverse-Card/KDL3 Trumpet.brr")
SamplePlokOverdrive: %importHeaderedBrr("hooded_edge/UNO-Reverse-Card/Plok Overdrive.brr")
SampleS3Bell: %importHeaderedBrr("hooded_edge/UNO-Reverse-Card/S3 Bell.brr")
SampleSukuDistGuitar: %importHeaderedBrr("hooded_edge/UNO-Reverse-Card/Suku Dist Guitar.brr")

SampleSOIPulse25O4High: %importHeaderedBrr("hooded_edge/WAWEE-IS-NEET/SOI Pulse 25% O4 High.brr")

Sample08SMW6C: %importHeaderedBrr("hooded_edge/GAP-HAG/08 SMW @6C.brr")
SampleKenTrumpet: %importHeaderedBrr("hooded_edge/GAP-HAG/Ken Trumpet.brr")
SampleMM7ElecPiano: %importHeaderedBrr("hooded_edge/GAP-HAG/MM7 Elec Piano.brr")
SampleSoiPianoHigh: %importHeaderedBrr("hooded_edge/GAP-HAG/Soi Piano High.brr")

%padSafe($F28000)
check bankcross full

%BEGIN_FREESPACE(81)
SampleTransferDefPointers: ; can't cross banks
dl 0, ; 03 (used in game over screen but uses song 4)
   SampleTransferDef_Rumia, ; 06
   0, ; 09 statue room
   0, ; 0C
   0, ; 0F
   0, ; 12
   SampleTransferDef_Kaguya, ; 15
   SampleTransferDef_Meiling, ; 18
   0, ; 1B
   0, ; 1E tourian (alive idol)
   SampleTransferDef_Seija, ; 21
   0, ; 24
   SampleTransferDef_PrismriverSisters, ; 27 (penguinmire)
   0, ; 2A (miniboss)
   0, ; 2D
   SampleTransferDef_Marisa, ; 30
   0, ; 33 zebes boom (used)
   SampleTransferDef_Hina, ; 36
   0, ; 39 death
   0, ; 3C credits (edited to only use the intro)
   0, ; 3F
   0, ; 42
   0, ; 45
   0, ; 48
   0, ; 4B (upper outskirts)
   0, ; 4E (lower outskirts)
   SampleTransferDef_KeineStage, ; 51 (blood bethel)
   0, ; 54 (upper deep purple)
   0, ; 57 (lower Sheol)
   0, ; 5A (ice castle)
   SampleTransferDef_Yukari, ; 5D (dead idol)
   0, ; 60 (lower deep purple)
   0, ; 63 (upper Sheol)
   0, ; 66 (title screen)
   SampleTransferDef_Aya, ; 69 (touhou area)
   0, ; 6C (greater junko)
   0, ; 6F (pre-snake)
   0, ; 72 (the new mother brain music)
   SampleTransferDef_Nue, ; 75 (escape)
   0, ; 78 (credits 2)
   0  ; 7B that song from alttp (used in one true junko room)

SampleTransferDef_Aya:
{
   dw !p_songSpecificData
   dl SampleMM7Sawtooth
   dl SampleXGSawtooth
   dl SampleS2SynthBrass
   dl SampleSomeOrgans
   dl SampleTopPiano
   dl SampleRS1Oboe
   dl SampleBDH1SawWave
   dl SampleCoolStringEns
   dl SampleS3SlapBassII
   dl SampleYasuiSnare
   dl SampleDR880Kick
   dl SampleMM7HiHat1
   dl SampleR8CrashCym
   dw 0
}

SampleTransferDef_Meiling:
{
   dw !p_songSpecificData
   dl SampleDefaultSMW01
   dl SampleDefaultSMW0C
   dl SampleSOIFatPunchAltSmall
   dl SampleSOIFMElecPiano2
   dl SampleDKNI4SynthBrass
   dl SampleSOILoudLead
   dl SampleSOIPulse50O4High
   dl SampleSOIPianoMed2
   dl Sample02SMW2Plus3
   dl SampleAquariusLead
   dl SampleSawtoothX
   dl SampleEBElecPiano
   dl SampleS3SlapBassII
   dl SampleYasuiSnare
   dl SampleDR660Kick
   dl SampleXR10Clap
   dl SampleR8Tom2
   dl SampleMM7HiHat1
   dl SampleR8CrashCym
   dw 0
}

SampleTransferDef_KeineStage:
{
   dw !p_songSpecificData
   dl SampleScarletPiano3p
   dl SampleRS1Oboe
   dl SampleKenPulseWave
   dl SampleRudraSawtooth
   dl SampleMM7Pulse50
   dl SampleKirbClarinet
   dl SampleWindStringEns
   dl SampleEBElecPiano
   dl SampleS3SlapBassII
   dl SampleYasuiSnare
   dl SampleDNBBassDrum
   dl SampleS550LATom
   dl SampleTR909HiHat
   dl SampleR8CrashCym
   dw 0
}

SampleTransferDef_Rumia:
{
   dw !p_songSpecificData
   dl SampleChronoPulseWidthMod
   dl Sample02SMW2Plus3
   dl SampleJV1080Square
   dl SampleMM7Pulse1875
   dl SampleMM7Sawtooth
   dl SampleBDH1SawWave
   dl SampleCoolStringEns
   dl SampleShinobiFMSynthBass
   dl SampleYasuiSnare
   dl SampleDR660Kick
   dl SampleR8Tom2
   dl SampleUltimaHiHat
   dl SampleR8CrashCym
   dw 0
}

SampleTransferDef_PrismriverSisters:
{
   dw !p_songSpecificData
   dl SampleDefaultSMW00
   dl SampleDefaultSMW08
   dl SampleSOMElecPiano
   dl SamplePopfulMailOverdrive
   dl SampleDKNI4SynthBrass
   dl SampleSOIHardSync1AltSmall
   dl SampleMM7Sawtooth
   dl SampleSOISpicyGuitar
   dl SampleAquariusLead
   dl SampleMM7Pulse50
   dl SampleMMX1StringEns
   dl SampleChronoPulseWidthMod
   dl SampleVCR7NylonGuitarLow
   dl SampleS3SlapBassII
   dl SampleYasuiSnare
   dl SampleDR660Kick
   dl SampleS550LATom
   dl SampleTR909HiHat
   dl SampleR8CrashCym
   dl SampleMMX1TechnologyNoise
   dw 0
}

SampleTransferDef_Seija:
{
   dw !p_songSpecificData
   dl SamplePlokOverdrive
   dl SampleS2SynthBrass
   dl SampleXGSawtooth
   dl SampleKDL3Trumpet
   dl SampleSukuDistGuitar
   dl SampleS3Bell
   dl SampleMMX1StringEns
   dl SampleS3SlapBassII
   dl SampleYasuiSnare
   dl SampleDR880Kick
   dl SampleUltimaHiHat
   dl SampleR8CrashCym
   dw 0
}

SampleTransferDef_Kaguya:
{
   dw !p_songSpecificData
   dl SampleDefaultSMW0C
   dl SampleXGSawtooth
   dl SampleDKNI4SynthBrass
   dl SampleSOIPulse25O4High
   dl SampleWindStringEns
   dl SampleS3SlapBassII
   dl SampleYasuiSnare
   dl SampleDR880Kick
   dl SampleTR909HiHat
   dl SampleR8CrashCym
   dw 0
}

SampleTransferDef_Marisa:
{
   dw !p_songSpecificData
   dl SampleKDL3Trumpet
   dl SamplePopfulMailOverdrive
   dl SampleSOIFMElecPiano2
   dl SampleSOIPulse50O4High
   dl SampleSOIPulse25O4High
   dl SampleMM7Sawtooth
   dl SampleYasuiSnare
   dl SampleDR880Kick
   dl SampleTR909HiHat
   dl SampleR8CrashCym
   dw 0
}

SampleTransferDef_Nue:
{
   dw !p_songSpecificData
   dl SampleDefaultSMW00
   dl SampleDefaultSMW0C
   dl Sample08SMW6C
   dl SampleS3Bell
   dl SampleS2SynthBrass
   dl SampleChronoPulseWidthMod
   dl SampleMM7Pulse50
   dl SampleWindStringEns
   dl SampleS3SlapBassII
   dl SampleYasuiSnare
   dl SampleDR880Kick
   dl SampleR8Tom2
   dl SampleTR909HiHat
   dl SampleR8CrashCym
   dw 0
}

SampleTransferDef_Hina:
{
   dw !p_songSpecificData
   dl SampleDefaultSMW04
   dl SampleTopPiano
   dl SampleRudraSawtooth
   dl SampleMM7Pulse1875
   dl SampleCoolStringEns
   dl SampleS3SlapBassII
   dl SampleYasuiSnare
   dl SampleDR660Kick
   dl SampleR8Tom2
   dl SampleUltimaHiHat
   dl SampleR8CrashCym
   dw 0
}

SampleTransferDef_Yukari:
{
   dw !p_songSpecificData
   dl SampleDefaultSMW02
   dl SampleDefaultSMW08
   dl SampleDefaultSMW0C
   dl SampleChronoPulseWidthMod
   dl SampleMM7ElecPiano
   dl SampleSoiPianoHigh
   dl SamplePopfulMailOverdrive
   dl SampleMM7Pulse50
   dl Sample08SMW6C
   dl SampleKenTrumpet
   dl SampleMMX1StringEns
   dl SampleS3SlapBassII
   dl SampleYasuiSnare
   dl SampleDR880Kick
   dl SampleS550LATom
   dl SampleTR909HiHat
   dl SampleR8CrashCym
   dw 0
}

%END_FREESPACE(81)
