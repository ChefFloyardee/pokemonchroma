Route13Mons:
	IF DEF(_RED)
		db $14
		dbw 24,ODDISH
		dbw 25,BELLSPROUT
		dbw 27,PIDGEY
		dbw 24,VENONAT
		dbw 22,WEEPINBELL
		dbw 26,GLOOM
		dbw 26,NOCTOWL
		dbw 25,DITTO
		dbw 28,FARFETCHD
		dbw 30,FARFETCHD
	ENDC
	IF DEF(_BLUE)
		db $14
		dbw 24,BELLSPROUT
		dbw 25,PIDGEY
		dbw 27,PIDGEY
		dbw 24,VENONAT
		dbw 22,BELLSPROUT
		dbw 26,VENONAT
		dbw 26,BELLSPROUT
		dbw 25,DITTO
		dbw 28,WEEPINBELL
		dbw 30,WEEPINBELL
	ENDC
	db $00
