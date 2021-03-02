org 0x7e00
jmp 0x0000:start

               
inicio1 db "                  QUIZ", 0
inicio2 db "          avatar: A Lenda de Aang", 0
inicio3 db "          Pronto Para comecar ?", 0
inicio4 db "          (S)Sim (N)Nao ", 0


acertou1 db "PARABENS! VOCE ACERTOU !", 0
acertou2 db "(enter) Continuar para a proxima pergunta", 0

errou1 db "RESPOSTA ERRADA !", 0
errou2 db "a) Tentar novamente   b) Proxima Pergunda", 0



pergunta1 db " Qual o nome do bisao voador de ang?", 0
alternativas1 db  "a)Hapa   b)Apaa   c)Apa   d)Happa", 0
; correta: c 




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

acertou: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 0
    int 10h	

    mov si, acertou1
    call print_string
    
    call quebra_linha

    mov si, acertou2
    call print_string

    call getchar

    ret

errou: 
    
    call limpa_tela

     ; Escolher cor de fundo
    mov ah, 0bh
    mov bh, 00h
    mov bl, 0
    int 10h	

    mov si, errou1
    call print_string
    
    call quebra_linha

    mov si, errou2
    call print_string

    call getchar

    ret



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
    mov bl, 3
    int 10h

    call quebra_linha
    call quebra_linha
    call quebra_linha

  
    mov si, inicio1
    call print_string
    
    call quebra_linha

    mov si, inicio2
    call print_string

    call quebra_linha
    call quebra_linha

    mov si, inicio3
    call print_string


    call quebra_linha
    call quebra_linha
    
    mov si, inicio4
    call print_string

    call getchar

   

; /----------------------------- TELA INICIO ---------------------------------/ 
    

;/---------------------------- Pergunta 1 -------------------------------------/

    call limpa_tela

    mov si, pergunta1
    call print_string


    call quebra_linha
    call quebra_linha
    
    mov si, alternativas1
    call print_string

    call getchar
    cmp al, 99
    je acertou
    jne errou
