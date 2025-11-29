org $8BF777
IntroSkipCheck:
REP #$30 ; required to not crash due to 8-bit accumulator
LDA $0998 : CMP #$001E : BNE + ; return if not in intro
LDA $1F51 : CMP #$B72F : BCS + ; return if intro finished
LDA $8F : BIT #$1000 : BEQ + ; return if not newly pressing start
JSR $B240 ; finish intro
+
PLB : PLP : RTL ; restore from hijack

EndingSkipCheck:
REP #$30
LDA $8F : BIT #$1000 : BEQ .ret ; return if not newly pressing start
LDA $1F51 : CMP #$DE64 : BCS +
  LDA #$DE64 : STA $1F51
+
.ret
PLB : PLP : RTL

CreditsSkipCheck:
LDA $8F : BIT #$1000 : BEQ .ret
JMP $F6FE
.ret
RTS

assert pc() <= $8BF800

org $8BA38C
JMP IntroSkipCheck

org $8BD443
PHP : PHB : PHK
org $8BD471
JMP EndingSkipCheck

org $8BE0ED : LDA.w #CreditsSkipCheck
