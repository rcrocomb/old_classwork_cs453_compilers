	.data

__i:	.space 4

__x:	.space 20

__res:	.space 4

__var_intcon_000__:	.word 0

__var_intcon_001__:	.word 5

__var_intcon_003__:	.word 1

__var_intcon_005__:	.word 123

__var_intcon_006__:	.word 5

__var_intcon_009__:	.word 4

__var_intcon_013__:	.word 4

__var_intcon_016__:	.word 3

__var_intcon_021__:	.word 2

__var_intcon_024__:	.word 3

__var_intcon_028__:	.word 3

__var_intcon_031__:	.word 4

__var_intcon_036__:	.word 4

__var_intcon_039__:	.word 5

__var_intcon_050__:	.word 1

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_sub_result_051__' is 4
# stack offset after '__var_mult_result_049__' is 8
# stack offset after '__var_negate_048__' is 9
# stack offset after '__var_and_result_047__' is 10
# stack offset after '__var_negate_046__' is 11
# stack offset after '__var_negate_045__' is 12
# stack offset after '__var_negate_044__' is 13
# stack offset after '__var_or_result_043__' is 14
# stack offset after '__var_gt_result_042__' is 15
# stack offset after '__var_array_entry_041__' is 20
# stack offset after '__var_div_result_040__' is 24
# stack offset after '__var_array_entry_038__' is 28
# stack offset after '__var_div_result_037__' is 32
# stack offset after '__var_or_result_035__' is 33
# stack offset after '__var_gt_result_034__' is 34
# stack offset after '__var_array_entry_033__' is 40
# stack offset after '__var_div_result_032__' is 44
# stack offset after '__var_array_entry_030__' is 48
# stack offset after '__var_div_result_029__' is 52
# stack offset after '__var_gt_result_027__' is 53
# stack offset after '__var_array_entry_026__' is 60
# stack offset after '__var_div_result_025__' is 64
# stack offset after '__var_array_entry_023__' is 68
# stack offset after '__var_div_result_022__' is 72
# stack offset after '__var_and_result_020__' is 73
# stack offset after '__var_lte_result_019__' is 74
# stack offset after '__var_array_entry_018__' is 80
# stack offset after '__var_div_result_017__' is 84
# stack offset after '__var_array_entry_015__' is 88
# stack offset after '__var_div_result_014__' is 92
# stack offset after '__var_lte_result_012__' is 93
# stack offset after '__var_array_entry_011__' is 100
# stack offset after '__var_div_result_010__' is 104
# stack offset after '__var_array_entry_008__' is 108
# stack offset after '__var_div_result_007__' is 112
# stack offset after '__var_add_result_004__' is 116
# stack offset after '__var_lt_result_002__' is 117
# stack offset after final alignment is 120
    la $sp, -120($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | __i
    lw $t0, __var_intcon_000__
    sw $t0, __i
# OP_GOTO | __label_bot_of_while_001__ | No src2 | No dest
    j __label_bot_of_while_001__

    nop
# OP_LABEL | __label_top_of_while_000__ | No src2 | No dest
__label_top_of_while_000__:
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __i
# OP_ASSIGN_TO_ARRAY | __x | __i | __i
    la  $t0, __x
    lw $t1, __i
    lw $t3, __i
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ADD | __i | __var_intcon_003__ | __var_add_result_004__
    lw $t0, __i
    lw $t1, __var_intcon_003__
    add $t2, $t0, $t1
    sw $t2, 112($sp)

# OP_ASSIGN | __var_add_result_004__ | No src2 | __i
    lw $t0, 112($sp)
    sw $t0, __i
# OP_LABEL | __label_bot_of_while_001__ | No src2 | No dest
__label_bot_of_while_001__:
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_LT | __i | __var_intcon_001__ | __var_lt_result_002__
    lw $t0, __i
    lw $t1, __var_intcon_001__
    slt $t2, $t0, $t1
    sb $t2, 116($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_002__ | __label_top_of_while_000__ | No dest
    lb $t2, 116($sp)
    bnez $t2, __label_top_of_while_000__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ASSIGN | __var_intcon_005__ | No src2 | __res
    lw $t0, __var_intcon_005__
    sw $t0, __res
# OP_GOTO | __label_bot_of_while_003__ | No src2 | No dest
    j __label_bot_of_while_003__

    nop
# OP_LABEL | __label_top_of_while_002__ | No src2 | No dest
__label_top_of_while_002__:
# OP_DUMMY | No src1 | No src2 | __res
# OP_DUMMY | No src1 | No src2 | __i
# OP_MULT | __res | __i | __var_mult_result_049__
    lw $t0, __res
    lw $t1, __i
    mul $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_mult_result_049__ | No src2 | __res
    lw $t0, 4($sp)
    sw $t0, __res
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_050__
# OP_SUB | __i | __var_intcon_050__ | __var_sub_result_051__
    lw $t0, __i
    lw $t1, __var_intcon_050__
    sub $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_sub_result_051__ | No src2 | __i
    lw $t0, 0($sp)
    sw $t0, __i
# OP_LABEL | __label_bot_of_while_003__ | No src2 | No dest
__label_bot_of_while_003__:
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_DIV | __i | __var_intcon_006__ | __var_div_result_007__
    lw $t0, __i
    lw $t1, __var_intcon_006__
    div $t2, $t0, $t1
    sw $t2, 108($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_008__
# OP_ASSIGN_FROM_ARRAY | __x | __var_div_result_007__ | __var_array_entry_008__
    la $t0, __x
    lw $t1, 108($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 104($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_008__
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_DIV | __i | __var_intcon_009__ | __var_div_result_010__
    lw $t0, __i
    lw $t1, __var_intcon_009__
    div $t2, $t0, $t1
    sw $t2, 100($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_011__
# OP_ASSIGN_FROM_ARRAY | __x | __var_div_result_010__ | __var_array_entry_011__
    la $t0, __x
    lw $t1, 100($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 96($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_011__
# OP_LTE | __var_array_entry_008__ | __var_array_entry_011__ | __var_lte_result_012__
    lw $t0, 104($sp)
    lw $t1, 96($sp)
    sle $t2, $t0, $t1
    sb $t2, 92($sp)

# OP_ASSIGN | __var_lte_result_012__ | No src2 | __var_and_result_020__
    lb $t0, 92($sp)
    sb $t0, 72($sp)

# OP_COND_BRANCH | __var_lte_result_012__ | __label_and_circuit_004__ | No dest
    lb $t2, 92($sp)
    beqz $t2, __label_and_circuit_004__

    nop
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_013__
# OP_DIV | __i | __var_intcon_013__ | __var_div_result_014__
    lw $t0, __i
    lw $t1, __var_intcon_013__
    div $t2, $t0, $t1
    sw $t2, 88($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_015__
# OP_ASSIGN_FROM_ARRAY | __x | __var_div_result_014__ | __var_array_entry_015__
    la $t0, __x
    lw $t1, 88($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 84($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_015__
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_DIV | __i | __var_intcon_016__ | __var_div_result_017__
    lw $t0, __i
    lw $t1, __var_intcon_016__
    div $t2, $t0, $t1
    sw $t2, 80($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_018__
# OP_ASSIGN_FROM_ARRAY | __x | __var_div_result_017__ | __var_array_entry_018__
    la $t0, __x
    lw $t1, 80($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 76($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_018__
# OP_LTE | __var_array_entry_015__ | __var_array_entry_018__ | __var_lte_result_019__
    lw $t0, 84($sp)
    lw $t1, 76($sp)
    sle $t2, $t0, $t1
    sb $t2, 73($sp)

# OP_AND | __var_lte_result_012__ | __var_lte_result_019__ | __var_and_result_020__
    lb $t0, 92($sp)
    lb $t1, 73($sp)
    and $t2, $t0, $t1
    sb $t2, 72($sp)

# OP_LABEL | __label_and_circuit_004__ | No src2 | No dest
__label_and_circuit_004__:
# OP_ASSIGN | __var_and_result_020__ | No src2 | __var_and_result_047__
    lb $t0, 72($sp)
    sb $t0, 9($sp)

# OP_COND_BRANCH | __var_and_result_020__ | __label_and_circuit_005__ | No dest
    lb $t2, 72($sp)
    beqz $t2, __label_and_circuit_005__

    nop
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_021__
# OP_DIV | __i | __var_intcon_021__ | __var_div_result_022__
    lw $t0, __i
    lw $t1, __var_intcon_021__
    div $t2, $t0, $t1
    sw $t2, 68($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_023__
# OP_ASSIGN_FROM_ARRAY | __x | __var_div_result_022__ | __var_array_entry_023__
    la $t0, __x
    lw $t1, 68($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 64($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_023__
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_024__
# OP_DIV | __i | __var_intcon_024__ | __var_div_result_025__
    lw $t0, __i
    lw $t1, __var_intcon_024__
    div $t2, $t0, $t1
    sw $t2, 60($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_026__
# OP_ASSIGN_FROM_ARRAY | __x | __var_div_result_025__ | __var_array_entry_026__
    la $t0, __x
    lw $t1, 60($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 56($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_026__
# OP_GT | __var_array_entry_023__ | __var_array_entry_026__ | __var_gt_result_027__
    lw $t0, 64($sp)
    lw $t1, 56($sp)
    sgt $t2, $t0, $t1
    sb $t2, 52($sp)

# OP_ASSIGN | __var_gt_result_027__ | No src2 | __var_or_result_035__
    lb $t0, 52($sp)
    sb $t0, 32($sp)

# OP_FALSE_COND_BRANCH | __var_gt_result_027__ | __label_or_circuit_006__ | No dest
    lb $t2, 52($sp)
    bnez $t2, __label_or_circuit_006__

    nop
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_028__
# OP_DIV | __i | __var_intcon_028__ | __var_div_result_029__
    lw $t0, __i
    lw $t1, __var_intcon_028__
    div $t2, $t0, $t1
    sw $t2, 48($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_030__
# OP_ASSIGN_FROM_ARRAY | __x | __var_div_result_029__ | __var_array_entry_030__
    la $t0, __x
    lw $t1, 48($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 44($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_030__
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_031__
# OP_DIV | __i | __var_intcon_031__ | __var_div_result_032__
    lw $t0, __i
    lw $t1, __var_intcon_031__
    div $t2, $t0, $t1
    sw $t2, 40($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_033__
# OP_ASSIGN_FROM_ARRAY | __x | __var_div_result_032__ | __var_array_entry_033__
    la $t0, __x
    lw $t1, 40($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 36($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_033__
# OP_GT | __var_array_entry_030__ | __var_array_entry_033__ | __var_gt_result_034__
    lw $t0, 44($sp)
    lw $t1, 36($sp)
    sgt $t2, $t0, $t1
    sb $t2, 33($sp)

# OP_OR | __var_gt_result_027__ | __var_gt_result_034__ | __var_or_result_035__
    lb $t0, 52($sp)
    lb $t1, 33($sp)
    or $t2, $t0, $t1
    sb $t2, 32($sp)

# OP_LABEL | __label_or_circuit_006__ | No src2 | No dest
__label_or_circuit_006__:
# OP_ASSIGN | __var_or_result_035__ | No src2 | __var_or_result_043__
    lb $t0, 32($sp)
    sb $t0, 13($sp)

# OP_FALSE_COND_BRANCH | __var_or_result_035__ | __label_or_circuit_007__ | No dest
    lb $t2, 32($sp)
    bnez $t2, __label_or_circuit_007__

    nop
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_036__
# OP_DIV | __i | __var_intcon_036__ | __var_div_result_037__
    lw $t0, __i
    lw $t1, __var_intcon_036__
    div $t2, $t0, $t1
    sw $t2, 28($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_038__
# OP_ASSIGN_FROM_ARRAY | __x | __var_div_result_037__ | __var_array_entry_038__
    la $t0, __x
    lw $t1, 28($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 24($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_038__
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_039__
# OP_DIV | __i | __var_intcon_039__ | __var_div_result_040__
    lw $t0, __i
    lw $t1, __var_intcon_039__
    div $t2, $t0, $t1
    sw $t2, 20($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_041__
# OP_ASSIGN_FROM_ARRAY | __x | __var_div_result_040__ | __var_array_entry_041__
    la $t0, __x
    lw $t1, 20($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 16($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_041__
# OP_GT | __var_array_entry_038__ | __var_array_entry_041__ | __var_gt_result_042__
    lw $t0, 24($sp)
    lw $t1, 16($sp)
    sgt $t2, $t0, $t1
    sb $t2, 14($sp)

# OP_OR | __var_or_result_035__ | __var_gt_result_042__ | __var_or_result_043__
    lb $t0, 32($sp)
    lb $t1, 14($sp)
    or $t2, $t0, $t1
    sb $t2, 13($sp)

# OP_LABEL | __label_or_circuit_007__ | No src2 | No dest
__label_or_circuit_007__:
# OP_OR | __var_or_result_035__ | __var_gt_result_042__ | __var_or_result_043__
    lb $t0, 32($sp)
    lb $t1, 14($sp)
    or $t2, $t0, $t1
    sb $t2, 13($sp)

# OP_NOT | __var_or_result_043__ | No src2 | __var_negate_044__
    lb $t0, 13($sp)
    li $t1, 1
    sub $t2, $t1, $t0
    sb $t2, 12($sp)

# OP_NOT | __var_negate_044__ | No src2 | __var_negate_045__
    lb $t0, 12($sp)
    li $t1, 1
    sub $t2, $t1, $t0
    sb $t2, 11($sp)

# OP_NOT | __var_negate_045__ | No src2 | __var_negate_046__
    lb $t0, 11($sp)
    li $t1, 1
    sub $t2, $t1, $t0
    sb $t2, 10($sp)

# OP_AND | __var_and_result_020__ | __var_negate_046__ | __var_and_result_047__
    lb $t0, 72($sp)
    lb $t1, 10($sp)
    and $t2, $t0, $t1
    sb $t2, 9($sp)

# OP_LABEL | __label_and_circuit_005__ | No src2 | No dest
__label_and_circuit_005__:
# OP_AND | __var_and_result_020__ | __var_negate_046__ | __var_and_result_047__
    lb $t0, 72($sp)
    lb $t1, 10($sp)
    and $t2, $t0, $t1
    sb $t2, 9($sp)

# OP_NOT | __var_and_result_047__ | No src2 | __var_negate_048__
    lb $t0, 9($sp)
    li $t1, 1
    sub $t2, $t1, $t0
    sb $t2, 8($sp)

# OP_FALSE_COND_BRANCH | __var_negate_048__ | __label_top_of_while_002__ | No dest
    lb $t2, 8($sp)
    bnez $t2, __label_top_of_while_002__

    nop
# OP_DUMMY | No src1 | No src2 | __res
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, __res
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
