	.data

__var_intcon_000__:	.word 0

__var_intcon_002__:	.word 1

__var_intcon_003__:	.word 1

	.text

# OP_ENTER_FUNCTION | __fact | No src2 | No dest
__fact:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_mult_result_006__' is 4
# stack offset after '__var_func_return_005__' is 8
# stack offset after '__var_sub_result_004__' is 12
# stack offset after '__var_eq_result_001__' is 13
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_EQ | n | __var_intcon_000__ | __var_eq_result_001__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_000__
    seq $t2, $t0, $t1
    sb $t2, 12($sp)

# OP_COND_BRANCH | __var_eq_result_001__ | __label_else_000__ | No dest
    lb $t2, 12($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_LEAVE_FUNCTION | __fact | No src2 | __var_intcon_002__
    lw $t2, __var_intcon_002__
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
# OP_GOTO | __label_post_else_001__ | No src2 | No dest
    j __label_post_else_001__

    nop
# OP_LABEL | __label_else_000__ | No src2 | No dest
__label_else_000__:
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_SUB | n | __var_intcon_003__ | __var_sub_result_004__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_003__
    sub $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_CALL_FUNCTION | __fact | __function___temp_function_000__ | __var_func_return_005__
    lw $t2, 8($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __fact
    nop
    la $sp, 4($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_005__
# OP_MULT | n | __var_func_return_005__ | __var_mult_result_006__
    lw $t0, 0($fp)
    lw $t1, 4($sp)
    mul $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __fact | No src2 | __var_mult_result_006__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
# OP_LABEL | __label_post_else_001__ | No src2 | No dest
__label_post_else_001__:
# OP_LEAVE_FUNCTION | __fact | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_007__:	.word 7

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_func_return_008__' is 4
# stack offset after 'x' is 8
# stack offset after final alignment is 8
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_CALL_FUNCTION | __fact | __function___temp_function_001__ | __var_func_return_008__
    lw $t2, __var_intcon_007__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __fact
    nop
    la $sp, 4($sp)

    sw $v0, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_008__
# OP_ASSIGN | __var_func_return_008__ | No src2 | x
    lw $t0, 0($sp)
    sw $t0, 4($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | print_int | __function___temp_function_002__ | No dest
    lw $t2, 4($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_003__ | No dest
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
