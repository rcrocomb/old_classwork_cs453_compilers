Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e430	void __a_func
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea18	data | name 'd' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea38	data | name 'e' | not const | local | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809ea18	int d
src2 == 0x809ea38	int e
dest  == 0x809eb08	data | name '__var_add_result_000__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809eb08	int __var_add_result_000__
src2 == 00000000	Nada
dest  == 0x809e978	data | name 'x' | not const | param | place == 0


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
# stack offset after '__var_add_result_000__' is 4
# stack offset after 'i' is 5
# stack offset after 'h' is 6
# stack offset after 'g' is 7
# stack offset after 'f' is 12
# stack offset after 'e' is 16
# stack offset after 'd' is 20
# stack offset after final alignment is 20
    la $sp, -20($sp)

# OP_DUMMY | No src1 | No src2 | d
# OP_DUMMY | No src1 | No src2 | e
# OP_ADD | d | e | __var_add_result_000__
    lw $t0, 16($sp)
    lw $t1, 12($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_000__ | No src2 | x
    lw $t0, 0($sp)
    sw $t0, 0($fp)

# OP_LEAVE_FUNCTION | __a_func | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e7f0	void __func_2
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9b8	data | name 'p1' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9d8	data | name 'p2' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e998	data | name 'p3' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e978	data | name 'p4' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eab8	data | name '__var_charcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void __a_func
src2 == 0x809e9f8	void __function___temp_function_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e7f0	void __func_2
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_charcon_001__:	.byte 'Q'

	.text

# OP_ENTER_FUNCTION | __func_2 | No src2 | No dest
__func_2:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'p4' is 40
# stack offset after 'p3' is 42
# stack offset after 'p2' is 48
# stack offset after 'p1' is 52
# stack offset after final alignment is 52
    la $sp, -52($sp)

# OP_DUMMY | No src1 | No src2 | p1
# OP_DUMMY | No src1 | No src2 | p2
# OP_DUMMY | No src1 | No src2 | p3
# OP_DUMMY | No src1 | No src2 | p4
# OP_DUMMY | No src1 | No src2 | __var_charcon_001__
# OP_CALL_FUNCTION | __a_func | __function___temp_function_000__ | No dest
    lb $t2, __var_charcon_001__
    sw $t2, -4($sp)
    la $t2, 0($sp)
    sw $t2, -8($sp)
    la $t2, 40($sp)
    sw $t2, -12($sp)
    lw $t2, 44($sp)
    sw $t2, -16($sp)
    lw $t2, 48($sp)
    sw $t2, -20($sp)
    la $sp, -20($sp)

    jal __a_func
    nop
    la $sp, 20($sp)
# OP_LEAVE_FUNCTION | __func_2 | No src2 | No dest

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
