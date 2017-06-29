db DEX_PUPITAR ; pokedex id
db 70 ; base hp
db 84 ; base attack
db 70 ; base defense
db 51 ; base speed
db 70 ; base special
db ROCK ; species type 1
db GROUND ; species type 2
db 45 ; catch rate
db 144 ; base exp yield
INCBIN "pic/bmon/pupitar.pic",0,1 ; 66, sprite dimensions
dw PupitarPicFront
dw PupitarPicBack
; attacks known at lvl 0
db TACKLE
db DEFENSE_CURL
db BITE
db 0
db 3 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 10,15
	tmlearn 20
	tmlearn 26,28,31,32
	tmlearn 34
	tmlearn 44,48
	tmlearn 50
db BANK(PupitarPicFront)
