	.data

__var_intcon_000__:	.word 0

__var_intcon_001__:	.word 0

__var_intcon_002__:	.word 5

__var_intcon_004__:	.word 1

__var_intcon_006__:	.word 0

__var_intcon_007__:	.word 10

__var_intcon_009__:	.word 2

__var_intcon_011__:	.word 0

__var_intcon_012__:	.word 15

__var_intcon_014__:	.word 3

__var_intcon_018__:	.word 3

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_020__' is 4
# stack offset after '__var_div_result_019__' is 8
# stack offset after '__var_add_result_017__' is 12
# stack offset after '__var_add_result_016__' is 16
# stack offset after '__var_add_result_015__' is 20
# stack offset after '__var_lt_result_013__' is 21
# stack offset after '__var_add_result_010__' is 28
# stack offset after '__var_lt_result_008__' is 29
# stack offset after '__var_add_result_005__' is 36
# stack offset after '__var_lt_result_003__' is 37
# stack offset after 'res' is 44
# stack offset after 'k' is 48
# stack offset after 'j' is 52
# stack offset after 'i' is 56
# stack offset after final alignment is 56
    la $sp, -56($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | res
    lw $t0, __var_intcon_000__
    sw $t0, 40($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | i
    lw $t0, __var_intcon_001__
    sw $t0, 52($sp)

# OP_GOTO | __label_for_bot_001__ | No src2 | No dest
    j __label_for_bot_001__

    nop
# OP_LABEL | __label_for_top_000__ | No src2 | No dest
__label_for_top_000__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_ASSIGN | __var_intcon_006__ | No src2 | j
    lw $t0, __var_intcon_006__
    sw $t0, 48($sp)

# OP_GOTO | __label_for_bot_003__ | No src2 | No dest
    j __label_for_bot_003__

    nop
# OP_LABEL | __label_for_top_002__ | No src2 | No dest
__label_for_top_002__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_011__
# OP_ASSIGN | __var_intcon_011__ | No src2 | k
    lw $t0, __var_intcon_011__
    sw $t0, 44($sp)

# OP_GOTO | __label_for_bot_005__ | No src2 | No dest
    j __label_for_bot_005__

    nop
# OP_LABEL | __label_for_top_004__ | No src2 | No dest
__label_for_top_004__:
# OP_DUMMY | No src1 | No src2 | res
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | j
# OP_ADD | i | j | __var_add_result_016__
    lw $t0, 52($sp)
    lw $t1, 48($sp)
    add $t2, $t0, $t1
    sw $t2, 12($sp)

# OP_DUMMY | No src1 | No src2 | k
# OP_ADD | __var_add_result_016__ | k | __var_add_result_017__
    lw $t0, 12($sp)
    lw $t1, 44($sp)
    add $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_DIV | __var_add_result_017__ | __var_intcon_018__ | __var_div_result_019__
    lw $t0, 8($sp)
    lw $t1, __var_intcon_018__
    div $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ADD | res | __var_div_result_019__ | __var_add_result_020__
    lw $t0, 40($sp)
    lw $t1, 4($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_020__ | No src2 | res
    lw $t0, 0($sp)
    sw $t0, 40($sp)

# OP_DUMMY | No src1 | No src2 | k
# OP_DUMMY | No src1 | No src2 | __var_intcon_014__
# OP_ADD | k | __var_intcon_014__ | __var_add_result_015__
    lw $t0, 44($sp)
    lw $t1, __var_intcon_014__
    add $t2, $t0, $t1
    sw $t2, 16($sp)

# OP_ASSIGN | __var_add_result_015__ | No src2 | k
    lw $t0, 16($sp)
    sw $t0, 44($sp)

# OP_LABEL | __label_for_bot_005__ | No src2 | No dest
__label_for_bot_005__:
# OP_DUMMY | No src1 | No src2 | k
# OP_DUMMY | No src1 | No src2 | __var_intcon_012__
# OP_LT | k | __var_intcon_012__ | __var_lt_result_013__
    lw $t0, 44($sp)
    lw $t1, __var_intcon_012__
    slt $t2, $t0, $t1
    sb $t2, 20($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_013__ | __label_for_top_004__ | No dest
    lb $t2, 20($sp)
    bnez $t2, __label_for_top_004__

    nop
# OP_DUMMY | No src1 | No src2 | j
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_ADD | j | __var_intcon_009__ | __var_add_result_010__
    lw $t0, 48($sp)
    lw $t1, __var_intcon_009__
    add $t2, $t0, $t1
    sw $t2, 24($sp)

# OP_ASSIGN | __var_add_result_010__ | No src2 | j
    lw $t0, 24($sp)
    sw $t0, 48($sp)

# OP_LABEL | __label_for_bot_003__ | No src2 | No dest
__label_for_bot_003__:
# OP_DUMMY | No src1 | No src2 | j
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_LT | j | __var_intcon_007__ | __var_lt_result_008__
    lw $t0, 48($sp)
    lw $t1, __var_intcon_007__
    slt $t2, $t0, $t1
    sb $t2, 28($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_008__ | __label_for_top_002__ | No dest
    lb $t2, 28($sp)
    bnez $t2, __label_for_top_002__

    nop
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ADD | i | __var_intcon_004__ | __var_add_result_005__
    lw $t0, 52($sp)
    lw $t1, __var_intcon_004__
    add $t2, $t0, $t1
    sw $t2, 32($sp)

# OP_ASSIGN | __var_add_result_005__ | No src2 | i
    lw $t0, 32($sp)
    sw $t0, 52($sp)

# OP_LABEL | __label_for_bot_001__ | No src2 | No dest
__label_for_bot_001__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_LT | i | __var_intcon_002__ | __var_lt_result_003__
    lw $t0, 52($sp)
    lw $t1, __var_intcon_002__
    slt $t2, $t0, $t1
    sb $t2, 36($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_003__ | __label_for_top_000__ | No dest
    lb $t2, 36($sp)
    bnez $t2, __label_for_top_000__

    nop
# OP_DUMMY | No src1 | No src2 | res
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, 40($sp)
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
