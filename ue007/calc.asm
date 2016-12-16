GLOBAL calc_add
GLOBAL calc_sub

SECTION .text

calc_add:
  MOV r14, 0
  JMP algorithm

calc_sub:
  MOV r15, 1
  JMP algorithm
  
algorithm:
  MOVD eax, xmm0          ; eax = float operand1
  MOVD ebx, xmm1          ; ebx = float operand2

  AND eax, 0x80000000     ; bitmask for sign bit (operand1)
  MOV ecx, eax            ; move sign bit to another register
  MOVD eax, xmm0          ; reassign operand1 to eax

  MOV rax, 1
  RET

  AND ebx, 0x80000000     ; bitmask for sign bit (operand1)
  MOV [rdx], ebx            ; move sign bit to another register
  MOVD ebx, xmm1          ; reassign operand2 to ebx AND eax, 0x0FF00000     ; bitmask for exponent (operand1)
  AND ebx, 0x0FF00000     ; bitmask for exponent (operand2)

  ; ECX bitmask
  ; EDX bitmask
  ; EAX operand1
  ; EBX operand2

  CMP eax, ebx            ; compare those registers now holding the exponent
  JG hiExpo               ; jump to hiExpo if eax > ebx
  JL loExpo               ; jump to loExpo if eax < ebx
  JE eqExpo               ; jump to eqExpo if eax = ebx

hiExpo:
  SUB eax, ebx            ; subtract higher exponent
  MOV esp, eax
  MOVD eax, xmm0          ; eax = float operand1

  JMP iniMant

  SHR eax, cl            ; right shift mantisse

loExpo:
  SUB ebx, eax            ; subtract higher exponent
  MOV esp, ebx
  MOVD ebx, xmm1          ; reassign operand2 to ebx

eqExpo:                   ; exponents are equal now 
  JMP pick
  
iniMant:
  AND eax, 0x000FFFFF     ; bitmask for mantisse (operand1)
  AND eax, 0x000FFFFF     ; bitmask for mantisse (operand2)
  
pick:
  CMP r14, 0
  JE cmpSignA
  JG cmpSignS

cmpSignA:                 ; calc_add
  CMP ecx, edx
  JG sub
  JL sub
  JE add

cmpSignS:                 ; calc_sub
  CMP ecx, edx
  JG add
  JL add
  JE sub

add:                      ; for all operations +
  ADD eax, ebx
  MOV rax, [eax]
  RET

sub:                      ; for all operations -
  SUB eax, ebx
  MOV rax, [eax]
  RET
