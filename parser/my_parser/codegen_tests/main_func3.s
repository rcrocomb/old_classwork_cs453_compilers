Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e430	int __a_func
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8a0	data | name 'y' | not const | param | place == 0


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809e8a0	int y
src2 == 0x809e8f8	int __var_intcon_000__
dest  == 0x809e948	data | name '__var_add_result_001__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e948	int __var_add_result_001__
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e430	int __a_func
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name 'a' | not const | local | place == -100000


	.data

__var_intcon_000__:	.word 2

	.text

# OP_ENTER_FUNCTION | __a_func | No src2 | No dest
__a_func:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_001__' is 4
# stack offset after 'a' is 8
# stack offset after final alignment is 8
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | y
# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ADD | y | __var_intcon_000__ | __var_add_result_001__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_000__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_001__ | No src2 | a
    lw $t0, 0($sp)
    sw $t0, 4($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_LEAVE_FUNCTION | __a_func | No src2 | a
    lw $t2, 4($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e4a8	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e8f8	int __var_intcon_002__
src2 == 00000000	Nada
dest  == 0x809e8a0	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8a0	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	int __a_func
src2 == 0x809e970	void __function___temp_function_000__
dest  == 0x809e998	data | name '__var_func_return_003__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e998	data | name '__var_func_return_003__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e998	int __var_func_return_003__
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e4a8	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_002__:	.word 4

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_func_return_003__' is 4
# stack offset after 'c' is 8
# stack offset after 'b' is 12
# stack offset after final alignment is 12
    la $sp, -12($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | b
    lw $t0, __var_intcon_002__
    sw $t0, 8($sp)

# OP_DUMMY | No src1 | No src2 | b
# OP_CALL_FUNCTION | __a_func | __function___temp_function_000__ | __var_func_return_003__
    lw $t2, 8($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __a_func
    nop
    la $sp, 4($sp)

    sw $v0, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_003__
# OP_ASSIGN | __var_func_return_003__ | No src2 | c
    lw $t0, 0($sp)
    sw $t0, 4($sp)

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
