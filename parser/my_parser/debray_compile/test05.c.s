	.data

__x:	.space 40

__y:	.space 40

__z:	.space 40

__var_intcon_000__:	.word 4

__var_intcon_001__:	.word 111111

__var_intcon_002__:	.word 5

__var_intcon_003__:	.word 222222

__var_intcon_004__:	.word 6

__var_intcon_005__:	.word 333333

__var_intcon_006__:	.word 7

__var_intcon_007__:	.word 444444

__var_intcon_008__:	.word 8

__var_intcon_009__:	.word 555555

__var_intcon_010__:	.word 9

__var_intcon_011__:	.word 666666

__var_intcon_012__:	.word 4

__array_stringcon_000__:	.asciiz "\n"

	.align 2

__var_intcon_014__:	.word 5

__array_stringcon_001__:	.asciiz "\n"

	.align 2

__var_intcon_016__:	.word 6

__array_stringcon_002__:	.asciiz "\n"

	.align 2

__var_intcon_018__:	.word 7

__array_stringcon_003__:	.asciiz "\n"

	.align 2

__var_intcon_020__:	.word 8

__array_stringcon_004__:	.asciiz "\n"

	.align 2

__var_intcon_022__:	.word 9

__array_stringcon_005__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_023__' is 4
# stack offset after '__var_array_entry_021__' is 8
# stack offset after '__var_array_entry_019__' is 12
# stack offset after '__var_array_entry_017__' is 16
# stack offset after '__var_array_entry_015__' is 20
# stack offset after '__var_array_entry_013__' is 24
# stack offset after 'u' is 28
# stack offset after final alignment is 28
    la $sp, -28($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN_TO_ARRAY | __x | __var_intcon_000__ | __var_intcon_001__
    la  $t0, __x
    lw $t1, __var_intcon_001__
    lw $t3, __var_intcon_000__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ASSIGN_TO_ARRAY | __x | __var_intcon_002__ | __var_intcon_003__
    la  $t0, __x
    lw $t1, __var_intcon_003__
    lw $t3, __var_intcon_002__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ASSIGN_TO_ARRAY | __x | __var_intcon_004__ | __var_intcon_005__
    la  $t0, __x
    lw $t1, __var_intcon_005__
    lw $t3, __var_intcon_004__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_ASSIGN_TO_ARRAY | __y | __var_intcon_006__ | __var_intcon_007__
    la  $t0, __y
    lw $t1, __var_intcon_007__
    lw $t3, __var_intcon_006__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_ASSIGN_TO_ARRAY | __y | __var_intcon_008__ | __var_intcon_009__
    la  $t0, __y
    lw $t1, __var_intcon_009__
    lw $t3, __var_intcon_008__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_DUMMY | No src1 | No src2 | __var_intcon_011__
# OP_ASSIGN_TO_ARRAY | __y | __var_intcon_010__ | __var_intcon_011__
    la  $t0, __y
    lw $t1, __var_intcon_011__
    lw $t3, __var_intcon_010__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_012__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_013__
# OP_ASSIGN_FROM_ARRAY | __x | __var_intcon_012__ | __var_array_entry_013__
    la $t0, __x
    lw $t1, __var_intcon_012__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 20($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_013__
# OP_ASSIGN | __var_array_entry_013__ | No src2 | u
    lw $t0, 20($sp)
    sw $t0, 24($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, 24($sp)
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
# OP_DUMMY | No src1 | No src2 | __var_intcon_014__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_015__
# OP_ASSIGN_FROM_ARRAY | __x | __var_intcon_014__ | __var_array_entry_015__
    la $t0, __x
    lw $t1, __var_intcon_014__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 16($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_015__
# OP_ASSIGN | __var_array_entry_015__ | No src2 | u
    lw $t0, 16($sp)
    sw $t0, 24($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_CALL_FUNCTION | print_int | __function___temp_function_002__ | No dest
    lw $t2, 24($sp)
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
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_017__
# OP_ASSIGN_FROM_ARRAY | __x | __var_intcon_016__ | __var_array_entry_017__
    la $t0, __x
    lw $t1, __var_intcon_016__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 12($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_017__
# OP_ASSIGN | __var_array_entry_017__ | No src2 | u
    lw $t0, 12($sp)
    sw $t0, 24($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_CALL_FUNCTION | print_int | __function___temp_function_004__ | No dest
    lw $t2, 24($sp)
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
# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_019__
# OP_ASSIGN_FROM_ARRAY | __y | __var_intcon_018__ | __var_array_entry_019__
    la $t0, __y
    lw $t1, __var_intcon_018__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_019__
# OP_ASSIGN | __var_array_entry_019__ | No src2 | u
    lw $t0, 8($sp)
    sw $t0, 24($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_CALL_FUNCTION | print_int | __function___temp_function_006__ | No dest
    lw $t2, 24($sp)
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
# OP_DUMMY | No src1 | No src2 | __var_intcon_020__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_021__
# OP_ASSIGN_FROM_ARRAY | __y | __var_intcon_020__ | __var_array_entry_021__
    la $t0, __y
    lw $t1, __var_intcon_020__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_021__
# OP_ASSIGN | __var_array_entry_021__ | No src2 | u
    lw $t0, 4($sp)
    sw $t0, 24($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_CALL_FUNCTION | print_int | __function___temp_function_008__ | No dest
    lw $t2, 24($sp)
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
# OP_DUMMY | No src1 | No src2 | __var_intcon_022__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_023__
# OP_ASSIGN_FROM_ARRAY | __y | __var_intcon_022__ | __var_array_entry_023__
    la $t0, __y
    lw $t1, __var_intcon_022__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_023__
# OP_ASSIGN | __var_array_entry_023__ | No src2 | u
    lw $t0, 0($sp)
    sw $t0, 24($sp)

# OP_DUMMY | No src1 | No src2 | u
# OP_CALL_FUNCTION | print_int | __function___temp_function_010__ | No dest
    lw $t2, 24($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_005__
# OP_CALL_FUNCTION | print_string | __function___temp_function_011__ | No dest
    la $t2, __array_stringcon_005__
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
