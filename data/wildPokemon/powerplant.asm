PowerPlantMons:
	db $0A
	dbw 21,VOLTORB
	dbw 21,MAGNEMITE
	dbw 20,PIKACHU
	dbw 24,PIKACHU
	dbw 23,MAGNEMITE
	dbw 23,MAGNETON
	dbw 32,MAGNETON
	dbw 35,RAICHU
	IF DEF(_RED)
		dbw 33,ELECTABUZZ
		dbw 36,ELECTABUZZ
	ENDC
	IF DEF(_BLUE)
		dbw 33,RAICHU
		dbw 36,RAICHU
	ENDC
	db $00
