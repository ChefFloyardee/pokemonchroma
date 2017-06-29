db DEX_REMORAID ; pokedex id
db 35 ; base hp
db 65 ; base attack
db 35 ; base defense
db 65 ; base speed
db 35 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 190 ; catch rate
db 78 ; base exp yield
INCBIN "pic/bmon/remoraid.pic",0,1 ; 66, sprite dimensions
dw RemoraidPicFront
dw RemoraidPicBack
; attacks known at lvl 0
db TACKLE
db FOCUS_ENERGY
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 6
	tmlearn 9,10,11,12,13,14
	tmlearn 20
	tmlearn 30,31,32
	tmlearn 33,34,36,39
	tmlearn 44,47
	tmlearn 49,50,53
db BANK(RemoraidPicFront)
