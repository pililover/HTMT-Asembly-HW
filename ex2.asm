.data
prompt: .asciiz "Input: "
result_uppercase: .asciiz "\nResult: uppercase"
result_lowercase: .asciiz "\nResult: lowercase"
invalid: .asciiz "\n Invalid input! Input data must be character"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 12
    syscall

#(ASCII range: 97-122: a-z, 65-90: A-Z)
    li $t0, 97
    li $t1, 122
    li $t2, 65
    li $t3, 90
    bge $v0, $t0, is_lowercase
    blt $v0, $t2, error
    bgt $v0, $t3, error
    j is_uppercase

is_uppercase:
    li $v0, 4
    la $a0, result_uppercase
    syscall
    j END

is_lowercase:
    li $v0, 4
    la $a0, result_lowercase
    syscall
    j END

error:
    li $v0, 4
    la $a0, invalid
    syscall

END:
    li $v0, 10
    syscall
