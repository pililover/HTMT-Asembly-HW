.data
msg1:.asciiz "Nhap chu:  "
msg2:.asciiz "Length: "

str1: .space 20
.text
.globl main
main:

addi $v0, $v0,4
la $a0,msg1
syscall
 
li $v0,8
la $a0,str1
addi $a1,$zero,20
syscall

la $a0,str1 


Loop:
lb $t0, 0($a0)
beq $t0, $zero, done
addi $t2, $t2, 1 
addi $s1, $s1, 1 
j Loop

done:
la $a0,msg2 
li $v0,4
syscall
move $a0,$t0
li $v0,1
syscall

li $v0,10
syscall
