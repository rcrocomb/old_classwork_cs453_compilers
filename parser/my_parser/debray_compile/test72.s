	.data

__u:	.space 4

__var_intcon_001__:	.word 0

__var_intcon_005__:	.word 1

	.text

# OP_ENTER_FUNCTION | __f | No src2 | No dest
__f:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_006__' is 4
# stack offset after '__var_add_result_004__' is 8
# stack offset after '__var_array_entry_003__' is 9
# stack offset after '__var_eq_result_002__' is 10
# stack offset after '__var_array_entry_000__' is 11
# stack offset after final alignment is 12
    la $sp, -12($sp)

# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_array_entry_000__
# OP_ASSIGN_FROM_ARRAY | s | n | __var_array_entry_000__
    lw $t0, 0($fp)
    lw $t1, 4($fp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 10($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_000__
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_EQ | __var_array_entry_000__ | __var_intcon_001__ | __var_eq_result_002__
    lb $t0, 10($sp)
    lw $t1, __var_intcon_001__
    seq $t2, $t0, $t1
    sb $t2, 9($sp)

# OP_COND_BRANCH | __var_eq_result_002__ | __label_else_000__ | No dest
    lb $t2, 9($sp)
    beqz $t2, __label_else_000__

    nop
# OP_LEAVE_FUNCTION | __f | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
# OP_GOTO | __label_post_else_001__ | No src2 | No dest
    j __label_post_else_001__

    nop
# OP_LABEL | __label_else_000__ | No src2 | No dest
__label_else_000__:
# OP_DUMMY | No src1 | No src2 | __u
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_array_entry_003__
# OP_ASSIGN_FROM_ARRAY | s | n | __var_array_entry_003__
    lw $t0, 0($fp)
    lw $t1, 4($fp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_003__
# OP_ADD | __u | __var_array_entry_003__ | __var_add_result_004__
    lw $t0, __u
    lb $t1, 8($sp)
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_add_result_004__ | No src2 | __u
    lw $t0, 4($sp)
    sw $t0, __u
# OP_DUMMY | No src1 | No src2 | s
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ADD | n | __var_intcon_005__ | __var_add_result_006__
    lw $t0, 4($fp)
    lw $t1, __var_intcon_005__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_CALL_FUNCTION | __f | __function___temp_function_000__ | No dest
    lw $t2, 0($sp)
    sw $t2, -4($sp)
    lw $t2, 0($fp)
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __f
    nop
    la $sp, 8($sp)
# OP_LABEL | __label_post_else_001__ | No src2 | No dest
__label_post_else_001__:
# OP_LEAVE_FUNCTION | __f | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__array_stringcon_000__:	.asciiz "hello world"

	.align 2

__var_intcon_007__:	.word 0

__array_stringcon_001__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_CALL_FUNCTION | __f | __function___temp_function_001__ | No dest
    lw $t2, __var_intcon_007__
    sw $t2, -4($sp)
    la $t2, __array_stringcon_000__
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __f
    nop
    la $sp, 8($sp)
# OP_DUMMY | No src1 | No src2 | __u
# OP_CALL_FUNCTION | print_int | __function___temp_function_002__ | No dest
    lw $t2, __u
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
