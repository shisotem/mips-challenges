        .text
        .globl main

main:
        li $s1, 0x41
        li $s2, 0x5A
        li $s3, 0x61
        li $s4, 0x7A
        li $s5, 0x20

        li $v0, 8
        la $a0, A
        li $a1, 109
        syscall

L1:     lb $t0, A($t1) # t1: index of A, t0: character
        beq $t0, $zero, L6
        beq $t1, $zero, L3
        beq $t0, $s5, L5
        bne $t6, $zero, L3 # t6: spaceFlag
        blt $t0, $s1, L2
        bgt $t0, $s2, L2
        xori $t0, $t0, 0x20 # large -> small

L2:     sb $t0, B($t2) # t2: index of B
        addi $t1, $t1, 1
        addi $t2, $t2, 1
        j L1

L3:     blt $t0, $s3, L4
        bgt $t0, $s4, L4
        xori $t0, $t0, 0x20 # small -> large

L4:     sb $t0, B($t2)
        li $t6, 0
        addi $t1, $t1, 1
        addi $t2, $t2, 1
        j L1

L5:     li $t6, 1
        sb $t0, B($t2)
        addi $t1, $t1, 1
        addi $t2, $t2, 1
        j L1

L6:     sb $t0, B($t2)
        
        li $v0, 4
        la $a0, B
        syscall

        li $v0, 10
        syscall
        jr $ra

        .data
A:      .space 109
B:      .space 109