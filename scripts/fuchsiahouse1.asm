FuchsiaHouse1Script:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaHouse1TextPointers:
	dw FuchsiaHouse1Text1
	dw FuchsiaHouse1Text2
	dw FuchsiaHouse1Text3

FuchsiaHouse1Text1: ; 75022 (1d:5022)
	TX_FAR MoveDeleterText1
	db "@"

FuchsiaHouse1Text2: ; 75027 (1d:5027)
	TX_FAR MoveRelearnerText1
	db "@"

FuchsiaHouse1Text3: ; 7502c (1d:502c)
	TX_FAR _FuchsiaHouse1Text3
	db "@"
