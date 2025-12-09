; Makes enemies unfreeze faster only in heated rooms, not anywhere in Norfair.
lorom

org $A0A88A ; for most enemies but metroids
JSL CalculateFreezeTimerLong : BRA + : org $A0A899 : +
org $A0A7E4
JSL CalculateFreezeTimerLong : BRA + : org $A0A7F3 : +

org $A3F027 ; for metroids
JSR CalculateFreezeTimer

%BEGIN_FREESPACE(A3)
CalculateFreezeTimer:
; scan through palette fx objects for a heated room fx
LDA #$F761 ; heated room palette fx id
CMP $1E8B : BEQ +
CMP $1E89 : BEQ +
CMP $1E87 : BEQ +
CMP $1E85 : BEQ +
CMP $1E83 : BEQ +
CMP $1E81 : BEQ +
CMP $1E7F : BEQ +
CMP $1E7D : BEQ +
LDA.w #400 : RTS ; unheated
+
LDA.w #300 : RTS ; heated
CalculateFreezeTimerLong:
JSR CalculateFreezeTimer : RTL
%END_FREESPACE(A3)
