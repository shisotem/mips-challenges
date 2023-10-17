    .text
    .globl main

main:
    la $a0, A
    la $a1, B

    # 1
    lw $t0, 0($a0)
    li $t1, 255
    mult $t0, $t1
    mflo $t2
    srl $t2, $t2, 3

    # 2
    # tmpする
    lw $t3, 4($a0)
    srl $t4, $t3, 25 # 0が25個 + 上位7bit
    sll $t5, $t3, 7
    or $t5, $t5, $t4

    # 格納処理
    sw $t2, 0($a1)
    sw $t5, 4($a1)

    li $v0, 10 # exit
    syscall
    jr $ra

    .data
A:  .word 1000, 0x54aaab55
B:  .space 8