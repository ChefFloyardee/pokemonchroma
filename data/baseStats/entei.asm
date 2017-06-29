db DEX_ENTEI ; pokedex id
db 115 ; base hp
db 115 ; base attack
db 85 ; base defense
db 100 ; base speed
db 75 ; base special
db FIRE ; species type 1
db FIRE ; species type 2
db 3 ; catch rate
db 217 ; base exp yield
INCBIN "pic/bmon/entei.pic",0,1 ; 77, sprite dimensions
dw EnteiPicFront
dw EnteiPicBack
; attacks known at lvl 0
db TACKLE
db GROWL
db EMBER
db 0
db 5 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 10,15
	tmlearn 20
	tmlearn 28,31,32
	tmlearn 33,34,38,39
	tmlearn 44
	tmlearn 50,51,54,55
db BANK(EnteiPicFront)
