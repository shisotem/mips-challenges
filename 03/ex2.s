    .text
    .globl main

main:
    la $a0, A
    li $s0, 10  # maxCount = 10

L1: sll $t3, $t2, 2  # addAddressNum = count * 4
    add $t1, $a0, $t3  # newAddress = originAddress + addAddressNum

    lw $t0, 0($t1)
    add $s4, $s4, $t0

    addi $t2, $t2, 1  # count += 1
    bne $t2, $s0, L1 # if (count != maxCount) j L1

# 終了処理
    li $v0, 10
    syscall
    jr $ra

    .data
A:  .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10