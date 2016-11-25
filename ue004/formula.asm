SECTION .text

GLOBAL formula

formula:

mov rax, rdi
add rdi, rsi ; (a+b)
mov rax, rdx
sub rdx, rcx
imul rdi, rdx ; mulitply rdi = (a+b)*(c-d)

shl r8, 3
shl r9, 2
add r8, r9

shr r10, 1
shr r11, 2
add r10, r11

sub r8, r10

mov rax, rdi

imul r8, rdi
mov rcx, 3
idiv rcx

ret
  
