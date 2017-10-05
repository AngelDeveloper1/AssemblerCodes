; HELLO.ASM
; EJEMPLO DE CAPTURA DE CARACTER CON SENTENCIA IF

.MODEL  SMALL
.STACK  100h
.DATA

Pregunta        DB 'Indica la calificacion del alumno (a,b,c,d,e,f): $'
MensajeA        DB  13,10,'Opcion A-Excelente',13,10,'$'
MensajeB        DB  13,10,'Opcion B-Muy bien',13,10,'$'
MensajeCe       DB  13,10,'Opcion C-Bien',13,10,'$'
MensajeD        DB  13,10,'Opcion D-Regular',13,10,'$'
MensajeE        DB  13,10,'Opcion E-Malo',13,10,'$'
MensajeF        DB  13,10,'Opcion F-Reprobado',13,10,'$'
MensajeNoValido  DB  13,10,'Opcion no valida',10,13,'$'

.CODE
start:
  mov     ax,@data
  mov     ds,ax                   ;Coloca en DS el segmento data
      

  mov     dx,OFFSET Pregunta      ;Coloca en dx Pregunta
  mov     ah,9                    ;Imprime la cadena
  int     21h                     ;Muestra en pantalla
  
  mov     ah,1                    ;Captura un caracter en DOS
  int     21h                     ;Captura un unico caracter
  or      al,20h                  ;Fuerza el caracter a convertirlo en minusculas

  cmp     al,'a'                  ;Compara  si el caracter es a
  je      EsA
  
  cmp     al,'b'                  ;Compara si el caracter es b
  je      EsB
  
  cmp     al,'c'                  ;Compara si el caracter es c
  je      EsCe
  
  cmp     al,'d'                  ;Compara si el caracter es d
  je      EsD
  
  cmp     al,'e'                  ;Compara si el caracter es e
  je      EsE

  cmp     al,'f'                  ;Compara si el caracter es f
  je      EsF
  
  mov     dx,OFFSET MensajeNoValido ;Mensaje por default
  jmp     SalidaPantalla

EsA:
  mov     dx,OFFSET MensajeA      ;Mensaje para A
  jmp     SalidaPantalla

EsB:
  mov     dx,OFFSET MensajeB     ;Mensaje para B
  jmp     SalidaPantalla
  
EsCe:
  mov     dx,OFFSET MensajeCe      ;Mensaje para C
  jmp     SalidaPantalla

EsD:
  mov     dx,OFFSET MensajeD     ;Mensaje para D
  jmp     SalidaPantalla
  
EsE:
  mov     dx,OFFSET MensajeE      ;Mensaje para E
  jmp     SalidaPantalla

EsF:
  mov     dx,OFFSET MensajeF     ;Mensaje para F
  jmp     SalidaPantalla
    
  
SalidaPantalla:
  mov     ah,9                    ;Imprime cadena en DOS
  int     21h                     ;Muestra el mensaje indicado
  mov     ah,4ch                  ;Da por terminado el program
  mov     al,0                    ;retorna un 0 de programa terminado correctamente
  int     21h                     ;fin del programa

END start
