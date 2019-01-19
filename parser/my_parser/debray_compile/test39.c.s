	.data

__x:	.space 4

__y:	.space 4

__z:	.space 4

__var_intcon_000__:	.word 2

__var_intcon_001__:	.word 3

__var_intcon_002__:	.word 4

__var_charcon_003__:	.byte 'a'

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_012__' is 4
# stack offset after '__var_sub_result_011__' is 8
# stack offset after '__var_mult_result_010__' is 12
# stack offset after '__var_div_result_009__' is 16
# stack offset after '__var_add_result_008__' is 20
# stack offset after '__var_mult_result_007__' is 24
# stack offset after '__var_div_result_006__' is 28
# stack offset after '__var_add_result_005__' is 32
# stack offset after '__var_mult_result_004__' is 36
# stack offset after 'c' is 37
# stack offset after 'b' is 38
# stack offset after 'a' is 39
# stack offset after final alignment is 40
    la $sp, -40($sp)

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
# OP_DUMMY | No src1 | No src2 | __var_charcon_003__
# OP_DUMMY | No src1 | No src2 | __x
# OP_MULT | __var_charcon_003__ | __x | __var_mult_result_004__
    lb $t0, __var_charcon_003__
    lw $t1, __x
    mul $t2, $t0, $t1
    sw $t2, 32($sp)

# OP_ASSIGN | __var_mult_result_004__ | No src2 | a
    lw $t0, 32($sp)
    sb $t0, 38($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | __x
# OP_DUMMY | No src1 | No src2 | __y
# OP_ADD | __x | __y | __var_add_result_005__
    lw $t0, __x
    lw $t1, __y
    add $t2, $t0, $t1
    sw $t2, 28($sp)

# OP_DIV | a | __var_add_result_005__ | __var_div_result_006__
    lb $t0, 38($sp)
    lw $t1, 28($sp)
    div $t2, $t0, $t1
    sw $t2, 24($sp)

# OP_DUMMY | No src1 | No src2 | __z
# OP_MULT | __var_div_result_006__ | __z | __var_mult_result_007__
    lw $t0, 24($sp)
    lw $t1, __z
    mul $t2, $t0, $t1
    sw $t2, 20($sp)

# OP_ASSIGN | __var_mult_result_007__ | No src2 | b
    lw $t0, 20($sp)
    sb $t0, 37($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | __x
# OP_DUMMY | No src1 | No src2 | __y
# OP_ADD | __x | __y | __var_add_result_008__
    lw $t0, __x
    lw $t1, __y
    add $t2, $t0, $t1
    sw $t2, 16($sp)

# OP_DIV | a | __var_add_result_008__ | __var_div_result_009__
    lb $t0, 38($sp)
    lw $t1, 16($sp)
    div $t2, $t0, $t1
    sw $t2, 12($sp)

# OP_DUMMY | No src1 | No src2 | __z
# OP_MULT | __var_div_result_009__ | __z | __var_mult_result_010__
    lw $t0, 12($sp)
    lw $t1, __z
    mul $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_SUB | __var_mult_result_010__ | a | __var_sub_result_011__
    lw $t0, 8($sp)
    lb $t1, 38($sp)
    sub $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_DUMMY | No src1 | No src2 | b
# OP_ADD | __var_sub_result_011__ | b | __var_add_result_012__
    lw $t0, 4($sp)
    lb $t1, 37($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_012__ | No src2 | c
    lw $t0, 0($sp)
    sb $t0, 36($sp)

# OP_DUMMY | No src1 | No src2 | c
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lb $t2, 36($sp)
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
