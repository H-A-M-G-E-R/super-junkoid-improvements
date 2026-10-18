lorom

org $819FDE : LDY.w #FileSelectTilemap_Music ; File select menu - index 10h/1Ch: reload main
org $819FE7 : JSR Hijack819FE7

org $81A1F7 : JMP FileSelectMenu_PressBCheck
org $81A20B : JMP FileSelectMenu_RightLeftCheck
org $81A30B : JMP FileSelectMenu_RightLeftCheck_right ; A press

%BEGIN_FREESPACE(81)
FileSelectTilemap_Music:
dw $2076, $207E, $207C, $2072, $206C, $FFFF

FileSelectMenu_RightLeftCheck:
{
  LDA $0952 : CMP #$0005 : BNE .notSelectedMusic
  LDA $8F : BIT #$0100 : BNE .right
  BIT #$0200 : BNE .left

.notSelectedMusic
  JMP $A2B9 ; Go to BRANCH_DONE

.right
  LDA $07F3 : INC : INC : INC
.merge
  ORA #$FF00 : JSL $808FC1
  LDA #$0005 : JSL $808FC1
  ; wait for music queue
  -
    JSL $808F0C ; Handle music queue
    JSL $808EF4 ; Check if music is queued
    BCS -
  JSR FileSelectMenu_UpdateMusicIndexTilemap
  JMP $A2B9

.left
  LDA $07F3 : DEC : DEC : DEC : BRA .merge
}

FileSelectMenu_PressBCheck:
{
  LDA $0952 : CMP #$0005 : BEQ FileSelectMenu_RightLeftCheck_left
  LDA #$0037 : JMP $A1FA
}

Hijack819FE7:
{
  JSR $B3E2
  ; fallthrough
}

FileSelectMenu_UpdateMusicIndexTilemap:
{
  LDA $07F3 : LSR : LSR : LSR : LSR : AND #$000F : ORA #$2060 : STA 2*$34A+$7E3600
  LDA $07F3 : AND #$000F : ORA #$2060 : STA 2*$34B+$7E3600
  JMP $969F ; Queue transfer of menu tilemap to VRAM BG1
}

%END_FREESPACE(81)
