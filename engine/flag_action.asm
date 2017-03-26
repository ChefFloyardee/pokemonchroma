FlagActionPredef:
	call GetPredefRegisters

FlagAction:
; Perform action b on bit de
; in the bitfield at hl.
;  0: reset
;  1: set
;  2: read
; Return the result in c.

	push hl
	push de
	push bc

	; bit
	ld a, e
	and 7
	ld c, a ; c is the bit offset

	; byte
	; divide de by 8
 	srl e
 	srl d
 	jr nc, .nocarry1
 	set 7, e
.nocarry1
 	srl e
 	srl d
 	jr nc, .nocarry2
 	set 7, e
.nocarry2
 	srl e
 	srl d
 	jr nc, .nocarry3
 	set 7, e
.nocarry3
	add hl, de

	; d = 1 << e (bitmask)
	inc c
	ld d, 1
.shift
	dec c
	jr z, .shifted
	sla d
	jr .shift
.shifted

	ld a, b
	and a
	jr z, .reset
	cp 2
	jr z, .read

.set
	ld b, [hl]
	ld a, d
	or b
	ld [hl], a
	jr .done

.reset
	ld b, [hl]
	ld a, d
	xor $ff
	and b
	ld [hl], a
	jr .done

.read
	ld b, [hl]
	ld a, d
	and b
.done
	pop bc
	pop de
	pop hl
	ld c, a
	ret
