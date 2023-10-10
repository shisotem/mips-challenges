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
#     add $t2, $t2, 1
#     bne $t2, $s0, L1  (<- blt $t2, $s0, L1 でもOK!)