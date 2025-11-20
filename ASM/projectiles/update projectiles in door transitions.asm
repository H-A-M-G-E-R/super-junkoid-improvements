lorom

org $90AECE
LDX #$0012
-
LDA $0C40,x : BEQ +
STX $0DDE
JSR ($0C68,x)
JSL $9381E9
LDX $0DDE
+
DEX : DEX : BPL -
STZ $0DD2
RTS
HandleProjectlesLong:
PHB : PHK : PLB : JSR $AECE : PLB : RTL

org $82E1A4
JSL $A08EB6 ; Determine which enemies to process
JSL HandleProjectlesLong
JSL $A09785 ; Samus / projectile interaction handling
JSR Here

org $82E1CA
JSL $A08EB6
JSL HandleProjectlesLong
JSL $A09785
JSR Here

org $82E29F
JSL $A08EB6
JSL HandleProjectlesLong
JSL $A09785
JSR Here

org $82E2E0
JSL $A08EB6
JSL HandleProjectlesLong
JSL $A09785
JSR Here

org $82E675 ; unused code in vanilla
Here:
JSL $A08FD4 ; Main enemy routine
JSL $868104 ; Enemy projectile handler
JSL $A09894 ; Enemy projectile / Samus collision handling
;JSL $A0996C ; Enemy projectile / projectile handling
JSL $A0A306 ; Process enemy power bomb interaction
JSL $8485B4 ; PLM handler
JSL $878064 ; Animated tiles objects handler
JSL $A0884D ; Draw Samus, projectiles, enemies and enemy projectiles
JSL $A09726 ; Handle queuing enemy BG2 tilemap VRAM transfer
RTS