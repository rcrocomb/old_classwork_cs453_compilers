	.data

__var_intcon_000__:	.word 1

__var_intcon_002__:	.word 1

__var_intcon_003__:	.word 1

__var_intcon_006__:	.word 2

	.text

# OP_ENTER_FUNCTION | __f | No src2 | No dest
__f:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_009__' is 4
# stack offset after '__var_func_return_008__' is 8
# stack offset after '__var_sub_result_007__' is 12
# stack offset after '__var_func_return_005__' is 16
# stack offset after '__var_sub_result_004__' is 20
# stack offset after '__var_lte_result_001__' is 21
# stack offset after final alignment is 24
    la $sp, -24($sp)

# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_LTE | n | __var_intcon_000__ | __var_lte_result_001__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_000__
    sle $t2, $t0, $t1
    sb $t2, 20($sp)

# OP_COND_BRANCH | __var_lte_result_001__ | __label_else_000__ | No dest
    lb $t2, 20($sp)
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
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_SUB | n | __var_intcon_003__ | __var_sub_result_004__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_003__
    sub $t2, $t0, $t1
    sw $t2, 16($sp)

# OP_CALL_FUNCTION | __g | __function___temp_function_000__ | __var_func_return_005__
    lw $t2, 16($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __g
    nop
    la $sp, 4($sp)

    sw $v0, 12($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_005__
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_SUB | n | __var_intcon_006__ | __var_sub_result_007__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_006__
    sub $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_CALL_FUNCTION | __f | __function___temp_function_001__ | __var_func_return_008__
    lw $t2, 8($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __f
    nop
    la $sp, 4($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_008__
# OP_ADD | __var_func_return_005__ | __var_func_return_008__ | __var_add_result_009__
    lw $t0, 12($sp)
    lw $t1, 4($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __f | No src2 | __var_add_result_009__
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
     
	.data

__var_intcon_010__:	.word 1

__var_intcon_012__:	.word 1

__var_intcon_013__:	.word 1

__var_intcon_016__:	.word 2

	.text

# OP_ENTER_FUNCTION | __g | No src2 | No dest
__g:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_019__' is 4
# stack offset after '__var_func_return_018__' is 8
# stack offset after '__var_sub_result_017__' is 12
# stack offset after '__var_func_return_015__' is 16
# stack offset after '__var_sub_result_014__' is 20
# stack offset after '__var_lte_result_011__' is 21
# stack offset after final alignment is 24
    la $sp, -24($sp)

# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_LTE | n | __var_intcon_010__ | __var_lte_result_011__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_010__
    sle $t2, $t0, $t1
    sb $t2, 20($sp)

# OP_COND_BRANCH | __var_lte_result_011__ | __label_else_002__ | No dest
    lb $t2, 20($sp)
    beqz $t2, __label_else_002__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_012__
# OP_LEAVE_FUNCTION | __g | No src2 | __var_intcon_012__
    lw $t2, __var_intcon_012__
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
# OP_GOTO | __label_post_else_003__ | No src2 | No dest
    j __label_post_else_003__

    nop
# OP_LABEL | __label_else_002__ | No src2 | No dest
__label_else_002__:
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_013__
# OP_SUB | n | __var_intcon_013__ | __var_sub_result_014__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_013__
    sub $t2, $t0, $t1
    sw $t2, 16($sp)

# OP_CALL_FUNCTION | __f | __function___temp_function_002__ | __var_func_return_015__
    lw $t2, 16($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __f
    nop
    la $sp, 4($sp)

    sw $v0, 12($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_015__
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_SUB | n | __var_intcon_016__ | __var_sub_result_017__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_016__
    sub $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_CALL_FUNCTION | __g | __function___temp_function_003__ | __var_func_return_018__
    lw $t2, 8($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __g
    nop
    la $sp, 4($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_018__
# OP_ADD | __var_func_return_015__ | __var_func_return_018__ | __var_add_result_019__
    lw $t0, 12($sp)
    lw $t1, 4($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __g | No src2 | __var_add_result_019__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
# OP_LABEL | __label_post_else_003__ | No src2 | No dest
__label_post_else_003__:
# OP_LEAVE_FUNCTION | __g | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_020__:	.word 5

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_func_return_021__' is 4
# stack offset after 'x' is 8
# stack offset after final alignment is 8
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_020__
# OP_CALL_FUNCTION | __f | __function___temp_function_004__ | __var_func_return_021__
    lw $t2, __var_intcon_020__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __f
    nop
    la $sp, 4($sp)

    sw $v0, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_021__
# OP_ASSIGN | __var_func_return_021__ | No src2 | x
    lw $t0, 0($sp)
    sw $t0, 4($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | print_int | __function___temp_function_005__ | No dest
    lw $t2, 4($sp)
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
