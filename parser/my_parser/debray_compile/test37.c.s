	.data

__x:	.space 4

__y:	.space 1

	.align 2

__z:	.space 4

__u:	.space 1

	.align 2

__var_intcon_000__:	.word 345

__var_intcon_001__:	.word 10

__var_intcon_003__:	.word 2

__array_stringcon_000__:	.asciiz "\n"

__array_stringcon_001__:	.asciiz "\n"

__array_stringcon_002__:	.asciiz "\n"

__array_stringcon_003__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_mult_result_007__' is 4
# stack offset after '__var_div_result_006__' is 8
# stack offset after '__var_add_result_005__' is 12
# stack offset after '__var_unary_MINUS_result_004__' is 16
# stack offset after '__var_sub_result_002__' is 20
# stack offset after final alignment is 20
    la $sp, -20($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | __x
    lw $t0, __var_intcon_000__
    sw $t0, __x
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | __y
    lw $t0, __var_intcon_001__
    sb $t0, __y
# OP_DUMMY | No src1 | No src2 | __x
# OP_DUMMY | No src1 | No src2 | __y
# OP_SUB | __x | __y | __var_sub_result_002__
    lw $t0, __x
    lb $t1, __y
    sub $t2, $t0, $t1
    sw $t2, 16($sp)

# OP_ASSIGN | __var_sub_result_002__ | No src2 | __x
    lw $t0, 16($sp)
    sw $t0, __x
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_NEGATIVE | __var_intcon_003__ | No src2 | __var_unary_MINUS_result_004__
    lw $t0, __var_intcon_003__
    neg $t2, $t0
    sw $t2, 12($sp)

# OP_ASSIGN | __var_unary_MINUS_result_004__ | No src2 | __y
    lw $t0, 12($sp)
    sb $t0, __y
# OP_DUMMY | No src1 | No src2 | __x
# OP_DUMMY | No src1 | No src2 | __y
# OP_ADD | __x | __y | __var_add_result_005__
    lw $t0, __x
    lb $t1, __y
    add $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_ASSIGN | __var_add_result_005__ | No src2 | __x
    lw $t0, 8($sp)
    sw $t0, __x
# OP_DUMMY | No src1 | No src2 | __x
# OP_DUMMY | No src1 | No src2 | __y
# OP_DIV | __x | __y | __var_div_result_006__
    lw $t0, __x
    lb $t1, __y
    div $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_div_result_006__ | No src2 | __z
    lw $t0, 4($sp)
    sw $t0, __z
# OP_DUMMY | No src1 | No src2 | __z
# OP_DUMMY | No src1 | No src2 | __y
# OP_MULT | __z | __y | __var_mult_result_007__
    lw $t0, __z
    lb $t1, __y
    mul $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_mult_result_007__ | No src2 | __u
    lw $t0, 0($sp)
    sb $t0, __u
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
# OP_DUMMY | No src1 | No src2 | __u
# OP_CALL_FUNCTION | print_int | __function___temp_function_006__ | No dest
    lb $t2, __u
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
