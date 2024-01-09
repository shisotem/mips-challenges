        .text
        .globl  main
main:
        addi $sp, $sp, -4
        sw $ra, 0($sp)

INLOOP:
        li $v0, 4
        la $a0, KMSG
        syscall
        li ##
        syscall
        move $s6, $v0
        beq $s6, ##
        la $a0, first
        move $a1, $s6
        jal BST
        j INLOOP

ENDPRC:
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        li $v0, 4
        la $a0, EDMSG
        syscall
        li $v0, 10
        syscall
        jr $ra

BST:
        lw $s1, 0($a0)
        move $t3, $a0
        move $t2, $a1
        beq $s1, $zero, ADDND

LOOP:
        ##
        move $t2, $a1
        beq $t1, $t2, FOUND
        blt ##
        addi $t3, $s1, 8
        ##
        j NEXT

RIGHT:
        ##
        lw $t4, 0($t3)

NEXT:
        beq, $t4, $zero, ADDND
        move $s1, $t4
        j LOOP

ADDND:
        li $v0, ##
        ##
        syscall
        move $s2, $v0
        sw $s2, 0($t3)
        sw $t2, 0($s2)
        li $v0, 4
        la $a0, ADDMSG
        syscall
        li $v0, 5
        syscall
        move $s7, $v0
        ##
        sw $zero, 8($s2)
        sw $zero, 12($s2)
        jr $ra

FOUND:
        li $v0, 4
        la $a0, FDMSG
        syscall
        li $v0, 1
        move $a0, $t1
        syscall
        li $v0, 4
        la $a0, SPACE
        syscall
        li $v0, 1
        lw $a0, ##
        syscall
        li $v0, 4
        la $a0, NEWL
        syscall
        jr $ra

        .data
first:  .word 0
KMSG:   .asciiz "顧客番号を入力して下さい: "
FDMSG:  .asciiz "登録されています．顧客番号と誕生日は: /n"
ADDMSG: .asciiz "無いので登録します．内線番号を入力してして下さい: "
SPACE:  .asciiz " "
NEWL:   .asciiz "/n/n"
EDMSG:  .asciiz "プログラムを終了します．/n"