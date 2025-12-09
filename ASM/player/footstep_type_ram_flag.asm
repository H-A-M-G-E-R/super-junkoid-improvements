; Makes the footstep type controlled by a RAM flag, allowing it to be set by init ASM, main ASM, PLM, or more, removing the hardcoded footstep types in vanilla. Uses 2 bytes of RAM.
; To use: LDA #$yyxx : STA !FootstepType where xx is the footstep type when walking and yy is the landing graphic type.
; Also comes with a PLM that sets the footstep type to its room argument ($yyxx).

; Setup for SMART:
; Set the path to the assembler (xkas or asar). If using asar, the ROM needs to be in .sfc and the extra arguments need to be "--fix-checksum=off --no-title-check".
; Put this ASM to the ASM folder, scan ASM for used space, and apply ASM to ROM.
; Put "EFD3.xml" to Data/PLMs in your project folder and if you change the PLM ID, rename it to the PLM ID without the $.
lorom

!FootstepType = $0A1A ; any unused Samus RAM in $0A02..0E0B because it resets when starting game or starting one of the two intro demos (2 bytes)
;!PLMID = $EFD3 ; ID (put it in freespace)

org $90ED88
LDA !FootstepType : AND #$00FF : ASL : TAX : JSR (FootstepTypeTable,x) : RTS
FootstepTypeTable:
  dw $EE64 ; 00: common (dust if speed boosting, otherwise no dust)
  dw $EDEC ; 01: water splash
  dw $EE6F ; 02: dust
  dw $EEE6 ; 03: none

org $91F0A5
LDA !FootstepType+1 : AND #$00FF : ASL : TAX : JSR (LandingTypeTable,x) : RTS
LandingTypeTable:
  dw $F0BE ; 00: none
  dw $F116 ; 01: water splash
  dw $F166 ; 02: dust

org $8882CA ; reset footstep type and atmospheric graphics when starting game/door transition (overwrite code relying on stupid hardcoded room pointers for earthquake sound, can be disabled by setup asm)
JSL SetDefaultFootstepType
STZ $0AEC : STZ $0AEE : STZ $0AF0 : STZ $0AF2
BRA + : org $8882F3 : +

;;; Footstep Setup PLM: room argument controls footstep type
;org $840000+!PLMID
;dw Setup,$AAE3 ; Instruction list - delete
;Setup:
;LDA $1DC7,y : STA !FootstepType : RTS

%BEGIN_FREESPACE(91)
SetDefaultFootstepType:
{
  LDA $079F : ASL : TAX
  JMP (.table,x)

.table
  dw SetFootstepTypeFromCREBitset ; outskirts
  dw SetFootstepTypeFalseIdol ; false idol
  dw SetFootstepTypeFromCREBitset ; deep purple
  dw SetFootstepTypeFromCREBitset ; ice castle
  dw SetFootstepTypeToWater ; blood bethel
  dw SetFootstepTypeToDust ; sheol
  dw SetFootstepTypeFromCREBitset ; touhou va-vouhou?
  dw SetFootstepTypeFromCREBitset
}

SetFootstepTypeFromCREBitset:
{
  LDA $07B3 : AND #$0030 : LSR : LSR : LSR : TAX ; bits 10h and 20h determine footstep type
  LDA.l .table,x : STA !FootstepType
  RTL

.table
  dw $0000 ; 0: no effect
  dw $0101 ; 10h: water splash
  dw $0200 ; 20h: light dust
  dw $0202 ; 30h: heavy dust
}
SetFootstepTypeFalseIdol:
{
  ; branch if heart (miniboss) is dead
  LDA #$0002 : JSL $8081DC
  BCS SetFootstepTypeToNone
  ; fallthrough
}
SetFootstepTypeToWater:
{
  LDA #$0101 : STA !FootstepType
  RTL
}

SetFootstepTypeToNone:
{
  STZ !FootstepType
  RTL
}

SetFootstepTypeToDust:
{
  LDA #$0200 : STA !FootstepType
  RTL
}
%END_FREESPACE(91)
