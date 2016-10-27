SECTION .text

; assembler doesn't diff btwn function and variable names
GLOBAL func

func: ; label
    RET ; returns to caller
