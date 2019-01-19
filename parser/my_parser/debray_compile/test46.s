	.data

__a:	.space 4

__b:	.space 4

__c:	.space 4

__d:	.space 4

__e:	.space 4

__LIM:	.space 4

__res:	.space 4

__var_intcon_000__:	.word 0

__var_intcon_001__:	.word 3

__var_intcon_002__:	.word 0

__var_intcon_004__:	.word 0

__var_intcon_006__:	.word 0

__var_intcon_008__:	.word 0

__var_intcon_010__:	.word 0

__var_intcon_012__:	.word 1

__var_intcon_014__:	.word 1

__var_intcon_016__:	.word 1

__var_intcon_018__:	.word 1

__var_intcon_020__:	.word 1

__var_intcon_022__:	.word 1

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_023__' is 4
# stack offset after '__var_add_result_021__' is 8
# stack offset after '__var_add_result_019__' is 12
# stack offset after '__var_add_result_017__' is 16
# stack offset after '__var_add_result_015__' is 20
# stack offset after '__var_add_result_013__' is 24
# stack offset after '__var_lt_result_011__' is 25
# stack offset after '__var_lt_result_009__' is 26
# stack offset after '__var_lt_result_007__' is 27
# stack offset after '__var_lt_result_005__' is 28
# stack offset after '__var_lt_result_003__' is 29
# stack offset after final alignment is 32
    la $sp, -32($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | __a
    lw $t0, __var_intcon_000__
    sw $t0, __a
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | __LIM
    lw $t0, __var_intcon_001__
    sw $t0, __LIM
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | __res
    lw $t0, __var_intcon_002__
    sw $t0, __res
# OP_GOTO | __label_bot_of_while_001__ | No src2 | No dest
    j __label_bot_of_while_001__

    nop
# OP_LABEL | __label_top_of_while_000__ | No src2 | No dest
__label_top_of_while_000__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ASSIGN | __var_intcon_004__ | No src2 | __b
    lw $t0, __var_intcon_004__
    sw $t0, __b
# OP_GOTO | __label_bot_of_while_003__ | No src2 | No dest
    j __label_bot_of_while_003__

    nop
# OP_LABEL | __label_top_of_while_002__ | No src2 | No dest
__label_top_of_while_002__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_ASSIGN | __var_intcon_006__ | No src2 | __c
    lw $t0, __var_intcon_006__
    sw $t0, __c
# OP_GOTO | __label_bot_of_while_005__ | No src2 | No dest
    j __label_bot_of_while_005__

    nop
# OP_LABEL | __label_top_of_while_004__ | No src2 | No dest
__label_top_of_while_004__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_ASSIGN | __var_intcon_008__ | No src2 | __d
    lw $t0, __var_intcon_008__
    sw $t0, __d
# OP_GOTO | __label_bot_of_while_007__ | No src2 | No dest
    j __label_bot_of_while_007__

    nop
# OP_LABEL | __label_top_of_while_006__ | No src2 | No dest
__label_top_of_while_006__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_ASSIGN | __var_intcon_010__ | No src2 | __e
    lw $t0, __var_intcon_010__
    sw $t0, __e
# OP_GOTO | __label_bot_of_while_009__ | No src2 | No dest
    j __label_bot_of_while_009__

    nop
# OP_LABEL | __label_top_of_while_008__ | No src2 | No dest
__label_top_of_while_008__:
# OP_DUMMY | No src1 | No src2 | __res
# OP_DUMMY | No src1 | No src2 | __var_intcon_012__
# OP_ADD | __res | __var_intcon_012__ | __var_add_result_013__
    lw $t0, __res
    lw $t1, __var_intcon_012__
    add $t2, $t0, $t1
    sw $t2, 20($sp)

# OP_ASSIGN | __var_add_result_013__ | No src2 | __res
    lw $t0, 20($sp)
    sw $t0, __res
# OP_DUMMY | No src1 | No src2 | __e
# OP_DUMMY | No src1 | No src2 | __var_intcon_014__
# OP_ADD | __e | __var_intcon_014__ | __var_add_result_015__
    lw $t0, __e
    lw $t1, __var_intcon_014__
    add $t2, $t0, $t1
    sw $t2, 16($sp)

# OP_ASSIGN | __var_add_result_015__ | No src2 | __e
    lw $t0, 16($sp)
    sw $t0, __e
# OP_LABEL | __label_bot_of_while_009__ | No src2 | No dest
__label_bot_of_while_009__:
# OP_DUMMY | No src1 | No src2 | __e
# OP_DUMMY | No src1 | No src2 | __LIM
# OP_LT | __e | __LIM | __var_lt_result_011__
    lw $t0, __e
    lw $t1, __LIM
    slt $t2, $t0, $t1
    sb $t2, 24($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_011__ | __label_top_of_while_008__ | No dest
    lb $t2, 24($sp)
    bnez $t2, __label_top_of_while_008__

    nop
# OP_DUMMY | No src1 | No src2 | __d
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_ADD | __d | __var_intcon_016__ | __var_add_result_017__
    lw $t0, __d
    lw $t1, __var_intcon_016__
    add $t2, $t0, $t1
    sw $t2, 12($sp)

# OP_ASSIGN | __var_add_result_017__ | No src2 | __d
    lw $t0, 12($sp)
    sw $t0, __d
# OP_LABEL | __label_bot_of_while_007__ | No src2 | No dest
__label_bot_of_while_007__:
# OP_DUMMY | No src1 | No src2 | __d
# OP_DUMMY | No src1 | No src2 | __LIM
# OP_LT | __d | __LIM | __var_lt_result_009__
    lw $t0, __d
    lw $t1, __LIM
    slt $t2, $t0, $t1
    sb $t2, 25($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_009__ | __label_top_of_while_006__ | No dest
    lb $t2, 25($sp)
    bnez $t2, __label_top_of_while_006__

    nop
# OP_DUMMY | No src1 | No src2 | __c
# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_ADD | __c | __var_intcon_018__ | __var_add_result_019__
    lw $t0, __c
    lw $t1, __var_intcon_018__
    add $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_ASSIGN | __var_add_result_019__ | No src2 | __c
    lw $t0, 8($sp)
    sw $t0, __c
# OP_LABEL | __label_bot_of_while_005__ | No src2 | No dest
__label_bot_of_while_005__:
# OP_DUMMY | No src1 | No src2 | __c
# OP_DUMMY | No src1 | No src2 | __LIM
# OP_LT | __c | __LIM | __var_lt_result_007__
    lw $t0, __c
    lw $t1, __LIM
    slt $t2, $t0, $t1
    sb $t2, 26($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_007__ | __label_top_of_while_004__ | No dest
    lb $t2, 26($sp)
    bnez $t2, __label_top_of_while_004__

    nop
# OP_DUMMY | No src1 | No src2 | __b
# OP_DUMMY | No src1 | No src2 | __var_intcon_020__
# OP_ADD | __b | __var_intcon_020__ | __var_add_result_021__
    lw $t0, __b
    lw $t1, __var_intcon_020__
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_add_result_021__ | No src2 | __b
    lw $t0, 4($sp)
    sw $t0, __b
# OP_LABEL | __label_bot_of_while_003__ | No src2 | No dest
__label_bot_of_while_003__:
# OP_DUMMY | No src1 | No src2 | __b
# OP_DUMMY | No src1 | No src2 | __LIM
# OP_LT | __b | __LIM | __var_lt_result_005__
    lw $t0, __b
    lw $t1, __LIM
    slt $t2, $t0, $t1
    sb $t2, 27($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_005__ | __label_top_of_while_002__ | No dest
    lb $t2, 27($sp)
    bnez $t2, __label_top_of_while_002__

    nop
# OP_DUMMY | No src1 | No src2 | __a
# OP_DUMMY | No src1 | No src2 | __var_intcon_022__
# OP_ADD | __a | __var_intcon_022__ | __var_add_result_023__
    lw $t0, __a
    lw $t1, __var_intcon_022__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_023__ | No src2 | __a
    lw $t0, 0($sp)
    sw $t0, __a
# OP_LABEL | __label_bot_of_while_001__ | No src2 | No dest
__label_bot_of_while_001__:
# OP_DUMMY | No src1 | No src2 | __a
# OP_DUMMY | No src1 | No src2 | __LIM
# OP_LT | __a | __LIM | __var_lt_result_003__
    lw $t0, __a
    lw $t1, __LIM
    slt $t2, $t0, $t1
    sb $t2, 28($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_003__ | __label_top_of_while_000__ | No dest
    lb $t2, 28($sp)
    bnez $t2, __label_top_of_while_000__

    nop
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
