Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e500	int __main
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e938	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e938	int __var_intcon_000__
src2 == 00000000	Nada
dest  == 0x809e8d8	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8d8	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9b8	data | name '__var_intcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea08	data | name '__var_array_entry_002__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809e918	char d
src2 == 0x809e9b8	int __var_intcon_001__
dest  == 0x809ea08	data | name '__var_array_entry_002__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea08	data | name '__var_array_entry_002__' | not const | local | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809e8d8	int b
src2 == 0x809ea08	char __var_array_entry_002__
dest  == 0x809ea70	data | name '__var_add_result_003__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809ea70	int __var_add_result_003__
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e500	int __main
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'c' | not const | local | place == -100000


	.data

__var_intcon_000__:	.word 4

__var_intcon_001__:	.word 1

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_003__' is 4
# stack offset after '__var_array_entry_002__' is 5
# stack offset after 'd' is 7
# stack offset after 'c' is 12
# stack offset after 'b' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | b
    lw $t0, __var_intcon_000__
    sw $t0, 12($sp)

# OP_DUMMY | No src1 | No src2 | b
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_002__
# OP_ASSIGN_FROM_ARRAY | d | __var_intcon_001__ | __var_array_entry_002__
    la $t0, 5($sp)
    lw $t1, __var_intcon_001__
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_002__
# OP_ADD | b | __var_array_entry_002__ | __var_add_result_003__
    lw $t0, 12($sp)
    lb $t1, 4($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_003__ | No src2 | c
    lw $t0, 0($sp)
    sw $t0, 8($sp)

# OP_DUMMY | No src1 | No src2 | c
# OP_LEAVE_FUNCTION | __main | No src2 | c
    lw $t2, 8($sp)
    move $v0, $t2

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
