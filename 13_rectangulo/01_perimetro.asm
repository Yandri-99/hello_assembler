.386
.model flat, stdcall
option casemap:none

include \masm32\include\masm32rt.inc

.data
    msgBase      db "Ingrese la base del rectangulo: ", 0
    msgAltura    db "Ingrese la altura del rectangulo: ", 0
    msgResultado db "El perimetro del rectangulo es: %d", 13, 10, 0

    bufferBase   db 16 dup(0)
    bufferAltura db 16 dup(0)
    base         dd ?
    altura       dd ?
    perimetro    dd ?

.code
start:
    invoke StdOut, addr msgBase
    invoke StdIn, addr bufferBase, sizeof bufferBase   ; Leer base como texto
    invoke atodw, addr bufferBase                      ; Convertir a DWORD
    mov base, eax

    invoke StdOut, addr msgAltura
    invoke StdIn, addr bufferAltura, sizeof bufferAltura ; Leer altura como texto
    invoke atodw, addr bufferAltura
    mov altura, eax

    mov eax, base
    add eax, altura
    shl eax, 1
    mov perimetro, eax

    invoke crt_printf, addr msgResultado, perimetro
    invoke ExitProcess, 0
end start
