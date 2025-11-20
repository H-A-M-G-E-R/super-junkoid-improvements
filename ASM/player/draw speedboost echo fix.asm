; Fixes speedboost echoes' position to be consistent with Samus's position and when Samus isn't drawn, the echoes aren't drawn to prevent garbage.

lorom

org $908855
DrawEcho:
{
LDA $18A8 : BEQ + ; If [Samus invincibility timer] != 0:
LDA $18AA : BNE + ; If [Samus knockback timer] = 0:
LDA $05B6 : LSR : BCS .Return ; If [frame counter] % 2 != 0: return
+
LDA $0B04 : SEC : SBC $0AF6 : CLC : ADC $0AB0,y : TAX ; X = [Samus spritemap X position] - [Samus X position] + [speed echo X position]
LDA $0B06 : SEC : SBC $0AFA : CLC : ADC $0AB8,y ; Y = [Samus spritemap Y position] - [Samus Y position] + [speed echo Y position]
BMI .Return : CMP #$00F8 : BPL .Return ; If not 0 <= [Y] < F8h: return
PHY : TAY
LDA $0AC8 ; A = [Samus' top half spritemap index]
JSL $8189AE ; Add Samus spritemap [A] to OAM at position ([X], [Y])
LDA $0ACA : BEQ + ; If [Samus' bottom half spritemap index] = 0: return
LDX $14 : LDY $12 ; (X, Y) = ([$14], [$12])
JSL $8189AE ; Add Samus spritemap [A] to OAM at position ([X], [Y])
+
PLY
.Return
RTS
}