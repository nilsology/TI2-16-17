SECTION .text

GLOBAL gauss

gauss:
  MOV rax, rdi
  ADD rdi, 1
  MUL rdi
  SHR rax, 1
  
  RET
