UnknownDungeon3Object:
	db $7d ; border block

	db $1 ; warps
	db $6, $3, $8, UNKNOWN_DUNGEON_1

	db $0 ; signs

	db $4 ; objects
	object SPRITE_SLOWBRO, $1b, $d, STAY, DOWN, $1, MEWTWO, 70 | OW_POKEMON
	object SPRITE_BALL, $10, $9, STAY, NONE, $2, ULTRA_BALL
	object SPRITE_BALL, $12, $1, STAY, NONE, $3, MAX_REVIVE
	object SPRITE_SLOWBRO, $1a, $d, STAY, DOWN, $4, MEW, 50 | OW_POKEMON

	; warp-to
	EVENT_DISP UNKNOWN_DUNGEON_3_WIDTH, $6, $3 ; UNKNOWN_DUNGEON_1
