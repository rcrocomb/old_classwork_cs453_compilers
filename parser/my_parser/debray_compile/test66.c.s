	.data

__x:	.space 40

__var_intcon_000__:	.word 0

__var_intcon_002__:	.word 1

	.text

# OP_ENTER_FUNCTION | __init | No src2 | No dest
__init:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_003__' is 4
# stack offset after '__var_lt_result_001__' is 5
# stack offset after 'i' is 12
# stack offset after final alignment is 12
    la $sp, -12($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | i
    lw $t0, __var_intcon_000__
    sw $t0, 8($sp)

# OP_GOTO | __label_for_bot_001__ | No src2 | No dest
    j __label_for_bot_001__

    nop
# OP_LABEL | __label_for_top_000__ | No src2 | No dest
__label_for_top_000__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | i
# OP_ASSIGN_TO_ARRAY | x | i | i
    lw  $t0, 0($fp)
    lw $t1, 8($sp)

    lw $t3, 8($sp)
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ADD | i | __var_intcon_002__ | __var_add_result_003__
    lw $t0, 8($sp)
    lw $t1, __var_intcon_002__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_003__ | No src2 | i
    lw $t0, 0($sp)
    sw $t0, 8($sp)

# OP_LABEL | __label_for_bot_001__ | No src2 | No dest
__label_for_bot_001__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | n
# OP_LT | i | n | __var_lt_result_001__
    lw $t0, 8($sp)
    lw $t1, 4($fp)
    slt $t2, $t0, $t1
    sb $t2, 4($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_001__ | __label_for_top_000__ | No dest
    lb $t2, 4($sp)
    bnez $t2, __label_for_top_000__

    nop
# OP_DUMMY | No src1 | No src2 | n
# OP_LEAVE_FUNCTION | __init | No src2 | n
    lw $t2, 4($fp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_004__:	.word 0

__var_intcon_005__:	.word 1

__var_intcon_007__:	.word 0

__var_intcon_011__:	.word 1

	.text

# OP_ENTER_FUNCTION | __count | No src2 | No dest
__count:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_sub_result_012__' is 4
# stack offset after '__var_add_result_010__' is 8
# stack offset after '__var_array_entry_009__' is 12
# stack offset after '__var_gte_result_008__' is 13
# stack offset after '__var_sub_result_006__' is 20
# stack offset after 'c' is 24
# stack offset after final alignment is 24
    la $sp, -24($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ASSIGN | __var_intcon_004__ | No src2 | c
    lw $t0, __var_intcon_004__
    sw $t0, 20($sp)

# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_SUB | n | __var_intcon_005__ | __var_sub_result_006__
    lw $t0, 4($fp)
    lw $t1, __var_intcon_005__
    sub $t2, $t0, $t1
    sw $t2, 16($sp)

# OP_ASSIGN | __var_sub_result_006__ | No src2 | n
    lw $t0, 16($sp)
    sw $t0, 4($fp)

# OP_GOTO | __label_bot_of_while_003__ | No src2 | No dest
    j __label_bot_of_while_003__

    nop
# OP_LABEL | __label_top_of_while_002__ | No src2 | No dest
__label_top_of_while_002__:
# OP_DUMMY | No src1 | No src2 | c
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_array_entry_009__
# OP_ASSIGN_FROM_ARRAY | x | n | __var_array_entry_009__
    lw $t0, 0($fp)
    lw $t1, 4($fp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_009__
# OP_ADD | c | __var_array_entry_009__ | __var_add_result_010__
    lw $t0, 20($sp)
    lw $t1, 8($sp)
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_add_result_010__ | No src2 | c
    lw $t0, 4($sp)
    sw $t0, 20($sp)

# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_011__
# OP_SUB | n | __var_intcon_011__ | __var_sub_result_012__
    lw $t0, 4($fp)
    lw $t1, __var_intcon_011__
    sub $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_sub_result_012__ | No src2 | n
    lw $t0, 0($sp)
    sw $t0, 4($fp)

# OP_LABEL | __label_bot_of_while_003__ | No src2 | No dest
__label_bot_of_while_003__:
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_GTE | n | __var_intcon_007__ | __var_gte_result_008__
    lw $t0, 4($fp)
    lw $t1, __var_intcon_007__
    sge $t2, $t0, $t1
    sb $t2, 12($sp)

# OP_FALSE_COND_BRANCH | __var_gte_result_008__ | __label_top_of_while_002__ | No dest
    lb $t2, 12($sp)
    bnez $t2, __label_top_of_while_002__

    nop
# OP_DUMMY | No src1 | No src2 | c
# OP_LEAVE_FUNCTION | __count | No src2 | c
    lw $t2, 20($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_013__:	.word 10

__var_intcon_015__:	.word 10

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_017__' is 4
# stack offset after '__var_func_return_016__' is 8
# stack offset after '__var_func_return_014__' is 12
# stack offset after 'z' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | __x
# OP_DUMMY | No src1 | No src2 | __var_intcon_013__
# OP_CALL_FUNCTION | __init | __function___temp_function_000__ | __var_func_return_014__
    lw $t2, __var_intcon_013__
    sw $t2, -4($sp)
    la $t2, __x
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __init
    nop
    la $sp, 8($sp)

    sw $v0, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_014__
# OP_ASSIGN | __var_func_return_014__ | No src2 | z
    lw $t0, 8($sp)
    sw $t0, 12($sp)

# OP_DUMMY | No src1 | No src2 | z
# OP_DUMMY | No src1 | No src2 | __x
# OP_DUMMY | No src1 | No src2 | __var_intcon_015__
# OP_CALL_FUNCTION | __count | __function___temp_function_001__ | __var_func_return_016__
    lw $t2, __var_intcon_015__
    sw $t2, -4($sp)
    la $t2, __x
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __count
    nop
    la $sp, 8($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_016__
# OP_ADD | z | __var_func_return_016__ | __var_add_result_017__
    lw $t0, 12($sp)
    lw $t1, 4($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_017__ | No src2 | z
    lw $t0, 0($sp)
    sw $t0, 12($sp)

# OP_DUMMY | No src1 | No src2 | z
# OP_CALL_FUNCTION | print_int | __function___temp_function_002__ | No dest
    lw $t2, 12($sp)
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
