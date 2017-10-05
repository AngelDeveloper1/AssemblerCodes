.model small
    .stack
    .data
    saludo   db "Tecnologico de Estudios Superiores de Ecatepec",10,13,"$"
    saludo2  db "Grupo 5601",10,13,"$"
    saludo3  db "Lenguajes de Interfaz",10,13,"$"
    saludo4  db "Cruz Jimenez Angel Javier","$"
    .code
     
    main  proc              ;Inicia proceso
       mov   ax,seg saludo     ;hmm ?seg?
       mov   ds,ax          ;ds = ax = saludo
     
       mov   ah,09          ;Function(print string)
       lea   dx,saludo         ;DX = String terminated by "$"
       int   21h       ;Interruptions DOS Functions
       
       mov   ax,seg saludo2     ;hmm ?seg?
       mov   ds,ax          ;ds = ax = saludo
       
       mov   ah,09          ;Function(print string)
       lea   dx,saludo2        ;DX = String terminated by "$"
       int   21h
 
       mov   ax,seg saludo3     ;hmm ?seg?
       mov   ds,ax          ;ds = ax = saludo
     
       mov   ah,09          ;Function(print string)
       lea   dx,saludo3         ;DX = String terminated by "$"
       int   21h       ;Interruptions DOS Functions
       
       mov   ax,seg saludo4     ;hmm ?seg?
       mov   ds,ax          ;ds = ax = saludo
       
       mov   ah,09          ;Function(print string)
       lea   dx,saludo4        ;DX = String terminated by "$"
       int   21h
       
    ;mensaje en pantalla
     mov   ax,4c00h       ;Function (Quit with exit code (EXIT))
     int   21h            ;Interruption DOS Functions
    main  endp              ;Termina proceso
    end main