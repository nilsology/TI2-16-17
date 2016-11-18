SECTION .text

GLOBAL asm_fib_rek

asm_fib_rek:

  MOV rax, rdi
  CMP rax, 1
  JBE exit
  DEC rax
  PUSH rax
  CALL asm_fib_rek 
  MOV rax, 0
  DEC  rax 
  CALL asm_fib_rek
  POP  rdi
  ADD  rax, rbx
  exit:
  RET

GLOBAL asm_fib_it

asm_fib_it:

  MOV r8, 0
  MOV r9, 1
  MOV rax, 0

  loop:
  CMP rdi, 0
  JE end

  MOV r8, r9
  MOV r9, rax
  MOV rax, r8
  ADD rax, r9
  DEC rdi
  JMP loop

  end: ret
