	.data

__y:	.space 40

__var_intcon_000__:	.word 7

__var_intcon_001__:	.word 1234

__var_intcon_002__:	.word 0

__var_intcon_003__:	.word 7

__var_intcon_005__:	.word 0

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_006__' is 4
# stack offset after '__var_array_entry_004__' is 8
# stack offset after 'u' is 12
# stack offset after 'x' is 52
# stack offset after final alignment is 52
    la $sp, -52($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN_TO_ARRAY | __y | __var_intcon_000__ | __var_intcon_001__
    la  $t0, __y
    lw $t1, __var_intcon_001__
    lw $t3, __var_intcon_000__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_004__
# OP_ASSIGN_FROM_ARRAY | __y | __var_intcon_003__ | __var_array_entry_004__
    la $t0, __y
    lw $t1, __var_intcon_003__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_004__
# OP_ASSIGN_TO_ARRAY | x | __var_intcon_002__ | __var_array_entry_004__
    la  $t0, 12($sp)
    lw $t1, 4($sp)

    lw $t3, __var_intcon_002__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_006__
# OP_ASSIGN_FROM_ARRAY | x | __var_intcon_005__ | __var_array_entry_006__
    la $t0, 12($sp)
    lw $t1, __var_intcon_005__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_006__
# OP_ASSIGN | __var_array_entry_006__ | No src2 | u
    lw $t0, 0($sp)
    sw $t0, 8($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, 8($sp)
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
