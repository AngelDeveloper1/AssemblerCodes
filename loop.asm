.model small
    .stack
    .data
    mensaje db 0Ah, 0dh,"Hola", "$" ;Declaramos una cadena.
.code
main proc
  mov cx, 0010 ;numero de veces a repetir el ciclo
ciclo:
  mov ax,@data
  mov ds,ax
  mov dx,offset mensaje ;lee la cadena desde nuestro segmento de datos
  mov ah, 09h
  int 21h
  loop ciclo ;Se repite desde nuestra etiqueta ciclo.

  mov ah,04ch ;Al terminar finaliza el programa.
  int 21h
  main endp
  end main
