	.data

__flag:	.space 4

__val:	.space 4

__var_intcon_000__:	.word 1

	.text

# OP_ENTER_FUNCTION | __side_effect | No src2 | No dest
__side_effect:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_unary_MINUS_result_001__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_NEGATIVE | __var_intcon_000__ | No src2 | __var_unary_MINUS_result_001__
    lw $t0, __var_intcon_000__
    neg $t2, $t0
    sw $t2, 0($sp)

# OP_ASSIGN | __var_unary_MINUS_result_001__ | No src2 | __flag
    lw $t0, 0($sp)
    sw $t0, __flag
# OP_DUMMY | No src1 | No src2 | x
# OP_LEAVE_FUNCTION | __side_effect | No src2 | x
    lw $t2, 0($fp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_002__:	.word 3

__var_intcon_003__:	.word 4

__var_intcon_004__:	.word 5

__var_intcon_005__:	.word 1

__var_intcon_006__:	.word 1234

__var_intcon_013__:	.word 1

__var_intcon_015__:	.word 0

__var_intcon_017__:	.word 4321

__var_intcon_024__:	.word 1

__var_intcon_026__:	.word 0

__var_intcon_028__:	.word 4321

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_mult_result_029__' is 4
# stack offset after '__var_lt_result_027__' is 5
# stack offset after '__var_sub_result_025__' is 12
# stack offset after '__var_or_result_023__' is 13
# stack offset after '__var_lt_result_022__' is 14
# stack offset after '__var_func_return_021__' is 20
# stack offset after '__var_or_result_020__' is 21
# stack offset after '__var_gt_result_019__' is 22
# stack offset after '__var_lt_result_018__' is 23
# stack offset after '__var_lt_result_016__' is 24
# stack offset after '__var_sub_result_014__' is 28
# stack offset after '__var_and_result_012__' is 29
# stack offset after '__var_lt_result_011__' is 30
# stack offset after '__var_func_return_010__' is 36
# stack offset after '__var_and_result_009__' is 37
# stack offset after '__var_gt_result_008__' is 38
# stack offset after '__var_lt_result_007__' is 39
# stack offset after 'z' is 44
# stack offset after 'y' is 48
# stack offset after 'x' is 52
# stack offset after final alignment is 52
    la $sp, -52($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | x
    lw $t0, __var_intcon_002__
    sw $t0, 48($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ASSIGN | __var_intcon_003__ | No src2 | y
    lw $t0, __var_intcon_003__
    sw $t0, 44($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ASSIGN | __var_intcon_004__ | No src2 | z
    lw $t0, __var_intcon_004__
    sw $t0, 40($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ASSIGN | __var_intcon_005__ | No src2 | __flag
    lw $t0, __var_intcon_005__
    sw $t0, __flag
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_ASSIGN | __var_intcon_006__ | No src2 | __val
    lw $t0, __var_intcon_006__
    sw $t0, __val
# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | y
# OP_LT | x | y | __var_lt_result_007__
    lw $t0, 48($sp)
    lw $t1, 44($sp)
    slt $t2, $t0, $t1
    sb $t2, 38($sp)

# OP_ASSIGN | __var_lt_result_007__ | No src2 | __var_and_result_009__
    lb $t0, 38($sp)
    sb $t0, 36($sp)

# OP_COND_BRANCH | __var_lt_result_007__ | __label_and_circuit_002__ | No dest
    lb $t2, 38($sp)
    beqz $t2, __label_and_circuit_002__

    nop
# OP_DUMMY | No src1 | No src2 | y
# OP_DUMMY | No src1 | No src2 | z
# OP_GT | y | z | __var_gt_result_008__
    lw $t0, 44($sp)
    lw $t1, 40($sp)
    sgt $t2, $t0, $t1
    sb $t2, 37($sp)

# OP_AND | __var_lt_result_007__ | __var_gt_result_008__ | __var_and_result_009__
    lb $t0, 38($sp)
    lb $t1, 37($sp)
    and $t2, $t0, $t1
    sb $t2, 36($sp)

# OP_LABEL | __label_and_circuit_002__ | No src2 | No dest
__label_and_circuit_002__:
# OP_ASSIGN | __var_and_result_009__ | No src2 | __var_and_result_012__
    lb $t0, 36($sp)
    sb $t0, 28($sp)

# OP_COND_BRANCH | __var_and_result_009__ | __label_and_circuit_003__ | No dest
    lb $t2, 36($sp)
    beqz $t2, __label_and_circuit_003__

    nop
# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | __side_effect | __function___temp_function_000__ | __var_func_return_010__
    lw $t2, 48($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __side_effect
    nop
    la $sp, 4($sp)

    sw $v0, 32($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_010__
# OP_DUMMY | No src1 | No src2 | z
# OP_LT | __var_func_return_010__ | z | __var_lt_result_011__
    lw $t0, 32($sp)
    lw $t1, 40($sp)
    slt $t2, $t0, $t1
    sb $t2, 29($sp)

# OP_AND | __var_and_result_009__ | __var_lt_result_011__ | __var_and_result_012__
    lb $t0, 36($sp)
    lb $t1, 29($sp)
    and $t2, $t0, $t1
    sb $t2, 28($sp)

# OP_LABEL | __label_and_circuit_003__ | No src2 | No dest
__label_and_circuit_003__:
# OP_COND_BRANCH | __var_and_result_012__ | __label_else_000__ | No dest
    lb $t2, 28($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | __var_intcon_013__
# OP_SUB | x | __var_intcon_013__ | __var_sub_result_014__
    lw $t0, 48($sp)
    lw $t1, __var_intcon_013__
    sub $t2, $t0, $t1
    sw $t2, 24($sp)

# OP_ASSIGN | __var_sub_result_014__ | No src2 | x
    lw $t0, 24($sp)
    sw $t0, 48($sp)

# OP_LABEL | __label_else_000__ | No src2 | No dest
__label_else_000__:
# OP_DUMMY | No src1 | No src2 | __flag
# OP_DUMMY | No src1 | No src2 | __var_intcon_015__
# OP_LT | __flag | __var_intcon_015__ | __var_lt_result_016__
    lw $t0, __flag
    lw $t1, __var_intcon_015__
    slt $t2, $t0, $t1
    sb $t2, 23($sp)

# OP_COND_BRANCH | __var_lt_result_016__ | __label_else_004__ | No dest
    lb $t2, 23($sp)
    beqz $t2, __label_else_004__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_017__
# OP_ASSIGN | __var_intcon_017__ | No src2 | __val
    lw $t0, __var_intcon_017__
    sw $t0, __val
# OP_LABEL | __label_else_004__ | No src2 | No dest
__label_else_004__:
# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | y
# OP_LT | x | y | __var_lt_result_018__
    lw $t0, 48($sp)
    lw $t1, 44($sp)
    slt $t2, $t0, $t1
    sb $t2, 22($sp)

# OP_ASSIGN | __var_lt_result_018__ | No src2 | __var_or_result_020__
    lb $t0, 22($sp)
    sb $t0, 20($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_018__ | __label_or_circuit_008__ | No dest
    lb $t2, 22($sp)
    bnez $t2, __label_or_circuit_008__

    nop
# OP_DUMMY | No src1 | No src2 | y
# OP_DUMMY | No src1 | No src2 | z
# OP_GT | y | z | __var_gt_result_019__
    lw $t0, 44($sp)
    lw $t1, 40($sp)
    sgt $t2, $t0, $t1
    sb $t2, 21($sp)

# OP_OR | __var_lt_result_018__ | __var_gt_result_019__ | __var_or_result_020__
    lb $t0, 22($sp)
    lb $t1, 21($sp)
    or $t2, $t0, $t1
    sb $t2, 20($sp)

# OP_LABEL | __label_or_circuit_008__ | No src2 | No dest
__label_or_circuit_008__:
# OP_ASSIGN | __var_or_result_020__ | No src2 | __var_or_result_023__
    lb $t0, 20($sp)
    sb $t0, 12($sp)

# OP_FALSE_COND_BRANCH | __var_or_result_020__ | __label_or_circuit_009__ | No dest
    lb $t2, 20($sp)
    bnez $t2, __label_or_circuit_009__

    nop
# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | __side_effect | __function___temp_function_001__ | __var_func_return_021__
    lw $t2, 48($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __side_effect
    nop
    la $sp, 4($sp)

    sw $v0, 16($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_021__
# OP_DUMMY | No src1 | No src2 | z
# OP_LT | __var_func_return_021__ | z | __var_lt_result_022__
    lw $t0, 16($sp)
    lw $t1, 40($sp)
    slt $t2, $t0, $t1
    sb $t2, 13($sp)

# OP_OR | __var_or_result_020__ | __var_lt_result_022__ | __var_or_result_023__
    lb $t0, 20($sp)
    lb $t1, 13($sp)
    or $t2, $t0, $t1
    sb $t2, 12($sp)

# OP_LABEL | __label_or_circuit_009__ | No src2 | No dest
__label_or_circuit_009__:
# OP_COND_BRANCH | __var_or_result_023__ | __label_else_006__ | No dest
    lb $t2, 12($sp)
    beqz $t2, __label_else_006__

    nop
# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | __var_intcon_024__
# OP_SUB | x | __var_intcon_024__ | __var_sub_result_025__
    lw $t0, 48($sp)
    lw $t1, __var_intcon_024__
    sub $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_ASSIGN | __var_sub_result_025__ | No src2 | x
    lw $t0, 8($sp)
    sw $t0, 48($sp)

# OP_LABEL | __label_else_006__ | No src2 | No dest
__label_else_006__:
# OP_DUMMY | No src1 | No src2 | __flag
# OP_DUMMY | No src1 | No src2 | __var_intcon_026__
# OP_LT | __flag | __var_intcon_026__ | __var_lt_result_027__
    lw $t0, __flag
    lw $t1, __var_intcon_026__
    slt $t2, $t0, $t1
    sb $t2, 4($sp)

# OP_COND_BRANCH | __var_lt_result_027__ | __label_else_010__ | No dest
    lb $t2, 4($sp)
    beqz $t2, __label_else_010__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_028__
# OP_ASSIGN | __var_intcon_028__ | No src2 | __val
    lw $t0, __var_intcon_028__
    sw $t0, __val
# OP_LABEL | __label_else_010__ | No src2 | No dest
__label_else_010__:
# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | __val
# OP_MULT | x | __val | __var_mult_result_029__
    lw $t0, 48($sp)
    lw $t1, __val
    mul $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_mult_result_029__ | No src2 | __val
    lw $t0, 0($sp)
    sw $t0, __val
# OP_DUMMY | No src1 | No src2 | __val
# OP_CALL_FUNCTION | print_int | __function___temp_function_002__ | No dest
    lw $t2, __val
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
