ZoneMonsCenter:
	db $1E
	IF DEF(_RED)
		db 22,NIDORAN_M
		db 25,RHYHORN
		db 22,VENONAT
		db 24,EXEGGCUTE
		db 31,VENOMOTH
		db 25,NIDORINA
		db 31,SCYTHER
		db 30,PINSIR
		db 23,CHANSEY
		db 23,CHANSEY
	ENDC
	IF DEF(_BLUE)
		db 22,NIDORAN_F
		db 25,RHYHORN
		db 22,VENONAT
		db 24,EXEGGCUTE
		db 31,NIDORINA
		db 25,EXEGGCUTE
		db 31,NIDORINO
		db 30,PARASECT
		db 23,PINSIR
		db 23,CHANSEY
	ENDC
	db $00
