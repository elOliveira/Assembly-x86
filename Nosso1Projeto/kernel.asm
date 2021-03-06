org 0x7e00
jmp 0x0000:start

;----------------------------------------------------------------------Tela  inicial----------------------------------------------------------------------------------------------
               
inicio1 db "                 Q U I Z", 0
inicio2 db "         AVATAR: A LENDA DE AANG", 0
inicio3 db "          pronto para comecar ?", 0
inicio4 db "                (s)sim", 0

stringTelaFinal db " pressione qualquer botao para finalizar",0
;---------------------------------------------------------------------alternativa correta-------------------------------------------------------------------------
acertou1 db "         PARABENS! VOCE ACERTOU!", 0
acertou2 db "           a) Proxima Pergunta", 0
;----------------------------------------------------------------------alternativa incorreta-----------------------------------------------------------------------
errou1 db "           RESPOSTA ERRADA!", 0
errou2 db "         a)Tentar novamente", 0
errou3 db "  pressione qualquer botao para avancar", 0


;---------------------------------------------------------------------Perguntas-----------------------------------------------------------------------------------
pergunta1 db " Qual o nome do bisao voador de ang?", 0
alternativas1 db  "a)Hapa   b)Apaa   c)Apa   d)Happa", 0
; correta: c 

pergunta2 db " Em qual ordem Aang dominou os elementos?", 0
alternativas2 db  "a)ar-agua-fogo-terra                    b)ar-terra-agua-fogo                    c)ar-fogo-agua-terra                    d)ar-agua-terra-fogo", 0
; correta: c 

pergunta3 db " Qual eh o nome do primeiro avatar?", 0
alternativas3 db  "a)Uan    b)Ruan  c)Wan   d)Huan", 0
; correta: c 

pergunta4 db " Qual a raca de momo?", 0
alternativas4 db  "a)rato voador                           b)ratasana voadora                      c)morcego do ar                         d)lemore morcego", 0
; correta: d 

pergunta5 db " Qual eh o nome da namorada do Sokka?", 0
alternativas5 db  "a)Suqui                                 b)Suky                                  c)Kyosi                                 d)Suki", 0
; correta: d 

pergunta6 db " Qual eh o nome do avatar anterior de Aang?", 0
alternativas6 db  "a)Roku                                  b)Rokuu                                 c)Rooku                                 d)Rooku", 0
; correta: a

pergunta7 db " Qual avatar viveu mais tempo?", 0
alternativas7 db  "a)Korra                                 b)Aang                                  c)Roku                                  d)Kyoshi", 0
; correta: d 

pergunta8 db " Em que ano lançou o primeiro episódio de Avatar a lenda de Aang?", 0
alternativas8 db  "a)2006                                  b)2002                                  c)2004                                  d)2005",0
; correta: d 

pergunta9 db " Qual nome do espirito da lua?", 0
alternativas9 db  "a)Tui                                   b)Yang                                  c)La                                    d)Ying", 0
; correta: a 

pergunta10 db " Qual eh o nome do primeiro avatar?", 0
alternativas10 db  "a)roko                                  b)asddasd                               c)ar-asdasdsa-agua-terra                d)ar-agua-terra-fogo", 0
; correta: c 

telafinal db "",0




;-------- funçoes --------------------

putchar:
    
    mov ah, 0eh
    int 10h

    ret

getchar: 
    mov ah, 0x00
    int 16h

    ret

print_string:
    lodsb
    mov ah, 0eh
    int 10h
    
    cmp al, 0
    jne print_string
    
    ret

quebra_linha:
    mov al, 10
    mov ah, 0eh
    int 10h
    
    mov al, 13
    mov ah, 0eh
    int 10h
    
    ret

limpa_tela: 
     xor bh, bh
    mov ah, 2
    int 10h

	mov cx, 2000
	mov bh, 0
	mov al, 0x20 
	mov ah, 09h
    int 0x10

    xor bh, bh
    mov ah, 2
    int 10h

    ret

; ----- funçoes do jogo ----------------------




data:
	
start:
    xor ax, ax
    xor bx, bx

   ; iniciando o modo de vídeo 
    mov ah, 0
    mov bh, 13h 
    int 10h

   
   ; /----------------------------- TELA INICIO ---------------------------------/ 
   
   
    call limpa_tela

   
   ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 0
    int 10h	

    ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 4
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

  
    mov si, inicio1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha

    mov si, inicio2
    call print_string

    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha

            ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 15
    int 10h
    
    
    mov si, inicio3
    call print_string


    call quebra_linha
    call quebra_linha

    
    
    mov si, inicio4
    call print_string

    call getchar

    cmp al, 115;
    je pergunta_1
    jne start;


   

; /----------------------------- TELA INICIO ---------------------------------/ 
    

;/---------------------------- INICIO PERGUNTA 1 -------------------------------------/
    pergunta_1:
       
        ; Escolher cor de fundo
        mov ah, 0bh
        mov bh, 00h
        mov bl, 0
        int 10h

        ;Escolher a cor dos caracteres 
        mov ah, 09h
        mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
        mov bh, 0
        mov al, ''
        mov bl, 15
        int 10h	
        
        call limpa_tela

        mov si, pergunta1
        call print_string


        call quebra_linha
        call quebra_linha
        
        mov si, alternativas1
        call print_string

        call getchar
        cmp al, 99
        je acertou_1
        jne errou_1

acertou_1: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 2
    int 10h	

        ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha


    mov si, acertou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    

    mov si, acertou2
    call print_string

    call getchar

    cmp al, 97
    je pergunta_2



errou_1: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 4
    int 10h	
      
      ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

    mov si, errou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    
    mov si, errou2
    call print_string

    call quebra_linha
    call quebra_linha

    mov si, errou3
    call print_string

    call getchar
    cmp al, 97
    je pergunta_1
    jne pergunta_2



;/---------------------------- INICIO PERGUNTA 2 -------------------------------------/
    pergunta_2:
        
        ; Escolher cor de fundo
        mov ah, 0bh
        mov bh, 00h
        mov bl, 0
        int 10h	

        ;Escolher a cor dos caracteres 
        mov ah, 09h
        mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
        mov bh, 0
        mov al, ''
        mov bl, 15
        int 10h
        
        call limpa_tela

        mov si, pergunta2
        call print_string


        call quebra_linha
        call quebra_linha
        
        mov si, alternativas2
        call print_string

        call getchar
        cmp al, 100
        je acertou_2
        jne errou_2

acertou_2: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 2
    int 10h	

        ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha


    mov si, acertou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    

    mov si, acertou2
    call print_string

    call getchar

    cmp al, 97
    je pergunta_3



errou_2: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 4
    int 10h	
      
      ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

    mov si, errou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    
    mov si, errou2
    call print_string

    call quebra_linha
    call quebra_linha

    mov si, errou3
    call print_string


    call getchar
    cmp al, 97
    je pergunta_2
    jne pergunta_3


;/---------------------------- INICIO PERGUNTA 3 -------------------------------------/
    pergunta_3:
       
         ; Escolher cor de fundo
        mov ah, 0bh
        mov bh, 00h
        mov bl, 0
        int 10h

            ;Escolher a cor dos caracteres 
        mov ah, 09h
        mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
        mov bh, 0
        mov al, ''
        mov bl, 15
        int 10h	
        
        call limpa_tela

        mov si, pergunta3
        call print_string


        call quebra_linha
        call quebra_linha
        
        mov si, alternativas3
        call print_string

        call getchar
        cmp al, 99
        je acertou_3
        jne errou_3

acertou_3: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 2
    int 10h	

        ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha


    mov si, acertou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    

    mov si, acertou2
    call print_string

    call getchar

    cmp al, 97
    je pergunta_4
    jne errou_3



errou_3: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 4
    int 10h	
      
      ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

    mov si, errou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    
    mov si, errou2
    call print_string

    call quebra_linha
    call quebra_linha

    mov si, errou3
    call print_string

    call getchar
    cmp al, 97
    je pergunta_3
    jne pergunta_4

;/---------------------------- INICIO PERGUNTA 4 -------------------------------------/
    pergunta_4:
       
         ; Escolher cor de fundo
        mov ah, 0bh
        mov bh, 00h
        mov bl, 0
        int 10h

            ;Escolher a cor dos caracteres 
        mov ah, 09h
        mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
        mov bh, 0
        mov al, ''
        mov bl, 15
        int 10h	
            
        call limpa_tela

        mov si, pergunta4
        call print_string


        call quebra_linha
        call quebra_linha
        
        mov si, alternativas4
        call print_string

        call getchar
        cmp al, 100 
        je acertou_4
        jne errou_4

acertou_4: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 2
    int 10h	

        ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha


    mov si, acertou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    

    mov si, acertou2
    call print_string

    call getchar

    cmp al, 100
    je pergunta_4



errou_4: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 4
    int 10h	
      
      ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

    mov si, errou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    
    mov si, errou2
    call print_string

    call quebra_linha
    call quebra_linha

    mov si, errou3
    call print_string

    call getchar
    cmp al, 100
    je pergunta_4
    jne pergunta_5


;/---------------------------- INICIO PERGUNTA -------------------------------------/
    pergunta_5:
       
        ; Escolher cor de fundo
        mov ah, 0bh
        mov bh, 00h
        mov bl, 0
        int 10h

        ;Escolher a cor dos caracteres 
        mov ah, 09h
        mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
        mov bh, 0
        mov al, ''
        mov bl, 15
        int 10h	
        
        call limpa_tela

        mov si, pergunta5
        call print_string


        call quebra_linha
        call quebra_linha
        
        mov si, alternativas5
        call print_string

        call getchar
        cmp al, 100
        je acertou_5
        jne errou_5

acertou_5: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 2
    int 10h	

        ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha


    mov si, acertou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    

    mov si, acertou2
    call print_string

    call getchar

    cmp al, 97
    je pergunta_6



errou_5: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 4
    int 10h	
      
      ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

    mov si, errou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    
    mov si, errou2
    call print_string

    call quebra_linha
    call quebra_linha

    mov si, errou3
    call print_string

    call getchar
    cmp al, 97
    je pergunta_5
    jne pergunta_6



;/---------------------------- INICIO PERGUNTA 6-------------------------------------/
    pergunta_6:
       
        ; Escolher cor de fundo
        mov ah, 0bh
        mov bh, 00h
        mov bl, 0
        int 10h

        ;Escolher a cor dos caracteres 
        mov ah, 09h
        mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
        mov bh, 0
        mov al, ''
        mov bl, 15
        int 10h	
        
        call limpa_tela

        mov si, pergunta6
        call print_string


        call quebra_linha
        call quebra_linha
        
        mov si, alternativas6
        call print_string

        call getchar
        cmp al, 99
        je acertou_6
        jne errou_6

acertou_6: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 2
    int 10h	

        ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha


    mov si, acertou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    

    mov si, acertou2
    call print_string

    call getchar

    cmp al, 97
    je pergunta_7



errou_6: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 4
    int 10h	
      
      ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

    mov si, errou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    
    mov si, errou2
    call print_string

    call quebra_linha
    call quebra_linha

    mov si, errou3
    call print_string

    call getchar
    cmp al, 97
    je pergunta_6
    jne pergunta_7



;/---------------------------- INICIO PERGUNTA 7-------------------------------------/
    pergunta_7:
       
        ; Escolher cor de fundo
        mov ah, 0bh
        mov bh, 00h
        mov bl, 0
        int 10h

        ;Escolher a cor dos caracteres 
        mov ah, 09h
        mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
        mov bh, 0
        mov al, ''
        mov bl, 15
        int 10h	
        
        call limpa_tela

        mov si, pergunta7
        call print_string


        call quebra_linha
        call quebra_linha
        
        mov si, alternativas7
        call print_string

        call getchar
        cmp al, 99
        je acertou_7
        jne errou_7

acertou_7: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 2
    int 10h	

        ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha


    mov si, acertou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    

    mov si, acertou2
    call print_string

    call getchar

    cmp al, 97
    je pergunta_7



errou_7: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 4
    int 10h	
      
      ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

    mov si, errou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    
    mov si, errou2
    call print_string

    call quebra_linha
    call quebra_linha

    mov si, errou3
    call print_string

    call getchar
    cmp al, 97
    je pergunta_7
    jne pergunta_8




;/---------------------------- INICIO PERGUNTA 8-------------------------------------/
    pergunta_8:
       
        ; Escolher cor de fundo
        mov ah, 0bh
        mov bh, 00h
        mov bl, 0
        int 10h

        ;Escolher a cor dos caracteres 
        mov ah, 09h
        mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
        mov bh, 0
        mov al, ''
        mov bl, 15
        int 10h	
        
        call limpa_tela

        mov si, pergunta8
        call print_string


        call quebra_linha
        call quebra_linha
        
        mov si, alternativas8
        call print_string

        call getchar
        cmp al, 99
        je acertou_8
        jne errou_8

acertou_8: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 2
    int 10h	

        ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha


    mov si, acertou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    

    mov si, acertou2
    call print_string

    call getchar

    cmp al, 97
    je pergunta_9



errou_8: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 4
    int 10h	
      
      ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

    mov si, errou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    
    mov si, errou2
    call print_string

    call quebra_linha
    call quebra_linha

    mov si, errou3
    call print_string

    call getchar
    cmp al, 97
    je pergunta_8
    jne pergunta_9




;/---------------------------- INICIO PERGUNTA 9-------------------------------------/
    pergunta_9:
       
        ; Escolher cor de fundo
        mov ah, 0bh
        mov bh, 00h
        mov bl, 0
        int 10h

        ;Escolher a cor dos caracteres 
        mov ah, 09h
        mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
        mov bh, 0
        mov al, ''
        mov bl, 15
        int 10h	
        
        call limpa_tela

        mov si, pergunta9
        call print_string


        call quebra_linha
        call quebra_linha
        
        mov si, alternativas9
        call print_string

        call getchar
        cmp al, 99
        je acertou_9
        jne errou_9

acertou_9: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 2
    int 10h	

        ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha


    mov si, acertou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    

    mov si, acertou2
    call print_string

    call getchar

    cmp al, 97
    je pergunta_9



errou_9: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 4
    int 10h	
      
      ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

    mov si, errou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    
    mov si, errou2
    call print_string

    call quebra_linha
    call quebra_linha

    mov si, errou3
    call print_string

    call getchar
    cmp al, 97
    je pergunta_9
    jne pergunta_10




;/---------------------------- INICIO PERGUNTA 10 -------------------------------------/
    pergunta_10:
       
        ; Escolher cor de fundo
        mov ah, 0bh
        mov bh, 00h
        mov bl, 0
        int 10h

        ;Escolher a cor dos caracteres 
        mov ah, 09h
        mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
        mov bh, 0
        mov al, ''
        mov bl, 15
        int 10h	
        
        call limpa_tela

        mov si, pergunta10
        call print_string


        call quebra_linha
        call quebra_linha
        
        mov si, alternativas10
        call print_string

        call getchar
        cmp al, 99
        je acertou_10
        jne errou_10

acertou_10: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 2
    int 10h	

        ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha


    mov si, acertou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    

    mov si, acertou2
    call print_string

    call getchar

    cmp al, 97
    je telaFinal



errou_10: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 4
    int 10h	
      
      ;Escolher a cor dos caracteres 
    mov ah, 09h
	mov cx, 2000 ;quantidade de caracteres que vão ser printados nessa cor
	mov bh, 0
	mov al, ''
    mov bl, 1
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

    mov si, errou1
    call print_string
    
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    call quebra_linha
    
    mov si, errou2
    call print_string

    call quebra_linha
    call quebra_linha

    mov si, stringTelaFinal
    call print_string

    call getchar
    cmp al, 97
    je pergunta_10
    jne telaFinal



telaFinal:
    call quebra_linha
