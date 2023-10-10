    .text
    .globl main
main:
    la $a0, A
    lw $t0, 0($a0)
    lw $t1, 4($a0)
    lw $t2, 8($a0)

    # 本当はaddiでOK
    li $t3, 2
    add $t0, $t0, $t3
    add $t1, $t1, $t3
    add $t2, $t2, $t3

    sw $t0, 0($a0)
    sw $t1, 4($a0)
    sw $t2, 8($a0)

    # 終了処理
    li $v0, 10
    syscall
    jr $ra

    .data
A: .word 5, 10, 15