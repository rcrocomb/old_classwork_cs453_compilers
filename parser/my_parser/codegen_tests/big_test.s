Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e860	int __fibonacci
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9d0	data | name 'n' | not const | param | place == 0


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eab8	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x809e9d0	int n
src2 == 0x809eab8	int __var_intcon_000__
dest  == 0x809eb08	data | name '__var_eq_result_001__' | not const | local | place == -100000


Three code: 
Operation is OP_COND_BRANCH
src1 == 0x809eb08	bool __var_eq_result_001__
src2 == 0x809ea70	ERROR TYPE __label_else_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb58	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e860	int __fibonacci
src2 == 00000000	Nada
dest  == 0x809eb58	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_GOTO
src1 == 0x809ea88	ERROR TYPE __label_post_else_001__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809ea70	ERROR TYPE __label_else_000__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9d0	data | name 'n' | not const | param | place == 0


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ec38	data | name '__var_intcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x809e9d0	int n
src2 == 0x809ec38	int __var_intcon_003__
dest  == 0x809ec88	data | name '__var_eq_result_004__' | not const | local | place == -100000


Three code: 
Operation is OP_COND_BRANCH
src1 == 0x809ec88	bool __var_eq_result_004__
src2 == 0x809ebf0	ERROR TYPE __label_else_002__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ecd8	data | name '__var_intcon_005__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e860	int __fibonacci
src2 == 00000000	Nada
dest  == 0x809ecd8	data | name '__var_intcon_005__' | const | param | place == -100000


Three code: 
Operation is OP_GOTO
src1 == 0x809ec08	ERROR TYPE __label_post_else_003__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809ebf0	ERROR TYPE __label_else_002__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ed70	data | name '__var_intcon_006__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809ed70	int __var_intcon_006__
src2 == 00000000	Nada
dest  == 0x809ea30	data | name 'sum' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9d0	data | name 'n' | not const | param | place == 0


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0550	data | name '__var_intcon_007__' | const | param | place == -100000


Three code: 
Operation is OP_SUB
src1 == 0x809e9d0	int n
src2 == 0x80a0550	int __var_intcon_007__
dest  == 0x80a05a0	data | name '__var_sub_result_008__' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e860	int __fibonacci
src2 == 0x80a05d8	int __function___temp_function_000__
dest  == 0x80a0600	data | name '__var_func_return_009__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0600	data | name '__var_func_return_009__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a0600	int __var_func_return_009__
src2 == 00000000	Nada
dest  == 0x809e9f0	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9d0	data | name 'n' | not const | param | place == 0


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a06a0	data | name '__var_intcon_010__' | const | param | place == -100000


Three code: 
Operation is OP_SUB
src1 == 0x809e9d0	int n
src2 == 0x80a06a0	int __var_intcon_010__
dest  == 0x80a06f0	data | name '__var_sub_result_011__' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e860	int __fibonacci
src2 == 0x80a0728	int __function___temp_function_001__
dest  == 0x80a0750	data | name '__var_func_return_012__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0750	data | name '__var_func_return_012__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a0750	int __var_func_return_012__
src2 == 00000000	Nada
dest  == 0x809ea10	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9f0	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea10	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809e9f0	int a
src2 == 0x809ea10	int b
dest  == 0x80a07f8	data | name '__var_add_result_013__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a07f8	int __var_add_result_013__
src2 == 00000000	Nada
dest  == 0x809ea30	data | name 'sum' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea30	data | name 'sum' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e860	int __fibonacci
src2 == 00000000	Nada
dest  == 0x809ea30	data | name 'sum' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x809ec08	ERROR TYPE __label_post_else_003__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809ea88	ERROR TYPE __label_post_else_001__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e860	int __fibonacci
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_000__:	.word 1

__var_intcon_002__:	.word 1

__var_intcon_003__:	.word 2

__var_intcon_005__:	.word 1

__var_intcon_006__:	.word 0

__var_intcon_007__:	.word 1

__var_intcon_010__:	.word 2

	.text

# OP_ENTER_FUNCTION | __fibonacci | No src2 | No dest
__fibonacci:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_013__' is 4
# stack offset after '__var_func_return_012__' is 8
# stack offset after '__var_sub_result_011__' is 12
# stack offset after '__var_func_return_009__' is 16
# stack offset after '__var_sub_result_008__' is 20
# stack offset after '__var_eq_result_004__' is 21
# stack offset after '__var_eq_result_001__' is 22
# stack offset after 'num' is 28
# stack offset after 'sum' is 32
# stack offset after 'b' is 36
# stack offset after 'a' is 40
# stack offset after final alignment is 40
    la $sp, -40($sp)

# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_EQ | n | __var_intcon_000__ | __var_eq_result_001__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_000__
    seq $t2, $t0, $t1
    sb $t2, 21($sp)

# OP_COND_BRANCH | __var_eq_result_001__ | __label_else_000__ | No dest
    lb $t2, 21($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_LEAVE_FUNCTION | __fibonacci | No src2 | __var_intcon_002__
    lw $t2, __var_intcon_002__
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
# OP_GOTO | __label_post_else_001__ | No src2 | No dest
    j __label_post_else_001__

    nop
# OP_LABEL | __label_else_000__ | No src2 | No dest
__label_else_000__:
# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_EQ | n | __var_intcon_003__ | __var_eq_result_004__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_003__
    seq $t2, $t0, $t1
    sb $t2, 20($sp)

# OP_COND_BRANCH | __var_eq_result_004__ | __label_else_002__ | No dest
    lb $t2, 20($sp)
    beqz $t2, __label_else_002__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_LEAVE_FUNCTION | __fibonacci | No src2 | __var_intcon_005__
    lw $t2, __var_intcon_005__
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
# OP_GOTO | __label_post_else_003__ | No src2 | No dest
    j __label_post_else_003__

    nop
# OP_LABEL | __label_else_002__ | No src2 | No dest
__label_else_002__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_ASSIGN | __var_intcon_006__ | No src2 | sum
    lw $t0, __var_intcon_006__
    sw $t0, 28($sp)

# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_SUB | n | __var_intcon_007__ | __var_sub_result_008__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_007__
    sub $t2, $t0, $t1
    sw $t2, 16($sp)

# OP_CALL_FUNCTION | __fibonacci | __function___temp_function_000__ | __var_func_return_009__
    lw $t2, 16($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __fibonacci
    nop
    la $sp, 4($sp)

    sw $v0, 12($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_009__
# OP_ASSIGN | __var_func_return_009__ | No src2 | a
    lw $t0, 12($sp)
    sw $t0, 36($sp)

# OP_DUMMY | No src1 | No src2 | n
# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_SUB | n | __var_intcon_010__ | __var_sub_result_011__
    lw $t0, 0($fp)
    lw $t1, __var_intcon_010__
    sub $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_CALL_FUNCTION | __fibonacci | __function___temp_function_001__ | __var_func_return_012__
    lw $t2, 8($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __fibonacci
    nop
    la $sp, 4($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_012__
# OP_ASSIGN | __var_func_return_012__ | No src2 | b
    lw $t0, 4($sp)
    sw $t0, 32($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | b
# OP_ADD | a | b | __var_add_result_013__
    lw $t0, 36($sp)
    lw $t1, 32($sp)
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_013__ | No src2 | sum
    lw $t0, 0($sp)
    sw $t0, 28($sp)

# OP_DUMMY | No src1 | No src2 | sum
# OP_LEAVE_FUNCTION | __fibonacci | No src2 | sum
    lw $t2, 28($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
# OP_LABEL | __label_post_else_003__ | No src2 | No dest
__label_post_else_003__:
# OP_LABEL | __label_post_else_001__ | No src2 | No dest
__label_post_else_001__:
# OP_LEAVE_FUNCTION | __fibonacci | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e500	int __main
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a05a0	data | name '__var_intcon_014__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a05a0	int __var_intcon_014__
src2 == 00000000	Nada
dest  == 0x809e9f0	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_GOTO
src1 == 0x80a0600	ERROR TYPE __label_bot_of_while_005__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809e9a8	ERROR TYPE __label_top_of_while_004__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9f0	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a06a0	data | name '__var_intcon_015__' | const | param | place == -100000


Three code: 
Operation is OP_LT
src1 == 0x809e9f0	int i
src2 == 0x80a06a0	int __var_intcon_015__
dest  == 0x80a0550	data | name '__var_lt_result_016__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9f0	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e860	int __fibonacci
src2 == 0x809ea80	int __function___temp_function_002__
dest  == 0x809eaa8	data | name '__var_func_return_017__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eaa8	data | name '__var_func_return_017__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809eaa8	int __var_func_return_017__
src2 == 00000000	Nada
dest  == 0x80a06f0	data | name 'result' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb20	data | name '__array_stringcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809eb90	int __function___temp_function_003__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9f0	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x809ec20	int __function___temp_function_004__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ec70	data | name '__array_stringcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809ece0	int __function___temp_function_005__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a06f0	data | name 'result' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x809ed58	int __function___temp_function_006__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9f0	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1738	data | name '__var_intcon_018__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809e9f0	int i
src2 == 0x80a1738	int __var_intcon_018__
dest  == 0x80a1770	data | name '__var_add_result_019__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a1770	int __var_add_result_019__
src2 == 00000000	Nada
dest  == 0x809e9f0	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x80a0600	ERROR TYPE __label_bot_of_while_005__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x80a0550	bool __var_lt_result_016__
src2 == 0x809e9a8	ERROR TYPE __label_top_of_while_004__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a17f0	data | name '__var_intcon_020__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e500	int __main
src2 == 00000000	Nada
dest  == 0x80a17f0	data | name '__var_intcon_020__' | const | param | place == -100000


	.data

__var_intcon_014__:	.word 1

__var_intcon_015__:	.word 20

__array_stringcon_000__:	.asciiz "\nFibonacci of "

__array_stringcon_001__:	.asciiz " == "

	.align 2

__var_intcon_018__:	.word 1

__var_intcon_020__:	.word 1

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_019__' is 4
# stack offset after '__var_func_return_017__' is 8
# stack offset after '__var_lt_result_016__' is 9
# stack offset after 'result' is 16
# stack offset after 'i' is 20
# stack offset after final alignment is 20
    la $sp, -20($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_014__
# OP_ASSIGN | __var_intcon_014__ | No src2 | i
    lw $t0, __var_intcon_014__
    sw $t0, 16($sp)

# OP_GOTO | __label_bot_of_while_005__ | No src2 | No dest
    j __label_bot_of_while_005__

    nop
# OP_LABEL | __label_top_of_while_004__ | No src2 | No dest
__label_top_of_while_004__:
# OP_DUMMY | No src1 | No src2 | i
# OP_CALL_FUNCTION | __fibonacci | __function___temp_function_002__ | __var_func_return_017__
    lw $t2, 16($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __fibonacci
    nop
    la $sp, 4($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_017__
# OP_ASSIGN | __var_func_return_017__ | No src2 | result
    lw $t0, 4($sp)
    sw $t0, 12($sp)

# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_003__ | No dest
    la $t2, __array_stringcon_000__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | i
# OP_CALL_FUNCTION | print_int | __function___temp_function_004__ | No dest
    lw $t2, 16($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_001__
# OP_CALL_FUNCTION | print_string | __function___temp_function_005__ | No dest
    la $t2, __array_stringcon_001__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | result
# OP_CALL_FUNCTION | print_int | __function___temp_function_006__ | No dest
    lw $t2, 12($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_ADD | i | __var_intcon_018__ | __var_add_result_019__
    lw $t0, 16($sp)
    lw $t1, __var_intcon_018__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_019__ | No src2 | i
    lw $t0, 0($sp)
    sw $t0, 16($sp)

# OP_LABEL | __label_bot_of_while_005__ | No src2 | No dest
__label_bot_of_while_005__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_015__
# OP_LT | i | __var_intcon_015__ | __var_lt_result_016__
    lw $t0, 16($sp)
    lw $t1, __var_intcon_015__
    slt $t2, $t0, $t1
    sb $t2, 8($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_016__ | __label_top_of_while_004__ | No dest
    lb $t2, 8($sp)
    bnez $t2, __label_top_of_while_004__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_020__
# OP_LEAVE_FUNCTION | __main | No src2 | __var_intcon_020__
    lw $t2, __var_intcon_020__
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
