    .text
    .globl main

main:
    la $a0, A
    li $s0, 10

    li $s1, 3 ##

L1: sll $t3, $t2, 2
    add $t1, $a0, $t3

    lw $t0, 0($t1)

    div $t0, $s1 ##
    mfhi $s2 ##
    bne $s2, $zero, L2 ##
    addi $s5, $s5, 1 ##

L2: add $t2, $t2, 1
    bne $t2, $s0, L1

# 終了処理
    li $v0, 10
    syscall
    jr $ra

    .data
A:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10


### note

### for (int i = 0; i < 10; i++) int t0 = A[i]; のテンプレ

#     la $a0, A
#     li $s0, 10
# 
# L1: sll $t3, $t2, 2
#     add $t1, $a0, $t3
# 
#     lw $t0, 0($t1)
#     
# 
#     add $t2, $t2, 1
#     bne $t2, $s0, L1

### このテンプレに"3の倍数を判定してカウントアップする処理（##）"を追加