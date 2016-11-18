SECTION .text

GLOBAL asm_fib_rek

asm_fib_rek:

  MOV rax, rdi
  CMP rax, 1
  JBE exit
  DEC rax
  PUSH rax         ; save N-1
  CALL asm_fib_rek   ; computing FIB(n-1)to rax
  XCHG rax,0[ESP]  ; swap FIB(n-1) for saved N-1 
  DEC  rax         ; = N-2
  CALL asm_fib_rek   ; computing FIB(N-2) to rax
  POP  rdi         ; = FIB(N-1)
  ADD  rax,ECX     ; = FIB(N-1)+FIB(N-2)
  exit:
  RET
