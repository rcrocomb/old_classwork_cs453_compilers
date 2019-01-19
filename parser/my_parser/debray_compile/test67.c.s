	.data

__x:	.space 15

	.align 2

__var_intcon_000__:	.word 0

__var_intcon_001__:	.word 0

__var_intcon_003__:	.word 0

__var_intcon_005__:	.word 1

__var_intcon_008__:	.word 0

	.text

# OP_ENTER_FUNCTION | __copy | No src2 | No dest
__copy:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_007__' is 1
# stack offset after '__var_add_result_006__' is 8
# stack offset after '__var_gt_result_004__' is 9
# stack offset after '__var_array_entry_002__' is 10
# stack offset after 'i' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | i
    lw $t0, __var_intcon_000__
    sw $t0, 12($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | i
    lw $t0, __var_intcon_001__
    sw $t0, 12($sp)

# OP_GOTO | __label_for_bot_001__ | No src2 | No dest
    j __label_for_bot_001__

    nop
# OP_LABEL | __label_for_top_000__ | No src2 | No dest
__label_for_top_000__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_array_entry_007__
# OP_ASSIGN_FROM_ARRAY | a | i | __var_array_entry_007__
    lw $t0, 0($fp)
    lw $t1, 12($sp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_007__
# OP_ASSIGN_TO_ARRAY | b | i | __var_array_entry_007__
    lw  $t0, 4($fp)
    lb $t1, 0($sp)

    lw $t3, 12($sp)
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ADD | i | __var_intcon_005__ | __var_add_result_006__
    lw $t0, 12($sp)
    lw $t1, __var_intcon_005__
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_add_result_006__ | No src2 | i
    lw $t0, 4($sp)
    sw $t0, 12($sp)

# OP_LABEL | __label_for_bot_001__ | No src2 | No dest
__label_for_bot_001__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_array_entry_002__
# OP_ASSIGN_FROM_ARRAY | a | i | __var_array_entry_002__
    lw $t0, 0($fp)
    lw $t1, 12($sp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 9($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_002__
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_GT | __var_array_entry_002__ | __var_intcon_003__ | __var_gt_result_004__
    lb $t0, 9($sp)
    lw $t1, __var_intcon_003__
    sgt $t2, $t0, $t1
    sb $t2, 8($sp)

# OP_FALSE_COND_BRANCH | __var_gt_result_004__ | __label_for_top_000__ | No dest
    lb $t2, 8($sp)
    bnez $t2, __label_for_top_000__

    nop
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_ASSIGN_TO_ARRAY | b | i | __var_intcon_008__
    lw  $t0, 4($fp)
    lb $t1, __var_intcon_008__
    lw $t3, 12($sp)
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | i
# OP_LEAVE_FUNCTION | __copy | No src2 | i
    lw $t2, 12($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_009__:	.word 0

__var_intcon_010__:	.word 0

__var_intcon_012__:	.word 0

__var_intcon_016__:	.word 1

	.text

# OP_ENTER_FUNCTION | __sum | No src2 | No dest
__sum:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_017__' is 4
# stack offset after '__var_add_result_015__' is 8
# stack offset after '__var_array_entry_014__' is 9
# stack offset after '__var_gt_result_013__' is 10
# stack offset after '__var_array_entry_011__' is 11
# stack offset after 'sum' is 16
# stack offset after 'i' is 20
# stack offset after final alignment is 20
    la $sp, -20($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_ASSIGN | __var_intcon_009__ | No src2 | i
    lw $t0, __var_intcon_009__
    sw $t0, 16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_ASSIGN | __var_intcon_010__ | No src2 | sum
    lw $t0, __var_intcon_010__
    sw $t0, 12($sp)

# OP_GOTO | __label_bot_of_while_003__ | No src2 | No dest
    j __label_bot_of_while_003__

    nop
# OP_LABEL | __label_top_of_while_002__ | No src2 | No dest
__label_top_of_while_002__:
# OP_DUMMY | No src1 | No src2 | sum
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_array_entry_014__
# OP_ASSIGN_FROM_ARRAY | b | i | __var_array_entry_014__
    lw $t0, 0($fp)
    lw $t1, 16($sp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_014__
# OP_ADD | sum | __var_array_entry_014__ | __var_add_result_015__
    lw $t0, 12($sp)
    lb $t1, 8($sp)
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_add_result_015__ | No src2 | sum
    lw $t0, 4($sp)
    sw $t0, 12($sp)

# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_ADD | i | __var_intcon_016__ | __var_add_result_017__
    lw $t0, 16($sp)
    lw $t1, __var_intcon_016__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_017__ | No src2 | i
    lw $t0, 0($sp)
    sw $t0, 16($sp)

# OP_LABEL | __label_bot_of_while_003__ | No src2 | No dest
__label_bot_of_while_003__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_array_entry_011__
# OP_ASSIGN_FROM_ARRAY | b | i | __var_array_entry_011__
    lw $t0, 0($fp)
    lw $t1, 16($sp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 10($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_011__
# OP_DUMMY | No src1 | No src2 | __var_intcon_012__
# OP_GT | __var_array_entry_011__ | __var_intcon_012__ | __var_gt_result_013__
    lb $t0, 10($sp)
    lw $t1, __var_intcon_012__
    sgt $t2, $t0, $t1
    sb $t2, 9($sp)

# OP_FALSE_COND_BRANCH | __var_gt_result_013__ | __label_top_of_while_002__ | No dest
    lb $t2, 9($sp)
    bnez $t2, __label_top_of_while_002__

    nop
# OP_DUMMY | No src1 | No src2 | sum
# OP_LEAVE_FUNCTION | __sum | No src2 | sum
    lw $t2, 12($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__array_stringcon_000__:	.asciiz "hello world"

__array_stringcon_001__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_020__' is 4
# stack offset after '__var_func_return_019__' is 8
# stack offset after '__var_func_return_018__' is 12
# stack offset after 'y' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_DUMMY | No src1 | No src2 | __x
# OP_CALL_FUNCTION | __copy | __function___temp_function_000__ | __var_func_return_018__
    la $t2, __x
    sw $t2, -4($sp)
    la $t2, __array_stringcon_000__
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __copy
    nop
    la $sp, 8($sp)

    sw $v0, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_018__
# OP_ASSIGN | __var_func_return_018__ | No src2 | y
    lw $t0, 8($sp)
    sw $t0, 12($sp)

# OP_DUMMY | No src1 | No src2 | y
# OP_DUMMY | No src1 | No src2 | __x
# OP_CALL_FUNCTION | __sum | __function___temp_function_001__ | __var_func_return_019__
    la $t2, __x
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __sum
    nop
    la $sp, 4($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_019__
# OP_ADD | y | __var_func_return_019__ | __var_add_result_020__
    lw $t0, 12($sp)
    lw $t1, 4($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_020__ | No src2 | y
    lw $t0, 0($sp)
    sw $t0, 12($sp)

# OP_DUMMY | No src1 | No src2 | y
# OP_CALL_FUNCTION | print_int | __function___temp_function_002__ | No dest
    lw $t2, 12($sp)
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
