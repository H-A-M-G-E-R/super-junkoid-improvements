;Originally made by MFreak (https://metroidconstruction.com/resource.php?id=524), modified by H A M for use with Super Junkoid
lorom

;--- Advanced Arm Cannon Palette - BASIC ---

;Advanced arm cannon palette changes samus's arm cannon palette depending on beam combination.
;In addition this patch also adds a beam glow effect on samus when shooting a beam projectile while charge beam is equipped.
;BASIC just changes arm cannon palette based on beams equipped.


;---------------------------------------Defines-----------------------------------------------------
;IMPORTANT DEFINES! DO NOT CHANGE!
!DPSourcePalette = $20
!DPSourcePaletteBank = $22
!DPSourcePositiveFading = $24
!DPSourceNegativeFading = $26

!ActionIndex = $0ACE		;used for various actions (speed boosting, shine sparking, etc.)
!ChargeIndex = $0B62		;used for charge glow when ready to fire up a fully charged shot
!DeathSequenceIndex = $12	;death palette index (0,2-8 ; 1 is flashing yellow)
!HeatGlowIndex = $1EEF		;used when FX flags 0 and 1 in norfair are set

!Numerator = $C400			;position of color transition
!ColorIndex = $C404			;cycle index for arm cannon palette change


;---------------------------------------Freespace---------------------------------------------------
;Can be changed to any bank with freespace
!BankFreeSpace = $9BCBFB		;main code for arm cannon palette
!BankCannonPalette = $9BD000	;arm cannon palettes


;---------------------------------------ArmCannonColor----------------------------------------------
;How many colors should be changed in samus palette set (range: $01-$04; default: $04)
!PaletteChangeAmount = $0004

;Which color of samus palette set should be changed (depends on !PaletteChangeAmount)
;(range: $00-$0F; $00 is the transparent palette and should be set for the other target palettes if unused)
!TargetPalette0 = $0D
!TargetPalette1 = $05
!TargetPalette2 = $08
!TargetPalette3 = $07


;---------------------------------------ColorChangeMethode------------------------------------------
;Here you can change the routine how the colors should be changed.
;	Transitional:	change color to a faded point between source and target
;	Fading:			have a fixed value added or subracted to a color

!Charge = Transitional
;Charge also used in death sequence
!HeatGlow = Fading
!SpeedBooster = Fading
;SpeedBooster also used when loading from save station
!Shine = Transitional
!ShineSpark = Fading
;ShineSpark also used in pseudo screw attack
!ScrewAttack = Fading

;Further information in "Target Colors / Index".


;---------------------------------------------------------------------------------------------------
;|x|									BANK $??		Cannon palette routine					 |x|
;---------------------------------------------------------------------------------------------------
{
ORG !BankFreeSpace
;For transitional:
;$20 = source palette pointer
;$22 = positive fading value (target color)
;$C400 = numerator
;$C402 = denumerator
;$C404 = colorindex

;For fading:
;$20 = source palette pointer
;$22 = positive fading value
;$24 = negative fading value
;$C404 = colorindex

ChargeSetup:
	PHB : PEA $7E7E : PLB : PLB
	LDA $0A6E : CMP #$0004 : BEQ PseudoScrewAttackSetup
	LDX !ChargeIndex : LDA.l ChargeNumeratorIndex,x : STA !Numerator	;set numerator
	LDA.l ChargePos,x : STA !DPSourcePositiveFading			;set positive fading value from charge
	JSR CannonPaletteOffsetFinder							;set source palette pointer
	JSR !Charge												;to "Transitional" or "Fading"
	PLB : CLC : RTL

;Pseudo screw attack uses shinespark palette
PseudoScrewAttackSetup:
	LDX !ChargeIndex : LDA.l PseudoScrewAttackNumeratorIndex,x : STA !Numerator
	LDA.l PseudoScrewAttackPos,x : STA !DPSourcePositiveFading
	JSR CannonPaletteOffsetFinder
	JSR !ShineSpark											;to "Transitional" or "Fading"
	PLB : CLC : RTL

DeathSetup:		;uses charge palette
	PHB : PEA $7E7E : PLB : PLB
	LDX !DeathSequenceIndex : CPX #$0002 : BEQ +			;if death frame index equals 2, return
	LDA.l DeathSequenceNumeratorIndex,x : STA !Numerator
	LDA.l DeathSequencePos,x : STA !DPSourcePositiveFading
	JSR CannonPaletteOffsetFinder
	JSR !Charge												;to "Transitional" or "Fading"
+ : PLB : CLC : RTL

SpeedBoosterSetup:
	PHB : PEA $7E7E : PLB : PLB
	LDX !ActionIndex : LDA.l SpeedBoosterNumeratorIndex,x : STA !Numerator
	LDA.l SpeedBoosterPos,x : STA !DPSourcePositiveFading
	JSR CannonPaletteOffsetFinder
	JSR !SpeedBooster										;to "Transitional" or "Fading"
	PLB : CLC : RTL

ShineSetup:
	PHB : PEA $7E7E : PLB : PLB
	LDX !ActionIndex : LDA.l ShineNumeratorIndex,x : STA !Numerator
	LDA.l ShinePos,x : STA !DPSourcePositiveFading
	JSR CannonPaletteOffsetFinder
	JSR !Shine												;to "Transitional" or "Fading"
	PLB : CLC : RTL

ShineSparkSetup:
	PHB : PEA $7E7E : PLB : PLB
	LDX !ActionIndex : LDA.l ShineSparkNumeratorIndex,x : STA !Numerator
	LDA.l ShineSparkPos,x : STA !DPSourcePositiveFading
	JSR CannonPaletteOffsetFinder
	JSR !ShineSpark											;to "Transitional" or "Fading"
	PLB : CLC : RTL

ScrewAttack:
	PHB : PEA $7E7E : PLB : PLB
	LDX !ActionIndex : LDA.l ScrewAttackNumeratorIndex,x : STA !Numerator
	LDA.l ScrewAttackPos,x : STA !DPSourcePositiveFading
	JSR CannonPaletteOffsetFinder
	JSR !ScrewAttack										;to "Transitional" or "Fading"
	PLB : CLC : RTL

LoadStationSetup:	;uses speed booster palette
	PHB : PEA $7E7E : PLB : PLB	: PHY : PHX
	TAX : STA !Numerator
	LDA.l LoadStationPos,x : STA !DPSourcePositiveFading
	JSR CannonPaletteOffsetFinder
	JSR !SpeedBooster									;to "Transitional" or "Fading"
	BRA FXReturn

FXHeatGlowSetup:
	PHB : PEA $7E7E : PLB : PLB	: PHY : PHX
	LDA !HeatGlowIndex : ASL : TAX : LDA.l HeatGlowNumeratorIndex,x : STA !Numerator
	LDA.l HeatGlowPos,x : STA !DPSourcePositiveFading
	JSR CannonPaletteOffsetFinder
	JSR !HeatGlow										;to "Transitional" or "Fading"
FXReturn:
	PLX : PLY : PLB
	CLC : RTL


;---------------------------------------Fading------------------------------------------------------
Fading:
	LDA !DPSourcePalette : BPL +
	LDX !DPSourcePositiveFading : TXA : AND #$001F : STA $00	;red component
	TXA : AND #$03E0 : STA $02									;green component
	TXA : AND #$7C00 : STA $04									;blue component
	TDC		;zero color index

- : STA !ColorIndex
	LDA [!DPSourcePalette] : JSR FadingColorCalculator

	;save color
	LDX !ColorIndex : LDA.l CannonPalettePosition,x
	TAX : TYA : STA $0000,x
	INC !DPSourcePalette : INC !DPSourcePalette
	LDA !ColorIndex : INC : INC : CMP #!PaletteChangeAmount*2 : BCC -

+ : STZ !Numerator : RTS
;$03,s = result
;$01,s = source color
FadingColorCalculator:
	PHA : PHA
	LDA !DPSourcePositiveFading : BEQ .return : BMI .minus		;skip addition, if fading value is zero or negative
;red +
	LDA $01,s : AND #$001F : CLC : ADC $00		;filter component of source and add with target
	CMP #$0020 : BCC + : LDA #$001F				;adjust if component value is over range
+ : STA $03,s									;save to result
;green +
	LDA $01,s : AND #$03E0 : CLC : ADC $02
	CMP #$0400 : BCC + : LDA #$03E0
+ : ORA $03,s : STA $03,s
;blue +
	LDA $01,s : AND #$7C00 : CLC : ADC $04
	BPL + : LDA #$7C00
+ : ORA $03,s : STA $03,s 						;final result
.return : PLA : PLY : RTS					;return [Y] = result color

.minus
;red -
	LDA $01,s : AND #$001F : SEC : SBC $00		;filter component of source and subtract with target
	BPL + : TDC									;set to zero if component value is negative
+ : STA $03,s									;save to result
;green -
	LDA $01,s : AND #$03E0 : SEC : SBC $02
	BPL + : TDC
+ : ORA $03,s : STA $03,s
;blue -
	LDA $01,s : AND #$7C00 : SEC : SBC $04
	BPL + : TDC
+ : ORA $03,s : STA $03,s 		;final result
	PLA : PLY : RTS					;return [Y] = result color


;---------------------------------------Transition--------------------------------------------------
;[A] = numerator
;Denumerator = 10h = 16

;Used for actions with transitional palette set
Transitional:
	LDA !DPSourcePalette : BPL +
	LDX !DPSourcePositiveFading : TXA : AND #$001F : STA $06
	TXA : LSR #2 : AND #$00F8 : STA $08
	TXA : AND #$7C00 : XBA : STA $0A
	TDC					;zero color index
- : STA !ColorIndex
	LDA [!DPSourcePalette] : TAX : LDY !DPSourcePositiveFading
	JSR TransitionalColorCalculator

	;save color
	LDX !ColorIndex : LDA.l CannonPalettePosition,x
	TAX : TYA : STA $0000,x
	INC !DPSourcePalette : INC !DPSourcePalette
	LDA !ColorIndex : INC : INC : CMP #!PaletteChangeAmount*2 : BCC -
	
+ : STZ !Numerator : RTS

;$01,s = source color
TransitionalColorCalculator:
	LDA !Numerator : BNE +				;if numerator is 0: 
	TXY : RTS							;result is source color
+ : CMP #$0010 : BCS +					;if numerator is over denominator: result is target color
	PHX
	
	LDY $06									;prepare target color red component
	LDA $01,s : AND #$001F : TAX			;prepare source color red component
	JSR TransitionalColorComponent
	STA $04										;save red component to result color
	
	LDY $08										;prepare target color green component
	LDA $01,s : LSR #2 : AND #$00F8 : TAX		;prepare source color green component
	JSR	TransitionalColorComponent : AND #$00F8 : ASL #2
	ORA $04 : STA $04							;add green component and save to result color
	
	LDY $0A								;prepare target color blue component
	LDA $01,s : AND #$7C00 : XBA : TAX	;prepare source color blue component
	JSR	TransitionalColorComponent : XBA : AND #$7C00
	ORA $04	: TAY								;add blue component and save to result color
	
	PLA
+ : RTS											;return [Y] = result color

TransitionalColorComponent:
	LDA !Numerator : STX $00 : CPY $00 : BCC ++ : STA $02 : TYA				;if target < source: branch
- : SEC : SBC $00 : XBA : ORA $02 : STA $004202 : NOP #2 : LDA $004216 : LSR #4 : CLC : ADC $00 : RTS			;(target - source) * numerator / denominator + source
++ : EOR #$000F : INC : STA $02		;numerator = denominator - numerator
	STY $00 : TXA : BRA -				;swap source and target


;---------------------------------------Target Colors / Index---------------------------------------

;Transitional	:used as target palette, only the pos points are used
;Fading			:add / subtract from source color
;The negative value only gets used by fading routine.
;Fading routine adds positive color values from *pos first, then subtracts them from *neg.

;SpriteSomething values

function rgb(red,green,blue) = red|(green<<5)|(blue<<10)

ChargePos: DW $7FFF, $7FFF, $7FFF, $7FFF, $7FFF, $7FFF		;$7FFF = (1F,1F,1F)
															;only the first 4 samus charge palette sets are used here

PseudoScrewAttackPos: DW rgb(22,22,8), rgb(22,22,8), rgb(22,22,8), $0000, $0000, $0000
																		;uses samus shine spark palette set

DeathSequencePos: DW $7FFF, $7FFF, $7FFF, $7FFF, $7FFF, $7FFF, $7FFF, $7FFF, $7FFF, $7FFF	;$7FFF = (1F,1F,1F)
																							;uses samus charge palette set

HeatGlowPos: DW rgb(0,0,0),
				rgb(1,0,0),
				rgb(1,0,0),
				rgb(2,0,0),
				rgb(2,0,0),
				rgb(3,0,0),
				rgb(3,0,0),
				rgb(5,0,0),
				rgb(5,0,0),
				rgb(3,0,0),
				rgb(3,0,0),
				rgb(2,0,0),
				rgb(2,0,0),
				rgb(1,0,0),
				rgb(1,0,0),
				rgb(1,0,0)

SpeedBoosterPos: DW rgb(0,0,0),rgb(0,0,10),rgb(0,5,20),rgb(2,12,30)	;the last color is floored down because 2 of the components (20,100,240) aren't divisible by 8

ShinePos: DW $7FFF, $7FFF, $7FFF, $7FFF, $7FFF, $7FFF			;$7FFF = (1F,1F,1F)

ShineSparkPos: DW rgb(0,0,0),rgb(8,8,4),rgb(13,13,0),rgb(22,22,8)

ScrewAttackPos: DW rgb(0,0,0),rgb(0,8,0),rgb(0,16,0),rgb(0,24,5),rgb(0,16,0),rgb(0,8,0)

LoadStationPos: DW rgb(0,0,0),rgb(0,0,10),rgb(0,5,15),rgb(0,10,15)

;These numerator index only get used by transitional routine.
;If these values equal or overextend the denumerator ($0010) the target color will be used.
ChargeNumeratorIndex:				;only the first 4 samus charge palette sets are used here
	DW $0000, $0002, $0004, $0006, $0004, $0002

PseudoScrewAttackNumeratorIndex:	;uses samus shine spark palette set
;	DW $0006, $0006, $0006, $0000, $0000, $0000

DeathSequenceNumeratorIndex:		;uses samus charge palette set
	DW $0000, $0000, $0002, $0004, $0006, $0008, $000A, $000C, $000E, $0010

HeatGlowNumeratorIndex:
;	DW $0000, $0002, $0002, $0004, $0004, $0006, $0006, $0008
;	DW $0008, $0006, $0006, $0004, $0004, $0002, $0002, $0000

SpeedBoosterNumeratorIndex:			;also used by load save station routine
;	DW $0000, $0002, $0004, $0006

ShineNumeratorIndex:
	DW $0000, $0004, $0008, $000C, $0008, $0004

ShineSparkNumeratorIndex:
;	DW $0000, $0002, $0004, $0006

ScrewAttackNumeratorIndex:
;	DW $0000, $0002, $0004, $0006, $0004, $0002


;---------------------------------------Misc.-------------------------------------------------------

UpdatePaletterAfterItemPickup:
	JSL $90AC8D		;update beam GFX (vanilla)
	JSL $91DEBA		;load normal samus palette with updated arm cannon palette
	RTL

CannonPaletteOffsetFinder:
	LDA $09A6 : AND #$000F : ASL : TAX : LDA.l BeamCannonPointer,x
	STA !DPSourcePalette										;save cannon color set pointer
	LDA.w #!BankCannonPalette>>16 : STA !DPSourcePaletteBank	;save cannon color bank
	RTS

BeamCannonPointer:
	DW $0000, Wave, Ice, Ice
	DW Spazer, Wave, Ice, Ice
	DW Plasma, Plasma, Ice, Ice
	DW Plasma, Plasma, Ice, Ice

CannonPalettePosition:
	DW !TargetPalette0*2+$C180, !TargetPalette1*2+$C180, !TargetPalette2*2+$C180, !TargetPalette3*2+$C180

PRINT pc
}

;---------------------------------------------------------------------------------------------------
;|x|									BANK $??		Arm cannon palette						 |x|
;---------------------------------------------------------------------------------------------------
{
ORG !BankCannonPalette		;Just storage for arm cannon palette
;Power:  DW $10E0, $2AC1, $1DA0, $3BE0
Ice:	DW $CA20, $F769, $E6EC, $FFED
Wave:	DW $800C, $8818, $8034, $801F
Spazer:	DW $CC51, $FDDF, $ED7D, $FE9F
Plasma:	DW $AE79, $8B1F, $9EBF, $835F
}
;---------------------------------------------------------------------------------------------------
;|x|									BANK $84		Update palette after item pickup		 |x|
;---------------------------------------------------------------------------------------------------

ORG $8488D8 : JSL UpdatePaletterAfterItemPickup

;---------------------------------------------------------------------------------------------------
;|x|									BANK $8D		FX										 |x|
;---------------------------------------------------------------------------------------------------
{ ;---doesn't need freespace, uses space of code which is unused---
;---this bank will be used when samus is in heated area or loads from save station---
;ORG $8DA9C5 : PADBYTE $FF : PAD $8DAAB9			;delete "unused data"
ORG $8DA9C5
LoadStation3:
	LDA #$0006 : BRA LoadStationBranch			;set index and run cannon palette routine
LoadStation2:
	LDA #$0004 : BRA LoadStationBranch
LoadStation1:
	LDA #$0002 : BRA LoadStationBranch
LoadStationDefault:
	LDA #$0000
LoadStationBranch:
	LDX $0A76 : BNE + : JSL LoadStationSetup	;skip arm cannon palette overwrite when loading game, if hyper beam is active
+ : JMP $C595									;(idk if this branch will ever be used, but if you want to save and load the game with hyper beam, it's there)
FXHeatGlow:
	LDA $0A76 : BNE + : JSL FXHeatGlowSetup		;skip arm cannon palette overwrite in heated areas, if hyper beam is active
+ : JMP $C595
	

;Samus loading - power suit
ORG $8DDB8B : DW LoadStationDefault
ORG $8DDBAF : DW LoadStation3
ORG $8DDBDA : DW LoadStationDefault
ORG $8DDBFE : DW LoadStation3
ORG $8DDC29 : DW LoadStationDefault
ORG $8DDC4D : DW LoadStation2
ORG $8DDC78 : DW LoadStationDefault
ORG $8DDC9C : DW LoadStation1
ORG $8DDCC4 : DW LoadStationDefault

;Samus loading - varia suit
ORG $8DDCF1 : DW LoadStationDefault
ORG $8DDD15 : DW LoadStation3
ORG $8DDD40 : DW LoadStationDefault
ORG $8DDD64 : DW LoadStation3
ORG $8DDD8F : DW LoadStationDefault
ORG $8DDDB3 : DW LoadStation2
ORG $8DDDDE : DW LoadStationDefault
ORG $8DDE02 : DW LoadStation1
ORG $8DDE2A : DW LoadStationDefault

;Samus loading - gravity suit
ORG $8DDE57 : DW LoadStationDefault
ORG $8DDE7B : DW LoadStation3
ORG $8DDEA6 : DW LoadStationDefault
ORG $8DDECA : DW LoadStation3
ORG $8DDEF5 : DW LoadStationDefault
ORG $8DDF19 : DW LoadStation2
ORG $8DDF44 : DW LoadStationDefault
ORG $8DDF68 : DW LoadStation1
ORG $8DDF90 : DW LoadStationDefault


;Samus in heat - power suit
ORG $8DE486 : DW FXHeatGlow
ORG $8DE4A8 : DW FXHeatGlow
ORG $8DE4CA : DW FXHeatGlow
ORG $8DE4EC : DW FXHeatGlow
ORG $8DE50E : DW FXHeatGlow
ORG $8DE530 : DW FXHeatGlow
ORG $8DE552 : DW FXHeatGlow
ORG $8DE574 : DW FXHeatGlow
ORG $8DE596 : DW FXHeatGlow
ORG $8DE5B8 : DW FXHeatGlow
ORG $8DE5DA : DW FXHeatGlow
ORG $8DE5FC : DW FXHeatGlow
ORG $8DE61E : DW FXHeatGlow
ORG $8DE640 : DW FXHeatGlow
ORG $8DE662 : DW FXHeatGlow
ORG $8DE684 : DW FXHeatGlow

;Samus in heat - varia suit
ORG $8DE6B2 : DW FXHeatGlow
ORG $8DE6D4 : DW FXHeatGlow
ORG $8DE6F6 : DW FXHeatGlow
ORG $8DE718 : DW FXHeatGlow
ORG $8DE73A : DW FXHeatGlow
ORG $8DE75C : DW FXHeatGlow
ORG $8DE77E : DW FXHeatGlow
ORG $8DE7A0 : DW FXHeatGlow
ORG $8DE7C2 : DW FXHeatGlow
ORG $8DE7E4 : DW FXHeatGlow
ORG $8DE806 : DW FXHeatGlow
ORG $8DE828 : DW FXHeatGlow
ORG $8DE84A : DW FXHeatGlow
ORG $8DE86C : DW FXHeatGlow
ORG $8DE88E : DW FXHeatGlow
ORG $8DE8B0 : DW FXHeatGlow

;Samus in heat - gravity suit
ORG $8DE8DE : DW FXHeatGlow
ORG $8DE900 : DW FXHeatGlow
ORG $8DE922 : DW FXHeatGlow
ORG $8DE944 : DW FXHeatGlow
ORG $8DE966 : DW FXHeatGlow
ORG $8DE988 : DW FXHeatGlow
ORG $8DE9AA : DW FXHeatGlow
ORG $8DE9CC : DW FXHeatGlow
ORG $8DE9EE : DW FXHeatGlow
ORG $8DEA10 : DW FXHeatGlow
ORG $8DEA32 : DW FXHeatGlow
ORG $8DEA54 : DW FXHeatGlow
ORG $8DEA76 : DW FXHeatGlow
ORG $8DEA98 : DW FXHeatGlow
ORG $8DEABA : DW FXHeatGlow
ORG $8DEADC : DW FXHeatGlow
}

;---------------------------------------------------------------------------------------------------
;|x|									BANK $91		Samus palette routine (hijack)			 |x|
;---------------------------------------------------------------------------------------------------
{ ;---doesn't need freespace, uses space of code which is no longer necessary---

;Normal palette after fired charged shot
ORG $91D71E : JSR NeutralSetup
;Charging up beam
ORG $91D77F : JSR MoveToChargeSetup
;Screw Attack
ORG $91DA2E : JSR MoveToScrewAttackSetup
;Speed Booster
ORG $91DA94 : JSR MoveToSpeedBoosterSetup
;Shine (speed booster shine)
ORG $91DAF3 : JSR MoveToShineSetup
;Shine Spark
ORG $91DB58 : JSR MoveToShineSparkSetup
;Cancel speed booster
ORG $91DE7A : JSR NeutralSetup
ORG $91DE82 : JSR NeutralSetup
ORG $91DE8A : JSR NeutralSetup
;Load Samus palette
ORG $91DED0 : JSR NeutralSetup
ORG $91DED8 : JSR NeutralSetup
ORG $91DEE0 : JSR NeutralSetup
;Door transition
ORG $91DEFC : JSR TargetSetup
ORG $91DF04 : JSR TargetSetup
ORG $91DF0C : JSR TargetSetup
;Obtaining hyper beam in Mother Brain's fight
;Preserve a vanilla quirk
ORG $91E5F0
LDA #$100B : STA $09A6 : STA $09A8	;set collected and equipped beams to charge+ice+wave+plasma
STA $0A76							;enable hyper beam
JSL UpdatePaletterAfterItemPickup	;update beam graphics and update suit palette
LDY #$E1F0 : JSL $8DC4E9			;spawn hyper beam palette fx
STZ $0DC0
CLC : RTS

;Samus source colour loader, used for:
;(hurtflash; cinamatic grayscale; hyper beam glow)
ORG $91DD5B
	PHB
	LDY #$C180 : LDA #$001F : MVN $9B7E
	PLB : RTS

NeutralSetup:
	PHB : PHY : LDY #$C180 : LDA #$001F : MVN $9B7E		;apply palette to samus ([X] is source)
	LDA $0A76 : BNE +									;skip arm cannon palette overwrite, if hyper beam is active
	LDA $09A6 : AND #$000F : ASL : TAX : LDA.l BeamCannonPointer,x : BPL + : TAX
	LDA.l !BankCannonPalette&$FF0000,x : STA.w !TargetPalette0*2+$C180
	LDA.l (!BankCannonPalette&$FF0000)+2,x : STA.w !TargetPalette1*2+$C180
	LDA.l (!BankCannonPalette&$FF0000)+4,x : STA.w !TargetPalette2*2+$C180
	LDA.l (!BankCannonPalette&$FF0000)+6,x : STA.w !TargetPalette3*2+$C180
+ : PLY : PLB : CLC : RTS
	
TargetSetup:									;target palettes are used for door transitions
	PHB : LDY #$C380 : LDA #$001F : MVN $9B7E	;apply to samus's target palette ([X] is source)
	LDA $0A76 : BNE +							;skip arm cannon palette overwrite, if hyper beam is active
	LDA $09A6 : AND #$000F : ASL : TAX : LDA.l BeamCannonPointer,x : BPL + : TAX
	LDA.l !BankCannonPalette&$FF0000,x : STA.w !TargetPalette0*2+$C380
	LDA.l (!BankCannonPalette&$FF0000)+2,x : STA.w !TargetPalette1*2+$C380
	LDA.l (!BankCannonPalette&$FF0000)+4,x : STA.w !TargetPalette2*2+$C380
	LDA.l (!BankCannonPalette&$FF0000)+6,x : STA.w !TargetPalette3*2+$C380
+ : PLB : CLC : RTS

;remaining freespace can be used for hijacks, now.
MoveToChargeSetup:
	JSR $DD5B
	JSL	ChargeSetup : RTS

MoveToSpeedBoosterSetup:
	JSR $DD5B
	LDA $0A76 : BNE + : JSL	SpeedBoosterSetup	;skip arm cannon palette overwrite, if hyper beam is active
+ : RTS											;only "charge" doesn't have it, because "charge" can never be triggered with hyper beam equipped.

MoveToShineSetup:
	JSR $DD5B
	LDA $0A76 : BNE + : JSL	ShineSetup
+ : RTS

MoveToShineSparkSetup:
	JSR $DD5B
	LDA $0A76 : BNE + : JSL	ShineSparkSetup
+ : RTS

MoveToScrewAttackSetup:
	JSR $DD5B
	LDA $0A76 : BNE + : JSL	ScrewAttack
+ : RTS

;PADBYTE $FF : PAD $91DE53		;delete original "Load Samus source/target colours"
}
;---------------------------------------------------------------------------------------------------
;|x|									BANK $9B		Death sequence							 |x|
;---------------------------------------------------------------------------------------------------
{ ;---doesn't need freespace, efficently compacted code of original code---
;ORG $9BB4B6 : PADBYTE $FF : PAD $9BB6D8
ORG $9BB48F	: JSR DeathSequencePaletteSet
ORG $9BB7B3	: JSR DeathSequencePaletteSet
ORG $9BB4B6
;First frame palette set
	PHP : REP #$30
	TDC : TAX : JSR DeathSequencePaletteSet
	;LDY #$0008 : JSR $B6D8
	LDY #$001E : JSR $B6D8 ;for SpriteSomething
	LDA $B823 : AND #$00FF : STA $0DE2
	STZ $0DE4 : STZ $0DE6
	JSR $B758			;go to death sequence subroutine
	PLP : RTS

DeathSequencePaletteSet:
	PHP : REP #$30
	STX !DeathSequenceIndex	;save death palette index
	LDY $0A74 : LDA DeathSequencePointer,y : TAY	;current suit
	LDA (!DeathSequenceIndex),y : TAX
	PHB : LDY #$C180 : LDA #$001F : MVN $9B7E : PLB	;set suit palette
	LDA $0A76 : BNE + : JSL DeathSetup				;skip arm cannon palette overwrite during death sequence, if hyper beam is active
+ : PHB : LDX #$C19F : LDY #$C1FF : LDA #$001F : MVP $7E7E : PLB	;set suitless samus palette (same as suit palette)
	PLP : RTS

DeathSequencePointer:
	DW $B7D3, $B7E7, $B7FB
DeathSequencePaletteSetLong:
PHB : PHK : PLB
JSR DeathSequencePaletteSet : PLB : RTL
}

org $82DBB2 ; Disable Black Falcon's arm cannon palette
LDA $09DA