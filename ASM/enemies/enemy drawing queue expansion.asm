; enemy drawing queue expansion
; by H A M
; Makes each enemy drawing queue entry take up 1 byte instead of 2, freeing up low RAM, and it can be used to expand the enemy drawing queue or use it for other purposes.
; No freespace used.

lorom

;Order of drawing (taken from PJ's banklogs):

;Sprite objects
;Bombs and projectile explosions
;High priority enemy projectiles
;Layer 0
;Layer 1
;Layer 2
;Samus
;Projectiles
;Layer 3
;Layer 4
;Layer 5
;Low priority enemy projectiles
;Layer 6
;Layer 7

!Layer0QueueSize = 16
!Layer1QueueSize = 16 ; was 1 like in vanilla
!Layer2QueueSize = 16
!Layer3QueueSize = 16 ; was 1 like in vanilla
!Layer4QueueSize = 16
!Layer5QueueSize = 32
!Layer6QueueSize = 16
!Layer7QueueSize = 16

assert !Layer0QueueSize+!Layer1QueueSize+!Layer2QueueSize+!Layer3QueueSize+!Layer4QueueSize+!Layer5QueueSize+!Layer6QueueSize+!Layer7QueueSize <= 228,"Enemy drawing queue is too big! Try making it smaller by changing the values!"
print "Freespace: $",hex($0E84+!Layer0QueueSize+!Layer1QueueSize+!Layer2QueueSize+!Layer3QueueSize+!Layer4QueueSize+!Layer5QueueSize+!Layer6QueueSize+!Layer7QueueSize,4),"..0F67" ; start of free RAM until and including $0F67

org $A0B133
EnemyDrawingQueueAddresses: ; that's the vanilla location
dw $0E84,
   $0E84+!Layer0QueueSize,
   $0E84+!Layer0QueueSize+!Layer1QueueSize,
   $0E84+!Layer0QueueSize+!Layer1QueueSize+!Layer2QueueSize,
   $0E84+!Layer0QueueSize+!Layer1QueueSize+!Layer2QueueSize+!Layer3QueueSize,
   $0E84+!Layer0QueueSize+!Layer1QueueSize+!Layer2QueueSize+!Layer3QueueSize+!Layer4QueueSize,
   $0E84+!Layer0QueueSize+!Layer1QueueSize+!Layer2QueueSize+!Layer3QueueSize+!Layer4QueueSize+!Layer5QueueSize,
   $0E84+!Layer0QueueSize+!Layer1QueueSize+!Layer2QueueSize+!Layer3QueueSize+!Layer4QueueSize+!Layer5QueueSize+!Layer6QueueSize
   
org $A09423 ; rewrite adding enemy to drawing queue
; X = [enemy index] before
LDA $0F9A,x : ASL : TAX ; X = [enemy layer] * 2 (carry is always cleared here) 
LDA EnemyDrawingQueueAddresses,x : ADC $0F68,x : TAY ; Y = [address of enemy drawing queue] + [size of enemy drawing queue]
LDA $0E54 : LSR #3 : SEP #$20 : STA $0000,y ; [Y] = [enemy index] >> 3 using 8-bit accumulator (always less than 100h)
INC $0F68,x ; Size of enemy drawing queue += 1 (using 8-bit A so it's faster)
REP #$20
RTS ; X = [enemy index] immediately after that so it's safe

org $A08880 ; rewrite handling the queue
LDA $0E32 : ASL : TAX ; X = [enemy layer] * 2
LDA $0F68,x : BEQ EXIT ; If [enemy drawing queue size] = 0: go to EXIT
LDY EnemyDrawingQueueAddresses,x ; Y = [address of enemy drawing queue]
-
LDA $0000,y : AND #$00FF : ASL #3 : STA $0E54 ; Enemy index = [[Y]] << 3
PHX : PHY : JSR $944A : PLY : PLX ; Write enemy OAM preserving X and Y
INY ; Y += 1
DEC $0F68,x ; Enemy drawing queue size -= 1
BNE - ; If [enemy drawing queue size] = 0: go to EXIT, else: go to -
BRA EXIT

org $A088B7
EXIT:
