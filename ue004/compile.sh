#! /bin/bash
nasm -f elf64 formula.asm
gcc -std=c99 formula.c formula.asm -o prog
