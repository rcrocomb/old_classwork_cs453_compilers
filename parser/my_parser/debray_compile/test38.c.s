	.data

__y:	.space 5

	.align 2

__var_intcon_000__:	.word 0

__var_intcon_001__:	.word 0

__var_intcon_002__:	.word 0

__var_intcon_003__:	.word 1

__var_intcon_004__:	.word 1

__var_intcon_005__:	.word 1

__var_intcon_006__:	.word 1

__var_intcon_007__:	.word 2

__var_intcon_008__:	.word 2

__var_intcon_009__:	.word 2

__var_intcon_010__:	.word 2

__var_intcon_011__:	.word 3

__var_intcon_012__:	.word 3

__var_intcon_013__:	.word 3

__var_intcon_014__:	.word 3

__var_intcon_015__:	.word 4

__var_intcon_016__:	.word 4

__var_intcon_017__:	.word 4

__var_intcon_018__:	.word 4

__var_intcon_019__:	.word 55

__var_intcon_020__:	.word 0

__var_intcon_022__:	.word 0

__var_intcon_025__:	.word 1

__var_intcon_029__:	.word 3

__var_intcon_032__:	.word 2

__var_intcon_036__:	.word 0

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_sub_result_038__' is 4
# stack offset after '__var_array_entry_037__' is 8
# stack offset after '__var_array_entry_035__' is 9
# stack offset after '__var_div_result_034__' is 16
# stack offset after '__var_array_entry_033__' is 20
# stack offset after '__var_mult_result_031__' is 24
# stack offset after '__var_array_entry_030__' is 28
# stack offset after '__var_array_entry_028__' is 29
# stack offset after '__var_add_result_027__' is 36
# stack offset after '__var_array_entry_026__' is 40
# stack offset after '__var_add_result_024__' is 44
# stack offset after '__var_array_entry_023__' is 45
# stack offset after '__var_array_entry_021__' is 52
# stack offset after 'u' is 56
# stack offset after 'x' is 76
# stack offset after final alignment is 76
    la $sp, -76($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN_TO_ARRAY | x | __var_intcon_000__ | __var_intcon_001__
    la  $t0, 56($sp)
    lw $t1, __var_intcon_001__
    lw $t3, __var_intcon_000__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ASSIGN_TO_ARRAY | __y | __var_intcon_002__ | __var_intcon_003__
    la  $t0, __y
    lb $t1, __var_intcon_003__
    lw $t3, __var_intcon_002__
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ASSIGN_TO_ARRAY | x | __var_intcon_004__ | __var_intcon_005__
    la  $t0, 56($sp)
    lw $t1, __var_intcon_005__
    lw $t3, __var_intcon_004__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_ASSIGN_TO_ARRAY | __y | __var_intcon_006__ | __var_intcon_007__
    la  $t0, __y
    lb $t1, __var_intcon_007__
    lw $t3, __var_intcon_006__
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_ASSIGN_TO_ARRAY | x | __var_intcon_008__ | __var_intcon_009__
    la  $t0, 56($sp)
    lw $t1, __var_intcon_009__
    lw $t3, __var_intcon_008__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_DUMMY | No src1 | No src2 | __var_intcon_011__
# OP_ASSIGN_TO_ARRAY | __y | __var_intcon_010__ | __var_intcon_011__
    la  $t0, __y
    lb $t1, __var_intcon_011__
    lw $t3, __var_intcon_010__
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_012__
# OP_DUMMY | No src1 | No src2 | __var_intcon_013__
# OP_ASSIGN_TO_ARRAY | x | __var_intcon_012__ | __var_intcon_013__
    la  $t0, 56($sp)
    lw $t1, __var_intcon_013__
    lw $t3, __var_intcon_012__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_014__
# OP_DUMMY | No src1 | No src2 | __var_intcon_015__
# OP_ASSIGN_TO_ARRAY | __y | __var_intcon_014__ | __var_intcon_015__
    la  $t0, __y
    lb $t1, __var_intcon_015__
    lw $t3, __var_intcon_014__
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_DUMMY | No src1 | No src2 | __var_intcon_017__
# OP_ASSIGN_TO_ARRAY | x | __var_intcon_016__ | __var_intcon_017__
    la  $t0, 56($sp)
    lw $t1, __var_intcon_017__
    lw $t3, __var_intcon_016__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_DUMMY | No src1 | No src2 | __var_intcon_019__
# OP_ASSIGN_TO_ARRAY | __y | __var_intcon_018__ | __var_intcon_019__
    la  $t0, __y
    lb $t1, __var_intcon_019__
    lw $t3, __var_intcon_018__
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_020__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_021__
# OP_ASSIGN_FROM_ARRAY | x | __var_intcon_020__ | __var_array_entry_021__
    la $t0, 56($sp)
    lw $t1, __var_intcon_020__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 48($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_021__
# OP_DUMMY | No src1 | No src2 | __var_intcon_022__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_023__
# OP_ASSIGN_FROM_ARRAY | __y | __var_intcon_022__ | __var_array_entry_023__
    la $t0, __y
    lw $t1, __var_intcon_022__
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 44($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_023__
# OP_ADD | __var_array_entry_021__ | __var_array_entry_023__ | __var_add_result_024__
    lw $t0, 48($sp)
    lb $t1, 44($sp)
    add $t2, $t0, $t1
    sw $t2, 40($sp)

# OP_ASSIGN | __var_add_result_024__ | No src2 | u
    lw $t0, 40($sp)
    sw $t0, 52($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_025__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_026__
# OP_ASSIGN_FROM_ARRAY | x | __var_intcon_025__ | __var_array_entry_026__
    la $t0, 56($sp)
    lw $t1, __var_intcon_025__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 36($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_026__
# OP_DUMMY | No src1 | No src2 | u
# OP_ADD | __var_array_entry_026__ | u | __var_add_result_027__
    lw $t0, 36($sp)
    lw $t1, 52($sp)
    add $t2, $t0, $t1
    sw $t2, 32($sp)

# OP_ASSIGN | __var_add_result_027__ | No src2 | u
    lw $t0, 32($sp)
    sw $t0, 52($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_DUMMY | No src1 | No src2 | __var_array_entry_028__
# OP_ASSIGN_FROM_ARRAY | __y | u | __var_array_entry_028__
    la $t0, __y
    lw $t1, 52($sp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 28($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_028__
# OP_DUMMY | No src1 | No src2 | __var_intcon_029__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_030__
# OP_ASSIGN_FROM_ARRAY | x | __var_intcon_029__ | __var_array_entry_030__
    la $t0, 56($sp)
    lw $t1, __var_intcon_029__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 24($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_030__
# OP_MULT | __var_array_entry_028__ | __var_array_entry_030__ | __var_mult_result_031__
    lb $t0, 28($sp)
    lw $t1, 24($sp)
    mul $t2, $t0, $t1
    sw $t2, 20($sp)

# OP_ASSIGN | __var_mult_result_031__ | No src2 | u
    lw $t0, 20($sp)
    sw $t0, 52($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_DUMMY | No src1 | No src2 | __var_intcon_032__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_033__
# OP_ASSIGN_FROM_ARRAY | x | __var_intcon_032__ | __var_array_entry_033__
    la $t0, 56($sp)
    lw $t1, __var_intcon_032__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 16($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_033__
# OP_DIV | u | __var_array_entry_033__ | __var_div_result_034__
    lw $t0, 52($sp)
    lw $t1, 16($sp)
    div $t2, $t0, $t1
    sw $t2, 12($sp)

# OP_ASSIGN | __var_div_result_034__ | No src2 | u
    lw $t0, 12($sp)
    sw $t0, 52($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_DUMMY | No src1 | No src2 | __var_array_entry_035__
# OP_ASSIGN_FROM_ARRAY | __y | u | __var_array_entry_035__
    la $t0, __y
    lw $t1, 52($sp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_035__
# OP_DUMMY | No src1 | No src2 | __var_intcon_036__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_037__
# OP_ASSIGN_FROM_ARRAY | x | __var_intcon_036__ | __var_array_entry_037__
    la $t0, 56($sp)
    lw $t1, __var_intcon_036__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_037__
# OP_SUB | __var_array_entry_035__ | __var_array_entry_037__ | __var_sub_result_038__
    lb $t0, 8($sp)
    lw $t1, 4($sp)
    sub $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_sub_result_038__ | No src2 | u
    lw $t0, 0($sp)
    sw $t0, 52($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, 52($sp)
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
