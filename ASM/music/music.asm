lorom

org $DA97E4
dl Song00, ; SPC engine
   Song03,
   Song06, ; Empty Crateria (pre-Snake)
   Song09, ; Boss (Titania) (blood bethel bosses)
   Song0C,
   Song0F, ; Boss (Macbeth) (vs. false idol heart)
   Song12, ; Boss (Venom Base Short) (vs. gargoyles/mochtroids)
   Song15,
   Song18, ; Game Clear Demonstration (escape)
   Song1B, ; Briefing (intro text)
   Song1E, ; Macbeth (alive idol)
   Song21, ; Vs. Andross (from Star Fox 2) (vs. snake)
   Song24, ; Vs. Mirage Dragon (from Star Fox 2) (vs. Ridley)
   Song27, ; Boss (Space Armada) + Entering Dangerous Territory (vs. Phantoon and statue room)
   Song2A, ; Boss (Meteor) (vs. Gold Torizo)
   Song2D, ; Player Down (Band) (death)
   Song30, ; Player Down (Orchestra) (death)
   Song33, ; Zebes boom (used in Super Junkoid)
   Song36, ; Game Over (Star Fox)
   Song39, ; Player Down (Space) (from Star Fox 2)
   Song3C, ; Main Theme (ending)
   Song3F,
   Song42,
   Song45, ; Surprise Attack (from Star Fox 2) (vs. Super Junkoid)
   Song48,
   Song4B, ; Corneria (upper outskirts)
   Song4E, ; Meteor (lower outskirts) + Boss (Corneria) (vs. Bomb Torizo)
   Song51, ; Titania (blood bethel)
   Song54, ; Venom Base (Level 1 & 3) (upper deep purple)
   Song57, ; Sector Y (lower Sheol)
   Song5A, ; Fortuna (ice castle) + Boss (Fortuna) (ice castle bosses)
   Song5D, ; Infected Satellite (from Star Fox 2) (dead idol)
   Song60, ; Venom Base (Level 2) (lower deep purple) + Boss (Asteroid) (vs. shaktool)
   Song63, ; Astropolis (from Star Fox 2) (upper Sheol)
   Song66  ; Title Demonstration (title screen)

org $80845D : dl Song00 ; repoint SPC engine

org $8BA713 : LDA #$FF1B ; intro music

org $A7EB8C : BRA $00 : LDA #$0032 ; etecoon walljump sound (skip [Samus X position] >= 100h check)
org $A7EA2D : BRA $00 ; another one
org $A7EE34 : BRA $00
org $A7EE8A : BRA $00

org $8FB7B4 : db $4E,$04 ; bomb torizo music
org $AAB096 : dw $0006,$0006,$0003

org $8F9FF5 : db $09,$05 ; botwoon
org $8F9DC5 : db $09,$05 ; draygon

org $8FA779 : db $5A,$06 ; snowman
org $8FA661 : db $5A,$06 ; penguinmire
org $A490AA : LDA #$0004
org $A49B86 : LDA #$0004
org $A49B9E : LDA #$0004
org $A497DD : LDA #$0006
org $8FA5D5 : db $5A,$06 ; two barf penguins guarding dreamer's crown
org $8FA3EB : db $5A,$06 ; barf penguin guarding rat dasher
org $8FA503 : db $5A,$05 ; barf kraid
org $A7C8AF : LDA #$0006

org $8FA28D : db $2A,$03 ; golden torizo

org $8FA7BF : db $60,$06 ; shaktool

org $8FA891 : db $24,$00 ; ridley

org $8F805F : db $00,$80 ; replace all instances of tourian silence with normal silence because it's overwritten by macbeth
org $8F8C41 : db $00,$80
org $8F8EFF : db $00,$80

org $8FABB3 : db $27,$06 ; statue room

org $8F9FAF : db $45,$04 ; super junkoid tension

org $8F9D7F : db $0F,$05 ; idol heart

org $8F9F23 : db $12,$05 ; gargoyles
org $8FA05D : db $12,$05 ; mochtroids

org $A9CC20 ; Remove Samus theme after getting Hyper Beam
NOP #4
org $A9CC68
NOP #4
org $A9CC6F
NOP #4

org $A9B1FE : LDA #$FF18 ; escape
org $A9B282 : LDA #$0005
org $8FB43B : db $18,$05
org $8FB4B0 : db $18,$05

org $8191BF : LDA #$FF36 ; game over music
org $8193F3 : LDA #$0005
org $82BB75 : RTL ; no more game over baby metroid
GetDeathMusic:
LDX $07F3 : LDA.l DeathSongTable : JSL $808FC1 : RTL
DeathSongTable:
dl $00FF30, ; 00
   $00FF30, ; 03
   $00FF30, ; 06
   $00FF2D, ; 09
   $00FF2D, ; 0C
   $00FF2D, ; 0F
   $00FF30, ; 12
   $00FF30, ; 15
   $00FF30, ; 18
   $00FF30, ; 1B
   $00FF2D, ; 1E
   $00FF39, ; 21
   $00FF39, ; 24
   $00FF30, ; 27
   $00FF2D, ; 2A
   $00FF2D, ; 2D
   $00FF30, ; 30
   $00FF30, ; 33
   $00FF30, ; 36
   $00FF39, ; 39
   $00FF30, ; 3C
   $00FF39, ; 3F
   $00FF39, ; 42
   $00FF39, ; 45
   $00FF2D, ; 48
   $00FF2D, ; 4B
   $00FF2D, ; 4E
   $00FF2D, ; 51
   $00FF30, ; 54
   $00FF30, ; 57
   $00FF2D, ; 5A
   $00FF39, ; 5D
   $00FF30, ; 60
   $00FF39, ; 63
   $00FF30 ; 66
org $82DD61 : JSL GetDeathMusic

check bankcross off
org $C3EBF5
Song00: incbin "trimmed spc engine for super junkoid.nspc"
Song03:
Song06: incbin "06.bin"
Song09: incbin "Boss (Titania) (Spospo and Botwoon-compatible).nspc"
Song0C:
Song0F: incbin "Boss (Macbeth) with spospo.nspc"
Song12: incbin "Boss (Venom Base 2) with lava and metroid sounds.nspc"
Song15:
Song18: incbin "Game Clear Demonstration + Ending.nspc"
Song1B: incbin "Briefing.nspc"
Song1E: incbin "Macbeth with lava sounds.nspc"
Song21: incbin "Andross (Star Fox 2).nspc"
Song24: incbin "taiman ridley.nspc"
Song27: incbin "Boss (Space Armada) + Entering Dangerous Territory with bleh phantoon.nspc"
Song2A: incbin "Boss (Meteor).nspc"
Song2D: incbin "Player Down (Band) (No Delay).nspc"
Song30: incbin "Player Down (Orchestra) (No Delay).nspc"
Song33: incbin "33.bin"
Song36: incbin "Game Over (Star Fox).nspc"
Song39: incbin "Player Down 3 (No Delay).nspc"
Song3C: incbin "Main Theme (Star Fox).nspc"
Song3F:
Song42:
Song45: incbin "Surprise Attack.nspc"
Song48:
Song4B: incbin "Corneria.nspc"
Song4E: incbin "110 Meteor + 120a Boss (Corneria) (Short Intro) with etecoons and metroids.nspc"
Song51: incbin "Titania.nspc"
Song54: incbin "Venom Base (Level 1 & 3) with lava and mochtroid sounds.nspc"
Song57: incbin "Sector Y.nspc"
Song5A: incbin "112 Fortuna + 121 Boss (Fortuna) barf crocomire.nspc"
Song5D: incbin "Infected Satellite.nspc"
Song60: incbin "116 Venom Base (Level 2) + 124 Boss (Asteroid).nspc"
Song63: incbin "Astropolis.nspc"
Song66: incbin "Title Demonstration with baby metroid sounds.nspc"