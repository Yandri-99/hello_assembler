; 01_area.asm - Calcular el área de un triángulo
.386
.model flat, stdcall
option casemap:none

include \masm32\include\masm32rt.inc

.data
    msgBase      db "Ingrese la base del triangulo: ", 0
    msgAltura    db "Ingrese la altura del triangulo: ", 0
    msgResultado db "El area del triangulo es: %d", 13,10, 0

    buffer1 db 16 dup(0)
    buffer2 db 16 dup(0)

    base    dd ?
    altura  dd ?
    area    dd ?

.code
start:
    invoke StdOut, addr msgBase
    invoke StdIn, addr buffer1, 16
    invoke atodw, addr buffer1
    mov base, eax

    invoke StdOut, addr msgAltura
    invoke StdIn, addr buffer2, 16
    invoke atodw, addr buffer2
    mov altura, eax

    ; area = (base * altura) / 2
    mov eax, base
    imul eax, altura
    mov edx, 0
    mov ecx, 2
    div ecx
    mov area, eax

    invoke crt_printf, addr msgResultado, area

    invoke ExitProcess, 0
end start
