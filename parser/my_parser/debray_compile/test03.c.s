	.data

__x:	.space 4

__y:	.space 4

__z:	.space 4

__var_intcon_000__:	.word 13579

__var_intcon_001__:	.word 24680

__var_intcon_002__:	.word 21436

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

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | __x
    lw $t0, __var_intcon_000__
    sw $t0, __x
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | __y
    lw $t0, __var_intcon_001__
    sw $t0, __y
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | __z
    lw $t0, __var_intcon_002__
    sw $t0, __z
# OP_DUMMY | No src1 | No src2 | __x
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, __x
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
    lw $t2, __y
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
    lw $t2, __z
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
