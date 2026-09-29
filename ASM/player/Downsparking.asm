lorom

;Downsparking, grants samus the ability to perform shinsparks downwards, vertically and diagonally, made by Tundain
;credit please!

;Thx to Scyzer for a collision fix
;and Smiley for how to flip the samus sprite

;To spark downwards, hold (angle) down when performing a regular shinespark, and it'll be downwards instead.
;(Disclaimer: the timing is pretty finnicky)

;12/4/2025 (DMY): fixed controls, now they're more intuitive, also improved general behavior

!Bank81Freespace = $81F198;large size
!Bank90Freespace = $90FD00;medium size
!Bank94FreeSpace = $94B1A0;small size 


org $92808D
SamusSpritesTable:



;-Bank $90---------------
;hijacks
;org $90D29F
;JSR checkreversed : NOP

;org $90D280
;JSR setdirection : NOP

;org !Bank90Freespace
;checkreversed:;inverts the shinespark speed
;LDA $0B36 : CMP #$0002 : BNE +
;LDA #$0003 : STA $0B02
;LDA $12 : EOR #$FFFF : STA $12;flip speed
;LDA $14 : EOR #$FFFF : INC : STA $14 : BNE +
;INC $12
;+
;JSL $949763
;RTS

;setdirection:;sets the correct collision direction while shinesparking down
;LDA $0B36 : CMP #$0002 : BNE +
;LDA #$0003 : STA $0B02
;+
;JSL $A0A8F0
;RTS


;org $90D30C
;NOP #3;remove setting her y direction to 0 (this allows the correct spritemap to be drawn whilst samus is in "shinespark crash" state


;bank $90-----------
;handling pose setup
org $91F55F
JMP alsodown

org $918014+2*$1B
dw extra

org $91FAF0
JSR downsparkAnimFrame

%BEGIN_FREESPACE(91)
;this code sets allows enrering the shinespark windup state even if you're holding angle down when jumping
alsodown:
CMP #$006B : BEQ +
CMP #$006C : BEQ ++
CMP #$0059 : BEQ +
CMP #$005A : BEQ ++
CMP #$0069 : JMP $F562
+
JMP $F564
++
JMP $F571

;some extra code attached to the input handler when shinesparking
;this is a bit ugly, but it's easier than including the entire transition table in this patch
extra:
JSR $81A9
LDA $0A1C;are you in the windup state?
CMP #$00C7 : BNE +
CMP #$00C8 : BNE +
LDA $8B : BIT $09BC : BEQ + ; angle down = diagonal downspark down
BIT #$0400 : BEQ + ; down = downspark down
LDA #$0002 : STA $0B36
+
RTS

downsparkAnimFrame:
STZ $0AB2
LDA $0A1C : DEC : LSR : CMP.w #($CB-1)/2 : BNE +
LDA $0B36 : CMP #$0002 : BNE +
LDA #$0002 : STA $0A9A ; new pose anim frame = 2
+
RTS

%END_FREESPACE(91)



;Bank $81--------------------------
org $8189AE;revert routine to vanilla
AddSamusSpritemap:
PHB
PEA $9200 : PLB : PLB        
STY $12    
STX $14    
ASL : TAX  
LDY.w SamusSpritesTable,x : LDA $0000,y : BEQ .Return   
STA $18 : INY #2       
LDX $0590
CLC

.Loop:
LDA $0000,y : ADC $14 : STA $0370,x
AND #$0100 : BEQ .X_high_clear    
LDA $0000,y : BPL +    
LDA $81859F,x : STA $16 : LDA ($16) : ORA $8185A1,x : STA ($16) 
JMP .Merge 
+          
LDA $81859F,x : STA $16 : LDA ($16) : ORA $81839F,x : STA ($16)  
JMP .Merge  
           
.X_high_clear: 
LDA $0000,y : BPL .Merge
LDA $81859F,x : STA $16 : LDA ($16) : ORA $8183A1,x : STA ($16)  

.Merge 
LDA $0002,y : CLC : ADC $12 : STA $0371,x : LDA $0003,y : STA $0372,x;set ypos and properties normally
TYA : CLC : ADC #$0005 : TAY 
TXA : ADC #$0004 : AND #$01FF : TAX        
DEC $18 : BNE .Loop    
STX $0590  
.Return:
PLB : RTL
assert pc() <= $818A37

;org $948FBB : JSR SparkCheck;thx to scyzer for this, this fixes an issue with diagonal sparks

;org !Bank94FreeSpace ;if sparking downward and hitting a slope horizontally, stop shinesparking (otherwise you softlock in slopes)
;SparkCheck:
;    LDA $0A6E : CMP #$0002 : BNE +
;    LDA $0B36 : CMP #$0002 : BEQ ++
;    +    LDX $0DC4 : RTS
;    ++    PLA : SEC : RTS
	