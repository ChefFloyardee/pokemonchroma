db DEX_HOOH ; pokedex id
db 106 ; base hp
db 130 ; base attack
db 90 ; base defense
db 90 ; base speed
db 154 ; base special
db FIRE ; species type 1
db FLYING  ; species type 2
db 3 ; catch rate
db 220 ; base exp yield
INCBIN "pic/bmon/ho_oh.pic",0,1 ; 77, sprite dimensions
dw HoOhPicFront
dw HoOhPicBack
; attacks known at lvl 0
db EMBER
db SKY_ATTACK
db 0
db 0
db 3 ; growth rate
; include learnset directly
	tmlearn 4,6
	tmlearn 10,15
	tmlearn 20,24
	tmlearn 25,26,31,32
	tmlearn 33,34,38,39
	tmlearn 42,43,44,45
	tmlearn 50,52,54,55
db BANK(HoOhPicFront)
