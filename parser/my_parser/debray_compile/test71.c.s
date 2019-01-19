	.data

__u:	.space 4

__var_intcon_000__:	.word 0

__var_intcon_002__:	.word 1

__var_intcon_003__:	.word 1

	.text

# OP_ENTER_FUNCTION | __f | No src2 | No dest
__f:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_func_return_005__' is 4
# stack offset after '__var_sub_result_004__' is 8
# stack offset after '__var_eq_result_001__' is 9
# stack offset after final alignment is 12
    la $sp, -12($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_EQ | u | __var_intcon_000__ | __var_eq_result_001__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_000__
    seq $t2, $t0, $t1
    sb $t2, 8($sp)

# OP_COND_BRANCH | __var_eq_result_001__ | __label_else_000__ | No dest
    lb $t2, 8($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_LEAVE_FUNCTION | __f | No src2 | __var_intcon_002__
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
# OP_DUMMY | No src1 | No src2 | u
# OP_CALL_FUNCTION | __incr | __function___temp_function_000__ | No dest
    lw $t2, 0($fp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __incr
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | u
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_SUB | u | __var_intcon_003__ | __var_sub_result_004__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_003__
    sub $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_CALL_FUNCTION | __f | __function___temp_function_001__ | __var_func_return_005__
    lw $t2, 4($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __f
    nop
    la $sp, 4($sp)

    sw $v0, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_005__
# OP_LEAVE_FUNCTION | __f | No src2 | __var_func_return_005__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
# OP_LABEL | __label_post_else_001__ | No src2 | No dest
__label_post_else_001__:
# OP_LEAVE_FUNCTION | __f | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
# OP_ENTER_FUNCTION | __incr | No src2 | No dest
__incr:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_006__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | __u
# OP_ADD | x | __u | __var_add_result_006__
    lw $t0, 4($fp)
    lw $t1, __u
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_006__ | No src2 | __u
    lw $t0, 0($sp)
    sw $t0, __u
# OP_LEAVE_FUNCTION | __incr | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_007__:	.word 1

__var_intcon_008__:	.word 6

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_010__' is 4
# stack offset after '__var_func_return_009__' is 8
# stack offset after 'x' is 12
# stack offset after final alignment is 12
    la $sp, -12($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_ASSIGN | __var_intcon_007__ | No src2 | __u
    lw $t0, __var_intcon_007__
    sw $t0, __u
# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_CALL_FUNCTION | __f | __function___temp_function_002__ | __var_func_return_009__
    lw $t2, __var_intcon_008__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __f
    nop
    la $sp, 4($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_009__
# OP_ASSIGN | __var_func_return_009__ | No src2 | x
    lw $t0, 4($sp)
    sw $t0, 8($sp)

# OP_DUMMY | No src1 | No src2 | __u
# OP_DUMMY | No src1 | No src2 | x
# OP_ADD | __u | x | __var_add_result_010__
    lw $t0, __u
    lw $t1, 8($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_010__ | No src2 | x
    lw $t0, 0($sp)
    sw $t0, 8($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | print_int | __function___temp_function_003__ | No dest
    lw $t2, 8($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_004__ | No dest
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
