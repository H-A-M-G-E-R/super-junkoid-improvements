lorom

org $82BE2F
REP #$30
LDA $09C2 : CMP #$001F : BPL + ; if low health:
LDA #$0002 : JSL $80914D ; Queue sound 2, sound library 3, max queued sounds allowed = 6 (low health beep)
BRA ++
+
LDA $0B40 : BEQ ++ ; If Samus echoes sound is playing:
LDA #$002B : JSL $80914D ; Queue sound 2Bh, sound library 3, max queued sounds allowed = 6 (resume speed booster)
++
JML $90F331

org $90F331
LDA $0D32 : CMP #$C4F0 : BEQ + ; if grappling:
LDA #$0006 : JSL $809049 ; Queue sound 6, sound library 1, max queued sounds allowed = 6 (grappling)
BRA ++
+
LDA $0CD0 : CMP #$0010 : BMI ++ ; if beam is charging:
LDA $0A1F : AND #$00FF : CMP #$0003 : BEQ ++ : CMP #$0014 : BEQ ++ ; if not spinjumping nor walljumping:
LDA #$0041 : JSL $809049 ; Queue sound 41h, sound library 1, max queued sounds allowed = 6 (resume charging beam)
++
RTL

org $91E697 : BRA $02
org $91E6C7 : BRA $02
org $91E6CF : PLB : PLP : RTL

org $90BD5C
LDA #$FFFF ; hyper beam charge sound fix (also fixes hyper beam bomb spread and pseudo screw)