lorom

org $90D0C6
CheckForCrown:
LDA $09A2 : BIT #$4000 : BEQ DecrementEnergy
RTS

org $90D0F5
BRA CheckForCrown
DecrementEnergy:
LDA $09C2 : CMP #$0002 : BMI +
DEC $09C2
+
RTS

org $90D121
BRA CheckForCrown

org $90F659
EndShinesparkCheck:
LDA $09A2 : BIT #$4000 : BEQ +
JMP $D2C2
+
LDA $09C2 : JMP $D2BD
PlayHurtSoundWithoutCrown:
LDA $09A2 : BIT #$4000 : BEQ +
JMP $D33D
+
LDA #$0035 : JMP $D339

org $90D2BA
JMP EndShinesparkCheck
CMP #$0002

org $90D336
JMP PlayHurtSoundWithoutCrown