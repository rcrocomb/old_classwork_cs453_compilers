	.data

__var_intcon_000__:	.word 0

__var_intcon_001__:	.word 123

__var_intcon_002__:	.word 5

__var_intcon_004__:	.word 0

__var_intcon_005__:	.word 5

__var_intcon_008__:	.word 2

__var_intcon_011__:	.word 0

__var_intcon_012__:	.word 5

__var_intcon_015__:	.word 2

__var_intcon_020__:	.word 1

__var_intcon_022__:	.word 1

__var_intcon_024__:	.word 1

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
# stack offset after '__var_add_result_023__' is 8
# stack offset after '__var_add_result_021__' is 12
# stack offset after '__var_add_result_019__' is 16
# stack offset after '__var_add_result_018__' is 20
# stack offset after '__var_gt_result_017__' is 21
# stack offset after '__var_div_result_016__' is 28
# stack offset after '__var_add_result_014__' is 32
# stack offset after '__var_lt_result_013__' is 33
# stack offset after '__var_gt_result_010__' is 34
# stack offset after '__var_div_result_009__' is 40
# stack offset after '__var_add_result_007__' is 44
# stack offset after '__var_lt_result_006__' is 45
# stack offset after '__var_lt_result_003__' is 46
# stack offset after 'res' is 52
# stack offset after 'b' is 56
# stack offset after 'a' is 60
# stack offset after 'k' is 64
# stack offset after 'j' is 68
# stack offset after 'i' is 72
# stack offset after final alignment is 72
    la $sp, -72($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | i
    lw $t0, __var_intcon_000__
    sw $t0, 68($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | res
    lw $t0, __var_intcon_001__
    sw $t0, 48($sp)

# OP_GOTO | __label_bot_of_while_001__ | No src2 | No dest
    j __label_bot_of_while_001__

    nop
# OP_LABEL | __label_top_of_while_000__ | No src2 | No dest
__label_top_of_while_000__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ASSIGN | __var_intcon_004__ | No src2 | j
    lw $t0, __var_intcon_004__
    sw $t0, 64($sp)

# OP_GOTO | __label_bot_of_while_003__ | No src2 | No dest
    j __label_bot_of_while_003__

    nop
# OP_LABEL | __label_top_of_while_002__ | No src2 | No dest
__label_top_of_while_002__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | j
# OP_ADD | i | j | __var_add_result_007__
    lw $t0, 68($sp)
    lw $t1, 64($sp)
    add $t2, $t0, $t1
    sw $t2, 40($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_DIV | __var_add_result_007__ | __var_intcon_008__ | __var_div_result_009__
    lw $t0, 40($sp)
    lw $t1, __var_intcon_008__
    div $t2, $t0, $t1
    sw $t2, 36($sp)

# OP_ASSIGN | __var_div_result_009__ | No src2 | k
    lw $t0, 36($sp)
    sw $t0, 60($sp)

# OP_DUMMY | No src1 | No src2 | k
# OP_DUMMY | No src1 | No src2 | i
# OP_GT | k | i | __var_gt_result_010__
    lw $t0, 60($sp)
    lw $t1, 68($sp)
    sgt $t2, $t0, $t1
    sb $t2, 33($sp)

# OP_COND_BRANCH | __var_gt_result_010__ | __label_else_004__ | No dest
    lb $t2, 33($sp)
    beqz $t2, __label_else_004__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_011__
# OP_ASSIGN | __var_intcon_011__ | No src2 | a
    lw $t0, __var_intcon_011__
    sw $t0, 56($sp)

# OP_GOTO | __label_bot_of_while_007__ | No src2 | No dest
    j __label_bot_of_while_007__

    nop
# OP_LABEL | __label_top_of_while_006__ | No src2 | No dest
__label_top_of_while_006__:
# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | k
# OP_ADD | a | k | __var_add_result_014__
    lw $t0, 56($sp)
    lw $t1, 60($sp)
    add $t2, $t0, $t1
    sw $t2, 28($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_015__
# OP_DIV | __var_add_result_014__ | __var_intcon_015__ | __var_div_result_016__
    lw $t0, 28($sp)
    lw $t1, __var_intcon_015__
    div $t2, $t0, $t1
    sw $t2, 24($sp)

# OP_ASSIGN | __var_div_result_016__ | No src2 | b
    lw $t0, 24($sp)
    sw $t0, 52($sp)

# OP_DUMMY | No src1 | No src2 | b
# OP_DUMMY | No src1 | No src2 | j
# OP_GT | b | j | __var_gt_result_017__
    lw $t0, 52($sp)
    lw $t1, 64($sp)
    sgt $t2, $t0, $t1
    sb $t2, 20($sp)

# OP_COND_BRANCH | __var_gt_result_017__ | __label_else_008__ | No dest
    lb $t2, 20($sp)
    beqz $t2, __label_else_008__

    nop
# OP_DUMMY | No src1 | No src2 | res
# OP_DUMMY | No src1 | No src2 | b
# OP_ADD | res | b | __var_add_result_018__
    lw $t0, 48($sp)
    lw $t1, 52($sp)
    add $t2, $t0, $t1
    sw $t2, 16($sp)

# OP_ASSIGN | __var_add_result_018__ | No src2 | res
    lw $t0, 16($sp)
    sw $t0, 48($sp)

# OP_GOTO | __label_post_else_009__ | No src2 | No dest
    j __label_post_else_009__

    nop
# OP_LABEL | __label_else_008__ | No src2 | No dest
__label_else_008__:
# OP_DUMMY | No src1 | No src2 | res
# OP_DUMMY | No src1 | No src2 | k
# OP_ADD | res | k | __var_add_result_019__
    lw $t0, 48($sp)
    lw $t1, 60($sp)
    add $t2, $t0, $t1
    sw $t2, 12($sp)

# OP_ASSIGN | __var_add_result_019__ | No src2 | res
    lw $t0, 12($sp)
    sw $t0, 48($sp)

# OP_LABEL | __label_post_else_009__ | No src2 | No dest
__label_post_else_009__:
# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | __var_intcon_020__
# OP_ADD | a | __var_intcon_020__ | __var_add_result_021__
    lw $t0, 56($sp)
    lw $t1, __var_intcon_020__
    add $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_ASSIGN | __var_add_result_021__ | No src2 | a
    lw $t0, 8($sp)
    sw $t0, 56($sp)

# OP_LABEL | __label_bot_of_while_007__ | No src2 | No dest
__label_bot_of_while_007__:
# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | __var_intcon_012__
# OP_LT | a | __var_intcon_012__ | __var_lt_result_013__
    lw $t0, 56($sp)
    lw $t1, __var_intcon_012__
    slt $t2, $t0, $t1
    sb $t2, 32($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_013__ | __label_top_of_while_006__ | No dest
    lb $t2, 32($sp)
    bnez $t2, __label_top_of_while_006__

    nop
# OP_LABEL | __label_else_004__ | No src2 | No dest
__label_else_004__:
# OP_DUMMY | No src1 | No src2 | j
# OP_DUMMY | No src1 | No src2 | __var_intcon_022__
# OP_ADD | j | __var_intcon_022__ | __var_add_result_023__
    lw $t0, 64($sp)
    lw $t1, __var_intcon_022__
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_add_result_023__ | No src2 | j
    lw $t0, 4($sp)
    sw $t0, 64($sp)

# OP_LABEL | __label_bot_of_while_003__ | No src2 | No dest
__label_bot_of_while_003__:
# OP_DUMMY | No src1 | No src2 | j
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_LT | j | __var_intcon_005__ | __var_lt_result_006__
    lw $t0, 64($sp)
    lw $t1, __var_intcon_005__
    slt $t2, $t0, $t1
    sb $t2, 44($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_006__ | __label_top_of_while_002__ | No dest
    lb $t2, 44($sp)
    bnez $t2, __label_top_of_while_002__

    nop
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_024__
# OP_ADD | i | __var_intcon_024__ | __var_add_result_025__
    lw $t0, 68($sp)
    lw $t1, __var_intcon_024__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_025__ | No src2 | i
    lw $t0, 0($sp)
    sw $t0, 68($sp)

# OP_LABEL | __label_bot_of_while_001__ | No src2 | No dest
__label_bot_of_while_001__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_LT | i | __var_intcon_002__ | __var_lt_result_003__
    lw $t0, 68($sp)
    lw $t1, __var_intcon_002__
    slt $t2, $t0, $t1
    sb $t2, 45($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_003__ | __label_top_of_while_000__ | No dest
    lb $t2, 45($sp)
    bnez $t2, __label_top_of_while_000__

    nop
# OP_DUMMY | No src1 | No src2 | res
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, 48($sp)
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
