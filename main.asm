; Example from http://www.sizecoding.org/wiki/Main_Page

	mov		al,0x13				; mode 13h = 320 x 200 in 256 colors
	int		0x10				; switch videomode
X: 
	or		al, [bp+si]			; *illusion* - executed ONCE
	xor		al, 0x68			; *illusion* - executed ONCE
	mov		dx, 0x79F			; *illusion* - executed ONCE
	pusha						; push all registers on stack
	fild 	word	[bx-9]		; x
	fild 	word	[bx-8]		; y x
	fpatan						; arc
	fst 	st1					; arc arc
	fcos						; cos(arc) arc
	fimul	dword	[si]		; l*cos(arc) arc
	fidiv	word	[bx-8]		; l*cos(arc)/x arc
	fistp	dword	[bx-4]		; arc
	fimul	word	[bx]		; scaled_arc
	fistp	word	[bx-5]		; -
	popa						; pop all registers from stack
	sub		ah, [bp+si]			; animation along distance
	xor		al, ah				; XOR scaled_arc with distance
	and		al, 16 + 8 + 4		; sub palette selection
	stosb						; write to screen, advance DI
	mov		ax, 0xCCCD			; the famous
	mul		di					; Rrrola trick
	jmp 	short X-1			; *ODD* jump into "int 0x10"