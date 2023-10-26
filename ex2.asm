.data
prompt: .asciiz "Input: "
result_uppercase: .asciiz "\n Result: uppercase"
result_lowercase: .asciiz "\n Result: lowercase"

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
    bge $v0, $t0, is_lowercase
    j is_uppercase

is_uppercase:
    li $v0, 4
    la $a0, result_uppercase
    syscall
    j done

is_lowercase:
    li $v0, 4
    la $a0, result_lowercase
    syscall

done:
    li $v0, 10
    syscall