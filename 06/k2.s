        .text
        .globl main

main:
        li $s0, 3
        la $a0, A
        li $s1, 0x2A
        li $s2, 0x0A

L1:     addi $t1, $t1, 1
        bgt $t1, $s0, L3

L2:     sb $s1, A($t7)
        addi $t7, $t7, 1
        addi $t2, $t2, 1
        blt $t2, $t1, L2
        sb $s2, A($t7)
        addi $t7, $t7, 1
        # move $t7, $zero
        move $t2, $zero
        j L1

L3:     li $v0, 4
        la $a0, A
        syscall

        li $v0, 10
        syscall
        jr $ra

        .data
A:      .space 54