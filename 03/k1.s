    .text
    .globl main

main:
    la $a0, A
    la $a1, B
    li $s0, 8

    li $s2, 8 # 割る数
    li $t4, 0 # 最高点の初期値
    li $t5, 10 # 最低点の初期値

    li $t6, 10 # 10かける
    li $s6, 5 # あまり判定に使う

L1: sll $t3, $t2, 2
    add $t1, $a0, $t3

    lw $t0, 0($t1)

# 総和
    add $s1, $s1, $t0
# 最高: t4
    ble $t0, $t4, L3
    move $t4, $t0
# 最低: t5
L3: bge $t0, $t5, L2
    move $t5, $t0

# ループの終わり
L2: add $t2, $t2, 1
    bne $t2, $s0, L1

# 平均値（四捨五入）
    div $s1, $s2
    mflo $s3
    mfhi $s4

    mult $s4, $t6
    mflo $t8 # あまり * 10の値

    div $t8, $s2
    mflo $s5

    blt $s5, $s6, L4
    addi $s3, $s3, 1

# 格納処理
L4: sw $s3, 0($a1)
    sw $t4, 4($a1)
    sw $t5, 8($a1)

# 終了処理
    li $v0, 10
    syscall
    jr $ra

    .data
A:  .word 6, 6, 8, 4, 7, 7, 7, 7
B:  .space 12