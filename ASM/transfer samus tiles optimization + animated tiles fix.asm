; Optimizes the Samus tile transfer routine so tiles are transfered only when they change, and fixes animated tiles when unpausing.
; Compatible with vanilla and SpriteSomething.
; Uses 1 byte at $3E.
lorom

; Samus tiles definition format:
;     aaaaaa nnnn NNNN
; where:
;     a: Source address
;     n: Part 1 size, n = 0 means no bytes are transferred (10000h bytes in vanilla)
;     N: Part 2 size, N = 0 means no bytes are transferred
org $809376
TransferSamusTiles:
LDX #$80 : STX $2115 ; VRAM address increment mode = 16-bit access
LDA #$1801 : STA $4310 ; DMA 1 control / target = 16-bit VRAM data write
LDX #$02 ; X = 2
LDA $0721 : BPL .nobottom ; If Samus bottom half tiles flagged for transfer: (SpriteSomething does bottom before top unlike vanilla)
STA $3C ; $3C = [Samus bottom half tiles definition]
LDY #$92 : STY $3E ; $3E low = $92
LDA #$6080 : STA $2116 ; VRAM address = $6080
LDA [$3C] : STA $4312 ; DMA 1 source address = [[$3C]]
TXY : LDA [$3C],y : STA $4314
INY : LDA [$3C],y : BEQ .nobottompart1 ; If [[$3C] + 3] != 0: (skip DMA transfer because if it is, it would transfer 10000h bytes which is bad)
STA $4315 ; DMA 1 size = [[$3C] + 3]
STX $420B ; Enable DMA 1
.nobottompart1
LDY #$05 : LDA [$3C],y : BEQ .nobottompart2 ; If [[$3C] + 5] != 0:
STA $4315 ; DMA 1 size = [[$3C] + 5]
LDA #$6180 : STA $2116 ; VRAM address = $6180
STX $420B ; Enable DMA 1
.nobottompart2
.nobottom
LDA $071F : BPL .notop ; If Samus top half tiles flagged for transfer:
STA $3C ; $3C = [Samus top half tiles definition]
LDY #$92 : STY $3E ; $3E low = $92
LDA #$6000 : STA $2116 ; VRAM address = $6000
LDA [$3C] : STA $4312 ; DMA 1 source address = [[$3C]]
TXY : LDA [$3C],y : STA $4314
INY : LDA [$3C],y : BEQ .notoppart1 ; If [[$3C] + 3] != 0:
STA $4315 ; DMA 1 size = [[$3C] + 3]
STX $420B ; Enable DMA 1
.notoppart1
LDY #$05 : LDA [$3C],y : BEQ .notoppart2 ; If [[$3C] + 5] != 0:
STA $4315 ; DMA 1 size = [[$3C] + 5]
LDA #$6100 : STA $2116 ; VRAM address = $6100
STX $420B ; Enable DMA 1
.notoppart2
.notop
RTS

ResetSamusTilesTransferFlags:
STZ $071F : STZ $0721 ; Samus tiles definitions = 0, clear Samus tiles transfer flags
LDA $909EAF : RTL ; Code that was hijacked at $91:E0E7

UnpauseAnimatedTiles:
LDX #$000A ; X = Ah (animated tiles object index)
.loop
LDA $1EF5,x : BEQ .nonexistent ; If [animated tiles object ID] != 0:
LDA $1F25,x : ORA #$8000 : STA $1F25,x ; Flag animated tiles object tiles for transfer
.nonexistent
DEX : DEX ; X -= 2 (next animated tiles object index)
BPL .loop ; If [X] >= 0: loop
LDA #$8000 : TSB $1EF1 ; Enable animated tiles objects
RTL

TransferAnimatedTiles:
LDA $1EF1 : BPL .disabled ; If animated tiles objects are disabled: return
LDY #$87 : STY $4314 ; DMA 1 source address bank = $87
LDX #$0A ; X = Ah (animated tiles object index)
LDY #$02 ; Y = 2
.loop
LDA $1EF5,x : BEQ .skip ; If [animated tiles object ID] != 0:
LDA $1F25,x : BPL .skip ; If animated tiles object tiles flagged for transfer:
STA $4312 ; DMA 1 source address = $87:0000 + [animated tiles object source address]
; DMA 1 control / target = 16-bit VRAM write (set by $809376)
LDA $1F31,x : STA $4315 ; DMA 1 size = [animated tiles object size]
LDA $1F3D,x : STA $2116 ; VRAM write address = [animated tiles object VRAM address]
; VRAM address increment mode = 16-bit access (set by $809376)
STY $420B ; Enable DMA 1
LDA $1F25,x : AND #$7FFF : STA $1F25,x ; Unflag animated tiles object tiles for transfer
.skip
DEX : DEX ; X -= 2 (next animated tiles object index)
BPL .loop ; If [X] >= 0: loop
.disabled
RTS

assert pc() <= $809459

org $91E0E7 : JSL ResetSamusTilesTransferFlags ; Hijack Samus initialization function
org $82895A : LDA #$8000 : TRB $071F : TRB $0721 ; Clear Samus tiles transfer flags
org $829392 : JSL UnpauseAnimatedTiles ; Instead of just enabling animated tiles objects when unpausing, do this
org $8095A4 : JSR TransferAnimatedTiles ; Repoint modified vanilla routine

org $928040
TAX : EOR $071F : ASL : BEQ + ; If [A] != [Samus top half tiles definition]:
BEQ $00 ; WDM crashes in SNES Classic/Canoe
STX $071F ; Samus top half tiles definition = [A], flag transfer for Samus top half tiles to VRAM
+

org $92807E
TAX : EOR $0721 : ASL : BEQ + ; If [A] != [Samus bottom half tiles definition]:
BEQ $00
STX $0721 ; Samus bottom half tiles definition = [A], flag transfer for Samus bottom half tiles to VRAM
+

org $82936A : BRA $01 ; Skip clearing Samus/beam tiles when unpausing
