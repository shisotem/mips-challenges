        .text
        .globl main

main:
        addi $sp, $sp, -4
        sw $ra, 0($sp)

        # input
        li $v0, 5
        syscall
        move $a0, $v0  # a0: loop count (row)

        # CONST_ASCII
        li $s0, 0x0A  # \n

Loop:   
        jal Linedisp

        addi $a0, $a0, -1
        bgt $a0, $zero, Loop

        # draw
        li $v0, 4
        la $a0, A
        syscall
        # fin
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        li $v0, 10
        syscall
        jr $ra

Linedisp:
        move $s1, $a0  # s1: max loop num (32bit)
        addi $s1, $s1, 48  # s1: max loop num (8bit/ASCII)

        move $s2, $a0  # s2: loop count (column)        
Inlineloop:

        sb $s1, A($t7)
        addi $t7, $t7, 1

        addi $s2, $s2, -1
        bgt $s2, $zero, Inlineloop

        sb $s0, A($t7)
        addi $t7, $t7, 1

        jr $ra

        .data
A:      .space 100