; Audio from "25 Hamburger Sound Variations in 60 Seconds" by Memetastic (https://www.youtube.com/watch?v=twukbnr9nrk)

; tick_len_ms = 2
; beat_len_ticks = 48 (addmusic)
; beat_len_ms_max_tempo = beat_len_ticks * tick_len_ms = 96
; max_bpm = 60000 / beat_len_ms_max_tempo = 625
; bpm = 625 * tempo / 256 = tempo * 625 / 256
; tempo = bpm * 256 / 625
asar 1.91
norom : org 0
incsrc "../defines.asm"

spcblock 6*$16+!p_instrumentTable nspc ; instruments
  ;db $16,$FF,$E0,$80,$01,$EA
  db $16,$FF,$E0,$80,$02,$DF
endspcblock

spcblock 4*$16+!p_sampleTable nspc ; sample table
  dw Sample,Sample
endspcblock

spcblock !p_songSpecificData nspc
  ;Sample: incbin "H_A_M_mono_8k.brr"
  Sample: incbin "H_A_M_mono_12k.brr"

dw 0,0,0,0 ; padding for shared trackers
Trackers:
  dw Tracker2A50

Tracker2A50:
  dw .pattern0
  dw $0000

.pattern0: dw .pattern0_0, 0, 0, 0, 0, 0, 0, 0

.pattern0_0
  !endEcho
  !musicVolume,255
  !tempo,24;24.576 or 60 bpm
  !setDPMiscCommand,!musicTempo,147;0.576*256
  !setDPMiscCommand,!noteEndInTicks,1
  !volume,255
  !instr,$16
  db 48,$7F
  !c5
  !tie
  !tie
  !tie
  !tie
  !tie
  !end
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock execute !p_spcEngine
