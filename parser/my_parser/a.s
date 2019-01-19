	.data

__var_intcon_000__:	.word 0

__var_intcon_002__:	.word 1

	.text

# OP_ENTER_FUNCTION | __setter_func | No src2 | No dest
__setter_func:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_004__' is 4
# stack offset after '__var_add_result_003__' is 8
# stack offset after '__var_lt_result_001__' is 9
# stack offset after 'index' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | index
    lw $t0, __var_intcon_000__
    sw $t0, 12($sp)

# OP_GOTO | __label_for_bot_001__ | No src2 | No dest
    j __label_for_bot_001__

    nop
# OP_LABEL | __label_for_top_000__ | No src2 | No dest
__label_for_top_000__:
# OP_DUMMY | No src1 | No src2 | index
# OP_DUMMY | No src1 | No src2 | value
# OP_DUMMY | No src1 | No src2 | index
# OP_ADD | value | index | __var_add_result_004__
    lw $t0, 8($fp)
    lw $t1, 12($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN_TO_ARRAY | x | index | __var_add_result_004__
    lw  $t0, 0($fp)
    lb $t1, 0($sp)

    lw $t3, 12($sp)
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | index
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ADD | index | __var_intcon_002__ | __var_add_result_003__
    lw $t0, 12($sp)
    lw $t1, __var_intcon_002__
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_add_result_003__ | No src2 | index
    lw $t0, 4($sp)
    sw $t0, 12($sp)

# OP_LABEL | __label_for_bot_001__ | No src2 | No dest
__label_for_bot_001__:
# OP_DUMMY | No src1 | No src2 | index
# OP_DUMMY | No src1 | No src2 | i
# OP_LT | index | i | __var_lt_result_001__
    lw $t0, 12($sp)
    lw $t1, 4($fp)
    slt $t2, $t0, $t1
    sb $t2, 8($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_001__ | __label_for_top_000__ | No dest
    lb $t2, 8($sp)
    bnez $t2, __label_for_top_000__

    nop
# OP_LEAVE_FUNCTION | __setter_func | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_005__:	.word 40

	.text

# OP_ENTER_FUNCTION | __func | No src2 | No dest
__func:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_CALL_FUNCTION | __setter_func | __function___temp_function_000__ | No dest
    lw $t2, __var_intcon_005__
    sw $t2, -4($sp)
    lw $t2, 4($fp)
    sw $t2, -8($sp)
    lw $t2, 0($fp)
    sw $t2, -12($sp)
    la $sp, -12($sp)

    jal __setter_func
    nop
    la $sp, 12($sp)
# OP_LEAVE_FUNCTION | __func | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_006__:	.word 0

__var_intcon_007__:	.word 10

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'i' is 4
# stack offset after 'p3' is 14
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_ASSIGN_TO_ARRAY | p3 | i | __var_intcon_006__
    la  $t0, 4($sp)
    lb $t1, __var_intcon_006__
    lw $t3, 0($sp)
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | p3
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_CALL_FUNCTION | __func | __function___temp_function_001__ | No dest
    lw $t2, __var_intcon_007__
    sw $t2, -4($sp)
    la $t2, 4($sp)
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __func
    nop
    la $sp, 8($sp)
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
