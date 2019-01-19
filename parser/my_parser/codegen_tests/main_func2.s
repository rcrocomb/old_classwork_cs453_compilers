Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e430	void __a_func
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e430	void __a_func
src2 == 00000000	Nada
dest  == 00000000	Nada

# OP_ENTER_FUNCTION | __a_func | No src2 | No dest
__a_func:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_LEAVE_FUNCTION | __a_func | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e828	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea10	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9b0	data | name '__var_intcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809ea10	int __var_intcon_000__
src2 == 0x809e9b0	int __var_intcon_001__
dest  == 0x809eaa8	data | name '__var_add_result_002__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eae0	data | name '__var_intcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809eaa8	int __var_add_result_002__
src2 == 0x809eae0	int __var_intcon_003__
dest  == 0x809eb30	data | name '__var_add_result_004__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809eb30	int __var_add_result_004__
src2 == 00000000	Nada
dest  == 0x809e9f0	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e828	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_000__:	.word 1

__var_intcon_001__:	.word 2

__var_intcon_003__:	.word 3

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_004__' is 4
# stack offset after '__var_add_result_002__' is 8
# stack offset after 'a' is 12
# stack offset after final alignment is 12
    la $sp, -12($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ADD | __var_intcon_000__ | __var_intcon_001__ | __var_add_result_002__
    lw $t0, __var_intcon_000__
    lw $t1, __var_intcon_001__
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ADD | __var_add_result_002__ | __var_intcon_003__ | __var_add_result_004__
    lw $t0, 4($sp)
    lw $t1, __var_intcon_003__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_004__ | No src2 | a
    lw $t0, 0($sp)
    sw $t0, 8($sp)

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
