.data
msg1:.asciiz "Input:  "
msg2:.asciiz "Length of string: "

str1: .space 20
.text
.globl main
main:

	li $v0,4
	la $a0,msg1
	syscall
 
	li $v0,8
	la $a0,str1
	addi $a1,$zero,20
	syscall
	
	la $a0,str1 

	move $t2, $zero

	Loop:
		lb $t0, 0($a0)
		beq $t0, $zero, END
		addi $t2, $t2, 1 
		addi $a0, $a0, 1 
		j Loop

END:
	subi $t2, $t2, 1   # exclude the null terminator

	la $a0,msg2 
	li $v0,4
	syscall
	move $a0,$t2
	li $v0,1
	syscall

	li $v0,10
	syscall
