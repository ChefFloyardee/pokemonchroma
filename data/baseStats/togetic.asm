db DEX_TOGETIC ; pokedex id
db 55 ; base hp
db 40 ; base attack
db 85 ; base defense
db 40 ; base speed
db 105 ; base special
db FAIRY ; species type 1
db FLYING ; species type 2
db 75 ; catch rate
db 114 ; base exp yield
INCBIN "pic/bmon/togetic.pic",0,1 ; 77, sprite dimensions
dw TogeticPicFront
dw TogeticPicBack
; attacks known at lvl 0
db POUND
db 0
db 0
db 0
db 3 ; growth rate
; learnset
    tmlearn 1,6,8
	tmlearn 10,15
	tmlearn 18,22
	tmlearn 29,31,32
	tmlearn 35,38,39
	tmlearn 42,43,44,45
	tmlearn 49,52,55
db BANK(TogeticPicFront)
