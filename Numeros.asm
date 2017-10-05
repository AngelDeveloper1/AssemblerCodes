.model small
    .stack
    .data
        Letra db 48,"$"
        salto db 10,13, "$"
        .code
            inicio:
                mov ax, @data
                mov ds, ax
                mov ah, 0fh
                int 10h
                mov ah,0
                int 10h
                mov cx, 9
               
            iteracion:
                mov ah,09h
                mov dx, offset letra
                int 21h
                inc letra
                inc bx
                cmp bx,9
                jbe iteracion
                mov ah, 09h
                mov dx, offset salto
                int 21h
                mov letra, 49
           end inicio