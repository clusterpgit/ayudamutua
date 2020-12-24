include pfarquim.asm
;==============================================MACROS
; Imprime el Texto que Recibe
Mostrar macro texto
    mov ax, seg texto
    mov ds,ax
	mov ah, 09h
	mov dx, offset texto 
	int 21h
endm

.model small
.stack
.data
   saludo   db "Hola Mundo", "$"
    MenuP db ' MENU PRINCIPAL PROYECTO FINAL',0ah,0dh,' ',0ah,0dh,' 1) Ingresar',0ah,0dh,' 2) Registrar',0ah,0dh,' 3) Salir',0ah,0dh,'$'
    MenuI db 'Ingrese los siguietes datos: ',0ah,0dh,' Usuario: ','$'
    MenuI2 db 0ah,0dh,' Contrasena: ','$'

.code

Menu_Principal proc near
	mov ax, @data
	mov ds,ax
	Mostrar MenuP

    getChar
    cmp al, 49  ; 1
    je MenuIngresar

    cmp al, 50
    je Menu_Principal

    cmp al, 51
    je Salir
    jmp Menu_Principal

Menu_Principal endp

MenuIngresar proc near
	mov ax, @data
	mov ds,ax
	Mostrar MenuI
    jmp Salir

MenuIngresar endp

Salir proc near
    mov ah, 4ch
    int 21h 
Salir endp



end
