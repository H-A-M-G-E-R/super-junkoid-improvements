lorom

org $A58687 ; draygon goo palette fix when shot
LDX #$005E

;org $A5A1F7 : incbin "draygon palettes new.pal" ; draygon now has blood wand
;
;org $A586C5 ; load new palettes when initializing draygon
;PHX : LDX #$001E
;- : LDA $A277,x : STA $7EC2A0,x : DEX : DEX : BPL -
;PLX : BRA $00

org $A59654 ; fix standup when draygon dies that causes bluesuit glitch
LDA $0A5A : CMP #$E2A1 : BNE + ; If [timer / Samus hack handler] != grabbed by Draygon: return
  JSL $90E2D4 ; Release Samus from Draygon
  STZ $0A64 ; Grapple connected flags = 0
+
JSR $9701 ; Draygon health-based palette handling
RTL

;;; draygon does fuynny dance

org $A586A3
JSR DraygonSetupResetPositions

org $A5878B
JSR $87AA ; undo old hijack

org $A58791
JMP DraygonDoFunnyThings

org $A5875F : RTS

org $A5A0D9
DraygonSpawnDancingEvirs:
{
  LDY #$0004
  .loop
    LDA #$0010 : STA $12
    LDA #$0180 : STA $14
    LDA #$003B : STA $16
    LDA #$0E00 : STA $18
    JSL $B4BC26 ; spawn sprite object
    DEY : BNE .loop
  RTS
}

DraygonSetupResetPositions:
{
  LDX $0E54
  LDA $0F7A : STA $7E7800 ; left
  CLC : ADC #$02A0 : STA $7E7804 ; right
  LDA $0F7E : STA $7E7802 ; y
  ; position for dance
  LDA #$0010 : STA $0F7A
  LDA #$0180 : STA $0F7E
  LDA #$0018 : STA $7E781E ; initial swoop y accel
  RTS
}

assert pc() <= $A5A13E

org $A5FA00
DraygonDoFunnyThings:
{
  LDA $7E781E : LSR : LSR : LSR : LSR : TAX
  .loop
    PHX : JSR DraygonDoTheFunnyThing : PLX
    DEX : BNE .loop
  RTS
}

DraygonDoTheFunnyThing:
{
  LDA $7E880C : SEC : SBC #$0500 : BMI .notYet :  TAX ; dance index
  LDA $CE07,x : CMP #$8080 : BEQ .done
  AND #$00FF : JSL $A0AFEA : CLC : ADC $0F7A : STA $0F7A
  LDA $CE08,x : AND #$00FF : JSL $A0AFEA : CLC : ADC $0F7E : STA $0F7E
.notYet
  JMP $A13E ; evirs

.done
  LDA.w #DraygonFunc_FlyUpAfterFunnyThing : STA $0FA8
  RTS
}

DraygonFunc_FlyUpAfterFunnyThing:
{
  JSR $87AA ; Handle firing wall turret
  LDA $0F7E : SEC : SBC #$0004 : STA $0F7E
  BMI .done
  RTS

.done
  LDA #$0005 : JSL $808FC1 ; queue boss music
  JMP $9164
}
