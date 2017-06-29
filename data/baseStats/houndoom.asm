db DEX_HOUNDOOM ; pokedex id
db 75 ; base hp
db 90 ; base attack
db 50 ; base defense
db 95 ; base speed
db 110 ; base special
db DARK ; species type 1
db FIRE ; species type 2
db 75 ; catch rate
db 213 ; base exp yield
INCBIN "pic/bmon/houndoom.pic",0,1 ; 77, sprite dimensions
dw HoundoomPicFront
dw HoundoomPicBack
; attacks known at lvl 0
db EMBER
db LEER
db ROAR
db SMOG
db 5 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 10
	tmlearn 18,20
	tmlearn 31,32
	tmlearn 34,38,39
	tmlearn 44
	tmlearn 50
db BANK(HoundoomPicFront)
