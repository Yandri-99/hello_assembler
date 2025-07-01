.386
.model flat, stdcall
option casemap:none

include \masm32\include\masm32rt.inc

.data
    msgBase      db "Ingrese la base del triangulo: ", 0
    msgAltura    db "Ingrese la altura del triangulo: ", 0
    msgResultado db "El area del triangulo es: %d", 13, 10, 0

    bufferBase   db 16 dup(0)
    bufferAltura db 16 dup(0)
    base         dd ?
    altura       dd ?
    area         dd ?

.code
start:
    invoke StdOut, addr msgBase
    invoke StdIn, addr bufferBase, sizeof bufferBase
    invoke atodw, addr bufferBase
    mov base, eax

    invoke StdOut, addr msgAltura
    invoke StdIn, addr bufferAltura, sizeof bufferAltura
    invoke atodw, addr bufferAltura
    mov altura, eax

    mov eax, base
    imul eax, altura
    shr eax, 1                ; Dividir entre 2 (área = base * altura / 2)
    mov area, eax

    invoke crt_printf, addr msgResultado, area
    invoke ExitProcess, 0
end start
