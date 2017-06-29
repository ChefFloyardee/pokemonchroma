db DEX_SHUCKLE ; pokedex id
db 20 ; base hp
db 10 ; base attack
db 230 ; base defense
db 5 ; base speed
db 230 ; base special
db BUG ; species type 1
db ROCK ; species type 2
db 190 ; catch rate
db 80 ; base exp yield
INCBIN "pic/bmon/shuckle.pic",0,1 ; 66, sprite dimensions
dw ShucklePicFront
dw ShucklePicBack
; attacks known at lvl 0
db TACKLE
db HARDEN
db QUICK_ATTACK
db 0
db 5 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 9,10,11,12,13,14
	tmlearn 24
	tmlearn 25,29,30,31,32
	tmlearn 33,34,39,40
	tmlearn 44,45,46
	tmlearn 49,50,53,55
db BANK(ShucklePicFront)
