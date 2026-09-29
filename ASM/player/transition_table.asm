!end     = $FF
!none    = $00
!up      = $08
!down    = $04
!left    = $02
!right   = $01
!jump    = $80
!shoot   = $40
!aimDown = $20
!aimUp   = $10

org $9181A9 ; Determine prospective pose from transition table
{
  ;;; Translate custom controller bindings to default bindings
  ; d-pad
  LDA $90 : AND #$000F : EOR #$FFFF : STA $12
  LDA $8C : AND #$000F : EOR #$FFFF : STA $13
  ; newly pressed shoot
  LDA $8F : BIT $09B2 : BEQ +
    LDA.W #!shoot : TRB $12
    LDA $8F
  +
  ; newly pressed jump
  BIT $09B4 : BEQ +
    LDA.W #!jump : TRB $12
    LDA $8F
  +
  ; newly pressed aim down
  BIT $09BC : BEQ +
    LDA.W #!aimDown : TRB $12
    LDA $8F
  +
  ; newly pressed aim up
  BIT $09BE : BEQ +
    LDA.W #!aimUp : TRB $12
  +
  ; pressing shoot
  LDA $8B : BIT $09B2 : BEQ +
    LDA.W #!shoot : TRB $13
    LDA $8B
  +
  ; pressing jump
  BIT $09B4 : BEQ +
    LDA.W #!jump : TRB $13
    LDA $8B
  +
  ; pressing aim down
  BIT $09BC : BEQ +
    LDA.W #!aimDown : TRB $13
    LDA $8B
  +
  ; pressing aim up
  BIT $09BE : BEQ +
    LDA.W #!aimUp : TRB $13
  +
  ; lookup the transition table
  LDA $0A1C : ASL : TAX
  LDA.W TransitionTable,x : BPL .clcRts ; return carry clear if no transition table
  TAY
  LDA $0000,y : AND #$00FF : CMP #$00FF : BEQ .clcRts ; this is needed for vanilla

.loop
  ; check if inputs match
  LDA $0000,y : AND $12 : BEQ .found
.next
  ; next input
  INY : INY : INY
  ; loop if not eot
  LDA $0000,y : AND #$00FF : CMP #$00FF : BNE .loop

  ; lookup failed
  JSL $9182D9 ; Handle transition table lookup failure
.clcRts
  CLC : RTS

.found
  LDA $0002,y : AND #$00FF
  CMP #$00C7 : BEQ .shinesparkWindup
  CMP #$00C8 : BNE .notWindup
.shinesparkWindup
  LDX $0A68 : BEQ .next ; don't trigger shinespark if shine timer == 0
.notWindup
  CMP $0A1C : BEQ .samePose
    STA $0A28 ; new prospective pose
    STZ $0A56 ; cancel bomb jump
  .samePose
  SEC : RTS
}
%padSafe($9182D9)

org $919EE2
TransitionTable:
dw Tr00, Tr01, Tr02, Tr03, Tr04, Tr05, Tr06, Tr07, Tr08, Tr09, Tr0A, Tr0B, Tr0C, Tr0D, Tr0E, Tr0F
dw Tr10, Tr11, Tr12, Tr13, Tr14, Tr15, Tr16, Tr17, Tr18, Tr19, Tr1A, Tr1B, Tr1C, Tr1D, Tr1E, Tr1F
dw Tr20, Tr21, Tr22, Tr23, Tr24, Tr25, Tr26, Tr27, Tr28, Tr29, Tr2A, Tr2B, Tr2C, Tr2D, Tr2E, Tr2F
dw Tr30, Tr31, Tr32, Tr33, Tr34, Tr35, Tr36, Tr37, Tr38, Tr39, Tr3A, Tr3B, Tr3C, Tr3D, Tr3E, Tr3F
dw Tr40, Tr41, Tr42, Tr43, Tr44, Tr45, Tr46, Tr47, Tr48, Tr49, Tr4A, Tr4B, Tr4C, Tr4D, Tr4E, Tr4F
dw Tr50, Tr51, Tr52, Tr53, Tr54, Tr55, Tr56, Tr57, Tr58, Tr59, Tr5A, Tr5B, Tr5C, Tr5D, Tr5E, Tr5F
dw Tr60, Tr61, Tr62, Tr63, Tr64, Tr65, Tr66, Tr67, Tr68, Tr69, Tr6A, Tr6B, Tr6C, Tr6D, Tr6E, Tr6F
dw Tr70, Tr71, Tr72, Tr73, Tr74, Tr75, Tr76, Tr77, Tr78, Tr79, Tr7A, Tr7B, Tr7C, Tr7D, Tr7E, Tr7F
dw Tr80, Tr81, Tr82, Tr83, Tr84, Tr85, Tr86, Tr87, Tr88, Tr89, Tr8A, Tr8B, Tr8C, Tr8D, Tr8E, Tr8F
dw Tr90, Tr91, Tr92, Tr93, Tr94, Tr95, Tr96, Tr97, Tr98, Tr99, Tr9A, Tr9B, Tr9C, Tr9D, Tr9E, Tr9F
dw TrA0, TrA1, TrA2, TrA3, TrA4, TrA5, TrA6, TrA7, TrA8, TrA9, TrAA, TrAB, TrAC, TrAD, TrAE, TrAF
dw TrB0, TrB1, TrB2, TrB3, TrB4, TrB5, TrB6, TrB7, TrB8, TrB9, TrBA, TrBB, TrBC, TrBD, TrBE, TrBF
dw TrC0, TrC1, TrC2, TrC3, TrC4, TrC5, TrC6, TrC7, TrC8, TrC9, TrCA, TrCB, TrCC, TrCD, TrCE, TrCF
dw TrD0, TrD1, TrD2, TrD3, TrD4, TrD5, TrD6, TrD7, TrD8, TrD9, TrDA, TrDB, TrDC, TrDD, TrDE, TrDF
dw TrE0, TrE1, TrE2, TrE3, TrE4, TrE5, TrE6, TrE7, TrE8, TrE9, TrEA, TrEB, TrEC, TrED, TrEE, TrEF
dw TrF0, TrF1, TrF2, TrF3, TrF4, TrF5, TrF6, TrF7, TrF8, TrF9, TrFA, TrFB, TrFC

Tr00: ; 0: Facing forward - power suit
Tr9B: ; 9Bh: Facing forward - varia/gravity suit
db !none, !right, $26 ; facing left  - turning - standing
db !none, !left, $25 ; facing right - turning - standing
db !end

Tr01: ; 1: Facing right - normal
Tr03: ; 3: Facing right - aiming up
Tr05: ; 5: Facing right - aiming up-right
Tr07: ; 7: Facing right - aiming down-right
TrA4: ; A4h: Facing right - landing from normal jump
TrA6: ; A6h: Facing right - landing from spin jump
TrE0: ; E0h: Facing right - landing from normal jump - aiming up
TrE2: ; E2h: Facing right - landing from normal jump - aiming up-right
TrE4: ; E4h: Facing right - landing from normal jump - aiming down-right
TrE6: ; E6h: Facing right - landing from normal jump - firing
db !jump, !up, $55 ; facing right - normal jump transition - aiming up
db !jump, !aimUp, $57 ; facing right - normal jump transition - aiming up-right
db !jump, !aimDown, $59 ; facing right - normal jump transition - aiming down-right
db !jump, !none, $4B ; facing right - normal jump transition
db !down, !aimDown|!aimUp, $F1 ; facing right - crouching transition - aiming up
db !down, !aimUp, $F3 ; facing right - crouching transition - aiming up-right
db !down, !aimDown, $F5 ; facing right - crouching transition - aiming down-right
db !down, !none, $35 ; facing right - crouching transition
db !none, !left|!shoot|!aimDown, $78 ; facing right - moonwalk - aiming down-right
db !none, !left|!shoot|!aimUp, $76 ; facing right - moonwalk - aiming up-right
db !none, !left|!aimDown|!aimUp, $25 ; facing right - turning - standing
db !none, !aimDown|!aimUp, $03 ; facing right - aiming up
db !none, !right|!aimUp, $0F ; moving right - aiming up-right
db !none, !right|!aimDown, $11 ; moving right - aiming down-right
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !none, !left|!shoot, $4A ; facing right - moonwalk
db !none, !left, $25 ; facing right - turning - standing
db !none, !up, $03 ; facing right - aiming up
db !none, !aimUp, $05 ; facing right - aiming up-right
db !none, !aimDown, $07 ; facing right - aiming down-right
db !none, !right, $09 ; moving right - not aiming
db !end

Tr02: ; 2: Facing left  - normal
Tr04: ; 4: Facing left  - aiming up
Tr06: ; 6: Facing left  - aiming up-left
Tr08: ; 8: Facing left  - aiming down-left
TrA5: ; A5h: Facing left  - landing from normal jump
TrA7: ; A7h: Facing left  - landing from spin jump
TrE1: ; E1h: Facing left  - landing from normal jump - aiming up
TrE3: ; E3h: Facing left  - landing from normal jump - aiming up-left
TrE5: ; E5h: Facing left  - landing from normal jump - aiming down-left
TrE7: ; E7h: Facing left  - landing from normal jump - firing
db !jump, !up, $56 ; facing left  - normal jump transition - aiming up
db !jump, !aimUp, $58 ; facing left  - normal jump transition - aiming up-left
db !jump, !aimDown, $5A ; facing left  - normal jump transition - aiming down-left
db !jump, !none, $4C ; facing left  - normal jump transition
db !down, !aimDown|!aimUp, $F2 ; facing left  - crouching transition - aiming up
db !down, !aimUp, $F4 ; facing left  - crouching transition - aiming up-left
db !down, !aimDown, $F6 ; facing left  - crouching transition - aiming down-left
db !down, !none, $36 ; facing left  - crouching transition
db !none, !right|!shoot|!aimDown, $77 ; facing left  - moonwalk - aiming down-left
db !none, !right|!shoot|!aimUp, $75 ; facing left  - moonwalk - aiming up-left
db !none, !right|!shoot, $49 ; facing left  - moonwalk
db !none, !right, $26 ; facing left  - turning - standing
db !none, !aimDown|!aimUp, $04 ; facing left  - aiming up
db !none, !left|!aimUp, $10 ; moving left  - aiming up-left
db !none, !left|!aimDown, $12 ; moving left  - aiming down-left
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !none, !up, $04 ; facing left  - aiming up
db !none, !aimUp, $06 ; facing left  - aiming up-left
db !none, !aimDown, $08 ; facing left  - aiming down-left
db !none, !left, $0A ; moving left  - not aiming
db !end

Tr09: ; 9: Moving right - not aiming
Tr0D: ; Dh: Moving right - aiming up (unused)
Tr0F: ; Fh: Moving right - aiming up-right
Tr11: ; 11h: Moving right - aiming down-right
db !down, !none, $35 ; facing right - crouching transition
db !jump, !none, $19 ; facing right - spin jump
db !none, !right|!aimUp, $0F ; moving right - aiming up-right
db !none, !right|!aimDown, $11 ; moving right - aiming down-right
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !none, !right|!shoot, $0B ; moving right - gun extended
db !none, !right, $09 ; moving right - not aiming
db !none, !left, $25 ; facing right - turning - standing
db !none, !up, $03 ; facing right - aiming up
db !none, !aimUp, $05 ; facing right - aiming up-right
db !none, !aimDown, $07 ; facing right - aiming down-right
db !end

Tr0A: ; Ah: Moving left  - not aiming
Tr0E: ; Eh: Moving left  - aiming up (unused)
Tr10: ; 10h: Moving left  - aiming up-left
Tr12: ; 12h: Moving left  - aiming down-left
db !down, !none, $36 ; facing left  - crouching transition
db !jump, !none, $1A ; facing left  - spin jump
db !none, !left|!aimUp, $10 ; moving left  - aiming up-left
db !none, !left|!aimDown, $12 ; moving left  - aiming down-left
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !none, !left|!shoot, $0C ; moving left  - gun extended
db !none, !left, $0A ; moving left  - not aiming
db !none, !right, $26 ; facing left  - turning - standing
db !none, !up, $04 ; facing left  - aiming up
db !none, !aimUp, $06 ; facing left  - aiming up-left
db !none, !aimDown, $08 ; facing left  - aiming down-left
db !end

Tr0B: ; Bh: Moving right - gun extended
db !down, !none, $35 ; facing right - crouching transition
db !jump, !none, $19 ; facing right - spin jump
db !none, !right|!aimUp, $0F ; moving right - aiming up-right
db !none, !right|!aimDown, $11 ; moving right - aiming down-right
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !none, !right, $0B ; moving right - gun extended
db !none, !left, $25 ; facing right - turning - standing
db !none, !up, $03 ; facing right - aiming up
db !none, !aimUp, $05 ; facing right - aiming up-right
db !none, !aimDown, $07 ; facing right - aiming down-right
db !end

Tr0C: ; Ch: Moving left  - gun extended
db !down, !none, $36 ; facing left  - crouching transition
db !jump, !none, $1A ; facing left  - spin jump
db !none, !left|!aimUp, $10 ; moving left  - aiming up-left
db !none, !left|!aimDown, $12 ; moving left  - aiming down-left
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !none, !left, $0C ; moving left  - gun extended
db !none, !right, $26 ; facing left  - turning - standing
db !none, !up, $04 ; facing left  - aiming up
db !none, !aimUp, $06 ; facing left  - aiming up-left
db !none, !aimDown, $08 ; facing left  - aiming down-left
db !end

Tr13: ; 13h: Facing right - normal jump - not aiming - not moving - gun extended
db !jump, !none, $19 ; facing right - spin jump
db !none, !up|!right, $69 ; facing right - normal jump - aiming up-right
db !none, !down|!right, $6B ; facing right - normal jump - aiming down-right
db !none, !right|!jump|!aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !right|!jump|!aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !left, $2F ; facing right - turning - jumping
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !down, $17 ; facing right - normal jump - aiming down
db !none, !aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !right, $51 ; facing right - normal jump - not aiming - moving forward
db !none, !shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !end

Tr14: ; 14h: Facing left  - normal jump - not aiming - not moving - gun extended
db !jump, !none, $1A ; facing left  - spin jump
db !none, !up|!left, $6A ; facing left  - normal jump - aiming up-left
db !none, !down|!left, $6C ; facing left  - normal jump - aiming down-left
db !none, !left|!jump|!aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !left|!jump|!aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !right, $30 ; facing left  - turning - jumping
db !none, !up, $16 ; facing left  - normal jump - aiming up
db !none, !down, $18 ; facing left  - normal jump - aiming down
db !none, !aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !left, $52 ; facing left  - normal jump - not aiming - moving forward
db !none, !shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !end

Tr15: ; 15h: Facing right - normal jump - aiming up
Tr4D: ; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended
Tr51: ; 51h: Facing right - normal jump - not aiming - moving forward
Tr69: ; 69h: Facing right - normal jump - aiming up-right
Tr6B: ; 6Bh: Facing right - normal jump - aiming down-right
db !jump, !none, $19 ; facing right - spin jump
db !none, !up|!right, $69 ; facing right - normal jump - aiming up-right
db !none, !down|!right, $6B ; facing right - normal jump - aiming down-right
db !none, !right|!jump|!aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !right|!jump|!aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !left, $2F ; facing right - turning - jumping
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !down, $17 ; facing right - normal jump - aiming down
db !none, !aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !right, $51 ; facing right - normal jump - not aiming - moving forward
db !none, !jump|!shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !jump, $4D ; facing right - normal jump - not aiming - not moving - gun not extended
db !none, !shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !end

Tr16: ; 16h: Facing left  - normal jump - aiming up
Tr4E: ; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended
Tr52: ; 52h: Facing left  - normal jump - not aiming - moving forward
Tr6A: ; 6Ah: Facing left  - normal jump - aiming up-left
Tr6C: ; 6Ch: Facing left  - normal jump - aiming down-left
db !jump, !none, $1A ; facing left  - spin jump
db !none, !up|!left, $6A ; facing left  - normal jump - aiming up-left
db !none, !down|!left, $6C ; facing left  - normal jump - aiming down-left
db !none, !left|!jump|!aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !left|!jump|!aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !right, $30 ; facing left  - turning - jumping
db !none, !up, $16 ; facing left  - normal jump - aiming up
db !none, !down, $18 ; facing left  - normal jump - aiming down
db !none, !aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !left, $52 ; facing left  - normal jump - not aiming - moving forward
db !none, !jump|!shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !jump, $4E ; facing left  - normal jump - not aiming - not moving - gun not extended
db !none, !shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !end

Tr17: ; 17h: Facing right - normal jump - aiming down
db !jump, !none, $19 ; facing right - spin jump
db !down, !none, $37 ; facing right - morphing transition
db !none, !up|!right, $69 ; facing right - normal jump - aiming up-right
db !none, !down|!right, $6B ; facing right - normal jump - aiming down-right
db !none, !right|!jump|!aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !right|!jump|!aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !left, $2F ; facing right - turning - jumping
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !down, $17 ; facing right - normal jump - aiming down
db !none, !aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !right, $51 ; facing right - normal jump - not aiming - moving forward
db !none, !jump|!shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !jump, $17 ; facing right - normal jump - aiming down
db !none, !shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !end

Tr18: ; 18h: Facing left  - normal jump - aiming down
db !jump, !none, $1A ; facing left  - spin jump
db !down, !none, $38 ; facing left  - morphing transition
db !none, !up|!left, $6A ; facing left  - normal jump - aiming up-left
db !none, !down|!left, $6C ; facing left  - normal jump - aiming down-left
db !none, !left|!jump|!aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !left|!jump|!aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !right, $30 ; facing left  - turning - jumping
db !none, !up, $16 ; facing left  - normal jump - aiming up
db !none, !down, $18 ; facing left  - normal jump - aiming down
db !none, !aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !left, $52 ; facing left  - normal jump - not aiming - moving forward
db !none, !jump|!shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !jump, $18 ; facing left  - normal jump - aiming down
db !none, !shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !end

Tr19: ; 19h: Facing right - spin jump
db !shoot, !none, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !up|!shoot, $15 ; facing right - normal jump - aiming up
db !none, !down|!shoot, $17 ; facing right - normal jump - aiming down
db !none, !shoot|!aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !shoot|!aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !right|!jump, $19 ; facing right - spin jump
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !down, $17 ; facing right - normal jump - aiming down
db !none, !right, $19 ; facing right - spin jump
db !none, !left, $1A ; facing left  - spin jump
db !end

Tr1A: ; 1Ah: Facing left  - spin jump
db !shoot, !none, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !up|!shoot, $16 ; facing left  - normal jump - aiming up
db !none, !down|!shoot, $18 ; facing left  - normal jump - aiming down
db !none, !shoot|!aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !shoot|!aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !left|!jump, $1A ; facing left  - spin jump
db !none, !up, $16 ; facing left  - normal jump - aiming up
db !none, !aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !down, $18 ; facing left  - normal jump - aiming down
db !none, !left, $1A ; facing left  - spin jump
db !none, !right, $19 ; facing right - spin jump
db !end

Tr1B: ; 1Bh: Facing right - space jump
db !shoot, !none, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !up|!shoot, $15 ; facing right - normal jump - aiming up
db !none, !down|!shoot, $17 ; facing right - normal jump - aiming down
db !none, !shoot|!aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !shoot|!aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !right|!jump, $1B ; facing right - space jump
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !down, $17 ; facing right - normal jump - aiming down
db !none, !right, $1B ; facing right - space jump
db !none, !left, $1C ; facing left  - space jump
db !end

Tr1C: ; 1Ch: Facing left  - space jump
db !shoot, !none, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !up|!shoot, $16 ; facing left  - normal jump - aiming up
db !none, !down|!shoot, $18 ; facing left  - normal jump - aiming down
db !none, !shoot|!aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !shoot|!aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !left|!jump, $1C ; facing left  - space jump
db !none, !up, $16 ; facing left  - normal jump - aiming up
db !none, !aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !down, $18 ; facing left  - normal jump - aiming down
db !none, !left, $1C ; facing left  - space jump
db !none, !right, $1B ; facing right - space jump
db !end

Tr1D: ; 1Dh: Facing right - morph ball - no springball - on ground
Tr1E: ; 1Eh: Moving right - morph ball - no springball - on ground
db !up, !none, $3D ; facing right - unmorphing transition
db !jump, !none, $3D ; facing right - unmorphing transition

Tr1F: ; 1Fh: Moving left  - morph ball - no springball - on ground
Tr41: ; 41h: Facing left  - morph ball - no springball - on ground
db !up, !none, $3E ; facing left  - unmorphing transition
db !jump, !none, $3E ; facing left  - unmorphing transition
db !none, !right, $1E ; moving right - morph ball - no springball - on ground
db !none, !left, $1F ; moving left  - morph ball - no springball - on ground
db !end

Tr20: ; 20h: Unused
Tr21: ; 21h: Unused
Tr22: ; 22h: Unused
Tr23: ; 23h: Unused
Tr24: ; 24h: Unused
Tr2F: ; 2Fh: Facing right - turning - jumping
Tr30: ; 30h: Facing left  - turning - jumping
Tr33: ; 33h: Unused
Tr34: ; 34h: Unused
Tr35: ; 35h: Facing right - crouching transition
Tr36: ; 36h: Facing left  - crouching transition
Tr37: ; 37h: Facing right - morphing transition
Tr38: ; 38h: Facing left  - morphing transition
Tr39: ; 39h: Unused
Tr3A: ; 3Ah: Unused
Tr3B: ; 3Bh: Facing right - standing transition
Tr3C: ; 3Ch: Facing left  - standing transition
Tr3D: ; 3Dh: Facing right - unmorphing transition
Tr3E: ; 3Eh: Facing left  - unmorphing transition
Tr3F: ; 3Fh: Unused
Tr40: ; 40h: Unused
Tr42: ; 42h: Unused
Tr43: ; 43h: Facing right - turning - crouching
Tr44: ; 44h: Facing left  - turning - crouching
Tr47: ; 47h: Unused
Tr48: ; 48h: Unused
Tr4B: ; 4Bh: Facing right - normal jump transition
Tr4C: ; 4Ch: Facing left  - normal jump transition
Tr55: ; 55h: Facing right - normal jump transition - aiming up
Tr56: ; 56h: Facing left  - normal jump transition - aiming up
Tr57: ; 57h: Facing right - normal jump transition - aiming up-right
Tr58: ; 58h: Facing left  - normal jump transition - aiming up-left
Tr59: ; 59h: Facing right - normal jump transition - aiming down-right
Tr5A: ; 5Ah: Facing left  - normal jump transition - aiming down-left
Tr5B: ; 5Bh: Unused
Tr5C: ; 5Ch: Unused
Tr5D: ; 5Dh: Unused
Tr5E: ; 5Eh: Unused
Tr5F: ; 5Fh: Unused
Tr60: ; 60h: Unused
Tr61: ; 61h: Unused
Tr62: ; 62h: Unused
Tr63: ; 63h: Unused
Tr64: ; 64h: Unused
Tr65: ; 65h: Unused
Tr66: ; 66h: Unused
Tr87: ; 87h: Facing right - turning - falling
Tr88: ; 88h: Facing left  - turning - falling
Tr8F: ; 8Fh: Facing right - turning - in air - aiming up
Tr90: ; 90h: Facing left  - turning - in air - aiming up
Tr91: ; 91h: Facing right - turning - in air - aiming down/down-right
Tr92: ; 92h: Facing left  - turning - in air - aiming down/down-left
Tr93: ; 93h: Facing right - turning - falling - aiming up
Tr94: ; 94h: Facing left  - turning - falling - aiming up
Tr95: ; 95h: Facing right - turning - falling - aiming down/down-right
Tr96: ; 96h: Facing left  - turning - falling - aiming down/down-left
Tr97: ; 97h: Facing right - turning - crouching - aiming up
Tr98: ; 98h: Facing left  - turning - crouching - aiming up
Tr99: ; 99h: Facing right - turning - crouching - aiming down/down-right
Tr9A: ; 9Ah: Facing left  - turning - crouching - aiming down/down-left
Tr9C: ; 9Ch: Facing right - turning - standing - aiming up-right
Tr9D: ; 9Dh: Facing left  - turning - standing - aiming up-left
Tr9E: ; 9Eh: Facing right - turning - in air - aiming up-right
Tr9F: ; 9Fh: Facing left  - turning - in air - aiming up-left
TrA0: ; A0h: Facing right - turning - falling - aiming up-right
TrA1: ; A1h: Facing left  - turning - falling - aiming up-left
TrA2: ; A2h: Facing right - turning - crouching - aiming up-right
TrA3: ; A3h: Facing left  - turning - crouching - aiming up-left
TrA8: ; A8h: Facing right - grappling
TrA9: ; A9h: Facing left  - grappling
TrAA: ; AAh: Facing right - grappling - aiming down-right
TrAB: ; ABh: Facing left  - grappling - aiming down-left
TrAC: ; ACh: Unused. Facing right - grappling - in air
TrAD: ; ADh: Unused. Facing left  - grappling - in air
TrAE: ; AEh: Unused. Facing right - grappling - in air - aiming down
TrAF: ; AFh: Unused. Facing left  - grappling - in air - aiming down
TrB0: ; B0h: Unused. Facing right - grappling - in air - aiming down-right
TrB1: ; B1h: Unused. Facing left  - grappling - in air - aiming down-left
TrB2: ; B2h: Facing clockwise     - grapple swinging
TrB3: ; B3h: Facing anticlockwise - grapple swinging
TrB4: ; B4h: Facing right - grappling - crouching
TrB5: ; B5h: Facing left  - grappling - crouching
TrB6: ; B6h: Facing right - grappling - crouching - aiming down-right
TrB7: ; B7h: Facing left  - grappling - crouching - aiming down-left
TrB8: ; B8h: Facing left  - grapple wall jump pose
TrB9: ; B9h: Facing right - grapple wall jump pose
TrC5: ; C5h: Unused
TrC6: ; C6h: Unused
TrC9: ; C9h: Facing right - shinespark - horizontal
TrCA: ; CAh: Facing left  - shinespark - horizontal
TrCB: ; CBh: Facing right - shinespark - vertical
TrCC: ; CCh: Facing left  - shinespark - vertical
TrCD: ; CDh: Facing right - shinespark - diagonal
TrCE: ; CEh: Facing left  - shinespark - diagonal
TrD3: ; D3h: Facing right - crystal flash
TrD4: ; D4h: Facing left  - crystal flash
TrD5: ; D5h: Facing right - x-ray - standing
TrD6: ; D6h: Facing left  - x-ray - standing
TrD7: ; D7h: Facing right - crystal flash ending
TrD8: ; D8h: Facing left  - crystal flash ending
TrD9: ; D9h: Facing right - x-ray - crouching
TrDA: ; DAh: Facing left  - x-ray - crouching
TrDB: ; DBh: Unused
TrDC: ; DCh: Unused
TrDD: ; DDh: Unused
TrDE: ; DEh: Unused
TrE8: ; E8h: Facing right - Samus drained - crouching/falling
TrE9: ; E9h: Facing left  - Samus drained - crouching/falling
TrEA: ; EAh: Facing right - Samus drained - standing
TrEB: ; EBh: Facing left  - Samus drained - standing
TrF1: ; F1h: Facing right - crouching transition - aiming up
TrF2: ; F2h: Facing left  - crouching transition - aiming up
TrF3: ; F3h: Facing right - crouching transition - aiming up-right
TrF4: ; F4h: Facing left  - crouching transition - aiming up-left
TrF5: ; F5h: Facing right - crouching transition - aiming down-right
TrF6: ; F6h: Facing left  - crouching transition - aiming down-left
TrF7: ; F7h: Facing right - standing transition - aiming up
TrF8: ; F8h: Facing left  - standing transition - aiming up
TrF9: ; F9h: Facing right - standing transition - aiming up-right
TrFA: ; FAh: Facing left  - standing transition - aiming up-left
TrFB: ; FBh: Facing right - standing transition - aiming down-right
TrFC: ; FCh: Facing left  - standing transition - aiming down-left
db !end

Tr25: ; 25h: Facing right - turning - standing
db !none, !left|!jump, $1A ; facing left  - spin jump
db !jump, !none, $4C ; facing left  - normal jump transition
db !none, !left, $25 ; facing right - turning - standing
db !end

Tr26: ; 26h: Facing left  - turning - standing
db !none, !right|!jump, $19 ; facing right - spin jump
db !jump, !none, $4B ; facing right - normal jump transition
db !none, !right, $26 ; facing left  - turning - standing
db !end

Tr27: ; 27h: Facing right - crouching
Tr71: ; 71h: Facing right - crouching - aiming up-right
Tr73: ; 73h: Facing right - crouching - aiming down-right
Tr85: ; 85h: Facing right - crouching - aiming up
db !up, !aimDown|!aimUp, $F7 ; facing right - standing transition - aiming up
db !up, !aimUp, $F9 ; facing right - standing transition - aiming up-right
db !up, !aimDown, $FB ; facing right - standing transition - aiming down-right
db !up, !none, $3B ; facing right - standing transition
db !left, !none, $43 ; facing right - turning - crouching
db !down, !none, $37 ; facing right - morphing transition
db !jump, !none, $4B ; facing right - normal jump transition
db !none, !aimDown|!aimUp, $85 ; facing right - crouching - aiming up
db !none, !right, $01 ; facing right - normal
db !none, !aimUp, $71 ; facing right - crouching - aiming up-right
db !none, !aimDown, $73 ; facing right - crouching - aiming down-right
db !end

Tr28: ; 28h: Facing left  - crouching
Tr72: ; 72h: Facing left  - crouching - aiming up-left
Tr74: ; 74h: Facing left  - crouching - aiming down-left
Tr86: ; 86h: Facing left  - crouching - aiming up
db !up, !aimDown|!aimUp, $F8 ; facing left  - standing transition - aiming up
db !up, !aimUp, $FA ; facing left  - standing transition - aiming up-left
db !up, !aimDown, $FC ; facing left  - standing transition - aiming down-left
db !up, !none, $3C ; facing left  - standing transition
db !right, !none, $44 ; facing left  - turning - crouching
db !down, !none, $38 ; facing left  - morphing transition
db !jump, !none, $4C ; facing left  - normal jump transition
db !none, !aimDown|!aimUp, $86 ; facing left  - crouching - aiming up
db !none, !left, $02 ; facing left  - normal
db !none, !aimUp, $72 ; facing left  - crouching - aiming up-left
db !none, !aimDown, $74 ; facing left  - crouching - aiming down-left
db !end

Tr29: ; 29h: Facing right - falling
Tr2B: ; 2Bh: Facing right - falling - aiming up
Tr6D: ; 6Dh: Facing right - falling - aiming up-right
Tr6F: ; 6Fh: Facing right - falling - aiming down-right
db !jump, !none, $19 ; facing right - spin jump
db !none, !up|!right, $6D ; facing right - falling - aiming up-right
db !none, !down|!right, $6F ; facing right - falling - aiming down-right
db !none, !left, $87 ; facing right - turning - falling
db !none, !up, $2B ; facing right - falling - aiming up
db !none, !down, $2D ; facing right - falling - aiming down
db !none, !aimUp, $6D ; facing right - falling - aiming up-right
db !none, !aimDown, $6F ; facing right - falling - aiming down-right
db !none, !shoot, $67 ; facing right - falling - gun extended
db !none, !right, $29 ; facing right - falling
db !end

Tr2A: ; 2Ah: Facing left  - falling
Tr2C: ; 2Ch: Facing left  - falling - aiming up
Tr6E: ; 6Eh: Facing left  - falling - aiming up-left
Tr70: ; 70h: Facing left  - falling - aiming down-left
db !jump, !none, $1A ; facing left  - spin jump
db !none, !up|!left, $6E ; facing left  - falling - aiming up-left
db !none, !down|!left, $70 ; facing left  - falling - aiming down-left
db !none, !right, $88 ; facing left  - turning - falling
db !none, !up, $2C ; facing left  - falling - aiming up
db !none, !down, $2E ; facing left  - falling - aiming down
db !none, !aimUp, $6E ; facing left  - falling - aiming up-left
db !none, !aimDown, $70 ; facing left  - falling - aiming down-left
db !none, !shoot, $68 ; facing left  - falling - gun extended
db !none, !left, $2A ; facing left  - falling
db !end

Tr2D: ; 2Dh: Facing right - falling - aiming down
db !jump, !none, $19 ; facing right - spin jump
db !down, !none, $37 ; facing right - morphing transition
db !none, !up|!right, $6D ; facing right - falling - aiming up-right
db !none, !down|!right, $6F ; facing right - falling - aiming down-right
db !none, !up, $2B ; facing right - falling - aiming up
db !none, !down, $2D ; facing right - falling - aiming down
db !none, !left, $87 ; facing right - turning - falling
db !none, !aimUp, $6D ; facing right - falling - aiming up-right
db !none, !aimDown, $6F ; facing right - falling - aiming down-right
db !none, !shoot, $67 ; facing right - falling - gun extended
db !none, !right, $29 ; facing right - falling
db !end

Tr2E: ; 2Eh: Facing left  - falling - aiming down
db !jump, !none, $1A ; facing left  - spin jump
db !down, !none, $38 ; facing left  - morphing transition
db !none, !up|!left, $6E ; facing left  - falling - aiming up-left
db !none, !down|!left, $70 ; facing left  - falling - aiming down-left
db !none, !up, $2C ; facing left  - falling - aiming up
db !none, !down, $2E ; facing left  - falling - aiming down
db !none, !right, $88 ; facing left  - turning - falling
db !none, !aimUp, $6E ; facing left  - falling - aiming up-left
db !none, !aimDown, $70 ; facing left  - falling - aiming down-left
db !none, !shoot, $68 ; facing left  - falling - gun extended
db !none, !left, $2A ; facing left  - falling
db !end

Tr31: ; 31h: Facing right - morph ball - no springball - in air
db !up, !none, $3D ; facing right - unmorphing transition
db !jump, !none, $3D ; facing right - unmorphing transition

Tr32: ; 32h: Facing left  - morph ball - no springball - in air
db !up, !none, $3E ; facing left  - unmorphing transition
db !jump, !none, $3E ; facing left  - unmorphing transition
db !none, !right, $31 ; facing right - morph ball - no springball - in air
db !none, !left, $32 ; facing left  - morph ball - no springball - in air
db !end

Tr45: ; 45h: Unused
db !none, !left|!shoot, $45 ; unused
db !none, !right, $09 ; moving right - not aiming
db !none, !left, $25 ; facing right - turning - standing
db !end

Tr46: ; 46h: Unused
db !none, !right|!shoot, $46 ; unused
db !none, !left, $0A ; moving left  - not aiming
db !none, !right, $26 ; facing left  - turning - standing
db !end

Tr49: ; 49h: Facing left  - moonwalk
Tr75: ; 75h: Facing left  - moonwalk - aiming up-left
Tr77: ; 77h: Facing left  - moonwalk - aiming down-left
db !down, !none, $36 ; facing left  - crouching transition
db !jump, !none, $C0 ; facing left  - moonwalking - turn/jump right
db !none, !right|!shoot|!aimDown, $77 ; facing left  - moonwalk - aiming down-left
db !none, !right|!shoot|!aimUp, $75 ; facing left  - moonwalk - aiming up-left
db !none, !right|!shoot, $49 ; facing left  - moonwalk
db !none, !left, $0A ; moving left  - not aiming
db !none, !right, $26 ; facing left  - turning - standing
db !end

Tr4A: ; 4Ah: Facing right - moonwalk
Tr76: ; 76h: Facing right - moonwalk - aiming up-right
Tr78: ; 78h: Facing right - moonwalk - aiming down-right
db !down, !none, $35 ; facing right - crouching transition
db !jump, !none, $BF ; facing right - moonwalking - turn/jump left
db !none, !left|!shoot|!aimUp, $76 ; facing right - moonwalk - aiming up-right
db !none, !left|!shoot|!aimDown, $78 ; facing right - moonwalk - aiming down-right
db !none, !left|!shoot, $4A ; facing right - moonwalk
db !none, !right, $09 ; moving right - not aiming
db !none, !left, $25 ; facing right - turning - standing
db !end

Tr4F: ; 4Fh: Facing left  - damage boost
db !none, !left|!jump, $52 ; facing left  - normal jump - not aiming - moving forward
db !none, !right|!jump, $4F ; facing left  - damage boost
db !none, !jump, $4E ; facing left  - normal jump - not aiming - not moving - gun not extended
db !end

Tr50: ; 50h: Facing right - damage boost
db !none, !left|!jump, $50 ; facing right - damage boost
db !none, !right|!jump, $51 ; facing right - normal jump - not aiming - moving forward
db !none, !jump, $4D ; facing right - normal jump - not aiming - not moving - gun not extended
db !end

Tr53: ; 53h: Facing right - knockback
db !none, !left|!jump, $50 ; facing right - damage boost
db !end

Tr54: ; 54h: Facing left  - knockback
db !none, !right|!jump, $4F ; facing left  - damage boost
db !end

Tr67: ; 67h: Facing right - falling - gun extended
db !jump, !none, $19 ; facing right - spin jump
db !none, !up|!right, $6D ; facing right - falling - aiming up-right
db !none, !down|!right, $6F ; facing right - falling - aiming down-right
db !none, !up, $2B ; facing right - falling - aiming up
db !none, !down, $2D ; facing right - falling - aiming down
db !none, !left, $87 ; facing right - turning - falling
db !none, !aimUp, $6D ; facing right - falling - aiming up-right
db !none, !aimDown, $6F ; facing right - falling - aiming down-right
db !none, !shoot, $67 ; facing right - falling - gun extended
db !none, !right, $67 ; facing right - falling - gun extended
db !end

Tr68: ; 68h: Facing left  - falling - gun extended
db !jump, !none, $1A ; facing left  - spin jump
db !none, !up|!left, $6E ; facing left  - falling - aiming up-left
db !none, !down|!left, $70 ; facing left  - falling - aiming down-left
db !none, !up, $2C ; facing left  - falling - aiming up
db !none, !down, $2E ; facing left  - falling - aiming down
db !none, !right, $88 ; facing left  - turning - falling
db !none, !aimUp, $6E ; facing left  - falling - aiming up-left
db !none, !aimDown, $70 ; facing left  - falling - aiming down-left
db !none, !shoot, $68 ; facing left  - falling - gun extended
db !none, !left, $68 ; facing left  - falling - gun extended
db !end

Tr79: ; 79h: Facing right - morph ball - spring ball - on ground
Tr7B: ; 7Bh: Moving right - morph ball - spring ball - on ground
db !up, !none, $3D ; facing right - unmorphing transition
db !jump, !none, $7F ; facing right - morph ball - spring ball - in air

Tr7A: ; 7Ah: Facing left  - morph ball - spring ball - on ground
Tr7C: ; 7Ch: Moving left  - morph ball - spring ball - on ground
db !up, !none, $3E ; facing left  - unmorphing transition
db !jump, !none, $80 ; facing left  - morph ball - spring ball - in air
db !none, !right, $7B ; moving right - morph ball - spring ball - on ground
db !none, !left, $7C ; moving left  - morph ball - spring ball - on ground
db !end

Tr7D: ; 7Dh: Facing right - morph ball - spring ball - falling
db !up, !none, $3D ; facing right - unmorphing transition

Tr7E: ; 7Eh: Facing left  - morph ball - spring ball - falling
db !up, !none, $3E ; facing left  - unmorphing transition
db !none, !right, $7D ; facing right - morph ball - spring ball - falling
db !none, !left, $7E ; facing left  - morph ball - spring ball - falling
db !end

Tr7F: ; 7Fh: Facing right - morph ball - spring ball - in air
db !up, !none, $3D ; facing right - unmorphing transition

Tr80: ; 80h: Facing left  - morph ball - spring ball - in air
db !up, !none, $3E ; facing left  - unmorphing transition
db !none, !right, $7F ; facing right - morph ball - spring ball - in air
db !none, !left, $80 ; facing left  - morph ball - spring ball - in air
db !end

Tr81: ; 81h: Facing right - screw attack
db !shoot, !none, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !up|!shoot, $15 ; facing right - normal jump - aiming up
db !none, !down|!shoot, $17 ; facing right - normal jump - aiming down
db !none, !shoot|!aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !shoot|!aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !right|!jump, $81 ; facing right - screw attack
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !down, $17 ; facing right - normal jump - aiming down
db !none, !right, $81 ; facing right - screw attack
db !none, !left, $82 ; facing left  - screw attack
db !end

Tr82: ; 82h: Facing left  - screw attack
db !shoot, !none, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !up|!shoot, $16 ; facing left  - normal jump - aiming up
db !none, !down|!shoot, $18 ; facing left  - normal jump - aiming down
db !none, !shoot|!aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !shoot|!aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !left|!jump, $82 ; facing left  - screw attack
db !none, !up, $16 ; facing left  - normal jump - aiming up
db !none, !aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !down, $18 ; facing left  - normal jump - aiming down
db !none, !left, $82 ; facing left  - screw attack
db !none, !right, $81 ; facing right - screw attack
db !end

Tr83: ; 83h: Facing right - wall jump
db !down, !none, $37 ; facing right - morphing transition
db !none, !left, $1A ; facing left  - spin jump
db !none, !aimUp, $69 ; facing right - normal jump - aiming up-right
db !none, !aimDown, $6B ; facing right - normal jump - aiming down-right
db !none, !shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !jump, $83 ; facing right - wall jump
db !end

Tr84: ; 84h: Facing left  - wall jump
db !down, !none, $38 ; facing left  - morphing transition
db !none, !right, $19 ; facing right - spin jump
db !none, !aimUp, $6A ; facing left  - normal jump - aiming up-left
db !none, !aimDown, $6C ; facing left  - normal jump - aiming down-left
db !none, !shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !jump, $84 ; facing left  - wall jump
db !end

Tr89: ; 89h: Facing right - ran into a wall
TrCF: ; CFh: Facing right - ran into a wall - aiming up-right
TrD1: ; D1h: Facing right - ran into a wall - aiming down-right
db !jump, !none, $4B ; facing right - normal jump transition
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !down, !none, $35 ; facing right - crouching transition
db !none, !left|!aimDown, $78 ; facing right - moonwalk - aiming down-right
db !none, !left|!aimUp, $76 ; facing right - moonwalk - aiming up-right
db !none, !up, $03 ; facing right - aiming up
db !none, !aimUp, $05 ; facing right - aiming up-right
db !none, !aimDown, $07 ; facing right - aiming down-right
db !none, !left, $25 ; facing right - turning - standing
db !none, !right, $09 ; moving right - not aiming
db !end

Tr8A: ; 8Ah: Facing left  - ran into a wall
TrD0: ; D0h: Facing left  - ran into a wall - aiming up-left
TrD2: ; D2h: Facing left  - ran into a wall - aiming down-left
db !jump, !none, $4C ; facing left  - normal jump transition
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !down, !none, $36 ; facing left  - crouching transition
db !none, !right|!aimDown, $77 ; facing left  - moonwalk - aiming down-left
db !none, !right|!aimUp, $75 ; facing left  - moonwalk - aiming up-left
db !none, !up, $04 ; facing left  - aiming up
db !none, !aimUp, $06 ; facing left  - aiming up-left
db !none, !aimDown, $08 ; facing left  - aiming down-left
db !none, !right, $26 ; facing left  - turning - standing
db !none, !left, $0A ; moving left  - not aiming
db !end

Tr8B: ; 8Bh: Facing right - turning - standing - aiming up
Tr8D: ; 8Dh: Facing right - turning - standing - aiming down-right
TrBF: ; BFh: Facing right - moonwalking - turn/jump left
TrC1: ; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right
TrC3: ; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right
db !jump, !left, $1A ; facing left  - spin jump
db !jump, !none, $4C ; facing left  - normal jump transition
db !end

Tr8C: ; 8Ch: Facing left  - turning - standing - aiming up
Tr8E: ; 8Eh: Facing left  - turning - standing - aiming down-left
TrC0: ; C0h: Facing left  - moonwalking - turn/jump right
TrC2: ; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left
TrC4: ; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left
db !jump, !right, $19 ; facing right - spin jump
db !jump, !none, $4B ; facing right - normal jump transition
db !end

TrBA: ; BAh: Facing left  - grabbed by Draygon - not moving - not aiming
TrBB: ; BBh: Facing left  - grabbed by Draygon - not moving - aiming up-left
TrBC: ; BCh: Facing left  - grabbed by Draygon - firing
TrBD: ; BDh: Facing left  - grabbed by Draygon - not moving - aiming down-left
TrBE: ; BEh: Facing left  - grabbed by Draygon - moving
db !none, !up|!left|!shoot, $BB ; facing left  - grabbed by Draygon - not moving - aiming up-left
db !none, !down|!left|!shoot, $BD ; facing left  - grabbed by Draygon - not moving - aiming down-left
db !none, !left|!shoot, $BC ; facing left  - grabbed by Draygon - firing
db !none, !aimUp, $BB ; facing left  - grabbed by Draygon - not moving - aiming up-left
db !none, !aimDown, $BD ; facing left  - grabbed by Draygon - not moving - aiming down-left
db !none, !shoot, $BC ; facing left  - grabbed by Draygon - firing
db !none, !left, $BE ; facing left  - grabbed by Draygon - moving
db !none, !right, $BE ; facing left  - grabbed by Draygon - moving
db !none, !up, $BE ; facing left  - grabbed by Draygon - moving
db !none, !down, $BE ; facing left  - grabbed by Draygon - moving
db !end

TrC7: ; C7h: Facing right - vertical shinespark windup
db !none, !down|!right|!jump, $CD ; facing right - shinespark - diagonal
db !none, !down|!jump, $CB ; facing right - shinespark - vertical
db !none, !jump|!aimDown, $CD ; facing right - shinespark - diagonal
db !none, !up|!right|!jump, $CD ; facing right - shinespark - diagonal
db !none, !up|!jump, $CB ; facing right - shinespark - vertical
db !none, !jump|!aimUp, $CD ; facing right - shinespark - diagonal
db !none, !right|!jump, $C9 ; facing right - shinespark - horizontal
db !end

TrC8: ; C8h: Facing left  - vertical shinespark windup
db !none, !down|!left|!aimUp, $CE ; facing left  - shinespark - diagonal
db !none, !down|!jump, $CC ; facing left  - shinespark - vertical
db !none, !jump|!aimDown, $CE ; facing left  - shinespark - diagonal
db !none, !up|!left|!aimUp, $CE ; facing left  - shinespark - diagonal
db !none, !up|!jump, $CC ; facing left  - shinespark - vertical
db !none, !jump|!aimUp, $CE ; facing left  - shinespark - diagonal
db !none, !left|!jump, $CA ; facing left  - shinespark - horizontal
db !end

TrDF: ; DFh: Unused
db !up, !none, $DE ; unused
db !end

TrEC: ; ECh: Facing right - grabbed by Draygon - not moving - not aiming
TrED: ; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right
TrEE: ; EEh: Facing right - grabbed by Draygon - firing
TrEF: ; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right
TrF0: ; F0h: Facing right - grabbed by Draygon - moving
db !none, !up|!right|!shoot, $ED ; facing right - grabbed by Draygon - not moving - aiming up-right
db !none, !down|!right|!shoot, $EF ; facing right - grabbed by Draygon - not moving - aiming down-right
db !none, !right|!shoot, $EE ; facing right - grabbed by Draygon - firing
db !none, !aimUp, $ED ; facing right - grabbed by Draygon - not moving - aiming up-right
db !none, !aimDown, $EF ; facing right - grabbed by Draygon - not moving - aiming down-right
db !none, !shoot, $EE ; facing right - grabbed by Draygon - firing
db !none, !left, $F0 ; facing right - grabbed by Draygon - moving
db !none, !right, $F0 ; facing right - grabbed by Draygon - moving
db !none, !up, $F0 ; facing right - grabbed by Draygon - moving
db !none, !down, $F0 ; facing right - grabbed by Draygon - moving
db !end

; animation delays
VerticalShinesparkAnimDelays:
db $08, $FF,
   $08, $FE,$01 ; downspark

%padSafe($91B010)

; animation delay pointers
org $91B010+2*$CB : dw VerticalShinesparkAnimDelays
org $91B010+2*$CC : dw VerticalShinesparkAnimDelays
