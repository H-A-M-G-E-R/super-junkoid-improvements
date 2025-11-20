lorom

org $82C385
; Save icon
dw $0001, $0001 : db $FF : dw $208C
; Boss icon
dw $0001, $0000 : db $FF : dw $208A
; Energy station icon
dw $0001, $0001 : db $FF : dw $208D
; Missile station icon
dw $0001, $0001 : db $00 : dw $208B
; Map station icon
dw $0001, $0001 : db $FF : dw $208E
; Debug elevator icon
dw $0001, $0000 : db $FF : dw $208F
; ?
dw $0001, $0000 : db $FF : dw $20B8
org $82CF7C
; Map cursor
dw $0004, $0004 : db $03 : dw $EEAF,
          $01FC : db $03 : dw $AEAF,
		  $0004 : db $FB : dw $6EAF,
		  $01FC : db $FB : dw $2EAF
dw $0004, $0005 : db $04 : dw $EEAF,
          $01FB : db $04 : dw $AEAF,
		  $0005 : db $FA : dw $6EAF,
		  $01FB : db $FA : dw $2EAF
dw $0004, $0006 : db $05 : dw $EEAF,
          $01FA : db $05 : dw $AEAF,
		  $0006 : db $F9 : dw $6EAF,
		  $01FA : db $F9 : dw $2EAF
; Boss cross-out icon
dw $0004, $0003 : db $03 : dw $EE9F,
          $0003 : db $FB : dw $6E9F,
		  $01FC : db $03 : dw $AE9F,
		  $01FC : db $FB : dw $2E9F
; Gunship icon
;dw $0002, $0004 : db $FD : dw $6E8F,
;          $01FC : db $FD : dw $2E8F