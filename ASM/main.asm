asar 1.91

lorom

incsrc "freespace.asm"

incsrc "ASM/bird door fix.asm"
incsrc "ASM/controller options scroll fix 1.1.asm"
incsrc "ASM/faster nintendo logo + spc echo improvements.asm"
incsrc "ASM/faster startup.asm"
incsrc "ASM/ice castle haze.asm"
incsrc "ASM/intro_skip.asm"
incsrc "ASM/item fanfare skip without sound.asm"
;incsrc "ASM/misc.asm"
incsrc "ASM/RNG.asm"
;incsrc "ASM/room header edits.asm"
incsrc "sprite_object_optimization.asm"
incsrc "ASM/transfer samus tiles optimization + animated tiles fix.asm"
incsrc "ASM/upload to apu space optimization.asm"
incsrc "ASM/water fix.asm"

; Player
incsrc "ASM/player/acid_immunity.asm"
incsrc "ASM/player/always draw atmospheric effects.asm"
incsrc "ASM/player/draw speedboost echo fix.asm"
;incsrc "ASM/player/fix y offsets.asm"
incsrc "player/footstep_type_ram_flag.asm"
;incsrc "ASM/player/ITEMWavedash.asm"
incsrc "ASM/player/no more morph bounce.asm" ; for real
;incsrc "ASM/player/remove appearance fanfare.asm"
incsrc "ASM/player/remove springball lock.asm"
;incsrc "ASM/player/sparksuit.asm"
incsrc "ASM/player/speed_booster_vertical_momentum_fix.asm" ; already did for normal jumps but not for walljumps
;incsrc "ASM/player/spinjump.asm"

incsrc "ASM/player/misc.asm"

; Enemy utils
incsrc "ASM/enemies/enemies unfreeze faster in heated rooms.asm"
incsrc "ASM/enemies/enemy drawing queue expansion.asm"
incsrc "ASM/enemies/enemy hit explosion.asm"
incsrc "ASM/enemies/enemy projectile-projectile collision.asm"
incsrc "ASM/enemies/enemy spritemaps.asm"
incsrc "ASM/enemies/enemy tile loading rewrite 1.03.asm"
incsrc "ASM/enemies/enemy touch ai rewrite.asm"
incsrc "ASM/enemies/oam_drawing.asm"

; Normal enemies
incsrc "ASM/enemies/ghosts face towards you.asm"
incsrc "ASM/enemies/fireflea touch ai fix.asm"
incsrc "ASM/enemies/ninja_junko.asm"
incsrc "ASM/enemies/shaktool.asm"
incsrc "ASM/enemies/slasher_sisters.asm"

; Bosses
incsrc "ASM/enemies/draygon.asm"
incsrc "ASM/enemies/kraid.asm"
incsrc "ASM/enemies/mb.asm"
incsrc "ASM/enemies/penguinmire.asm"
incsrc "ASM/enemies/ridley.asm"
incsrc "ASM/enemies/torizo.asm"

incsrc "ASM/enemies/misc.asm"

; Projectiles
incsrc "ASM/projectiles/beam.asm"
incsrc "ASM/projectiles/Charge flare optimization.asm"
incsrc "ASM/projectiles/update projectiles in door transitions.asm"

incsrc "ASM/projectiles/misc.asm"

; HUD
incsrc "ASM/hud/minimap.asm"
incsrc "ASM/hud/Room names.asm"
incsrc "ASM/hud/transparent hud kinda.asm"

; Pause screen
incsrc "ASM/pause_screen/Instant Unpause (SRAM Expansion).asm"
incsrc "ASM/pause_screen/map icons.asm"
incsrc "ASM/pause_screen/map unpause layer fix.asm"
incsrc "ASM/pause_screen/unpause sound fix.asm"

; Freespace stuff
incsrc "ASM/player/moonwalk_fixes.asm"

if defined("spritesomething")
    incsrc "ASM/player/restore vanilla space jump animation.asm"
else
    ; TODO check
    incsrc "ASM/player/Advanced Arm Cannon Palette - BASIC.asm"
endif

; temp
; Another Medium and CORE (from undertale) by Toby Fox, arranged by MetroidNerd#9001
; Gargoyle and Twin Vulcan from Thunder Force III/Thunder Spirits, ported by me
!p_songTable = read3($808F73)
check bankcross off
org read3(!p_songTable+$4B) : incbin "music/Another_Medium.nspc"
org read3(!p_songTable+$54) : incbin "music/CORE.nspc"
org read3(!p_songTable+$2A) : incbin "music/gargoyle_vanilla.nspc"
org read3(!p_songTable+$6C) : incbin "music/twin_vulcan_vanilla.nspc"
org read3(!p_songTable+$72) : incbin "music/be_menaced_by_orn_vanilla.nspc"
org read3(!p_songTable+$75) : incbin "music/hbiuwd_vanilla.nspc"
; $78 is credits song

; Profane Junko's "roar" is Gawr Gura's "a"
; overwrite empty crateria music
org read3(!p_songTable+$06) : incbin "music/gura.nspc"

org read3(!p_songTable+$0F) : incbin "music/g_lobster_vanilla_fireinthehole.nspc"
check bankcross full

org $8FDE2F+4 : db $0F,$04 ; room header edit (immodest junko)

org $8BDE33 : BRA + : org $8BDE41 : + ; for some reason loading this song crashes possibly because i replaced other music

org $A9F29A : LDA #$0000 ; no crashy when shitroid stops draining you

; wip
;if defined("music")
;    incsrc "ASM/music/music.asm"
;endif
