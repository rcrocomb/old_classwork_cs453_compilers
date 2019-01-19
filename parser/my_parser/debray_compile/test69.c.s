	.data

__y:	.space 4

	.text

# OP_ENTER_FUNCTION | __acc | No src2 | No dest
__acc:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_mult_result_000__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __y
# OP_DUMMY | No src1 | No src2 | x
# OP_MULT | __y | x | __var_mult_result_000__
    lw $t0, __y
    lw $t1, 0($fp)
    mul $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_mult_result_000__ | No src2 | __y
    lw $t0, 0($sp)
    sw $t0, __y
# OP_LEAVE_FUNCTION | __acc | No src2 | No dest

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

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_sub_result_006__' is 4
# stack offset after '__var_gt_result_004__' is 5
# stack offset after 'f' is 12
# stack offset after 'n' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | __y
    lw $t0, __var_intcon_001__
    sw $t0, __y
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | n
    lw $t0, __var_intcon_002__
    sw $t0, 12($sp)

# OP_GOTO | __label_for_bot_001__ | No src2 | No dest
    j __label_for_bot_001__

    nop
# OP_LABEL | __label_for_top_000__ | No src2 | No dest
__label_for_top_000__:
# OP_DUMMY | No src1 | No src2 | n
# OP_CALL_FUNCTION | __acc | __function___temp_function_000__ | No dest
    lw $t2, 12($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __acc
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_SUB | n | __var_intcon_005__ | __var_sub_result_006__
    lw $t0, 12($sp)
    lw $t1, __var_intcon_005__
    sub $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_sub_result_006__ | No src2 | n
    lw $t0, 0($sp)
    sw $t0, 12($sp)

# OP_LABEL | __label_for_bot_001__ | No src2 | No dest
__label_for_bot_001__:
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_GT | n | __var_intcon_003__ | __var_gt_result_004__
    lw $t0, 12($sp)
    lw $t1, __var_intcon_003__
    sgt $t2, $t0, $t1
    sb $t2, 4($sp)

# OP_FALSE_COND_BRANCH | __var_gt_result_004__ | __label_for_top_000__ | No dest
    lb $t2, 4($sp)
    bnez $t2, __label_for_top_000__

    nop
# OP_DUMMY | No src1 | No src2 | __y
# OP_CALL_FUNCTION | print_int | __function___temp_function_001__ | No dest
    lw $t2, __y
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
