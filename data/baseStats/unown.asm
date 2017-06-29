db DEX_UNOWN ; pokedex id
db 48 ; base hp
db 72 ; base attack
db 48 ; base defense
db 48 ; base speed
db 48 ; base special
db PSYCHIC ; species type 1
db PSYCHIC ; species type 2
db 225 ; catch rate
db 61 ; base exp yield
INCBIN "pic/bmon/unown.pic",0,1 ; 55, sprite dimensions
dw UnownPicFront
dw UnownPicBack
; attacks known at lvl 0
db AMNESIA
db METRONOME
db TACKLE
db QUICK_ATTACK
db 3 ; growth rate
; include learnset directly
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
	tmlearn 0
db BANK(UnownPicFront)
