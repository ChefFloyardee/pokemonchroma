UnknownDungeon3Script:
	call EnableAutoTextBoxDrawing
	ld hl, UnknownDungeon3TrainerHeaders
	ld de, .ScriptPointers
	ld a, [wUnknownDungeon3CurScript]
	call ExecuteCurMapScriptInTable
	ld [wUnknownDungeon3CurScript], a
	ret

.ScriptPointers
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

UnknownDungeon3TextPointers:
	dw MewtwoText
	dw PickUpItemText
	dw PickUpItemText
	dw MewText

UnknownDungeon3TrainerHeaders:
MewtwoTrainerHeader:
	dbEventFlagBit EVENT_BEAT_MEWTWO
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MEWTWO
	dw MewtwoBattleText ; TextBeforeBattle
	dw MewtwoBattleText ; TextAfterBattle
	dw MewtwoBattleText ; TextEndBattle
	dw MewtwoBattleText ; TextEndBattle

	
MewTrainerHeader:
	dbEventFlagBit EVENT_BEAT_MEW, 1
	db 0 ; view range
	dwEventFlagAddress EVENT_BEAT_MEW, 1
	dw MewBattleText ; TextBeforeBattle
	dw MewBattleText ; TextAfterBattle
	dw MewBattleText ; TextEndBattle
	dw MewBattleText ; TextEndBattle

	db $ff

MewtwoText:
	TX_ASM
	ld hl, MewtwoTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MewtwoBattleText:
	TX_FAR _MewtwoBattleText
	TX_ASM
	ld a, MEWTWO
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

MewText:
	TX_ASM
	ld hl, MewTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MewBattleText:
	TX_FAR _MewBattleText
	TX_ASM
	ld a, MEW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd
