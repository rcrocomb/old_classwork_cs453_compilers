Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e500	void __real_not_test
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
Operation is OP_ASSIGN
src1 == 0x809e948	int __var_intcon_001__
src2 == 00000000	Nada
dest  == 0x809e8a0	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e880	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8a0	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_NE
src1 == 0x809e880	int a
src2 == 0x809e8a0	int b
dest  == 0x809ea10	data | name '__var_ne_result_002__' | not const | local | place == -100000


Three code: 
Operation is OP_NOT
src1 == 0x809ea10	bool __var_ne_result_002__
src2 == 00000000	Nada
dest  == 0x809ea48	data | name '__var_negate_003__' | not const | local | place == -100000


Three code: 
Operation is OP_COND_BRANCH
src1 == 0x809ea48	bool __var_negate_003__
src2 == 0x809e9b0	ERROR TYPE __label_else_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea98	data | name '__var_intcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809ea98	int __var_intcon_004__
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_GOTO
src1 == 0x809e9c8	ERROR TYPE __label_post_else_001__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809e9b0	ERROR TYPE __label_else_000__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb30	data | name '__var_intcon_005__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809eb30	int __var_intcon_005__
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x809e9c8	ERROR TYPE __label_post_else_001__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebb0	data | name '__array_stringcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809ec20	void __function___temp_function_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x809ec98	void __function___temp_function_001__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ece8	data | name '__array_stringcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809ed58	void __function___temp_function_002__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e500	void __real_not_test
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_000__:	.word 1

__var_intcon_001__:	.word 2

__var_intcon_004__:	.word 1

__var_intcon_005__:	.word 2

__array_stringcon_000__:	.asciiz "c == "

__array_stringcon_001__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __real_not_test | No src2 | No dest
__real_not_test:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_negate_003__' is 1
# stack offset after '__var_ne_result_002__' is 2
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
# OP_ASSIGN | __var_intcon_001__ | No src2 | b
    lw $t0, __var_intcon_001__
    sw $t0, 8($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | b
# OP_NE | a | b | __var_ne_result_002__
    lw $t0, 12($sp)
    lw $t1, 8($sp)
    sne $t2, $t0, $t1
    sb $t2, 1($sp)

# OP_NOT | __var_ne_result_002__ | No src2 | __var_negate_003__
    lb $t0, 1($sp)
    li $t1, 1
    sub $t2, $t1, $t0
    sb $t2, 0($sp)

# OP_COND_BRANCH | __var_negate_003__ | __label_else_000__ | No dest
    lb $t2, 0($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ASSIGN | __var_intcon_004__ | No src2 | c
    lw $t0, __var_intcon_004__
    sw $t0, 4($sp)

# OP_GOTO | __label_post_else_001__ | No src2 | No dest
    j __label_post_else_001__

    nop
# OP_LABEL | __label_else_000__ | No src2 | No dest
__label_else_000__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ASSIGN | __var_intcon_005__ | No src2 | c
    lw $t0, __var_intcon_005__
    sw $t0, 4($sp)

# OP_LABEL | __label_post_else_001__ | No src2 | No dest
__label_post_else_001__:
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_000__ | No dest
    la $t2, __array_stringcon_000__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | c
# OP_CALL_FUNCTION | print_int | __function___temp_function_001__ | No dest
    lw $t2, 4($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_001__
# OP_CALL_FUNCTION | print_string | __function___temp_function_002__ | No dest
    la $t2, __array_stringcon_001__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_LEAVE_FUNCTION | __real_not_test | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x80a0740	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e500	void __real_not_test
src2 == 0x80a0768	void __function___temp_function_003__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x80a0740	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_CALL_FUNCTION | __real_not_test | __function___temp_function_003__ | No dest

    jal __real_not_test
    nop
    la $sp, 0($sp)
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
