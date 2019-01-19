	.data

__i:	.space 4

__var_intcon_000__:	.word 0

__var_intcon_001__:	.word 100

__array_stringcon_000__:	.asciiz "\n"

	.align 2

__var_intcon_004__:	.word 1

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_005__' is 4
# stack offset after '__var_add_result_003__' is 8
# stack offset after '__var_lt_result_002__' is 9
# stack offset after final alignment is 12
    la $sp, -12($sp)

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
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, __i
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
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __i
# OP_ADD | __i | __i | __var_add_result_003__
    lw $t0, __i
    lw $t1, __i
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ADD | __var_add_result_003__ | __var_intcon_004__ | __var_add_result_005__
    lw $t0, 4($sp)
    lw $t1, __var_intcon_004__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_005__ | No src2 | __i
    lw $t0, 0($sp)
    sw $t0, __i
# OP_LABEL | __label_bot_of_while_001__ | No src2 | No dest
__label_bot_of_while_001__:
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_LT | __i | __var_intcon_001__ | __var_lt_result_002__
    lw $t0, __i
    lw $t1, __var_intcon_001__
    slt $t2, $t0, $t1
    sb $t2, 8($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_002__ | __label_top_of_while_000__ | No dest
    lb $t2, 8($sp)
    bnez $t2, __label_top_of_while_000__

    nop
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
