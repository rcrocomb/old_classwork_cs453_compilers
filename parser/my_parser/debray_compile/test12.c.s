	.data

__x:	.space 1

__y:	.space 1

__z:	.space 1

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

# OP_DUMMY | No src1 | No src2 | __var_charcon_000__
# OP_ASSIGN | __var_charcon_000__ | No src2 | __x
    lb $t0, __var_charcon_000__
    sb $t0, __x
# OP_DUMMY | No src1 | No src2 | __var_charcon_001__
# OP_ASSIGN | __var_charcon_001__ | No src2 | __y
    lb $t0, __var_charcon_001__
    sb $t0, __y
# OP_DUMMY | No src1 | No src2 | __var_charcon_002__
# OP_ASSIGN | __var_charcon_002__ | No src2 | __z
    lb $t0, __var_charcon_002__
    sb $t0, __z
# OP_DUMMY | No src1 | No src2 | __x
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lb $t2, __x
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
# OP_DUMMY | No src1 | No src2 | __y
# OP_CALL_FUNCTION | print_int | __function___temp_function_002__ | No dest
    lb $t2, __y
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
# OP_DUMMY | No src1 | No src2 | __z
# OP_CALL_FUNCTION | print_int | __function___temp_function_004__ | No dest
    lb $t2, __z
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
