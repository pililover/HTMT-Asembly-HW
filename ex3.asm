.data 
Arr: .space 40
input1: .asciiz "Input N: "
input2: .asciiz "a["
input3: .asciiz "] = "
space: .asciiz " "
invalid: .asciiz "Invalid N! N must be less than or equal to 10"
out_mess: .asciiz "\nOutput: "
.text 
main:
	li $v0, 4
	la $a0, input1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	beq $t0, $0, END
	
	slti $t1, $t0, 0
	bne $t1, $0, error
	
	slti $t1, $t0, 11
	beq $t1, $0, error
	
	addi $t1, $0, 0
	addi $s0, $0, 0

InputArray:
	beq $t1, $t0, next
	
	li $v0, 4
	la $a0, input2
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, input3
	syscall
	
	li $v0, 5
	syscall
	sw $v0, Arr($s0)
	
	addi $s0, $s0, 4
	addi $t1, $t1, 1
	
	j InputArray

next:
	addi $s0, $0, 0

	li $v0, 4
	la $a0, out_mess
	syscall
	
OutputArray:
	beq $t0, $0, END
	
	lw $t1, Arr($s0)
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $s0, $s0, 4
	addi $t0, $t0, -1
	
	j OutputArray
	
error: 
	li $v0, 4
	la $a0, invalid
	syscall
	
END:
	li $v0, 10
	syscall
