	.data

__var_intcon_001__:	.word 0

__var_intcon_003__:	.word 0

__var_intcon_005__:	.word 1

	.text

# OP_ENTER_FUNCTION | __sum | No src2 | No dest
__sum:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_008__' is 4
# stack offset after '__var_func_return_007__' is 8
# stack offset after '__var_add_result_006__' is 12
# stack offset after '__var_array_entry_004__' is 13
# stack offset after '__var_eq_result_002__' is 14
# stack offset after '__var_array_entry_000__' is 15
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_array_entry_000__
# OP_ASSIGN_FROM_ARRAY | x | i | __var_array_entry_000__
    lw $t0, 0($fp)
    lw $t1, 4($fp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 14($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_000__
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_EQ | __var_array_entry_000__ | __var_intcon_001__ | __var_eq_result_002__
    lb $t0, 14($sp)
    lw $t1, __var_intcon_001__
    seq $t2, $t0, $t1
    sb $t2, 13($sp)

# OP_COND_BRANCH | __var_eq_result_002__ | __label_else_000__ | No dest
    lb $t2, 13($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_LEAVE_FUNCTION | __sum | No src2 | __var_intcon_003__
    lw $t2, __var_intcon_003__
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
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_array_entry_004__
# OP_ASSIGN_FROM_ARRAY | x | i | __var_array_entry_004__
    lw $t0, 0($fp)
    lw $t1, 4($fp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 12($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_004__
# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ADD | i | __var_intcon_005__ | __var_add_result_006__
    lw $t0, 4($fp)
    lw $t1, __var_intcon_005__
    add $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_CALL_FUNCTION | __sum | __function___temp_function_000__ | __var_func_return_007__
    lw $t2, 8($sp)
    sw $t2, -4($sp)
    lw $t2, 0($fp)
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __sum
    nop
    la $sp, 8($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_007__
# OP_ADD | __var_array_entry_004__ | __var_func_return_007__ | __var_add_result_008__
    lb $t0, 12($sp)
    lw $t1, 4($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __sum | No src2 | __var_add_result_008__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
# OP_LABEL | __label_post_else_001__ | No src2 | No dest
__label_post_else_001__:
# OP_LEAVE_FUNCTION | __sum | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__array_stringcon_000__:	.asciiz "hello world"

	.align 2

__var_intcon_009__:	.word 0

__array_stringcon_001__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_func_return_010__' is 4
# stack offset after 'x' is 8
# stack offset after final alignment is 8
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_CALL_FUNCTION | __sum | __function___temp_function_001__ | __var_func_return_010__
    lw $t2, __var_intcon_009__
    sw $t2, -4($sp)
    la $t2, __array_stringcon_000__
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __sum
    nop
    la $sp, 8($sp)

    sw $v0, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_010__
# OP_ASSIGN | __var_func_return_010__ | No src2 | x
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
