    .text
    .globl main

main:
    la $a0, A

    lw $t0, 0($a0)
    lw $t1, 4($a0)
    addi $t0, $t0, -1
    addi $t1, $t1, 1
    sw $t0, 0($a0)
    sw $t1, 4($a0)

    lw $t0, 4($a0)
    lw $t1, 8($a0)
    addi $t0, $t0, -2
    addi $t1, $t1, 2
    sw $t0, 4($a0)
    sw $t1, 8($a0)

    lw $t0, 8($a0)
    lw $t1, 12($a0)
    addi $t0, $t0, -3
    addi $t1, $t1, 3
    sw $t0, 8($a0)
    sw $t1, 12($a0)

    lw $t0, 12($a0)
    lw $t1, 16($a0)
    addi $t0, $t0, -4
    addi $t1, $t1, 4
    sw $t0, 12($a0)
    sw $t1, 16($a0)

    # 終了処理
    li $v0, 10
    syscall
    jr $ra

    .data
A: .word 5, 4, 3, 2, 1