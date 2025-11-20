lorom

org $829156 ; fading out from map screen to equipment screen
JSR $B9C8 : JSL $82B672 : JSL $82BB30

org $82934B ; fading out from unpause
LDA $0763 : DEC : BEQ +
JSR $B9C8 : JSL $82B672 : JSL $82BB30 : RTS
+
JSR $B267 : JSR $B2A2 : JMP $A56D