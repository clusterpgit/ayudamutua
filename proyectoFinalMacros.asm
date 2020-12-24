; -----------------archivo de macros
print macro cadena
    LOCAL ETQ
    ETQ:
        mov ah, 90h
        mov dx, @data
        mov ds, dx
        mov dx, offset cadena
        int 21h
endm

getChar macro
    mov ah,01h
    int 21h
endm
