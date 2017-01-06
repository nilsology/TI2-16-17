global fold

section .text

fold:

mov r8, rdi     ; func
mov r9, rsi     ; len
mov rbx, rdx    ; a[len]
mov rax, rcx    ; dir

cmp rax, 0
jne foldr       ; jump to fold right
                ; otherwise continue with "fold left"

foldl:

  push r9       ; len to stack
  push r8       ; func to stack
  
  mov r12, 1    ; counter (n)
  mov r13, r9
  dec r13       ; len-1 

  mov r14, r9   ; offset
  dec r14
  add r14, rbx

  mov r15, r9   ; last elem address
  dec r15
  shl r15, 3    ; mul by int 8
  add r15, rbx

  mov rdi, rbx  ; init func(X, x)

  push rdi

  loopl:
    pop rax
    inc r12     ; increment counter 
    add r14, 8  ; increase offset

    mov rsi, r14; set func(x, X)
    pop r8
    call r8

    cmp r15, r14
    jne loopl
    
    ret

foldr:

ret

global zipWith

section .text

zipWith:

ret
