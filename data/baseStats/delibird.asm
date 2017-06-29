db DEX_DELIBIRD ; pokedex id
db 45 ; base hp
db 55 ; base attack
db 45 ; base defense
db 75 ; base speed
db 45 ; base special
db ICE ; species type 1
db FLYING ; species type 2
db 45 ; catch rate
db 183 ; base exp yield
INCBIN "pic/bmon/delibird.pic",0,1 ; 66, sprite dimensions
dw DelibirdPicFront
dw DelibirdPicBack
; attacks known at lvl 0
db PECK
db SAND_ATTACK
db LEER
db 0
db 0 ; growth rate
; learnset
	tmlearn 2,3,4,6,8
	tmlearn 9,10
	tmlearn 20
	tmlearn 31,32
	tmlearn 33,34,39,40
	tmlearn 44
	tmlearn 50,51,52
db BANK(DelibirdPicFront)
