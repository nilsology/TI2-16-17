SECTION .text

; assembler doesn't diff btwn function and variable names
GLOBAL func

; SHR rax, 1 ; division durch 2 abgerundet

func: ; label
  
  MOV rax, rdi
  MOV rbx, rsi
  ADD rax, rbx
  
  RET ; returns to caller


