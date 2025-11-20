; Atmospheric effects are always drawn, and speedbooster echoes are visible while Samus uses the grapple beam.
lorom

org $90EB3B : JSR DrawSamusSprites

org $90EB55 ; rewrite function to free up space
DrawSamusNoChargeGrappleBeam:
{
LDA $0AAC : AND #$000F : BEQ .NoArmCannon ; If [arm cannon drawing mode] = 0: go to NoArmCannon
DEC : BNE .ArmCannonUnderSamus ; If [arm cannon drawing mode] != 1: go to ArmCannonUnderSamus
.ArmCannonOverSamus
JSR $C663 ; Draw arm cannon
.NoArmCannon
JSR $85E2 ; Draw Samus
-
JSR $87BD ; Draw Samus echoes
RTS
.ArmCannonUnderSamus
JSR $85E2 ; Draw Samus
JSR $C663 ; Draw arm cannon
BRA -
}
DrawSamusSprites:
{
JSR $C5C4 ; Handle arm cannon open state
JSR $8A4C ; Handle atmospheric effects
JMP ($0A5C) ; Go to [Samus drawing handler]
}
org $90EBA3
DrawSamusWithGrappleBeam:
{
LDA $0AAC : AND #$000F : BEQ .NoArmCannon ; If [arm cannon drawing mode] = 0: go to NoArmCannon
DEC : BNE .ArmCannonUnderSamus ; If [arm cannon drawing mode] != 1: go to ArmCannonUnderSamus
.ArmCannonOverSamus
JSR $C663 ; Draw arm cannon
.NoArmCannon
JSR $85E2 ; Draw Samus
-
JSR $87BD ; Draw Samus echoes
JSL $9BBFA5 ; Update grapple beam tiles and increment flare counter
LDA $0CFE : BEQ + ; If [grapple beam length] != 0:
JSL $94AFBA ; Draw grapple beam
+
RTS
.ArmCannonUnderSamus
JSR $85E2 ; Draw Samus
JSR $C663 ; Draw arm cannon
BRA -
}
