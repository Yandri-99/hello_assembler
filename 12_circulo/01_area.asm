.386
.model flat, stdcall
option casemap:none

include \masm32\include\masm32rt.inc

.data
    msgRadio      db "Ingrese el radio del circulo: ", 0
    msgResultado  db "El area del circulo es: %d", 13, 10, 0

    inputBuffer   db 16 dup(0)   ; Espacio para entrada de texto
    radio         dd ?
    area          dd ?

.code
start:
    invoke StdOut, addr msgRadio
    invoke StdIn, addr inputBuffer, sizeof inputBuffer    ; ← Solución aquí
    invoke atodw, addr inputBuffer
    mov radio, eax

    mov eax, radio
    imul eax, radio    ; radio * radio
    imul eax, 3        ; * 3 como aproximación de π
    mov area, eax

    invoke crt_printf, addr msgResultado, area
    invoke ExitProcess, 0
end start
