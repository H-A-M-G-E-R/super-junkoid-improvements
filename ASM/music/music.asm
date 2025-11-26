lorom
; wip
org $BAA171
dl Song00, ; SPC engine
   Song03,
   Song06,
   Song09,
   Song0C,
   Song0F,
   Song12,
   Song15,
   Song18,
   Song1B,
   Song1E,
   Song21,
   Song24,
   Song27,
   Song2A,
   Song2D,
   Song30,
   Song33,
   Song36,
   Song39,
   Song3C,
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
   Song66

org $80845D : dl Song00 ; repoint SPC engine

org $A7EB8C : BRA $00 : LDA #$0032 ; etecoon walljump sound (skip [Samus X position] >= 100h check)
org $A7EA2D : BRA $00 ; another one
org $A7EE34 : BRA $00
org $A7EE8A : BRA $00

org $8191BF : LDA #$FF36 ; game over music
org $8193F3 : LDA #$0005
org $82BB75 : RTL ; no more game over baby metroid

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