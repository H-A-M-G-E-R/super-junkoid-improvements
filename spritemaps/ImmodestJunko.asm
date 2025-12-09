ImmodestJunkoGfx:
incbin "ImmodestJunko.gfx"

ImmodestJunkoPal:
incbin "ImmodestJunko.pal"

ImmodestJunkoLintSpritemap:
dw $0003 : db $F4,$81,$F8,$42,$21, $E4,$81,$F8,$40,$21, $04,$80,$F8,$44,$21

ImmodestJunkoRockSpritemap_Big:
dw $0001 : db $F8,$81,$F8,$46,$31

ImmodestJunkoRockSpritemap_Small:
dw $0001 : db $FC,$01,$FC,$48,$31

ImmodestJunkoLaserOam_Forward0:
dw $0004 : db $E1,$81,$FC,$64,$21, $F1,$81,$FC,$66,$21, $FF,$81,$FC,$66,$61, $0F,$80,$FC,$64,$61

ImmodestJunkoLaserOam_Forward1:
dw $0004 : db $E1,$81,$FC,$60,$21, $F1,$81,$FC,$62,$21, $FF,$81,$FC,$62,$61, $0F,$80,$FC,$60,$61

ImmodestJunkoLaserOam_SlightlyDown0:
dw $0006 : db $EB,$81,$FF,$4C,$21, $E3,$01,$07,$5B,$21, $FB,$01,$FF,$4E,$21, $03,$80,$F1,$4C,$E1, $13,$00,$F1,$5B,$E1, $FB,$01,$F9,$4E,$E1

ImmodestJunkoLaserOam_SlightlyDown1:
dw $0006 : db $E9,$81,$00,$49,$21, $E1,$01,$08,$58,$21, $F9,$01,$00,$4B,$21, $03,$80,$F1,$49,$E1, $13,$00,$F1,$58,$E1, $FB,$01,$F9,$4B,$E1

ImmodestJunkoLaserOam_Down0:
dw $0004 : db $E8,$81,$08,$6C,$21, $F2,$81,$FE,$6E,$21, $08,$80,$E8,$6C,$E1, $FE,$81,$F2,$6E,$E1

ImmodestJunkoLaserOam_Down1:
dw $0004 : db $E8,$81,$08,$68,$21, $F2,$81,$FE,$6A,$21, $08,$80,$E8,$68,$E1, $FE,$81,$F2,$6A,$E1
