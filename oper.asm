.MODEL SMALL
.STACK 100H
.DATA

n1 db 0
n2 db 0
Res db 0
Pregunta DB 13,10,'indica la operacion {s-suma, r-resta, m-multiplicacion, d-divicion}: $'
Msg1 DB 13,10,'ingrese el primer numero:',13,10,'$'
Msg2 DB 13,10,'ingrese el segundo numero',13,10,'$' 
Msg3 DB 13,10,'el resultado es: ',13,10,'$'
MensajeNoValido  DB  13,10,'Opcion no valida',10,13,'$'

.CODE
start:
  mov     ax,@data
  mov     ds,ax                   ;Coloca en DS el segmento data
      
      mov dx,OFFSET Msg1     ;Mensaje para s
  mov ah,9               ;Imprime la cadena
  int 21h
  mov ah,01
  int 21h
  sub al,30h
  mov n1,al
  
  mov dx,OFFSET Msg2     ;Mensaje para s
  mov ah,9               ;Imprime la cadena
  int 21h
  mov ah,01
  int 21h
  sub al,30h
  mov n2,al    
      
  mov     dx,OFFSET Pregunta      ;Coloca en dx Pregunta
  mov     ah,9                    ;Imprime la cadena
  int     21h                     ;Muestra en pantalla
  
  mov     ah,1                    ;Captura un caracter en DOS
  int     21h                     ;Captura un unico caracter
  or      al,20h                  ;Fuerza el caracter a convertirlo en minusculas
  
  cmp     al,'s'                  ;Compara  si el caracter es s
  je      Sum
  
  cmp     al,'r'                  ;Compara  si el caracter es s
  je      Resta
  
  cmp     al,'m'                  ;Compara  si el caracter es s
  je      Mult
  
  cmp     al,'d'                  ;Compara  si el caracter es s
  je      Divi
  
  mov     dx,OFFSET MensajeNoValido ;Mensaje por default
  mov     ah,9                    ;Imprime cadena en DOS
  int     21h 
  jmp     start

Sum:
  mov al,n1
  add al,n2
  mov Res,al
  jmp SalidaPantalla
Resta:
  mov al,n1
  sub al,n2
  mov Res,al
  jmp SalidaPantalla
Mult:
  mov al,n1
  mul n2
  mov Res,al
  jmp SalidaPantalla
Divi:

  xor ax,ax
  mov bl,al
  mov al,n1
  div n2       ; divide AX/BX el resultado lo almacena en AX, el residuo queda en DX
  mov Res,al
  jmp SalidaPantalla
  
 ;.exit
  
SalidaPantalla:
  mov ah,09
  lea dx,Msg3
  int 21h
  mov dl,Res
  add dl,30h
  mov ah,02
  int 21h                  ;Muestra el mensaje indicado
  mov ah,4ch                  ;Da por terminado el program
  mov al,0                    ;retorna un 0 de programa terminado correctamente
  int 21h                     ;fin del programa

END start