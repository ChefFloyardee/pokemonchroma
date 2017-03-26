Route2Mons:
	db $19
	dbw 3,RATTATA
	dbw 3,PIDGEY
	dbw 4,HOOTHOOT
	dbw 4,CATERPIE
	dbw 5,LEDYBA
	if DEF(_RED)
		dbw 3,WEEDLE
	ENDC
	if DEF(_BLUE)
		dbw 3,CATERPIE
	ENDC
	dbw 4,SPINARAK
	dbw 5,CHIKORITA
	if DEF(_RED)
		dbw 4,WEEDLE
		dbw 5,WEEDLE
	ENDC
	if DEF(_BLUE)
		dbw 4,CATERPIE
		dbw 5,CATERPIE
	ENDC
	db $00
