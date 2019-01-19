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

__var_intcon_000__:	.word 1

__var_intcon_001__:	.word 7

__var_intcon_002__:	.word 0

__var_intcon_004__:	.word 1

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_mult_result_007__' is 4
# stack offset after '__var_func_return_006__' is 8
# stack offset after '__var_sub_result_005__' is 12
# stack offset after '__var_gt_result_003__' is 13
# stack offset after 'f' is 20
# stack offset after 'n' is 24
# stack offset after final alignment is 24
    la $sp, -24($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | f
    lw $t0, __var_intcon_000__
    sw $t0, 16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | n
    lw $t0, __var_intcon_001__
    sw $t0, 20($sp)

# OP_GOTO | __label_for_bot_001__ | No src2 | No dest
    j __label_for_bot_001__

    nop
# OP_LABEL | __label_for_top_000__ | No src2 | No dest
__label_for_top_000__:
# OP_DUMMY | No src1 | No src2 | n
# OP_CALL_FUNCTION | __id | __function___temp_function_000__ | __var_func_return_006__
    lw $t2, 20($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_006__
# OP_DUMMY | No src1 | No src2 | f
# OP_MULT | __var_func_return_006__ | f | __var_mult_result_007__
    lw $t0, 4($sp)
    lw $t1, 16($sp)
    mul $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_mult_result_007__ | No src2 | f
    lw $t0, 0($sp)
    sw $t0, 16($sp)

# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_SUB | n | __var_intcon_004__ | __var_sub_result_005__
    lw $t0, 20($sp)
    lw $t1, __var_intcon_004__
    sub $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_ASSIGN | __var_sub_result_005__ | No src2 | n
    lw $t0, 8($sp)
    sw $t0, 20($sp)

# OP_LABEL | __label_for_bot_001__ | No src2 | No dest
__label_for_bot_001__:
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_GT | n | __var_intcon_002__ | __var_gt_result_003__
    lw $t0, 20($sp)
    lw $t1, __var_intcon_002__
    sgt $t2, $t0, $t1
    sb $t2, 12($sp)

# OP_FALSE_COND_BRANCH | __var_gt_result_003__ | __label_for_top_000__ | No dest
    lb $t2, 12($sp)
    bnez $t2, __label_for_top_000__

    nop
# OP_DUMMY | No src1 | No src2 | f
# OP_CALL_FUNCTION | print_int | __function___temp_function_001__ | No dest
    lw $t2, 16($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_002__ | No dest
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
