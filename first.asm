	BITS 16 ; NASM: compile in 16 bit mode
start:
	mov ax, 07C0h ; 4k of stack space after this bootloader?
	add ax, 288 ; (4096 + 512) / 16 bytes per paragraph
	mov ss, ax
	mov sp, 4096

	mov ax, 07C0h ; Set data segment to where we're loaded
	mov ds, ax

	mov si, text_string ; put string position in SI
	call print_string ; call the print-string routine
	jmp $

	text_string db 'This is an OS booted from assembly!', 0

print_string:
	mov ah, 0Eh ; interrupt 10h is "print character"

.repeat:
	lodsb ; Get a character from the string
	cmp al, 0 ; check null-termination
	je .done
	int 10h ; print it (al?)
	jmp .repeat
.done:
	ret

	times 510-($-$$) db 0 ; pad remainder with 0s
	dw 0xAA55 ; PC boot signature
