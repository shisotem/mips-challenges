    .text
    .globl main

main:
    li $s0, 10          # maxCount = 10
L1: addi $t0, $t0, 1    # addNum += 1
    add $s4, $s4, $t0   # sum += addNum
    addi $t2, $t2, 1    # count += 1
    bne $t2, $s0, L1    # if (count != maxCount) j Li

# 終了処理
    li $v0, 10
    syscall
    jr $ra

    .data