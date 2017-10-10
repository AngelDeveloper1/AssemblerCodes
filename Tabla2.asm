.model small
.stack
.data
num db 0
.code
 inicio:
   mov cl,01h
   tabla:
   mov al,2
   mul cl
   aam
   mov bx,ax
   mov ah,02h
   mov dl,
   int 21h
   mov ah,02h
   mov dl,bh
   add dl,30h
   int 21h
   inc cx
   cmp cx,11
   ja salir
   jb tabla
   
   salir:
   mov ah,4ch
   int 21h
end inicio