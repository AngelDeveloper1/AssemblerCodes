.model small
    .stack 100 
        .data
        Pregunta db "Usar a)Cuadrado b)Rectangulo",13,10,'$'
            dos equ 2 ; declaracion de constante=2
            m1 db 10,13,"Introduce la base: $"
            m2 db 10,13,"Introduce la altura: $"
            m3 db 10,13,10,13,"Area: $"
            m4 db 10,13,"Perimetro: $"
            m5 db 13,10,"Area y perimetro de un rectangulo",10,13,'$'
            m6 db 13,10,"Area y perimetro de un cuadrado",10,13,'$'
            base db 0
            altura db 0
            unidades db 0
            decenas db 0
        
        
        .CODE
        start:
        mov     ax,@data
        mov     ds,ax                   ;Coloca en DS el segmento data
      
        mov     dx,OFFSET Pregunta      ;Coloca en dx Pregunta
        mov     ah,9                    ;Imprime la cadena
        int     21h
        
        mov     ah,1                    ;Captura un caracter en DOS
        int     21h                     ;Captura un unico caracter
        or      al,20h                  ;Fuerza el caracter a convertirlo en minusculas

        cmp     al,'a'                  ;Compara  si el caracter es a
        je      EsA
  
        cmp     al,'b'                  ;Compara si el caracter es b
        je      EsB
        
        EsA:
         ; imprime titulo
            mov ah,09h
            lea dx,m6
            int 21h
            jmp Operacion      
            

        EsB:
         ; imprime titulo
            mov ah,09h
            lea dx,m5
            int 21h
            jmp Operacion
            
        Operacion:
            ; imprime introduce la base
            lea dx,m1
            int 21h

            ; pide la base
            mov ah,01h
            int 21h
            sub al,30h
            mov base,al

            ; imprime introduce la altura
            mov ah,09h
            lea dx,m2
            int 21h

            ; pide la altura
            mov ah,01h
            int 21h
            sub al,30h
            mov altura, al

            ;calcula area
            mov al,base
            mul altura 
            aam
            mov decenas,ah
            mov unidades,al

            ; imprime el area es
            mov ah,09h
            lea dx,m3
            int 21h
            call imprime2digitos

            ;calcula perimetro
            mov al,dos
            mul base
            mov bl,al

            mov al,dos
            mul altura
            mov cl,al

            add bl,cl
            mov al,bl
            aam
            mov decenas,ah
            mov unidades,al

            ; imprime el perimetro es
            mov ah,09h
            lea dx,m4
            int 21h
            call imprime2digitos


            cls proc near
            mov ah,00h
            mov al,03h
            int 10h
            ret
            endp

            impcar proc near
            add dl,30h
            mov ah,02h
            int 21h
            ret
            endp
            imprime2digitos proc near
            ; imprime decenas
            mov dl,decenas
            call impcar
            ; imprime unidades
            mov dl,unidades
            call impcar
            ret
            endp
            
end start 