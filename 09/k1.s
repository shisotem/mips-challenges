###
### A(n) = A(n-1) + 2*n-1, A(0) = 0 なる再帰プログラム
###

        .text
        .globl  main

main:
        li $a0, 3 # n=3としてプログラムを実行

        addi $sp, $sp, -4 # OSへの戻り番地をpush
        sw $ra, 0($sp)
        
        jal Func # ($a0: 3) => $v0: Func(3)

        lw $ra, 0($sp) # OSへの戻り番地をpop
        addi $sp, $sp, 4

        move $s1, $v0 # 最終的な回答を$s1とする (問の仕様上)

        li $v0, 10 # 終了
        syscall
        jr $ra

Func:
        addi $sp, $sp, -8 # スタックフレームの作成
        sw $s0, 4($sp) # $s0の値: (0, 3, 2, 1)をpush
        sw $ra, 0($sp) # (12, 40, 40, 40)行目への戻り番地をpush

        ### base case ($a0=0 のとき)
        li $v0, 0 # Func(0)の返り値は0なので$v0に0をセット
        beq $a0, $zero, Func_return # $a0=0 のとき
        ### base case

        move $s0, $a0 # 2*n-1の計算に使うnを$s0(->stack)に退避しておく
        addi $a0, $a0, -1 # $a0(引数)をデクリメント (n->n-1) して
        jal Func # 呼び出す ($a0: n-1) => $v0: Func(n-1)

        # calc part
        sll $s0, $s0, 1 # 2*n ($s0はスタック頂上からpopした値)
        addi $s0, $s0, -1 # 2*n-1
        add $v0, $v0, $s0 # Func(n-1) + 2*n-1

        # $v0: 0 + 2*1-1 となり、そのまま↓へ (注: Func_returnはただのラベル)

Func_return:
        lw $s0, 4($sp) # スタック頂上の $ra と $s0 を取り出す(pop)
        lw $ra, 0($sp)
        addi $sp, $sp, 8

        jr $ra # stack頂上の$raに書かれていた番地にジャンプ(->計算パート)


        .data