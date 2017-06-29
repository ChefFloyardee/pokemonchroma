db DEX_DONPHAN ; pokedex id
db 90 ; base hp
db 120 ; base attack
db 120 ; base defense
db 50 ; base speed
db 60 ; base special
db GROUND ; species type 1
db GROUND ; species type 2
db 60 ; catch rate
db 189 ; base exp yield
INCBIN "pic/bmon/donphan.pic",0,1 ; 77, sprite dimensions
dw DonphanPicFront
dw DonphanPicBack
; attacks known at lvl 0
db GROWL
db TACKLE
db STOMP
db DEFENSE_CURL
db 5 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 9,10,12
	tmlearn 18,20
	tmlearn 26,27,31,32
	tmlearn 34,40
	tmlearn 44,48
	tmlearn 50,54
db BANK(DonphanPicFront)
