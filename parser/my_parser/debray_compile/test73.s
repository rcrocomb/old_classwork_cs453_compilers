	.data

__x:	.space 40

	.text

# OP_ENTER_FUNCTION | __id | No src2 | No dest
__id:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_LEAVE_FUNCTION | __id | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
	.data

__var_intcon_000__:	.word 0

__var_intcon_001__:	.word 10

__var_intcon_003__:	.word 1

__var_intcon_005__:	.word 5

__var_intcon_014__:	.word 0

__var_intcon_016__:	.word 1

__var_intcon_019__:	.word 1

__var_intcon_022__:	.word 1

__var_intcon_025__:	.word 1

__var_intcon_028__:	.word 1

__var_intcon_031__:	.word 1

__var_intcon_034__:	.word 1

__var_intcon_036__:	.word 1

__var_intcon_038__:	.word 0

__var_intcon_040__:	.word 1

__var_intcon_043__:	.word 1

__var_intcon_046__:	.word 1

__var_intcon_049__:	.word 1

__var_intcon_052__:	.word 1

__var_intcon_055__:	.word 1

__var_intcon_058__:	.word 1

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_060__' is 4
# stack offset after '__var_add_result_059__' is 8
# stack offset after '__var_func_return_057__' is 12
# stack offset after '__var_add_result_056__' is 16
# stack offset after '__var_array_entry_054__' is 20
# stack offset after '__var_add_result_053__' is 24
# stack offset after '__var_func_return_051__' is 28
# stack offset after '__var_add_result_050__' is 32
# stack offset after '__var_array_entry_048__' is 36
# stack offset after '__var_add_result_047__' is 40
# stack offset after '__var_func_return_045__' is 44
# stack offset after '__var_add_result_044__' is 48
# stack offset after '__var_array_entry_042__' is 52
# stack offset after '__var_add_result_041__' is 56
# stack offset after '__var_func_return_039__' is 60
# stack offset after '__var_add_result_037__' is 64
# stack offset after '__var_add_result_035__' is 68
# stack offset after '__var_func_return_033__' is 72
# stack offset after '__var_add_result_032__' is 76
# stack offset after '__var_array_entry_030__' is 80
# stack offset after '__var_add_result_029__' is 84
# stack offset after '__var_func_return_027__' is 88
# stack offset after '__var_add_result_026__' is 92
# stack offset after '__var_array_entry_024__' is 96
# stack offset after '__var_add_result_023__' is 100
# stack offset after '__var_func_return_021__' is 104
# stack offset after '__var_add_result_020__' is 108
# stack offset after '__var_array_entry_018__' is 112
# stack offset after '__var_add_result_017__' is 116
# stack offset after '__var_func_return_015__' is 120
# stack offset after '__var_array_entry_013__' is 124
# stack offset after '__var_func_return_012__' is 128
# stack offset after '__var_array_entry_011__' is 132
# stack offset after '__var_func_return_010__' is 136
# stack offset after '__var_array_entry_009__' is 140
# stack offset after '__var_func_return_008__' is 144
# stack offset after '__var_array_entry_007__' is 148
# stack offset after '__var_func_return_006__' is 152
# stack offset after '__var_add_result_004__' is 156
# stack offset after '__var_lt_result_002__' is 157
# stack offset after 'res' is 164
# stack offset after 'i' is 168
# stack offset after final alignment is 168
    la $sp, -168($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | i
    lw $t0, __var_intcon_000__
    sw $t0, 164($sp)

# OP_GOTO | __label_for_bot_001__ | No src2 | No dest
    j __label_for_bot_001__

    nop
# OP_LABEL | __label_for_top_000__ | No src2 | No dest
__label_for_top_000__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | i
# OP_ASSIGN_TO_ARRAY | __x | i | i
    la  $t0, __x
    lw $t1, 164($sp)

    lw $t3, 164($sp)
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ADD | i | __var_intcon_003__ | __var_add_result_004__
    lw $t0, 164($sp)
    lw $t1, __var_intcon_003__
    add $t2, $t0, $t1
    sw $t2, 152($sp)

# OP_ASSIGN | __var_add_result_004__ | No src2 | i
    lw $t0, 152($sp)
    sw $t0, 164($sp)

# OP_LABEL | __label_for_bot_001__ | No src2 | No dest
__label_for_bot_001__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_LT | i | __var_intcon_001__ | __var_lt_result_002__
    lw $t0, 164($sp)
    lw $t1, __var_intcon_001__
    slt $t2, $t0, $t1
    sb $t2, 156($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_002__ | __label_for_top_000__ | No dest
    lb $t2, 156($sp)
    bnez $t2, __label_for_top_000__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_CALL_FUNCTION | __id | __function___temp_function_000__ | __var_func_return_006__
    lw $t2, __var_intcon_005__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 148($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_006__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_007__
# OP_ASSIGN_FROM_ARRAY | __x | __var_func_return_006__ | __var_array_entry_007__
    la $t0, __x
    lw $t1, 148($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 144($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_007__
# OP_CALL_FUNCTION | __id | __function___temp_function_001__ | __var_func_return_008__
    lw $t2, 144($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 140($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_008__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_009__
# OP_ASSIGN_FROM_ARRAY | __x | __var_func_return_008__ | __var_array_entry_009__
    la $t0, __x
    lw $t1, 140($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 136($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_009__
# OP_CALL_FUNCTION | __id | __function___temp_function_002__ | __var_func_return_010__
    lw $t2, 136($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 132($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_010__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_011__
# OP_ASSIGN_FROM_ARRAY | __x | __var_func_return_010__ | __var_array_entry_011__
    la $t0, __x
    lw $t1, 132($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 128($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_011__
# OP_CALL_FUNCTION | __id | __function___temp_function_003__ | __var_func_return_012__
    lw $t2, 128($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 124($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_012__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_013__
# OP_ASSIGN_FROM_ARRAY | __x | __var_func_return_012__ | __var_array_entry_013__
    la $t0, __x
    lw $t1, 124($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 120($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_013__
# OP_ASSIGN | __var_array_entry_013__ | No src2 | res
    lw $t0, 120($sp)
    sw $t0, 160($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_014__
# OP_CALL_FUNCTION | __id | __function___temp_function_004__ | __var_func_return_015__
    lw $t2, __var_intcon_014__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 116($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_015__
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_ADD | __var_func_return_015__ | __var_intcon_016__ | __var_add_result_017__
    lw $t0, 116($sp)
    lw $t1, __var_intcon_016__
    add $t2, $t0, $t1
    sw $t2, 112($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_018__
# OP_ASSIGN_FROM_ARRAY | __x | __var_add_result_017__ | __var_array_entry_018__
    la $t0, __x
    lw $t1, 112($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 108($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_018__
# OP_DUMMY | No src1 | No src2 | __var_intcon_019__
# OP_ADD | __var_array_entry_018__ | __var_intcon_019__ | __var_add_result_020__
    lw $t0, 108($sp)
    lw $t1, __var_intcon_019__
    add $t2, $t0, $t1
    sw $t2, 104($sp)

# OP_CALL_FUNCTION | __id | __function___temp_function_005__ | __var_func_return_021__
    lw $t2, 104($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 100($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_021__
# OP_DUMMY | No src1 | No src2 | __var_intcon_022__
# OP_ADD | __var_func_return_021__ | __var_intcon_022__ | __var_add_result_023__
    lw $t0, 100($sp)
    lw $t1, __var_intcon_022__
    add $t2, $t0, $t1
    sw $t2, 96($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_024__
# OP_ASSIGN_FROM_ARRAY | __x | __var_add_result_023__ | __var_array_entry_024__
    la $t0, __x
    lw $t1, 96($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 92($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_024__
# OP_DUMMY | No src1 | No src2 | __var_intcon_025__
# OP_ADD | __var_array_entry_024__ | __var_intcon_025__ | __var_add_result_026__
    lw $t0, 92($sp)
    lw $t1, __var_intcon_025__
    add $t2, $t0, $t1
    sw $t2, 88($sp)

# OP_CALL_FUNCTION | __id | __function___temp_function_006__ | __var_func_return_027__
    lw $t2, 88($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 84($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_027__
# OP_DUMMY | No src1 | No src2 | __var_intcon_028__
# OP_ADD | __var_func_return_027__ | __var_intcon_028__ | __var_add_result_029__
    lw $t0, 84($sp)
    lw $t1, __var_intcon_028__
    add $t2, $t0, $t1
    sw $t2, 80($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_030__
# OP_ASSIGN_FROM_ARRAY | __x | __var_add_result_029__ | __var_array_entry_030__
    la $t0, __x
    lw $t1, 80($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 76($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_030__
# OP_DUMMY | No src1 | No src2 | __var_intcon_031__
# OP_ADD | __var_array_entry_030__ | __var_intcon_031__ | __var_add_result_032__
    lw $t0, 76($sp)
    lw $t1, __var_intcon_031__
    add $t2, $t0, $t1
    sw $t2, 72($sp)

# OP_CALL_FUNCTION | __id | __function___temp_function_007__ | __var_func_return_033__
    lw $t2, 72($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 68($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_033__
# OP_DUMMY | No src1 | No src2 | __var_intcon_034__
# OP_ADD | __var_func_return_033__ | __var_intcon_034__ | __var_add_result_035__
    lw $t0, 68($sp)
    lw $t1, __var_intcon_034__
    add $t2, $t0, $t1
    sw $t2, 64($sp)

# OP_DUMMY | No src1 | No src2 | res
# OP_DUMMY | No src1 | No src2 | __var_intcon_036__
# OP_ADD | res | __var_intcon_036__ | __var_add_result_037__
    lw $t0, 160($sp)
    lw $t1, __var_intcon_036__
    add $t2, $t0, $t1
    sw $t2, 60($sp)

# OP_ASSIGN_TO_ARRAY | __x | __var_add_result_035__ | __var_add_result_037__
    la  $t0, __x
    lw $t1, 60($sp)

    lw $t3, 64($sp)
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_038__
# OP_CALL_FUNCTION | __id | __function___temp_function_008__ | __var_func_return_039__
    lw $t2, __var_intcon_038__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 56($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_039__
# OP_DUMMY | No src1 | No src2 | __var_intcon_040__
# OP_ADD | __var_func_return_039__ | __var_intcon_040__ | __var_add_result_041__
    lw $t0, 56($sp)
    lw $t1, __var_intcon_040__
    add $t2, $t0, $t1
    sw $t2, 52($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_042__
# OP_ASSIGN_FROM_ARRAY | __x | __var_add_result_041__ | __var_array_entry_042__
    la $t0, __x
    lw $t1, 52($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 48($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_042__
# OP_DUMMY | No src1 | No src2 | __var_intcon_043__
# OP_ADD | __var_array_entry_042__ | __var_intcon_043__ | __var_add_result_044__
    lw $t0, 48($sp)
    lw $t1, __var_intcon_043__
    add $t2, $t0, $t1
    sw $t2, 44($sp)

# OP_CALL_FUNCTION | __id | __function___temp_function_009__ | __var_func_return_045__
    lw $t2, 44($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 40($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_045__
# OP_DUMMY | No src1 | No src2 | __var_intcon_046__
# OP_ADD | __var_func_return_045__ | __var_intcon_046__ | __var_add_result_047__
    lw $t0, 40($sp)
    lw $t1, __var_intcon_046__
    add $t2, $t0, $t1
    sw $t2, 36($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_048__
# OP_ASSIGN_FROM_ARRAY | __x | __var_add_result_047__ | __var_array_entry_048__
    la $t0, __x
    lw $t1, 36($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 32($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_048__
# OP_DUMMY | No src1 | No src2 | __var_intcon_049__
# OP_ADD | __var_array_entry_048__ | __var_intcon_049__ | __var_add_result_050__
    lw $t0, 32($sp)
    lw $t1, __var_intcon_049__
    add $t2, $t0, $t1
    sw $t2, 28($sp)

# OP_CALL_FUNCTION | __id | __function___temp_function_010__ | __var_func_return_051__
    lw $t2, 28($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 24($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_051__
# OP_DUMMY | No src1 | No src2 | __var_intcon_052__
# OP_ADD | __var_func_return_051__ | __var_intcon_052__ | __var_add_result_053__
    lw $t0, 24($sp)
    lw $t1, __var_intcon_052__
    add $t2, $t0, $t1
    sw $t2, 20($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_054__
# OP_ASSIGN_FROM_ARRAY | __x | __var_add_result_053__ | __var_array_entry_054__
    la $t0, __x
    lw $t1, 20($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 16($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_054__
# OP_DUMMY | No src1 | No src2 | __var_intcon_055__
# OP_ADD | __var_array_entry_054__ | __var_intcon_055__ | __var_add_result_056__
    lw $t0, 16($sp)
    lw $t1, __var_intcon_055__
    add $t2, $t0, $t1
    sw $t2, 12($sp)

# OP_CALL_FUNCTION | __id | __function___temp_function_011__ | __var_func_return_057__
    lw $t2, 12($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __id
    nop
    la $sp, 4($sp)

    sw $v0, 8($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_057__
# OP_DUMMY | No src1 | No src2 | __var_intcon_058__
# OP_ADD | __var_func_return_057__ | __var_intcon_058__ | __var_add_result_059__
    lw $t0, 8($sp)
    lw $t1, __var_intcon_058__
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_060__
# OP_ASSIGN_FROM_ARRAY | __x | __var_add_result_059__ | __var_array_entry_060__
    la $t0, __x
    lw $t1, 4($sp)
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_060__
# OP_ASSIGN | __var_array_entry_060__ | No src2 | res
    lw $t0, 0($sp)
    sw $t0, 160($sp)

# OP_DUMMY | No src1 | No src2 | res
# OP_CALL_FUNCTION | print_int | __function___temp_function_012__ | No dest
    lw $t2, 160($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_013__ | No dest
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
