    .text
    .globl main

main:
    li $s1, 3 # data
    andi $t0, $s1, 0x0001
    beq $t0, $zero, L1
    addi $s2, $zero, 1 # data is odd
    j L2
L1: addi $s2, $zero, 2 # data is even
L2: li $v0, 10 # exit
    syscall
    jr $ra

    .data