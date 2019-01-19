	.data

__x:	.space 4

__var_intcon_000__:	.word 1

__var_intcon_001__:	.word 0

__var_intcon_004__:	.word 2

__var_intcon_006__:	.word 1

	.text

# OP_ENTER_FUNCTION | __f | No src2 | No dest
__f:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_sub_result_007__' is 4
# stack offset after '__var_mult_result_005__' is 8
# stack offset after '__var_mult_result_003__' is 12
# stack offset after '__var_gt_result_002__' is 13
# stack offset after 'y' is 20
# stack offset after final alignment is 20
    la $sp, -20($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | y
    lw $t0, __var_intcon_000__
    sw $t0, 16($sp)

# OP_GOTO | __label_bot_of_while_001__ | No src2 | No dest
    j __label_bot_of_while_001__

    nop
# OP_LABEL | __label_top_of_while_000__ | No src2 | No dest
__label_top_of_while_000__:
# OP_DUMMY | No src1 | No src2 | __x
# OP_DUMMY | No src1 | No src2 | i
# OP_MULT | __x | i | __var_mult_result_003__
    lw $t0, __x
    lw $t1, 0($fp)
    mul $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_ASSIGN | __var_mult_result_003__ | No src2 | __x
    lw $t0, 8($sp)
    sw $t0, __x
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_DUMMY | No src1 | No src2 | y
# OP_MULT | __var_intcon_004__ | y | __var_mult_result_005__
    lw $t0, __var_intcon_004__
    lw $t1, 16($sp)
    mul $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_mult_result_005__ | No src2 | y
    lw $t0, 4($sp)
    sw $t0, 16($sp)

# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_SUB | i | __var_intcon_006__ | __var_sub_result_007__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_006__
    sub $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_sub_result_007__ | No src2 | i
    lw $t0, 0($sp)
    sw $t0, 0($fp)

# OP_LABEL | __label_bot_of_while_001__ | No src2 | No dest
__label_bot_of_while_001__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_GT | i | __var_intcon_001__ | __var_gt_result_002__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_001__
    sgt $t2, $t0, $t1
    sb $t2, 12($sp)

# OP_FALSE_COND_BRANCH | __var_gt_result_002__ | __label_top_of_while_000__ | No dest
    lb $t2, 12($sp)
    bnez $t2, __label_top_of_while_000__

    nop
# OP_DUMMY | No src1 | No src2 | y
# OP_LEAVE_FUNCTION | __f | No src2 | y
    lw $t2, 16($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_008__:	.word 1

__var_intcon_009__:	.word 6

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_011__' is 4
# stack offset after '__var_func_return_010__' is 8
# stack offset after 'a' is 12
# stack offset after final alignment is 12
    la $sp, -12($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_ASSIGN | __var_intcon_008__ | No src2 | __x
    lw $t0, __var_intcon_008__
    sw $t0, __x
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_CALL_FUNCTION | __f | __function___temp_function_000__ | __var_func_return_010__
    lw $t2, __var_intcon_009__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __f
    nop
    la $sp, 4($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_010__
# OP_ASSIGN | __var_func_return_010__ | No src2 | a
    lw $t0, 4($sp)
    sw $t0, 8($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | __x
# OP_ADD | a | __x | __var_add_result_011__
    lw $t0, 8($sp)
    lw $t1, __x
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_011__ | No src2 | __x
    lw $t0, 0($sp)
    sw $t0, __x
# OP_DUMMY | No src1 | No src2 | __x
# OP_CALL_FUNCTION | print_int | __function___temp_function_001__ | No dest
    lw $t2, __x
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
