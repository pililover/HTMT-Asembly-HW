.data
num1_mes: .asciiz "Input a: "
num2_mes: .asciiz "Input b: "
result_mes: .asciiz "Result: "

case1: .asciiz "a > b"
case2: .asciiz "a < b"
case3: .asciiz "a = b"

.text
main:
	li $v0, 4
	la $a0, num1_mes
	syscall

	li $v0, 5
	syscall 
	move $t0, $v0

	li $v0, 4
	la $a0, num2_mes
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	beq $t0, $t1, printEqual

	slt $t2, $t0, $t1
	bne $t2, $zero, printLess

	li $v0, 4
	la $a0, result_mes
	syscall

	li $v0, 4
	la $a0, case1
	syscall
	j END

	printEqual:
		li $v0, 4
		la $a0, result_mes
		syscall

		li $v0, 4
		la $a0, case3
		syscall
		j END

	printLess:
		li $v0, 4
		la $a0, result_mes
		syscall

		li $v0, 4
		la $a0, case2
		syscall

END:
	li $v0, 10
	syscall
