Route4Mons:
	db $14
	IF DEF(_RED)
		db 10,RATTATA
		db 10,SPEAROW
		db 8,EKANS
		db 6,SANDSHREW
		db 8,MANKEY
		db 10,SANDSHREW
		db 12,MANKEY
		db 12,SPEAROW
		db 8,SQUIRTLE
		db 8,SQUIRTLE
	ENDC
	IF DEF(_BLUE)
		db 10,RATTATA
		db 10,SPEAROW
		db 8,RATTATA
		db 6,SANDSHREW
		db 8,SPEAROW
		db 10,SANDSHREW
		db 12,RATTATA
		db 12,SPEAROW
		db 8,SANDSHREW
		db 12,SANDSHREW
	ENDC
	db $00
