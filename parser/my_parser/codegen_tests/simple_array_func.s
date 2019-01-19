Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e500	void __func
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eaa8	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809eaa8	int __var_intcon_000__
src2 == 00000000	Nada
dest  == 0x809ea58	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_GOTO
src1 == 0x809ea90	ERROR TYPE __label_for_bot_001__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809ea78	ERROR TYPE __label_for_top_000__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809ea90	ERROR TYPE __label_for_bot_001__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea58	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea38	data | name 'i' | not const | param | place == 4


Three code: 
Operation is OP_LT
src1 == 0x809ea58	int index
src2 == 0x809ea38	int i
dest  == 0x809eb88	data | name '__var_lt_result_001__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea58	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebd8	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809ea58	int index
src2 == 0x809ebd8	int __var_intcon_002__
dest  == 0x809ec28	data | name '__var_add_result_003__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809ec28	int __var_add_result_003__
src2 == 00000000	Nada
dest  == 0x809ea58	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea58	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea58	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_TO_ARRAY
src1 == 0x809ea18	char x
src2 == 0x809ea58	int index
dest  == 0x809ea58	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x809eb88	bool __var_lt_result_001__
src2 == 0x809ea78	ERROR TYPE __label_for_top_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e500	void __func
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_000__:	.word 0

__var_intcon_002__:	.word 1

	.text

# OP_ENTER_FUNCTION | __func | No src2 | No dest
__func:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_003__' is 4
# stack offset after '__var_lt_result_001__' is 5
# stack offset after 'index' is 12
# stack offset after final alignment is 12
    la $sp, -12($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | index
    lw $t0, __var_intcon_000__
    sw $t0, 8($sp)

# OP_GOTO | __label_for_bot_001__ | No src2 | No dest
    j __label_for_bot_001__

    nop
# OP_LABEL | __label_for_top_000__ | No src2 | No dest
__label_for_top_000__:
# OP_DUMMY | No src1 | No src2 | index
# OP_DUMMY | No src1 | No src2 | index
# OP_ASSIGN_TO_ARRAY | x | index | index
    lw  $t0, 0($fp)
    lb $t1, 8($sp)

    lw $t3, 8($sp)
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | index
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ADD | index | __var_intcon_002__ | __var_add_result_003__
    lw $t0, 8($sp)
    lw $t1, __var_intcon_002__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_003__ | No src2 | index
    lw $t0, 0($sp)
    sw $t0, 8($sp)

# OP_LABEL | __label_for_bot_001__ | No src2 | No dest
__label_for_bot_001__:
# OP_DUMMY | No src1 | No src2 | index
# OP_DUMMY | No src1 | No src2 | i
# OP_LT | index | i | __var_lt_result_001__
    lw $t0, 8($sp)
    lw $t1, 4($fp)
    slt $t2, $t0, $t1
    sb $t2, 4($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_001__ | __label_for_top_000__ | No dest
    lb $t2, 4($sp)
    bnez $t2, __label_for_top_000__

    nop
# OP_LEAVE_FUNCTION | __func | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e850	void __print_array
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eaa8	data | name '__array_stringcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809eac8	void __function___temp_function_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb88	data | name 'i' | not const | param | place == 4


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x809eb28	void __function___temp_function_001__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0878	data | name '__array_stringcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a08d8	void __function___temp_function_002__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a13c0	data | name '__var_intcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a13c0	int __var_intcon_004__
src2 == 00000000	Nada
dest  == 0x809ebd8	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_GOTO
src1 == 0x80a13a8	ERROR TYPE __label_for_bot_003__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a0928	ERROR TYPE __label_for_top_002__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a13a8	ERROR TYPE __label_for_bot_003__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebd8	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb88	data | name 'i' | not const | param | place == 4


Three code: 
Operation is OP_LT
src1 == 0x809ebd8	int index
src2 == 0x809eb88	int i
dest  == 0x809ebf8	data | name '__var_lt_result_005__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebd8	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ec48	data | name '__var_intcon_006__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809ebd8	int index
src2 == 0x809ec48	int __var_intcon_006__
dest  == 0x809ec98	data | name '__var_add_result_007__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809ec98	int __var_add_result_007__
src2 == 00000000	Nada
dest  == 0x809ebd8	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebd8	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x809ed10	void __function___temp_function_003__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ed60	data | name '__array_stringcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809edd0	void __function___temp_function_004__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebd8	data | name 'index' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0658	data | name '__var_array_entry_008__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809ea38	char x
src2 == 0x809ebd8	int index
dest  == 0x80a0658	data | name '__var_array_entry_008__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0658	data | name '__var_array_entry_008__' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x809ee68	void __function___temp_function_005__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eeb8	data | name '__array_stringcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a06b8	void __function___temp_function_006__
dest  == 00000000	Nada

Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x809ebf8	bool __var_lt_result_005__
src2 == 0x80a0928	ERROR TYPE __label_for_top_002__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0720	data | name '__array_stringcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a0790	void __function___temp_function_007__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e850	void __print_array
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__array_stringcon_000__:	.asciiz "\nArray has "

__array_stringcon_001__:	.asciiz " elements\n"

	.align 2

__var_intcon_004__:	.word 0

__var_intcon_006__:	.word 1

__array_stringcon_002__:	.asciiz " == "

__array_stringcon_003__:	.asciiz "\n"

__array_stringcon_004__:	.asciiz "print_array complete\n"

	.text

# OP_ENTER_FUNCTION | __print_array | No src2 | No dest
__print_array:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_008__' is 1
# stack offset after '__var_add_result_007__' is 8
# stack offset after '__var_lt_result_005__' is 9
# stack offset after 'index' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_000__ | No dest
    la $t2, __array_stringcon_000__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | i
# OP_CALL_FUNCTION | print_int | __function___temp_function_001__ | No dest
    lw $t2, 4($fp)
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
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ASSIGN | __var_intcon_004__ | No src2 | index
    lw $t0, __var_intcon_004__
    sw $t0, 12($sp)

# OP_GOTO | __label_for_bot_003__ | No src2 | No dest
    j __label_for_bot_003__

    nop
# OP_LABEL | __label_for_top_002__ | No src2 | No dest
__label_for_top_002__:
# OP_DUMMY | No src1 | No src2 | index
# OP_CALL_FUNCTION | print_int | __function___temp_function_003__ | No dest
    lw $t2, 12($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_002__
# OP_CALL_FUNCTION | print_string | __function___temp_function_004__ | No dest
    la $t2, __array_stringcon_002__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | index
# OP_DUMMY | No src1 | No src2 | __var_array_entry_008__
# OP_ASSIGN_FROM_ARRAY | x | index | __var_array_entry_008__
    lw $t0, 0($fp)
    lw $t1, 12($sp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_008__
# OP_CALL_FUNCTION | print_int | __function___temp_function_005__ | No dest
    lb $t2, 0($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_003__
# OP_CALL_FUNCTION | print_string | __function___temp_function_006__ | No dest
    la $t2, __array_stringcon_003__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | index
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_ADD | index | __var_intcon_006__ | __var_add_result_007__
    lw $t0, 12($sp)
    lw $t1, __var_intcon_006__
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_add_result_007__ | No src2 | index
    lw $t0, 4($sp)
    sw $t0, 12($sp)

# OP_LABEL | __label_for_bot_003__ | No src2 | No dest
__label_for_bot_003__:
# OP_DUMMY | No src1 | No src2 | index
# OP_DUMMY | No src1 | No src2 | i
# OP_LT | index | i | __var_lt_result_005__
    lw $t0, 12($sp)
    lw $t1, 4($fp)
    slt $t2, $t0, $t1
    sb $t2, 8($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_005__ | __label_for_top_002__ | No dest
    lb $t2, 8($sp)
    bnez $t2, __label_for_top_002__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_004__
# OP_CALL_FUNCTION | print_string | __function___temp_function_007__ | No dest
    la $t2, __array_stringcon_004__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_LEAVE_FUNCTION | __print_array | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e8d8	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0720	data | name '__array_stringcon_005__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809ee20	void __function___temp_function_008__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eeb8	data | name '__var_intcon_009__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809eeb8	int __var_intcon_009__
src2 == 00000000	Nada
dest  == 0x809ea38	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_GOTO
src1 == 0x80a0900	ERROR TYPE __label_for_bot_005__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809ed38	ERROR TYPE __label_for_top_004__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a0900	ERROR TYPE __label_for_bot_005__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea38	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea90	data | name '__var_intcon_010__' | const | param | place == -100000


Three code: 
Operation is OP_LT
src1 == 0x809ea38	int i
src2 == 0x809ea90	int __var_intcon_010__
dest  == 0x80a0668	data | name '__var_lt_result_011__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea38	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ed78	data | name '__var_intcon_012__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809ea38	int i
src2 == 0x809ed78	int __var_intcon_012__
dest  == 0x80a07d0	data | name '__var_add_result_013__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a07d0	int __var_add_result_013__
src2 == 00000000	Nada
dest  == 0x809ea38	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea38	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a13c0	data | name '__var_intcon_014__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN_TO_ARRAY
src1 == 0x80a0928	char p3
src2 == 0x809ea38	int i
dest  == 0x80a13c0	data | name '__var_intcon_014__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea38	data | name 'i' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1428	data | name '__var_array_entry_015__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x80a0928	char p3
src2 == 0x809ea38	int i
dest  == 0x80a1428	data | name '__var_array_entry_015__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1428	data | name '__var_array_entry_015__' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x809eb78	void __function___temp_function_009__
dest  == 00000000	Nada

Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x80a0668	bool __var_lt_result_011__
src2 == 0x809ed38	ERROR TYPE __label_for_top_004__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0928	data | name 'p3' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebf8	data | name '__var_intcon_016__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e850	void __print_array
src2 == 0x809ec48	void __function___temp_function_010__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0928	data | name 'p3' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ecc0	data | name '__var_intcon_017__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e500	void __func
src2 == 0x80a14d8	void __function___temp_function_011__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0928	data | name 'p3' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1550	data | name '__var_intcon_018__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e850	void __print_array
src2 == 0x80a15a0	void __function___temp_function_012__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a15f0	data | name '__array_stringcon_006__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a1660	void __function___temp_function_013__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e8d8	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__array_stringcon_005__:	.asciiz "\nSTART\n"

__var_intcon_009__:	.word 0

__var_intcon_010__:	.word 10

__var_intcon_012__:	.word 1

__var_intcon_014__:	.word 0

__var_intcon_016__:	.word 10

__var_intcon_017__:	.word 10

__var_intcon_018__:	.word 10

__array_stringcon_006__:	.asciiz "\nDONE\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_015__' is 1
# stack offset after '__var_add_result_013__' is 8
# stack offset after '__var_lt_result_011__' is 9
# stack offset after 'i' is 16
# stack offset after 'p3' is 26
# stack offset after final alignment is 28
    la $sp, -28($sp)

# OP_DUMMY | No src1 | No src2 | __array_stringcon_005__
# OP_CALL_FUNCTION | print_string | __function___temp_function_008__ | No dest
    la $t2, __array_stringcon_005__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_ASSIGN | __var_intcon_009__ | No src2 | i
    lw $t0, __var_intcon_009__
    sw $t0, 12($sp)

# OP_GOTO | __label_for_bot_005__ | No src2 | No dest
    j __label_for_bot_005__

    nop
# OP_LABEL | __label_for_top_004__ | No src2 | No dest
__label_for_top_004__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_014__
# OP_ASSIGN_TO_ARRAY | p3 | i | __var_intcon_014__
    la  $t0, 16($sp)
    lb $t1, __var_intcon_014__
    lw $t3, 12($sp)
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_array_entry_015__
# OP_ASSIGN_FROM_ARRAY | p3 | i | __var_array_entry_015__
    la $t0, 16($sp)
    lw $t1, 12($sp)
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_015__
# OP_CALL_FUNCTION | print_int | __function___temp_function_009__ | No dest
    lb $t2, 0($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_012__
# OP_ADD | i | __var_intcon_012__ | __var_add_result_013__
    lw $t0, 12($sp)
    lw $t1, __var_intcon_012__
    add $t2, $t0, $t1
    sw $t2, 4($sp)

# OP_ASSIGN | __var_add_result_013__ | No src2 | i
    lw $t0, 4($sp)
    sw $t0, 12($sp)

# OP_LABEL | __label_for_bot_005__ | No src2 | No dest
__label_for_bot_005__:
# OP_DUMMY | No src1 | No src2 | i
# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_LT | i | __var_intcon_010__ | __var_lt_result_011__
    lw $t0, 12($sp)
    lw $t1, __var_intcon_010__
    slt $t2, $t0, $t1
    sb $t2, 8($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_011__ | __label_for_top_004__ | No dest
    lb $t2, 8($sp)
    bnez $t2, __label_for_top_004__

    nop
# OP_DUMMY | No src1 | No src2 | p3
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_CALL_FUNCTION | __print_array | __function___temp_function_010__ | No dest
    lw $t2, __var_intcon_016__
    sw $t2, -4($sp)
    la $t2, 16($sp)
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __print_array
    nop
    la $sp, 8($sp)
# OP_DUMMY | No src1 | No src2 | p3
# OP_DUMMY | No src1 | No src2 | __var_intcon_017__
# OP_CALL_FUNCTION | __func | __function___temp_function_011__ | No dest
    lw $t2, __var_intcon_017__
    sw $t2, -4($sp)
    la $t2, 16($sp)
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __func
    nop
    la $sp, 8($sp)
# OP_DUMMY | No src1 | No src2 | p3
# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_CALL_FUNCTION | __print_array | __function___temp_function_012__ | No dest
    lw $t2, __var_intcon_018__
    sw $t2, -4($sp)
    la $t2, 16($sp)
    sw $t2, -8($sp)
    la $sp, -8($sp)

    jal __print_array
    nop
    la $sp, 8($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_006__
# OP_CALL_FUNCTION | print_string | __function___temp_function_013__ | No dest
    la $t2, __array_stringcon_006__
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
