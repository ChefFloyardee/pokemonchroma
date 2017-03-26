SilphCo3Object:
	db $2e ; border block

	db $a ; warps
	db $0, $1a, $1, SILPH_CO_2F
	db $0, $18, $0, SILPH_CO_4F
	db $0, $14, $0, SILPH_CO_ELEVATOR
	db $b, $17, $9, SILPH_CO_3F
	db $3, $3, $5, SILPH_CO_5F
	db $f, $3, $6, SILPH_CO_5F
	db $3, $1b, $3, SILPH_CO_2F
	db $b, $3, $3, SILPH_CO_9F
	db $b, $b, $4, SILPH_CO_7F
	db $f, $1b, $3, SILPH_CO_3F

	db $0 ; signs

	db $4 ; objects
	object SPRITE_LAPRAS_GIVER, $18, $8, STAY, NONE, $1 ; person
	object SPRITE_ROCKET, $14, $7, STAY, LEFT, $2, ROCKET, $19
	object SPRITE_OAK_AIDE, $7, $9, STAY, DOWN, $3, SCIENTIST, $4
	object SPRITE_BALL, $8, $5, STAY, NONE, $4, HYPER_POTION

	; warp-to
	EVENT_DISP SILPH_CO_3F_WIDTH, $0, $1a ; SILPH_CO_2F
	EVENT_DISP SILPH_CO_3F_WIDTH, $0, $18 ; SILPH_CO_4F
	EVENT_DISP SILPH_CO_3F_WIDTH, $0, $14 ; SILPH_CO_ELEVATOR
	EVENT_DISP SILPH_CO_3F_WIDTH, $b, $17 ; SILPH_CO_3F
	EVENT_DISP SILPH_CO_3F_WIDTH, $3, $3 ; SILPH_CO_5F
	EVENT_DISP SILPH_CO_3F_WIDTH, $f, $3 ; SILPH_CO_5F
	EVENT_DISP SILPH_CO_3F_WIDTH, $3, $1b ; SILPH_CO_2F
	EVENT_DISP SILPH_CO_3F_WIDTH, $b, $3 ; SILPH_CO_9F
	EVENT_DISP SILPH_CO_3F_WIDTH, $b, $b ; SILPH_CO_7F
	EVENT_DISP SILPH_CO_3F_WIDTH, $f, $1b ; SILPH_CO_3F
