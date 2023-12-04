        .text
        .globl  main

main:
        li $a0, 3 # n=3としてプログラムを実行

        addi $sp, $sp, -4 # OSへの戻り番地をpush
        sw $ra, 0($sp)
        
        jal Func

        lw $ra, 0($sp) # OSへの戻り番地をpop
        addi $sp, $sp, 4

        move $s1, $v0 # 最終的な回答を$s1とする

        li $v0, 10 # 終了
        syscall
        jr $ra

Func:
        addi $sp, $sp, -8 # スタックフレームの作成
        sw $s0, 4($sp) # $s0の値: (0, )をpush
        sw $ra, 0($sp) # (12, )への戻り番地をpush

        ### base case
        li $v0, 0 # n=0のとき返す値はこれを使う
        beq $a0, $zero, Func_return
        move $s0, $a0 # $a0: 引数 / $s0: 2n-1の計算に使うn
        
        addi $a0, $a0, -1 # 引数をデクリメントして
        jal Func # 呼び出す (-> $v0が返り値となる)

        sll $s0, $s0, 1 # 2 * n
        addi $s0, $s0, -1 # 2 * n - 1
        add $v0, $v0, $s0 # Func(n-1) + 2 * n - 1

Func_return:
        lw $s0, 4($sp)
        lw $ra, 0($sp)
        addi $sp, $sp, 8

        jr $ra


        .data