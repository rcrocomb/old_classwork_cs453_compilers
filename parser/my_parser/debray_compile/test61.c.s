	.data

__var_intcon_000__:	.word 1

	.text

# OP_ENTER_FUNCTION | __f | No src2 | No dest
__f:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_001__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ADD | x | __var_intcon_000__ | __var_add_result_001__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_000__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __f | No src2 | __var_add_result_001__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_002__:	.word 1

__var_charcon_006__:	.byte 'Q'

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_008__' is 4
# stack offset after '__var_func_return_007__' is 5
# stack offset after '__var_add_result_005__' is 12
# stack offset after '__var_func_return_004__' is 13
# stack offset after '__var_func_return_003__' is 14
# stack offset after 'y' is 15
# stack offset after 'x' is 20
# stack offset after final alignment is 20
    la $sp, -20($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | y
    lw $t0, __var_intcon_002__
    sb $t0, 14($sp)

# OP_DUMMY | No src1 | No src2 | y
# OP_CALL_FUNCTION | __f | __function___temp_function_000__ | __var_func_return_003__
    lb $t2, 14($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __f
    nop
    la $sp, 4($sp)

    sb $v0, 13($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_003__
# OP_ASSIGN | __var_func_return_003__ | No src2 | x
    lb $t0, 13($sp)
    sw $t0, 16($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | __f | __function___temp_function_001__ | __var_func_return_004__
    lw $t2, 16($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __f
    nop
    la $sp, 4($sp)

    sb $v0, 12($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_004__
# OP_ADD | x | __var_func_return_004__ | __var_add_result_005__
    lw $t0, 16($sp)
    lb $t1, 12($sp)
    add $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_ASSIGN | __var_add_result_005__ | No src2 | y
    lw $t0, 8($sp)
    sb $t0, 14($sp)

# OP_DUMMY | No src1 | No src2 | y
# OP_DUMMY | No src1 | No src2 | __var_charcon_006__
# OP_CALL_FUNCTION | __f | __function___temp_function_002__ | __var_func_return_007__
    lb $t2, __var_charcon_006__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __f
    nop
    la $sp, 4($sp)

    sb $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_007__
# OP_ADD | y | __var_func_return_007__ | __var_add_result_008__
    lb $t0, 14($sp)
    lb $t1, 4($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_008__ | No src2 | x
    lw $t0, 0($sp)
    sw $t0, 16($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | print_int | __function___temp_function_003__ | No dest
    lw $t2, 16($sp)
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
