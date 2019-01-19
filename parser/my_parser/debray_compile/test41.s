	.data

__var_intcon_000__:	.word 1

__var_intcon_001__:	.word 0

__var_intcon_003__:	.word 1111

__var_intcon_004__:	.word 2222

__var_intcon_005__:	.word 1

__var_intcon_006__:	.word 1

__var_intcon_009__:	.word 3333

__var_intcon_010__:	.word 4444

__array_stringcon_000__:	.asciiz "\n"

__array_stringcon_001__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_gt_result_008__' is 1
# stack offset after '__var_unary_MINUS_result_007__' is 8
# stack offset after '__var_gt_result_002__' is 9
# stack offset after 'res2' is 16
# stack offset after 'res1' is 20
# stack offset after 'y' is 24
# stack offset after 'x' is 28
# stack offset after final alignment is 28
    la $sp, -28($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_GT | __var_intcon_000__ | __var_intcon_001__ | __var_gt_result_002__
    lw $t0, __var_intcon_000__
    lw $t1, __var_intcon_001__
    sgt $t2, $t0, $t1
    sb $t2, 8($sp)

# OP_COND_BRANCH | __var_gt_result_002__ | __label_else_000__ | No dest
    lb $t2, 8($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ASSIGN | __var_intcon_003__ | No src2 | res1
    lw $t0, __var_intcon_003__
    sw $t0, 16($sp)

# OP_GOTO | __label_post_else_001__ | No src2 | No dest
    j __label_post_else_001__

    nop
# OP_LABEL | __label_else_000__ | No src2 | No dest
__label_else_000__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ASSIGN | __var_intcon_004__ | No src2 | res1
    lw $t0, __var_intcon_004__
    sw $t0, 16($sp)

# OP_LABEL | __label_post_else_001__ | No src2 | No dest
__label_post_else_001__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ASSIGN | __var_intcon_005__ | No src2 | x
    lw $t0, __var_intcon_005__
    sw $t0, 24($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_NEGATIVE | __var_intcon_006__ | No src2 | __var_unary_MINUS_result_007__
    lw $t0, __var_intcon_006__
    neg $t2, $t0
    sw $t2, 4($sp)

# OP_ASSIGN | __var_unary_MINUS_result_007__ | No src2 | y
    lw $t0, 4($sp)
    sw $t0, 20($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | y
# OP_GT | x | y | __var_gt_result_008__
    lw $t0, 24($sp)
    lw $t1, 20($sp)
    sgt $t2, $t0, $t1
    sb $t2, 0($sp)

# OP_COND_BRANCH | __var_gt_result_008__ | __label_else_002__ | No dest
    lb $t2, 0($sp)
    beqz $t2, __label_else_002__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_ASSIGN | __var_intcon_009__ | No src2 | res2
    lw $t0, __var_intcon_009__
    sw $t0, 12($sp)

# OP_GOTO | __label_post_else_003__ | No src2 | No dest
    j __label_post_else_003__

    nop
# OP_LABEL | __label_else_002__ | No src2 | No dest
__label_else_002__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_ASSIGN | __var_intcon_010__ | No src2 | res2
    lw $t0, __var_intcon_010__
    sw $t0, 12($sp)

# OP_LABEL | __label_post_else_003__ | No src2 | No dest
__label_post_else_003__:
# OP_DUMMY | No src1 | No src2 | res1
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, 16($sp)
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
# OP_DUMMY | No src1 | No src2 | res2
# OP_CALL_FUNCTION | print_int | __function___temp_function_002__ | No dest
    lw $t2, 12($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_001__
# OP_CALL_FUNCTION | print_string | __function___temp_function_003__ | No dest
    la $t2, __array_stringcon_001__
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
