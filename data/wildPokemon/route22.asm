Route22Mons:
	db $19
	IF DEF(_RED)
		dbw 3,RATTATA
		dbw 3,NIDORAN_M
		dbw 4,NIDORAN_F
		dbw 4,RATTATA
		dbw 4,MANKEY
		dbw 4,SPEAROW
		dbw 3,MANKEY
		dbw 5,CYNDAQUIL
		dbw 3,PONYTA
		dbw 4,PONYTA
	ENDC
	IF DEF(_BLUE)
		dbw 3,RATTATA
		dbw 3,NIDORAN_F
		dbw 4,RATTATA
		dbw 4,NIDORAN_F
		dbw 2,RATTATA
		dbw 2,NIDORAN_F
		dbw 3,SPEAROW
		dbw 5,SPEAROW
		dbw 3,NIDORAN_M
		dbw 4,NIDORAN_M
	ENDC
	db $00
