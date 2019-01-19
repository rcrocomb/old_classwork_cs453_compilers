	.data

__a:	.space 4

__b:	.space 4

__c:	.space 4

__d:	.space 4

__e:	.space 4

__f:	.space 4

__g:	.space 4

__res:	.space 4

__var_intcon_000__:	.word 1

__var_intcon_001__:	.word 2

__var_intcon_002__:	.word 3

__var_intcon_003__:	.word 4

__var_intcon_004__:	.word 5

__var_intcon_005__:	.word 6

__var_intcon_014__:	.word 1111

__var_intcon_015__:	.word 2222

__var_intcon_016__:	.word 3333

__var_intcon_017__:	.word 4444

__var_intcon_018__:	.word 5555

__var_intcon_019__:	.word 6666

__var_intcon_020__:	.word 7777

__var_intcon_021__:	.word 8888

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_lt_result_013__' is 1
# stack offset after '__var_lt_result_012__' is 2
# stack offset after '__var_lt_result_011__' is 3
# stack offset after '__var_negate_010__' is 4
# stack offset after '__var_eq_result_009__' is 5
# stack offset after '__var_lt_result_008__' is 6
# stack offset after '__var_gte_result_007__' is 7
# stack offset after '__var_lt_result_006__' is 8
# stack offset after final alignment is 8
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | __a
    lw $t0, __var_intcon_000__
    sw $t0, __a
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | __b
    lw $t0, __var_intcon_001__
    sw $t0, __b
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | __c
    lw $t0, __var_intcon_002__
    sw $t0, __c
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ASSIGN | __var_intcon_003__ | No src2 | __d
    lw $t0, __var_intcon_003__
    sw $t0, __d
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ASSIGN | __var_intcon_004__ | No src2 | __e
    lw $t0, __var_intcon_004__
    sw $t0, __e
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ASSIGN | __var_intcon_005__ | No src2 | __f
    lw $t0, __var_intcon_005__
    sw $t0, __f
# OP_DUMMY | No src1 | No src2 | __a
# OP_DUMMY | No src1 | No src2 | __b
# OP_LT | __a | __b | __var_lt_result_006__
    lw $t0, __a
    lw $t1, __b
    slt $t2, $t0, $t1
    sb $t2, 7($sp)

# OP_COND_BRANCH | __var_lt_result_006__ | __label_else_000__ | No dest
    lb $t2, 7($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | __b
# OP_DUMMY | No src1 | No src2 | __c
# OP_GTE | __b | __c | __var_gte_result_007__
    lw $t0, __b
    lw $t1, __c
    sge $t2, $t0, $t1
    sb $t2, 6($sp)

# OP_COND_BRANCH | __var_gte_result_007__ | __label_else_002__ | No dest
    lb $t2, 6($sp)
    beqz $t2, __label_else_002__

    nop
# OP_DUMMY | No src1 | No src2 | __c
# OP_DUMMY | No src1 | No src2 | __d
# OP_LT | __c | __d | __var_lt_result_008__
    lw $t0, __c
    lw $t1, __d
    slt $t2, $t0, $t1
    sb $t2, 5($sp)

# OP_COND_BRANCH | __var_lt_result_008__ | __label_else_004__ | No dest
    lb $t2, 5($sp)
    beqz $t2, __label_else_004__

    nop
# OP_DUMMY | No src1 | No src2 | __d
# OP_DUMMY | No src1 | No src2 | __e
# OP_EQ | __d | __e | __var_eq_result_009__
    lw $t0, __d
    lw $t1, __e
    seq $t2, $t0, $t1
    sb $t2, 4($sp)

# OP_NOT | __var_eq_result_009__ | No src2 | __var_negate_010__
    lb $t0, 4($sp)
    li $t1, 1
    sub $t2, $t1, $t0
    sb $t2, 3($sp)

# OP_COND_BRANCH | __var_negate_010__ | __label_else_006__ | No dest
    lb $t2, 3($sp)
    beqz $t2, __label_else_006__

    nop
# OP_DUMMY | No src1 | No src2 | __e
# OP_DUMMY | No src1 | No src2 | __f
# OP_LT | __e | __f | __var_lt_result_011__
    lw $t0, __e
    lw $t1, __f
    slt $t2, $t0, $t1
    sb $t2, 2($sp)

# OP_COND_BRANCH | __var_lt_result_011__ | __label_else_008__ | No dest
    lb $t2, 2($sp)
    beqz $t2, __label_else_008__

    nop
# OP_DUMMY | No src1 | No src2 | __g
# OP_DUMMY | No src1 | No src2 | __f
# OP_LT | __g | __f | __var_lt_result_012__
    lw $t0, __g
    lw $t1, __f
    slt $t2, $t0, $t1
    sb $t2, 1($sp)

# OP_COND_BRANCH | __var_lt_result_012__ | __label_else_010__ | No dest
    lb $t2, 1($sp)
    beqz $t2, __label_else_010__

    nop
# OP_DUMMY | No src1 | No src2 | __g
# OP_DUMMY | No src1 | No src2 | __a
# OP_LT | __g | __a | __var_lt_result_013__
    lw $t0, __g
    lw $t1, __a
    slt $t2, $t0, $t1
    sb $t2, 0($sp)

# OP_COND_BRANCH | __var_lt_result_013__ | __label_else_012__ | No dest
    lb $t2, 0($sp)
    beqz $t2, __label_else_012__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_014__
# OP_ASSIGN | __var_intcon_014__ | No src2 | __res
    lw $t0, __var_intcon_014__
    sw $t0, __res
# OP_GOTO | __label_post_else_013__ | No src2 | No dest
    j __label_post_else_013__

    nop
# OP_LABEL | __label_else_012__ | No src2 | No dest
__label_else_012__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_015__
# OP_ASSIGN | __var_intcon_015__ | No src2 | __res
    lw $t0, __var_intcon_015__
    sw $t0, __res
# OP_LABEL | __label_post_else_013__ | No src2 | No dest
__label_post_else_013__:
# OP_GOTO | __label_post_else_011__ | No src2 | No dest
    j __label_post_else_011__

    nop
# OP_LABEL | __label_else_010__ | No src2 | No dest
__label_else_010__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_ASSIGN | __var_intcon_016__ | No src2 | __res
    lw $t0, __var_intcon_016__
    sw $t0, __res
# OP_LABEL | __label_post_else_011__ | No src2 | No dest
__label_post_else_011__:
# OP_GOTO | __label_post_else_009__ | No src2 | No dest
    j __label_post_else_009__

    nop
# OP_LABEL | __label_else_008__ | No src2 | No dest
__label_else_008__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_017__
# OP_ASSIGN | __var_intcon_017__ | No src2 | __res
    lw $t0, __var_intcon_017__
    sw $t0, __res
# OP_LABEL | __label_post_else_009__ | No src2 | No dest
__label_post_else_009__:
# OP_GOTO | __label_post_else_007__ | No src2 | No dest
    j __label_post_else_007__

    nop
# OP_LABEL | __label_else_006__ | No src2 | No dest
__label_else_006__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_ASSIGN | __var_intcon_018__ | No src2 | __res
    lw $t0, __var_intcon_018__
    sw $t0, __res
# OP_LABEL | __label_post_else_007__ | No src2 | No dest
__label_post_else_007__:
# OP_GOTO | __label_post_else_005__ | No src2 | No dest
    j __label_post_else_005__

    nop
# OP_LABEL | __label_else_004__ | No src2 | No dest
__label_else_004__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_019__
# OP_ASSIGN | __var_intcon_019__ | No src2 | __res
    lw $t0, __var_intcon_019__
    sw $t0, __res
# OP_LABEL | __label_post_else_005__ | No src2 | No dest
__label_post_else_005__:
# OP_GOTO | __label_post_else_003__ | No src2 | No dest
    j __label_post_else_003__

    nop
# OP_LABEL | __label_else_002__ | No src2 | No dest
__label_else_002__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_020__
# OP_ASSIGN | __var_intcon_020__ | No src2 | __res
    lw $t0, __var_intcon_020__
    sw $t0, __res
# OP_LABEL | __label_post_else_003__ | No src2 | No dest
__label_post_else_003__:
# OP_GOTO | __label_post_else_001__ | No src2 | No dest
    j __label_post_else_001__

    nop
# OP_LABEL | __label_else_000__ | No src2 | No dest
__label_else_000__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_021__
# OP_ASSIGN | __var_intcon_021__ | No src2 | __res
    lw $t0, __var_intcon_021__
    sw $t0, __res
# OP_LABEL | __label_post_else_001__ | No src2 | No dest
__label_post_else_001__:
# OP_DUMMY | No src1 | No src2 | __res
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, __res
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_001__ | No dest
    la $t2, __array_stringcon_000__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_LEAVE_FUNCTION | __main | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     

print_int:
    li $v0, 1
    lw $a0, 0($sp)
    syscall
    jr $ra

print_string:
    li $v0, 4
    lw $a0, 0($sp)
    syscall
    jr $ra
