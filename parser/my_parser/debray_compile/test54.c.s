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
# OP_DUMMY | No src1 | No src2 | y
# OP_ADD | x | y | __var_add_result_000__
    lw $t0, 0($fp)
    lw $t1, 4($fp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __add | No src2 | __var_add_result_000__
    lw $t2, 0($sp)
    move $v0, $t2

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

__var_intcon_009__:	.word 1

__var_intcon_011__:	.word 2

__var_intcon_013__:	.word 5

__var_intcon_016__:	.word 1

__var_intcon_018__:	.word 1

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_mult_result_020__' is 4
# stack offset after '__var_func_return_019__' is 8
# stack offset after '__var_func_return_017__' is 12
# stack offset after '__var_func_return_015__' is 16
# stack offset after '__var_unary_MINUS_result_014__' is 20
# stack offset after '__var_func_return_012__' is 24
# stack offset after '__var_func_return_010__' is 28
# stack offset after '__var_func_return_008__' is 32
# stack offset after '__var_sub_result_006__' is 36
# stack offset after '__var_gt_result_004__' is 37
# stack offset after 'f' is 44
# stack offset after 'i' is 48
# stack offset after 'e' is 52
# stack offset after 'd' is 56
# stack offset after 'c' is 60
# stack offset after 'b' is 64
# stack offset after 'a' is 68
# stack offset after final alignment is 68
    la $sp, -68($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | f
    lw $t0, __var_intcon_001__
    sw $t0, 40($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | i
    lw $t0, __var_intcon_002__
    sw $t0, 44($sp)

# OP_GOTO | __label_for_bot_001__ | No src2 | No dest
    j __label_for_bot_001__

    nop
# OP_LABEL | __label_for_top_000__ | No src2 | No dest
__label_for_top_000__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_CALL_FUNCTION | __add | __function___temp_function_000__ | __var_func_return_008__
    lw $t2, __var_intcon_007__
    sw $t2, -4($sp)
    lw $t2, 44($sp)
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __add
    nop
    la $sp, 8($sp)

    sw $v0, 28($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_008__
# OP_ASSIGN | __var_func_return_008__ | No src2 | a
    lw $t0, 28($sp)
    sw $t0, 64($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_CALL_FUNCTION | __add | __function___temp_function_001__ | __var_func_return_010__
    lw $t2, __var_intcon_009__
    sw $t2, -4($sp)
    lw $t2, 64($sp)
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __add
    nop
    la $sp, 8($sp)

    sw $v0, 24($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_010__
# OP_ASSIGN | __var_func_return_010__ | No src2 | b
    lw $t0, 24($sp)
    sw $t0, 60($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_011__
# OP_DUMMY | No src1 | No src2 | b
# OP_CALL_FUNCTION | __add | __function___temp_function_002__ | __var_func_return_012__
    lw $t2, 60($sp)
    sw $t2, -4($sp)
    lw $t2, __var_intcon_011__
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __add
    nop
    la $sp, 8($sp)

    sw $v0, 20($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_012__
# OP_ASSIGN | __var_func_return_012__ | No src2 | c
    lw $t0, 20($sp)
    sw $t0, 56($sp)

# OP_DUMMY | No src1 | No src2 | c
# OP_DUMMY | No src1 | No src2 | __var_intcon_013__
# OP_NEGATIVE | __var_intcon_013__ | No src2 | __var_unary_MINUS_result_014__
    lw $t0, __var_intcon_013__
    neg $t2, $t0
    sw $t2, 16($sp)

# OP_CALL_FUNCTION | __add | __function___temp_function_003__ | __var_func_return_015__
    lw $t2, 16($sp)
    sw $t2, -4($sp)
    lw $t2, 56($sp)
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __add
    nop
    la $sp, 8($sp)

    sw $v0, 12($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_015__
# OP_ASSIGN | __var_func_return_015__ | No src2 | d
    lw $t0, 12($sp)
    sw $t0, 52($sp)

# OP_DUMMY | No src1 | No src2 | d
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_CALL_FUNCTION | __add | __function___temp_function_004__ | __var_func_return_017__
    lw $t2, __var_intcon_016__
    sw $t2, -4($sp)
    lw $t2, 52($sp)
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __add
    nop
    la $sp, 8($sp)

    sw $v0, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_017__
# OP_ASSIGN | __var_func_return_017__ | No src2 | e
    lw $t0, 8($sp)
    sw $t0, 48($sp)

# OP_DUMMY | No src1 | No src2 | f
# OP_DUMMY | No src1 | No src2 | e
# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_CALL_FUNCTION | __add | __function___temp_function_005__ | __var_func_return_019__
    lw $t2, __var_intcon_018__
    sw $t2, -4($sp)
    lw $t2, 48($sp)
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __add
    nop
    la $sp, 8($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_019__
# OP_MULT | f | __var_func_return_019__ | __var_mult_result_020__
    lw $t0, 40($sp)
    lw $t1, 4($sp)
    mul $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_mult_result_020__ | No src2 | f
    lw $t0, 0($sp)
    sw $t0, 40($sp)

# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_SUB | i | __var_intcon_005__ | __var_sub_result_006__
    lw $t0, 44($sp)
    lw $t1, __var_intcon_005__
    sub $t2, $t0, $t1
    sw $t2, 32($sp)

# OP_ASSIGN | __var_sub_result_006__ | No src2 | i
    lw $t0, 32($sp)
    sw $t0, 44($sp)

# OP_LABEL | __label_for_bot_001__ | No src2 | No dest
__label_for_bot_001__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_GT | i | __var_intcon_003__ | __var_gt_result_004__
    lw $t0, 44($sp)
    lw $t1, __var_intcon_003__
    sgt $t2, $t0, $t1
    sb $t2, 36($sp)

# OP_FALSE_COND_BRANCH | __var_gt_result_004__ | __label_for_top_000__ | No dest
    lb $t2, 36($sp)
    bnez $t2, __label_for_top_000__

    nop
# OP_DUMMY | No src1 | No src2 | f
# OP_CALL_FUNCTION | print_int | __function___temp_function_006__ | No dest
    lw $t2, 40($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_007__ | No dest
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
