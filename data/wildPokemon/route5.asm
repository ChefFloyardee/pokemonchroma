Route5Mons:
	db $0F
	IF DEF(_RED)
		db 13,ODDISH
		db 13,BELLSPROUT
		db 15,HOOTHOOT
		db 10,MANKEY
		db 12,MEOWTH
		db 15,MANKEY
		db 16,MEOWTH
		db 16,AIPOM
		db 14,TOGEPI
		db 16,TOGEPI
	ENDC
	IF DEF(_BLUE)
		db 13,BELLSPROUT
		db 13,PIDGEY
		db 15,PIDGEY
		db 10,MEOWTH
		db 12,MEOWTH
		db 15,BELLSPROUT
		db 16,BELLSPROUT
		db 16,PIDGEY
		db 14,MEOWTH
		db 16,MEOWTH
	ENDC
	db $00