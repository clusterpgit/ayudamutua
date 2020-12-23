%macro print 1
	mov dx,%1	; dx = cadena a imprimir
	mov ah,9	; ah = 9 = funcion para imprimir en consola una cadena
	int 21h		
%endmacro


;--------------------------Data------------------------
section .data


; VARIABLES 1

    usrAdmin DB "admin"
    usrPass DB "1234"

    Msg1 DB "1. Ingresar $"
	Msg2 DB "2. Registrar $"
	Msg3 DB "3. Salir $"


; mensajes 
    opc1 DB 0DH, 0AH,"Pass tiene que ser mayor a 4 caracteres$"
	opc2 DB 0DH, 0AH,"----------entro opc2----------$"
	opc3 DB 0DH, 0AH,"----------entro opc3----------$"
	opc4 DB 0DH, 0AH,"----------entro opc4----------$"

CRLF DB 0DH, 0AH, '$'
	
	Ingresar DB " Ingrese una opcion:  $"


;-----------------------Codigo---------------------------
org 100h
section .text

Inicio:
	print Msg1
	print CRLF
	
	print Msg2
	print CRLF
	
	print Msg3
	print CRLF

    print Ingresar

    call GetCH


    sub al,48 ; convirtiendo ascii a decimal y guardandolo en al

    cmp al,1		; comparar si se ingreso opc 1
	je Op1			; si se ingreso 1, me voy a opc 1
	cmp al,2		; comparar si se ingreso opc 2
	je Op2			; si se ingreso 2, me voy a opc 2
	cmp al,3		; comparar si se ingreso opc 3
	je Op3			; si se ingreso 3, me voy a opc 3
	
	jmp Inicio


Op1:    ; INGRESAR AL JUEGO
	print opc1
	print CRLF
	jmp Inicio
Op2:  ; REGISTRARSE
	print opc2
	print CRLF
	jmp Inicio
Op3:  ; SALIR
	mov ax,4c00h	;funcion system.exit
	int 21h
GetCH:
	mov ah,01h		; funcion para leer un caracter del teclado
	
	
	; aqui estaba el error, había colocado 21 sin especificar que era hexadecimal
	; y la interrupcion es 21 en hexadecimal, por lo que se debe agregar la h al 21
	
	int 21h			; inicio la lectura del caracter
	ret