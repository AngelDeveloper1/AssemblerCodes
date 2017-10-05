.model small
    .stack  
    .data
    Pregunta          DB 'Que elijes 1)sol 2)luna : $'
    MensajeUno        DB  13,10,'elegiste sol',13,10,'$'
    MensajeDos        DB  13,10,'elegiste luna',13,10,'$''
    .code
        start:
          mov     ax,@data
          mov     ds,ax                   
          mov     dx,OFFSET Pregunta      
          mov     ah,9                    
          int     21h                     
          mov     ah,1                    
          int     21h                     
          cmp     al,'1'                  
            je      EsUno
          cmp     al,'2'                  
            je      EsDos
    EsUno:
      mov     dx,OFFSET MensajeUno      
      jmp     SalidaPantalla

    EsDos:
      mov     dx,OFFSET MensajeDos     
      jmp     SalidaPantalla

    SalidaPantalla:
      mov     ah,9                    
      int     21h                     
      mov     ah,4ch                  
      mov     al,0                    
      int     21h                     
    end start