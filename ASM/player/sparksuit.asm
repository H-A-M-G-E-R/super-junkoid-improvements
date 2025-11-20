; Fire shots while sparksuit is selected.

lorom

org $90DD67 : dw SparkSuitHUDSelectionHandler

org $90F83A
SparkSuitHUDSelectionHandler:
LDA $0A68 : BEQ + ; If [special Samus palette timer] != 0:
JSR $B80D ; Execute HUD selection handler - nothing / power bombs
RTS
+
LDA $09B2 : BIT $8F : BNE + ; If not newly pressing shoot:
BIT $0E00 : BEQ ++ ; If not previously newly pressing shoot: return
+
DEC $09CE ; Decrement [Samus power bombs]
BNE + ; If [Samus power bombs] = 0:
-
STZ $09D2 ; HUD item index = 0
STZ $0A04 ; Auto-cancel HUD item index = 0
+
LDA $0A04 : BNE - ; If [auto-cancel HUD item index] != 0: branch
LDA #$00B4 : STA $0A68 ; Special Samus palette timer = 180
LDA #$0001 : STA $0ACC ; Special Samus palette type = 1 (speed booster shine)
STZ $0ACE ; Special Samus palette frame = 0
LDA #$000F : STA $0CCC ; Cooldown timer = Fh
++
RTS

org $90B88F : JSR $AC39 ; undo hijack made by original sparksuit code