lorom ;The cause of the suit palette changing immediately after Varia/Gravity is collected is the PLMs giving Varia/Gravity, and Stage 3 of suit pickup (http://patrickjohnston.org/bank/index.html) also gives Varia/Gravity, this fixes that by making the PLMs not give Varia/Gravity so the suit palette changes at Stage 3.
org $84E2C1+$0009 ;Varia Suit
	dw $0000
org $84E2F6+$0009 ;Gravity Suit
	dw $0000
org $84E71E+$0009 ;Varia Suit Chozo Orb
	dw $0000
org $84E760+$0009 ;Gravity Suit Chozo Orb
	dw $0000
org $84EC28+$0009 ;Varia Suit Shot Block
	dw $0000
org $84EC70+$0009 ;Gravity Suit Shot Block
	dw $0000