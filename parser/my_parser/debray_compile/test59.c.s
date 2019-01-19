# OP_ENTER_FUNCTION | __id | No src2 | No dest
__id:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_LEAVE_FUNCTION | __id | No src2 | x
    lw $t2, 0($fp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_000__:	.word 123

__var_intcon_001__:	.word 3

__var_intcon_004__:	.word 4

__var_intcon_009__:	.word 321

__var_intcon_010__:	.word 12

__var_intcon_014__:	.word 0

__var_intcon_016__:	.word 1

__var_intcon_018__:	.word 1

__var_intcon_020__:	.word 0

__var_intcon_024__:	.word 6

__var_intcon_027__:	.word 1

__var_intcon_029__:	.word 2

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_030__' is 4
# stack offset after '__var_add_result_028__' is 8
# stack offset after '__var_func_return_026__' is 12
# stack offset after '__var_lt_result_025__' is 13
# stack offset after '__var_func_return_023__' is 20
# stack offset after '__var_func_return_022__' is 24
# stack offset after '__var_func_return_021__' is 28
# stack offset after '__var_sub_result_019__' is 32
# stack offset after '__var_sub_result_017__' is 36
# stack offset after '__var_gt_result_015__' is 37
# stack offset after '__var_func_return_013__' is 44
# stack offset after '__var_func_return_012__' is 48
# stack offset after '__var_func_return_011__' is 52
# stack offset after '__var_gt_result_008__' is 53
# stack offset after '__var_func_return_007__' is 60
# stack offset after '__var_func_return_006__' is 64
# stack offset after '__var_func_return_005__' is 68
# stack offset after '__var_func_return_003__' is 72
# stack offset after '__var_func_return_002__' is 76
# stack offset after 'i' is 80
# stack offset after 'x' is 84
# stack offset after final alignment is 84
    la $sp, -84($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | x
    lw $t0, __var_intcon_000__
    sw $t0, 80($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_CALL_FUNCTION | __id | __function___temp_function_000__ | __var_func_return_002__
    lw $t2, __var_intcon_001__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 72($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_002__
# OP_CALL_FUNCTION | __id | __function___temp_function_001__ | __var_func_return_003__
    lw $t2, 72($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 68($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_003__
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_CALL_FUNCTION | __id | __function___temp_function_002__ | __var_func_return_005__
    lw $t2, __var_intcon_004__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 64($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_005__
# OP_CALL_FUNCTION | __id | __function___temp_function_003__ | __var_func_return_006__
    lw $t2, 64($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 60($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_006__
# OP_CALL_FUNCTION | __id | __function___temp_function_004__ | __var_func_return_007__
    lw $t2, 60($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 56($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_007__
# OP_GT | __var_func_return_003__ | __var_func_return_007__ | __var_gt_result_008__
    lw $t0, 68($sp)
    lw $t1, 56($sp)
    sgt $t2, $t0, $t1
    sb $t2, 52($sp)

# OP_COND_BRANCH | __var_gt_result_008__ | __label_else_000__ | No dest
    lb $t2, 52($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_ASSIGN | __var_intcon_009__ | No src2 | x
    lw $t0, __var_intcon_009__
    sw $t0, 80($sp)

# OP_LABEL | __label_else_000__ | No src2 | No dest
__label_else_000__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_ASSIGN | __var_intcon_010__ | No src2 | i
    lw $t0, __var_intcon_010__
    sw $t0, 76($sp)

# OP_GOTO | __label_bot_of_while_003__ | No src2 | No dest
    j __label_bot_of_while_003__

    nop
# OP_LABEL | __label_top_of_while_002__ | No src2 | No dest
__label_top_of_while_002__:
# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_SUB | x | __var_intcon_016__ | __var_sub_result_017__
    lw $t0, 80($sp)
    lw $t1, __var_intcon_016__
    sub $t2, $t0, $t1
    sw $t2, 32($sp)

# OP_ASSIGN | __var_sub_result_017__ | No src2 | x
    lw $t0, 32($sp)
    sw $t0, 80($sp)

# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_SUB | i | __var_intcon_018__ | __var_sub_result_019__
    lw $t0, 76($sp)
    lw $t1, __var_intcon_018__
    sub $t2, $t0, $t1
    sw $t2, 28($sp)

# OP_ASSIGN | __var_sub_result_019__ | No src2 | i
    lw $t0, 28($sp)
    sw $t0, 76($sp)

# OP_LABEL | __label_bot_of_while_003__ | No src2 | No dest
__label_bot_of_while_003__:
# OP_DUMMY | No src1 | No src2 | i
# OP_CALL_FUNCTION | __id | __function___temp_function_005__ | __var_func_return_011__
    lw $t2, 76($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 48($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_011__
# OP_CALL_FUNCTION | __id | __function___temp_function_006__ | __var_func_return_012__
    lw $t2, 48($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 44($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_012__
# OP_CALL_FUNCTION | __id | __function___temp_function_007__ | __var_func_return_013__
    lw $t2, 44($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 40($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_013__
# OP_DUMMY | No src1 | No src2 | __var_intcon_014__
# OP_GT | __var_func_return_013__ | __var_intcon_014__ | __var_gt_result_015__
    lw $t0, 40($sp)
    lw $t1, __var_intcon_014__
    sgt $t2, $t0, $t1
    sb $t2, 36($sp)

# OP_FALSE_COND_BRANCH | __var_gt_result_015__ | __label_top_of_while_002__ | No dest
    lb $t2, 36($sp)
    bnez $t2, __label_top_of_while_002__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_020__
# OP_CALL_FUNCTION | __id | __function___temp_function_008__ | __var_func_return_021__
    lw $t2, __var_intcon_020__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 24($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_021__
# OP_ASSIGN | __var_func_return_021__ | No src2 | i
    lw $t0, 24($sp)
    sw $t0, 76($sp)

# OP_GOTO | __label_for_bot_005__ | No src2 | No dest
    j __label_for_bot_005__

    nop
# OP_LABEL | __label_for_top_004__ | No src2 | No dest
__label_for_top_004__:
# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | __var_intcon_029__
# OP_ADD | x | __var_intcon_029__ | __var_add_result_030__
    lw $t0, 80($sp)
    lw $t1, __var_intcon_029__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_030__ | No src2 | x
    lw $t0, 0($sp)
    sw $t0, 80($sp)

# OP_DUMMY | No src1 | No src2 | i
# OP_CALL_FUNCTION | __id | __function___temp_function_011__ | __var_func_return_026__
    lw $t2, 76($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_026__
# OP_DUMMY | No src1 | No src2 | __var_intcon_027__
# OP_ADD | __var_func_return_026__ | __var_intcon_027__ | __var_add_result_028__
    lw $t0, 8($sp)
    lw $t1, __var_intcon_027__
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_add_result_028__ | No src2 | i
    lw $t0, 4($sp)
    sw $t0, 76($sp)

# OP_LABEL | __label_for_bot_005__ | No src2 | No dest
__label_for_bot_005__:
# OP_DUMMY | No src1 | No src2 | i
# OP_CALL_FUNCTION | __id | __function___temp_function_009__ | __var_func_return_022__
    lw $t2, 76($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 20($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_022__
# OP_CALL_FUNCTION | __id | __function___temp_function_010__ | __var_func_return_023__
    lw $t2, 20($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 16($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_023__
# OP_DUMMY | No src1 | No src2 | __var_intcon_024__
# OP_LT | __var_func_return_023__ | __var_intcon_024__ | __var_lt_result_025__
    lw $t0, 16($sp)
    lw $t1, __var_intcon_024__
    slt $t2, $t0, $t1
    sb $t2, 12($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_025__ | __label_for_top_004__ | No dest
    lb $t2, 12($sp)
    bnez $t2, __label_for_top_004__

    nop
# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | print_int | __function___temp_function_012__ | No dest
    lw $t2, 80($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_013__ | No dest
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
