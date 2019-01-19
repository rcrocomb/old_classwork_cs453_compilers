	.data

__y:	.space 4

	.text

# OP_ENTER_FUNCTION | __add | No src2 | No dest
__add:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_000__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | __y
# OP_ADD | x | __y | __var_add_result_000__
    lw $t0, 0($fp)
    lw $t1, __y
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_000__ | No src2 | __y
    lw $t0, 0($sp)
    sw $t0, __y
# OP_LEAVE_FUNCTION | __add | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_001__:	.word 1

__var_intcon_002__:	.word 7

__var_intcon_003__:	.word 0

__var_intcon_005__:	.word 1

__var_intcon_007__:	.word 0

__var_intcon_008__:	.word 1

__var_intcon_009__:	.word 2

__var_intcon_010__:	.word 5

__var_intcon_012__:	.word 2

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_mult_result_013__' is 4
# stack offset after '__var_unary_MINUS_result_011__' is 8
# stack offset after '__var_sub_result_006__' is 12
# stack offset after '__var_gt_result_004__' is 13
# stack offset after 'f' is 20
# stack offset after 'i' is 24
# stack offset after final alignment is 24
    la $sp, -24($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | f
    lw $t0, __var_intcon_001__
    sw $t0, 16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | i
    lw $t0, __var_intcon_002__
    sw $t0, 20($sp)

# OP_GOTO | __label_for_bot_001__ | No src2 | No dest
    j __label_for_bot_001__

    nop
# OP_LABEL | __label_for_top_000__ | No src2 | No dest
__label_for_top_000__:
# OP_DUMMY | No src1 | No src2 | i
# OP_ASSIGN | i | No src2 | __y
    lw $t0, 20($sp)
    sw $t0, __y
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_CALL_FUNCTION | __add | __function___temp_function_000__ | No dest
    lw $t2, __var_intcon_007__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __add
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_CALL_FUNCTION | __add | __function___temp_function_001__ | No dest
    lw $t2, __var_intcon_008__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __add
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_CALL_FUNCTION | __add | __function___temp_function_002__ | No dest
    lw $t2, __var_intcon_009__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __add
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_NEGATIVE | __var_intcon_010__ | No src2 | __var_unary_MINUS_result_011__
    lw $t0, __var_intcon_010__
    neg $t2, $t0
    sw $t2, 4($sp)

# OP_CALL_FUNCTION | __add | __function___temp_function_003__ | No dest
    lw $t2, 4($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __add
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_012__
# OP_CALL_FUNCTION | __add | __function___temp_function_004__ | No dest
    lw $t2, __var_intcon_012__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __add
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | f
# OP_DUMMY | No src1 | No src2 | __y
# OP_MULT | f | __y | __var_mult_result_013__
    lw $t0, 16($sp)
    lw $t1, __y
    mul $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_mult_result_013__ | No src2 | f
    lw $t0, 0($sp)
    sw $t0, 16($sp)

# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_SUB | i | __var_intcon_005__ | __var_sub_result_006__
    lw $t0, 20($sp)
    lw $t1, __var_intcon_005__
    sub $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_ASSIGN | __var_sub_result_006__ | No src2 | i
    lw $t0, 8($sp)
    sw $t0, 20($sp)

# OP_LABEL | __label_for_bot_001__ | No src2 | No dest
__label_for_bot_001__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_GT | i | __var_intcon_003__ | __var_gt_result_004__
    lw $t0, 20($sp)
    lw $t1, __var_intcon_003__
    sgt $t2, $t0, $t1
    sb $t2, 12($sp)

# OP_FALSE_COND_BRANCH | __var_gt_result_004__ | __label_for_top_000__ | No dest
    lb $t2, 12($sp)
    bnez $t2, __label_for_top_000__

    nop
# OP_DUMMY | No src1 | No src2 | f
# OP_CALL_FUNCTION | print_int | __function___temp_function_005__ | No dest
    lw $t2, 16($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_006__ | No dest
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
