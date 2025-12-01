;;; adds spritemap flipping support for (non-extended spritemap) enemies, and fixes extended sritemap drawing

!EnemyProperty2_XFlip = $2000

org $A094CF
LDY $0F8E,x
LDA $0F88,x : BIT #!EnemyProperty2_XFlip : BNE +
JSL $818AB8 ; no flip
PLB : RTS

+
JSL DrawSpritemapXFlipped
PLB : RTS

assert pc() <= $A094F4

org $818B22
DrawExtendedSpritemap:
{
  LDA $0000,y : BEQ .rtl
  STA $18 ; remaining spritemap entries
  INY : INY
  LDX $0590 ; oam stack pointer
  CLC
.loop
  LDA $0000,y : ADC $14 : STA $0370,x ; x
  AND #$0100 : BEQ +
    ; x high
    LDA $81859F,x : STA $16
    LDA ($16) : ORA $81839F,x : STA ($16)
  +
  LDA $0000,y : BPL +
    ; size
    LDA $81859F,x : STA $16
    LDA ($16) : ORA $8183A1,x : STA ($16)
  +
  ; y
  ; sign extend y offset
  LDA $0002,y : AND #$00FF : BIT #$0080 : BEQ +
    ORA #$FF00
  +
  CLC : ADC $12
  CMP #$00F0 : BCC .yOnscreen
  CMP #$FFF0 : BCS .yOnscreen
  ; y is offscreen, place it offscreen
  LDA #$00F0
.yOnscreen
  STA $0371,x
  ; tile number and attributes
  LDA $0003,y : CLC : ADC $00 : ORA $03 : STA $0372,x
  ; next
  TYA : ADC #$0005 : TAY
  TXA : ADC #$0004 : AND #$01FF : TAX
  DEC $18 : BNE .loop
  STX $0590
.rtl
  RTL
}

DrawSpritemapXFlipped:
{
  LDA $0000,y : BEQ .rts ; number of entries in $18
  STA $18
  INY : INY
  LDA $14 : SEC : SBC #$0008 : STA $14 ; subtract x offset by 8 for small tiles
  LDX $0590
  .loop
    LDA $14 : SEC : SBC $0000,y : STA $0370,x ; x
    LDA $0000,y : BPL +
      ; size
      LDA $0370,x : SEC : SBC #$0008 : STA $0370,x ; subtract x by 8 again for big tiles
      LDA $81859F,x : STA $16
      LDA ($16) : ORA $8183A1,x : STA ($16)
    +
    LDA $0370,x : AND #$0100 : BEQ +
      ; high x
      LDA $81859F,x : STA $16
      LDA ($16) : ORA $81839F,x : STA ($16)
    +
    SEP #$20
    LDA $0002,y : CLC : ADC $12 : STA $0371,x ; y
    REP #$21
    LDA $0003,y : EOR #$4000 : ADC $00 : ORA $03 : STA $0372,x ; tile num and attrs
    ; next entry
    TYA : ADC #$0005 : TAY
    TXA : ADC #$0004 : AND #$01FF : TAX
    DEC $18 : BNE .loop
  STX $0590
.rts
  RTL
}

assert pc() <= $818CF4

org $A0955B
LDY $16 : JSL DrawExtendedSpritemap
BRA + : org $A09570 : +

org $8683D6 ; enemy projectiles too
DrawEnemyProjectile:
{
  LDA $19BB,x : AND #$00FF : STA $00 ; base tile number
  LDA $19BB,x : AND #$FF00 : STA $03 ; palette
  LDA $1A4B,x : SEC : SBC $0911 : CLC : ADC $24 : STA $14 ; x
  CLC : ADC #$0080 : BIT #$FE00 : BNE .rts
  LDA $1A93,x : SEC : SBC $0915 : CLC : ADC $22 : STA $12 ; y
  LDY $1B6B,x ; spritemap pointer
  PHX : JSL DrawExtendedSpritemap : PLX
.rts
  RTS
}

