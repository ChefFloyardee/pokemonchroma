_AddPartyMon:
; Adds a new mon to the player's or enemy's party.
; [wMonDataLocation] is used in an unusual way in this function.
; If the lower nybble is 0, the mon is added to the player's party, else the enemy's.
; If the entire value is 0, then the player is allowed to name the mon.
	ld de, wPartyCount
	ld a, [wMonDataLocation]
	and $f
	jr z, .next
	ld de, wEnemyPartyCount
.next
	ld a, [de]
	inc a
	cp PARTY_LENGTH + 1
	ret nc ; return if the party is already full
	ld [de], a
	ld a, [de]
	ld [hNewPartyLength], a
	sla a
	dec de
	add e
	ld e, a
	jr nc, .noCarry
	inc d
.noCarry
	ld a, [wcf91]
	ld [de], a
 	inc de
 	ld a, [wcf91 + 1]
	ld [de], a ; write species of new mon in party list
	inc de
	ld a, $ff ; terminator
	ld [de], a
	inc de
 	ld a, $ff ; terminator
 	ld [de], a
	ld hl, wPartyMonOT
	ld a, [wMonDataLocation]
	and $f
	jr z, .next2
	ld hl, wEnemyMonOT
.next2
	ld a, [hNewPartyLength]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
	ld a, [wMonDataLocation]
	and a
	jr nz, .skipNaming
	ld hl, wPartyMonNicks
	ld a, [hNewPartyLength]
	dec a
	call SkipFixedLengthTextEntries
	ld a, NAME_MON_SCREEN
	ld [wNamingScreenType], a
	predef AskName
.skipNaming
	ld hl, wPartyMons
	ld a, [wMonDataLocation]
	and $f
	jr z, .next3
	ld hl, wEnemyMons
.next3
	ld a, [hNewPartyLength]
	dec a
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld e, l
	ld d, h
	push hl
	ld a, [wcf91]
	ld [wd0b5], a
	ld a, [wcf91 + 1]
	ld [wd0b5 + 1], a
	call GetMonHeader
	ld hl, wMonHeader
	ld a, [hli]
	ld [de], a
 	inc de
 	ld a, [hli]
	ld [de], a ; species
	inc de
	pop hl
	push hl
	ld a, [wMonDataLocation]
	and $f
	ld a, $98     ; set enemy trainer mon IVs to fixed average values
	ld b, $88
	jr nz, .next4

; If the mon is being added to the player's party, update the pokedex.
	ld a, [wcf91]
	ld [wd11e], a
	ld a, [wcf91 + 1]
	ld [wd11e + 1], a
	push de
	predef IndexToPokedex
	pop de
	push de
	ld a, [wd11e]
	ld e, a
	ld a, [wd11e + 1]
	ld d, a
	dec de
	ld hl, wPokedexOwned
	call Test16BitFlag
	ld a, c ; whether the mon was already flagged as owned
	ld [wUnusedD153], a ; not read
	ld a, [wd11e]
	ld e, a
 	ld a, [wd11e + 1]
 	ld d, a
 	dec de
 	ld hl, wPokedexOwned
 	call Set16BitFlag
	ld hl, wPokedexSeen
	call Set16BitFlag
	pop de
	pop hl
	push hl

	ld a, [wIsInBattle]
	and a ; is this a wild mon caught in battle?
	jr nz, .copyEnemyMonData

; Not wild.
	call Random ; generate random IVs
	ld b, a
	call Random

.next4
	push bc
	ld bc, wPartyMon1DVs - wPartyMon1
	add hl, bc
	pop bc
	ld [hli], a
	ld [hl], b         ; write IVs
	ld bc, (wPartyMon1HPExp - 1) - (wPartyMon1DVs + 1)
	add hl, bc
	ld a, 1
	ld c, a
	xor a
	ld b, a
	call CalcStat      ; calc HP stat (set cur Hp to max HP)
	ld a, [H_MULTIPLICAND+1]
	ld [de], a
	inc de
	ld a, [H_MULTIPLICAND+2]
	ld [de], a
	inc de
	xor a
	ld [de], a         ; box level
	inc de
	ld [de], a         ; status ailments
	inc de
	jr .copyMonTypesAndMoves
.copyEnemyMonData
	ld bc, wEnemyMon1DVs - wEnemyMon1
	add hl, bc
	ld a, [wEnemyMonDVs] ; copy IVs from cur enemy mon
	ld [hli], a
	ld a, [wEnemyMonDVs + 1]
	ld [hl], a
	ld a, [wEnemyMonHP]    ; copy HP from cur enemy mon
	ld [de], a
	inc de
	ld a, [wEnemyMonHP+1]
	ld [de], a
	inc de
	xor a
	ld [de], a                ; box level
	inc de
	ld a, [wEnemyMonStatus]   ; copy status ailments from cur enemy mon
	ld [de], a
	inc de
.copyMonTypesAndMoves
	ld hl, wMonHTypes
	ld a, [hli]       ; type 1
	ld [de], a
	inc de
	ld a, [hli]       ; type 2
	ld [de], a
	inc de
	ld a, [hli]       ; catch rate (held item in gen 2)
	ld [de], a
	ld hl, wMonHMoves
	ld a, [hli]
	inc de
	push de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	ld a, [hli]
	inc de
	ld [de], a
	push de
	dec de
	dec de
	dec de
	xor a
	ld [wLearningMovesFromDayCare], a
	predef WriteMonMoves
	pop de
	ld a, [wPlayerID]  ; set trainer ID to player ID
	inc de
	ld [de], a
	ld a, [wPlayerID + 1]
	inc de
	ld [de], a
	push de
	ld a, [wCurEnemyLVL]
	ld d, a
	callab CalcExperience
	pop de
	inc de
	ld a, [hExperience] ; write experience
	ld [de], a
	inc de
	ld a, [hExperience + 1]
	ld [de], a
	inc de
	ld a, [hExperience + 2]
	ld [de], a
	xor a
	ld b, NUM_STATS * 2
.writeEVsLoop              ; set all EVs to 0
	inc de
	ld [de], a
	dec b
	jr nz, .writeEVsLoop
	inc de
	inc de
	pop hl
	call AddPartyMon_WriteMovePP
	inc de
	ld a, [wCurEnemyLVL]
	ld [de], a
	inc de
	ld a, [wIsInBattle]
	dec a
	jr nz, .calcFreshStats
	ld hl, wEnemyMonMaxHP
	ld bc, $a
	call CopyData          ; copy stats of cur enemy mon
	pop hl
	jr .done
.calcFreshStats
	pop hl
	ld bc, wPartyMon1HPExp - 1 - wPartyMon1
	add hl, bc
	ld b, $0
	call CalcStats         ; calculate fresh set of stats
.done
	scf
	ret

LoadMovePPs:
	call GetPredefRegisters
	; fallthrough
AddPartyMon_WriteMovePP:
	ld b, NUM_MOVES
.pploop
	ld a, [hli]     ; read move ID
	and a
	jr z, .empty
	dec a
	push hl
	push de
	push bc
	ld hl, Moves
	ld bc, MoveEnd - Moves
	call AddNTimes
	ld de, wcd6d
	ld a, BANK(Moves)
	call FarCopyData
	pop bc
	pop de
	pop hl
	ld a, [wcd6d + 5] ; PP is byte 5 of move data
.empty
	inc de
	ld [de], a
	dec b
	jr nz, .pploop ; there are still moves to read
	ret

; adds enemy mon [wcf91] (at position [wWhichPokemon] in enemy list) to own party
; used in the cable club trade center
_AddEnemyMonToPlayerParty:
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	scf
	ret z            ; party full, return failure
	inc a
	ld [hl], a       ; add 1 to party members
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [wcf91]
	ld [hli], a
 	ld a, [wcf91 + 1]
	ld [hli], a      ; add mon as last list entry
	ld [hl], $ff     ; write new sentinel
	ld hl, wPartyMons
	ld a, [wPartyCount]
	dec a
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wLoadedMon
	call CopyData    ; write new mon's data (from wLoadedMon)
	ld hl, wPartyMonOT
	ld a, [wPartyCount]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, wEnemyMonOT
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld bc, NAME_LENGTH
	call CopyData    ; write new mon's OT name (from an enemy mon)
	ld hl, wPartyMonNicks
	ld a, [wPartyCount]
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
	ld hl, wEnemyMonNicks
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
	ld bc, NAME_LENGTH
	call CopyData    ; write new mon's nickname (from an enemy mon)
	ld a, [wcf91]
	ld [wd11e], a
	ld a, [wcf91 + 1]
 	ld [wd11e + 1], a
	predef IndexToPokedex
	ld a, [wd11e]
	ld e, a
 	ld a, [wd11e + 1]
 	ld d, a
 	dec de
	ld hl, wPokedexOwned
	call Set16BitFlag ; add to owned pokemon
	ld hl, wPokedexSeen
	call Set16BitFlag ; add to seen pokemon
	and a
	ret                  ; return success

_MoveMon:
	ld a, [wMoveMonType]
	and a
	jr z, .checkPartyMonSlots
	cp DAYCARE_TO_PARTY
	jr z, .checkPartyMonSlots
	cp PARTY_TO_DAYCARE
	ld hl, wDayCareMon
	jr z, .asm_f575
	ld hl, wNumInBox
	ld a, [hl]
	cp MONS_PER_BOX
	jr nz, .partyOrBoxNotFull
	jr .boxFull
.checkPartyMonSlots
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jr nz, .partyOrBoxNotFull
.boxFull
	scf
	ret
.partyOrBoxNotFull
	inc a
	ld [hl], a           ; increment number of mons in party/box
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [wMoveMonType]
	cp DAYCARE_TO_PARTY
	ld a, [wDayCareMon]
	ld c, a
 	ld a, [wDayCareMon + 1]
 	ld b, a
	jr z, .asm_f556
	ld a, [wcf91]
	ld c, a
 	ld a, [wcf91 + 1]
 	ld b, a
.asm_f556
	ld a, c
 	ld [hli], a
 	ld a, b
	ld [hli], a          ; write new mon ID
	ld [hl], $ff         ; write new sentinel
	inc hl
	ld [hl], $ff
	ld a, [wMoveMonType]
	dec a
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1 ; $2c
	ld a, [wPartyCount]
	jr nz, .skipToNewMonEntry
	ld hl, wBoxMons
	ld bc, wBoxMon2 - wBoxMon1 ; $21
	ld a, [wNumInBox]
.skipToNewMonEntry
	dec a
	call AddNTimes
.asm_f575
	push hl
	ld e, l
	ld d, h
	ld a, [wMoveMonType]
	and a
	ld hl, wBoxMons
	ld bc, wBoxMon2 - wBoxMon1 ; $21
	jr z, .asm_f591
	cp DAYCARE_TO_PARTY
	ld hl, wDayCareMon
	jr z, .asm_f597
	ld hl, wPartyMons
	ld bc, wPartyMon2 - wPartyMon1 ; $2c
.asm_f591
	ld a, [wWhichPokemon]
	call AddNTimes
.asm_f597
	push hl
	push de
	ld bc, wBoxMon2 - wBoxMon1
	call CopyData
	pop de
	pop hl
	ld a, [wMoveMonType]
	and a
	jr z, .asm_f5b4
	cp DAYCARE_TO_PARTY
	jr z, .asm_f5b4
	ld bc, wBoxMon2 - wBoxMon1
	add hl, bc
	ld a, [hl]
	inc de
	inc de
	inc de
	inc de
	ld [de], a
.asm_f5b4
	ld a, [wMoveMonType]
	cp PARTY_TO_DAYCARE
	ld de, wDayCareMonOT
	jr z, .asm_f5d3
	dec a
	ld hl, wPartyMonOT
	ld a, [wPartyCount]
	jr nz, .asm_f5cd
	ld hl, wBoxMonOT
	ld a, [wNumInBox]
.asm_f5cd
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
.asm_f5d3
	ld hl, wBoxMonOT
	ld a, [wMoveMonType]
	and a
	jr z, .asm_f5e6
	ld hl, wDayCareMonOT
	cp DAYCARE_TO_PARTY
	jr z, .asm_f5ec
	ld hl, wPartyMonOT
.asm_f5e6
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
.asm_f5ec
	ld bc, NAME_LENGTH
	call CopyData
	ld a, [wMoveMonType]
	cp PARTY_TO_DAYCARE
	ld de, wDayCareMonName
	jr z, .asm_f611
	dec a
	ld hl, wPartyMonNicks
	ld a, [wPartyCount]
	jr nz, .asm_f60b
	ld hl, wBoxMonNicks
	ld a, [wNumInBox]
.asm_f60b
	dec a
	call SkipFixedLengthTextEntries
	ld d, h
	ld e, l
.asm_f611
	ld hl, wBoxMonNicks
	ld a, [wMoveMonType]
	and a
	jr z, .asm_f624
	ld hl, wDayCareMonName
	cp DAYCARE_TO_PARTY
	jr z, .asm_f62a
	ld hl, wPartyMonNicks
.asm_f624
	ld a, [wWhichPokemon]
	call SkipFixedLengthTextEntries
.asm_f62a
	ld bc, NAME_LENGTH
	call CopyData
	pop hl
	ld a, [wMoveMonType]
	cp PARTY_TO_BOX
	jr z, .asm_f664
	cp PARTY_TO_DAYCARE
	jr z, .asm_f664
	push hl
	srl a
	add $2
	ld [wMonDataLocation], a
	call LoadMonData
	callba CalcLevelFromExperience
	ld a, d
	ld [wCurEnemyLVL], a
	pop hl
	ld bc, wBoxMon2 - wBoxMon1
	add hl, bc
	ld [hli], a
	ld d, h
	ld e, l
	ld bc, -18
	add hl, bc
	ld b, $1
	call CalcStats
.asm_f664
	and a
	ret
