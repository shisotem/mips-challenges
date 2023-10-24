    .text
    .globl main
main:
    la $a0, msg
    li $s1, 0x41
    li $s2, 0x5a
    li $s3, 0x61
    li $s4, 0x7a

L1: add $t2, $a0, $t1
    lb $t0, 0($t2) #
    beq $t0, $zero, L4
    blt $t0, $s1, L3
    ble $t0, $s2, L2 #
    blt $t0, $s3, L3
    bgt $t0, $s4, L3
L2: xori $t0, $t0, 0x0020 #
L3: sb $t0, 0($t2) #
    addi $t1, $t1, 1
    j L1
L4: li $v0, 4 #
    la $a0, msg
    syscall
    li $v0, 10
    syscall
    jr $ra
    .data
msg: .asciiz "OmIyA8\n"