    .text
    .globl main
main:
    li $s0, 2023
    li $s1, 9
    li $s2, 26

    mult $s1, $s2
    mflo $t0

    add $t0, $t0, $t0

    div $s0, $t0
    mflo $s3
    mfhi $s4

# 終了処理
    li $v0, 10
    syscall
    jr $ra

    .data