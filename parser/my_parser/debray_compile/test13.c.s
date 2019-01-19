	.data

__var_charcon_000__:	.byte 'A'

__var_charcon_001__:	.byte 'B'

__var_charcon_002__:	.byte 'C'

__array_stringcon_000__:	.asciiz "\n"

__array_stringcon_001__:	.asciiz "\n"

__array_stringcon_002__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'z' is 1
# stack offset after 'y' is 2
# stack offset after 'x' is 3
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_000__
# OP_ASSIGN | __var_charcon_000__ | No src2 | x
    lb $t0, __var_charcon_000__
    sb $t0, 2($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_001__
# OP_ASSIGN | __var_charcon_001__ | No src2 | y
    lb $t0, __var_charcon_001__
    sb $t0, 1($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_002__
# OP_ASSIGN | __var_charcon_002__ | No src2 | z
    lb $t0, __var_charcon_002__
    sb $t0, 0($sp)

# OP_DUMMY | No src1 | No src2 | x
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lb $t2, 2($sp)
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
    lb $t2, 1($sp)
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
    lb $t2, 0($sp)
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
