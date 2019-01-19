	.data

__var_intcon_000__:	.word 111

__var_intcon_001__:	.word 222

__var_intcon_002__:	.word 333

__var_intcon_003__:	.word 444

__var_intcon_004__:	.word 555

__array_stringcon_000__:	.asciiz "\n"

__array_stringcon_001__:	.asciiz "\n"

__array_stringcon_002__:	.asciiz "\n"

__array_stringcon_003__:	.asciiz "\n"

__array_stringcon_004__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'v' is 4
# stack offset after 'u' is 8
# stack offset after 'z' is 12
# stack offset after 'y' is 16
# stack offset after 'x' is 20
# stack offset after final alignment is 20
    la $sp, -20($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | x
    lw $t0, __var_intcon_000__
    sw $t0, 16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | y
    lw $t0, __var_intcon_001__
    sw $t0, 12($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | z
    lw $t0, __var_intcon_002__
    sw $t0, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ASSIGN | __var_intcon_003__ | No src2 | u
    lw $t0, __var_intcon_003__
    sw $t0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ASSIGN | __var_intcon_004__ | No src2 | v
    lw $t0, __var_intcon_004__
    sw $t0, 0($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, 16($sp)
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
# OP_DUMMY | No src1 | No src2 | z
# OP_CALL_FUNCTION | print_int | __function___temp_function_004__ | No dest
    lw $t2, 8($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_002__
# OP_CALL_FUNCTION | print_string | __function___temp_function_005__ | No dest
    la $t2, __array_stringcon_002__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | u
# OP_CALL_FUNCTION | print_int | __function___temp_function_006__ | No dest
    lw $t2, 4($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_003__
# OP_CALL_FUNCTION | print_string | __function___temp_function_007__ | No dest
    la $t2, __array_stringcon_003__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | v
# OP_CALL_FUNCTION | print_int | __function___temp_function_008__ | No dest
    lw $t2, 0($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_004__
# OP_CALL_FUNCTION | print_string | __function___temp_function_009__ | No dest
    la $t2, __array_stringcon_004__
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
