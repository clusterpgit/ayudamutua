include pfarquim.asm


.model small
.stack 100h

;--------------------- seccion de datos

.data

;variables menu
; menu primero
opcion      db  0ah, 0dh, 'Ingrese una opcion para entrar...', '$'
opcion1     db 0ah, 0dh, '1....... Ingresar', '$'
opcion2     db 0ah, 0dh, '2....... Registrar', '$'
opcion3     db 0ah, 0dh, '3....... Salir', '$'


; menu ingresar

ingreseUsuario     db 0ah, 0dh, 'Ingrese su Usuario: ', '$'
ingresePass        db 0ah, 0dh, 'Ingrese su Password: ', '$'


; posibles errores
errorUno        db 0ah, 0dh, 'Usuario o contrasenia no existen', '$'
errorDos        db 0ah, 0dh, 'Este usuario ya existe', '$'

; variables manejo de archivos

rutaUsuarios        db 'usuarios.txt', 00h


;variables admin

usrAdmin    db  'admin'
passAdmin   db  '1234'

; ------------------------- CODIGO 

.code 

main proc
    Menu: 
        print opcion
        print opcion1
        print opcion2
        print opcion3

        getChar

        ; aqui vamos a ver que opcion selecciona el usuario

        cmp al, 49  ; 1
        je MenuIngresar

        cmp al, 50
        je MenuRegistrar

        cmp al, 51
        je Salir
        jmp Menu


    
    MenuIngresar:
        print ingreseUsuario
        getChar
        print ingresePass
        getChar
    
    MenuRegistrar:
        getChar
        mov ah, 4ch
        int 21h

    Salir: 
        mov ah, 4ch
        int 21h

main endp
end main
