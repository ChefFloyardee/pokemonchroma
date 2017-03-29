ForestMons:
	db $08
	IF DEF(_RED)
		dbw 4,WEEDLE
		dbw 5,CATERPIE
		dbw 3,LEDYBA
		dbw 5,KAKUNA
		dbw 4,KAKUNA
		dbw 6,SPINARAK
		dbw 6,PICHU
		dbw 3,PICHU
	ENDC
	IF DEF(_BLUE)
		dbw 4,CATERPIE
		dbw 5,METAPOD
		dbw 3,CATERPIE
		dbw 5,CATERPIE
		dbw 4,METAPOD
		dbw 6,METAPOD
		dbw 4,KAKUNA
		dbw 3,WEEDLE
	ENDC
	dbw 5,BULBASAUR
	dbw 5,BULBASAUR
	db $00
