Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e500	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8e0	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e8e0	int __var_intcon_000__
src2 == 00000000	Nada
dest  == 0x809e880	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e948	data | name '__var_intcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_NEGATIVE
src1 == 0x809e948	int __var_intcon_001__
src2 == 00000000	Nada
dest  == 0x809e998	data | name '__var_unary_MINUS_result_002__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e998	int __var_unary_MINUS_result_002__
src2 == 00000000	Nada
dest  == 0x809e8a0	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e880	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x809ea10	void __function___temp_function_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea60	data | name '__array_stringcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809ead0	void __function___temp_function_001__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8a0	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x809eb48	void __function___temp_function_002__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb98	data | name '__array_stringcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809ec08	void __function___temp_function_003__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e500	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_000__:	.word 1

__var_intcon_001__:	.word 1

__array_stringcon_000__:	.asciiz " "

__array_stringcon_001__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_unary_MINUS_result_002__' is 4
# stack offset after 'c' is 8
# stack offset after 'b' is 12
# stack offset after 'a' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | a
    lw $t0, __var_intcon_000__
    sw $t0, 12($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_NEGATIVE | __var_intcon_001__ | No src2 | __var_unary_MINUS_result_002__
    lw $t0, __var_intcon_001__
    neg $t2, $t0
    sw $t2, 0($sp)

# OP_ASSIGN | __var_unary_MINUS_result_002__ | No src2 | b
    lw $t0, 0($sp)
    sw $t0, 8($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, 12($sp)
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
# OP_DUMMY | No src1 | No src2 | b
# OP_CALL_FUNCTION | print_int | __function___temp_function_002__ | No dest
    lw $t2, 8($sp)
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
