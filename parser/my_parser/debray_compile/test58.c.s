# OP_ENTER_FUNCTION | __f | No src2 | No dest
__f:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_003__' is 4
# stack offset after '__var_mult_result_002__' is 8
# stack offset after '__var_add_result_001__' is 12
# stack offset after '__var_mult_result_000__' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | b
# OP_DUMMY | No src1 | No src2 | c
# OP_DUMMY | No src1 | No src2 | d
# OP_DUMMY | No src1 | No src2 | e
# OP_MULT | d | e | __var_mult_result_000__
    lw $t0, 12($fp)
    lw $t1, 16($fp)
    mul $t2, $t0, $t1
    sw $t2, 12($sp)

# OP_ADD | c | __var_mult_result_000__ | __var_add_result_001__
    lw $t0, 8($fp)
    lw $t1, 12($sp)
    add $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_MULT | b | __var_add_result_001__ | __var_mult_result_002__
    lw $t0, 4($fp)
    lw $t1, 8($sp)
    mul $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ADD | a | __var_mult_result_002__ | __var_add_result_003__
    lw $t0, 0($fp)
    lw $t1, 4($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __f | No src2 | __var_add_result_003__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_004__:	.word 1

__var_intcon_005__:	.word 2

__var_intcon_006__:	.word 3

__var_intcon_007__:	.word 4

__var_intcon_008__:	.word 5

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_func_return_010__' is 4
# stack offset after '__var_func_return_009__' is 8
# stack offset after 'x' is 12
# stack offset after final alignment is 12
    la $sp, -12($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_CALL_FUNCTION | __f | __function___temp_function_000__ | __var_func_return_009__
    lw $t2, __var_intcon_008__
    sw $t2, -4($sp)
    lw $t2, __var_intcon_007__
    sw $t2, -8($sp)
    lw $t2, __var_intcon_006__
    sw $t2, -12($sp)
    lw $t2, __var_intcon_005__
    sw $t2, -16($sp)
    lw $t2, __var_intcon_004__
    sw $t2, -20($sp)
    la $sp, -20($sp)

    jal __f
    nop
    la $sp, 20($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_009__
# OP_ASSIGN | __var_func_return_009__ | No src2 | x
    lw $t0, 4($sp)
    sw $t0, 8($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | __f | __function___temp_function_001__ | __var_func_return_010__
    lw $t2, 8($sp)
    sw $t2, -4($sp)
    lw $t2, 8($sp)
    sw $t2, -8($sp)
    lw $t2, 8($sp)
    sw $t2, -12($sp)
    lw $t2, 8($sp)
    sw $t2, -16($sp)
    lw $t2, 8($sp)
    sw $t2, -20($sp)
    la $sp, -20($sp)

    jal __f
    nop
    la $sp, 20($sp)

    sw $v0, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_010__
# OP_ASSIGN | __var_func_return_010__ | No src2 | x
    lw $t0, 0($sp)
    sw $t0, 8($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | print_int | __function___temp_function_002__ | No dest
    lw $t2, 8($sp)
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
