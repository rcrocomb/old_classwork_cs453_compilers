	.data

__var_intcon_000__:	.word 123

__var_intcon_001__:	.word 0

__var_intcon_002__:	.word 5

__var_intcon_004__:	.word 1

__var_intcon_006__:	.word 0

__var_intcon_007__:	.word 5

__var_intcon_009__:	.word 1

__var_intcon_012__:	.word 2

__var_intcon_015__:	.word 0

__var_intcon_016__:	.word 5

__var_intcon_018__:	.word 1

__var_intcon_021__:	.word 2

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_025__' is 4
# stack offset after '__var_add_result_024__' is 8
# stack offset after '__var_gt_result_023__' is 9
# stack offset after '__var_div_result_022__' is 16
# stack offset after '__var_add_result_020__' is 20
# stack offset after '__var_add_result_019__' is 24
# stack offset after '__var_lt_result_017__' is 25
# stack offset after '__var_gt_result_014__' is 26
# stack offset after '__var_div_result_013__' is 32
# stack offset after '__var_add_result_011__' is 36
# stack offset after '__var_add_result_010__' is 40
# stack offset after '__var_lt_result_008__' is 41
# stack offset after '__var_add_result_005__' is 48
# stack offset after '__var_lt_result_003__' is 49
# stack offset after 'res' is 56
# stack offset after 'b' is 60
# stack offset after 'a' is 64
# stack offset after 'k' is 68
# stack offset after 'j' is 72
# stack offset after 'i' is 76
# stack offset after final alignment is 76
    la $sp, -76($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | res
    lw $t0, __var_intcon_000__
    sw $t0, 52($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | i
    lw $t0, __var_intcon_001__
    sw $t0, 72($sp)

# OP_GOTO | __label_for_bot_001__ | No src2 | No dest
    j __label_for_bot_001__

    nop
# OP_LABEL | __label_for_top_000__ | No src2 | No dest
__label_for_top_000__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_ASSIGN | __var_intcon_006__ | No src2 | j
    lw $t0, __var_intcon_006__
    sw $t0, 68($sp)

# OP_GOTO | __label_for_bot_003__ | No src2 | No dest
    j __label_for_bot_003__

    nop
# OP_LABEL | __label_for_top_002__ | No src2 | No dest
__label_for_top_002__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | j
# OP_ADD | i | j | __var_add_result_011__
    lw $t0, 72($sp)
    lw $t1, 68($sp)
    add $t2, $t0, $t1
    sw $t2, 32($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_012__
# OP_DIV | __var_add_result_011__ | __var_intcon_012__ | __var_div_result_013__
    lw $t0, 32($sp)
    lw $t1, __var_intcon_012__
    div $t2, $t0, $t1
    sw $t2, 28($sp)

# OP_ASSIGN | __var_div_result_013__ | No src2 | k
    lw $t0, 28($sp)
    sw $t0, 64($sp)

# OP_DUMMY | No src1 | No src2 | k
# OP_DUMMY | No src1 | No src2 | i
# OP_GT | k | i | __var_gt_result_014__
    lw $t0, 64($sp)
    lw $t1, 72($sp)
    sgt $t2, $t0, $t1
    sb $t2, 25($sp)

# OP_COND_BRANCH | __var_gt_result_014__ | __label_else_004__ | No dest
    lb $t2, 25($sp)
    beqz $t2, __label_else_004__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_015__
# OP_ASSIGN | __var_intcon_015__ | No src2 | a
    lw $t0, __var_intcon_015__
    sw $t0, 60($sp)

# OP_GOTO | __label_for_bot_007__ | No src2 | No dest
    j __label_for_bot_007__

    nop
# OP_LABEL | __label_for_top_006__ | No src2 | No dest
__label_for_top_006__:
# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | k
# OP_ADD | a | k | __var_add_result_020__
    lw $t0, 60($sp)
    lw $t1, 64($sp)
    add $t2, $t0, $t1
    sw $t2, 16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_021__
# OP_DIV | __var_add_result_020__ | __var_intcon_021__ | __var_div_result_022__
    lw $t0, 16($sp)
    lw $t1, __var_intcon_021__
    div $t2, $t0, $t1
    sw $t2, 12($sp)

# OP_ASSIGN | __var_div_result_022__ | No src2 | b
    lw $t0, 12($sp)
    sw $t0, 56($sp)

# OP_DUMMY | No src1 | No src2 | b
# OP_DUMMY | No src1 | No src2 | j
# OP_GT | b | j | __var_gt_result_023__
    lw $t0, 56($sp)
    lw $t1, 68($sp)
    sgt $t2, $t0, $t1
    sb $t2, 8($sp)

# OP_COND_BRANCH | __var_gt_result_023__ | __label_else_008__ | No dest
    lb $t2, 8($sp)
    beqz $t2, __label_else_008__

    nop
# OP_DUMMY | No src1 | No src2 | res
# OP_DUMMY | No src1 | No src2 | b
# OP_ADD | res | b | __var_add_result_024__
    lw $t0, 52($sp)
    lw $t1, 56($sp)
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_add_result_024__ | No src2 | res
    lw $t0, 4($sp)
    sw $t0, 52($sp)

# OP_GOTO | __label_post_else_009__ | No src2 | No dest
    j __label_post_else_009__

    nop
# OP_LABEL | __label_else_008__ | No src2 | No dest
__label_else_008__:
# OP_DUMMY | No src1 | No src2 | res
# OP_DUMMY | No src1 | No src2 | k
# OP_ADD | res | k | __var_add_result_025__
    lw $t0, 52($sp)
    lw $t1, 64($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_025__ | No src2 | res
    lw $t0, 0($sp)
    sw $t0, 52($sp)

# OP_LABEL | __label_post_else_009__ | No src2 | No dest
__label_post_else_009__:
# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_ADD | a | __var_intcon_018__ | __var_add_result_019__
    lw $t0, 60($sp)
    lw $t1, __var_intcon_018__
    add $t2, $t0, $t1
    sw $t2, 20($sp)

# OP_ASSIGN | __var_add_result_019__ | No src2 | a
    lw $t0, 20($sp)
    sw $t0, 60($sp)

# OP_LABEL | __label_for_bot_007__ | No src2 | No dest
__label_for_bot_007__:
# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_LT | a | __var_intcon_016__ | __var_lt_result_017__
    lw $t0, 60($sp)
    lw $t1, __var_intcon_016__
    slt $t2, $t0, $t1
    sb $t2, 24($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_017__ | __label_for_top_006__ | No dest
    lb $t2, 24($sp)
    bnez $t2, __label_for_top_006__

    nop
# OP_LABEL | __label_else_004__ | No src2 | No dest
__label_else_004__:
# OP_DUMMY | No src1 | No src2 | j
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_ADD | j | __var_intcon_009__ | __var_add_result_010__
    lw $t0, 68($sp)
    lw $t1, __var_intcon_009__
    add $t2, $t0, $t1
    sw $t2, 36($sp)

# OP_ASSIGN | __var_add_result_010__ | No src2 | j
    lw $t0, 36($sp)
    sw $t0, 68($sp)

# OP_LABEL | __label_for_bot_003__ | No src2 | No dest
__label_for_bot_003__:
# OP_DUMMY | No src1 | No src2 | j
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_LT | j | __var_intcon_007__ | __var_lt_result_008__
    lw $t0, 68($sp)
    lw $t1, __var_intcon_007__
    slt $t2, $t0, $t1
    sb $t2, 40($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_008__ | __label_for_top_002__ | No dest
    lb $t2, 40($sp)
    bnez $t2, __label_for_top_002__

    nop
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ADD | i | __var_intcon_004__ | __var_add_result_005__
    lw $t0, 72($sp)
    lw $t1, __var_intcon_004__
    add $t2, $t0, $t1
    sw $t2, 44($sp)

# OP_ASSIGN | __var_add_result_005__ | No src2 | i
    lw $t0, 44($sp)
    sw $t0, 72($sp)

# OP_LABEL | __label_for_bot_001__ | No src2 | No dest
__label_for_bot_001__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_LT | i | __var_intcon_002__ | __var_lt_result_003__
    lw $t0, 72($sp)
    lw $t1, __var_intcon_002__
    slt $t2, $t0, $t1
    sb $t2, 48($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_003__ | __label_for_top_000__ | No dest
    lb $t2, 48($sp)
    bnez $t2, __label_for_top_000__

    nop
# OP_DUMMY | No src1 | No src2 | res
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, 52($sp)
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
