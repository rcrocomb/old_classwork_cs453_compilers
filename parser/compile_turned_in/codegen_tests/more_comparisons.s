Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e808	int __increment
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name '__g' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809e8c0	int __g
src2 == 0x809e8f8	int __var_intcon_000__
dest  == 0x809e948	data | name '__var_add_result_001__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e948	int __var_add_result_001__
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name '__g' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e998	data | name '__g' | not const | global | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e808	int __increment
src2 == 00000000	Nada
dest  == 0x809e998	data | name '__g' | not const | global | place == -100000


	.data

__g:	.space 4

__var_intcon_000__:	.word 1

	.text

# OP_ENTER_FUNCTION | __increment | No src2 | No dest
__increment:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_001__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __g
# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ADD | __g | __var_intcon_000__ | __var_add_result_001__
    lw $t0, __g
    lw $t1, __var_intcon_000__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_001__ | No src2 | __g
    lw $t0, 0($sp)
    sw $t0, __g
# OP_DUMMY | No src1 | No src2 | __g
# OP_LEAVE_FUNCTION | __increment | No src2 | __g
    lw $t2, __g
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809ebc0	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ec30	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809ec30	int __var_intcon_002__
src2 == 00000000	Nada
dest  == 0x809e500	data | name '__g' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e968	data | name '__var_intcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e968	int __var_intcon_003__
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ec80	data | name '__var_charcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809ec80	char __var_charcon_004__
src2 == 00000000	Nada
dest  == 0x809e948	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ed00	data | name '__var_intcon_005__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809ed00	int __var_intcon_005__
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e948	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x809e8f8	int a
src2 == 0x809e948	int b
dest  == 0x809edc8	data | name '__var_eq_result_006__' | not const | local | place == -100000


Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x809edc8	bool __var_eq_result_006__
src2 == 0x809ee00	ERROR TYPE __label_or_circuit_002__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e948	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ee48	data | name '__var_charcon_007__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x809e948	int b
src2 == 0x809ee48	char __var_charcon_007__
dest  == 0x809ee98	data | name '__var_eq_result_008__' | not const | local | place == -100000


Three code: 
Operation is OP_OR
src1 == 0x809edc8	bool __var_eq_result_006__
src2 == 0x809ee98	bool __var_eq_result_008__
dest  == 0x809e9b8	data | name '__var_or_result_009__' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x809ee00	ERROR TYPE __label_or_circuit_002__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_COND_BRANCH
src1 == 0x809e9b8	bool __var_or_result_009__
src2 == 0x809ed68	ERROR TYPE __label_else_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea38	data | name '__array_stringcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809ea98	void __function___temp_function_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_GOTO
src1 == 0x809ed80	ERROR TYPE __label_post_else_001__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809ed68	ERROR TYPE __label_else_000__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb60	data | name '__var_charcon_010__' | const | param | place == -100000


Three code: 
Operation is OP_NE
src1 == 0x809e8f8	int a
src2 == 0x809eb60	char __var_charcon_010__
dest  == 0x80a0b68	data | name '__var_ne_result_011__' | not const | local | place == -100000


Three code: 
Operation is OP_NOT
src1 == 0x80a0b68	bool __var_ne_result_011__
src2 == 00000000	Nada
dest  == 0x80a0ba0	data | name '__var_negate_012__' | not const | local | place == -100000


Three code: 
Operation is OP_COND_BRANCH
src1 == 0x80a0ba0	bool __var_negate_012__
src2 == 0x809eb18	ERROR TYPE __label_else_003__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0bf0	data | name '__array_stringcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a0c50	void __function___temp_function_001__
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809eb18	ERROR TYPE __label_else_003__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809ed80	ERROR TYPE __label_post_else_001__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e948	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x809e8f8	int a
src2 == 0x809e948	int b
dest  == 0x80a0d30	data | name '__var_eq_result_013__' | not const | local | place == -100000


Three code: 
Operation is OP_COND_BRANCH
src1 == 0x80a0d30	bool __var_eq_result_013__
src2 == 0x80a0d68	ERROR TYPE __label_and_circuit_007__
dest  == 00000000	Nada

Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e808	int __increment
src2 == 0x80a0d98	void __function___temp_function_002__
dest  == 0x80a0dd0	data | name '__var_func_return_014__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0dd0	data | name '__var_func_return_014__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0e30	data | name '__var_intcon_015__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80a0dd0	int __var_func_return_014__
src2 == 0x80a0e30	int __var_intcon_015__
dest  == 0x80a0e80	data | name '__var_eq_result_016__' | not const | local | place == -100000


Three code: 
Operation is OP_AND
src1 == 0x80a0d30	bool __var_eq_result_013__
src2 == 0x80a0e80	bool __var_eq_result_016__
dest  == 0x80a0eb8	data | name '__var_and_result_017__' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x80a0d68	ERROR TYPE __label_and_circuit_007__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_COND_BRANCH
src1 == 0x80a0eb8	bool __var_and_result_017__
src2 == 0x80a0cd0	ERROR TYPE __label_else_005__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0f38	data | name '__array_stringcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a0fa8	void __function___temp_function_003__
dest  == 00000000	Nada

Three code: 
Operation is OP_GOTO
src1 == 0x80a0ce8	ERROR TYPE __label_post_else_006__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a0cd0	ERROR TYPE __label_else_005__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1058	data | name '__var_intcon_018__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a10a8	data | name '__var_intcon_019__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80a1058	int __var_intcon_018__
src2 == 0x80a10a8	int __var_intcon_019__
dest  == 0x80a10f8	data | name '__var_eq_result_020__' | not const | local | place == -100000


Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x80a10f8	bool __var_eq_result_020__
src2 == 0x80a1130	ERROR TYPE __label_or_circuit_010__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1160	data | name '__var_intcon_021__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a11b0	data | name '__var_intcon_022__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80a1160	int __var_intcon_021__
src2 == 0x80a11b0	int __var_intcon_022__
dest  == 0x80a1200	data | name '__var_eq_result_023__' | not const | local | place == -100000


Three code: 
Operation is OP_OR
src1 == 0x80a10f8	bool __var_eq_result_020__
src2 == 0x80a1200	bool __var_eq_result_023__
dest  == 0x80a1238	data | name '__var_or_result_024__' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x80a1130	ERROR TYPE __label_or_circuit_010__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x80a1238	bool __var_or_result_024__
src2 == 0x80a12a0	ERROR TYPE __label_or_circuit_011__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_LT
src1 == 0x809e8f8	int a
src2 == 0x809e8c0	int c
dest  == 0x80a1300	data | name '__var_lt_result_025__' | not const | local | place == -100000


Three code: 
Operation is OP_OR
src1 == 0x80a1238	bool __var_or_result_024__
src2 == 0x80a1300	bool __var_lt_result_025__
dest  == 0x80a1338	data | name '__var_or_result_026__' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x80a12a0	ERROR TYPE __label_or_circuit_011__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_COND_BRANCH
src1 == 0x80a1338	bool __var_or_result_026__
src2 == 0x80a1028	ERROR TYPE __label_else_008__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a13b8	data | name '__array_stringcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a1428	void __function___temp_function_004__
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a1028	ERROR TYPE __label_else_008__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a0ce8	ERROR TYPE __label_post_else_006__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a14a8	data | name '__var_intcon_027__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a14a8	int __var_intcon_027__
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_GOTO
src1 == 0x80a1528	ERROR TYPE __label_for_bot_013__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a1510	ERROR TYPE __label_for_top_012__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a1528	ERROR TYPE __label_for_bot_013__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a15a0	data | name '__var_intcon_028__' | const | param | place == -100000


Three code: 
Operation is OP_LT
src1 == 0x809e8f8	int a
src2 == 0x80a15a0	int __var_intcon_028__
dest  == 0x80a15f0	data | name '__var_lt_result_029__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1640	data | name '__var_intcon_030__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809e8f8	int a
src2 == 0x80a1640	int __var_intcon_030__
dest  == 0x80a1690	data | name '__var_add_result_031__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a1690	int __var_add_result_031__
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a16e0	data | name '__var_intcon_032__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a16e0	int __var_intcon_032__
src2 == 00000000	Nada
dest  == 0x809e948	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1748	data | name '__array_stringcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a17b8	void __function___temp_function_005__
dest  == 00000000	Nada

Three code: 
Operation is OP_GOTO
src1 == 0x80a1820	ERROR TYPE __label_bot_of_while_015__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a1808	ERROR TYPE __label_top_of_while_014__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e948	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1880	data | name '__var_intcon_033__' | const | param | place == -100000


Three code: 
Operation is OP_LT
src1 == 0x809e948	int b
src2 == 0x80a1880	int __var_intcon_033__
dest  == 0x80a18d0	data | name '__var_lt_result_034__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e948	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80a1a38	void __function___temp_function_006__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1a88	data | name '__array_stringcon_005__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a1af8	void __function___temp_function_007__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e948	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1b60	data | name '__var_intcon_035__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809e948	int b
src2 == 0x80a1b60	int __var_intcon_035__
dest  == 0x80a9d20	data | name '__var_add_result_036__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a9d20	int __var_add_result_036__
src2 == 00000000	Nada
dest  == 0x809e948	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x80a1820	ERROR TYPE __label_bot_of_while_015__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x80a18d0	bool __var_lt_result_034__
src2 == 0x80a1808	ERROR TYPE __label_top_of_while_014__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a9da0	data | name '__array_stringcon_006__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a9e10	void __function___temp_function_008__
dest  == 00000000	Nada

Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x80a15f0	bool __var_lt_result_029__
src2 == 0x80a1510	ERROR TYPE __label_for_top_012__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a9e78	data | name '__array_stringcon_007__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a9ee8	void __function___temp_function_009__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809ebc0	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_002__:	.word 0

__var_intcon_003__:	.word 1

__var_charcon_004__:	.byte 'a'

	.align 2

__var_intcon_005__:	.word 2

__var_charcon_007__:	.byte 'a'

__array_stringcon_000__:	.asciiz "PASSED\n"

__var_charcon_010__:	.byte 'a'

__array_stringcon_001__:	.asciiz "FAILED\n"

__var_intcon_015__:	.word 1

__array_stringcon_002__:	.asciiz "FAILED\n"

	.align 2

__var_intcon_018__:	.word 1

__var_intcon_019__:	.word 2

__var_intcon_021__:	.word 1

__var_intcon_022__:	.word 3

__array_stringcon_003__:	.asciiz "PASSED\n"

	.align 2

__var_intcon_027__:	.word 0

__var_intcon_028__:	.word 10

__var_intcon_030__:	.word 2

__var_intcon_032__:	.word 0

__array_stringcon_004__:	.asciiz " b == "

	.align 2

__var_intcon_033__:	.word 5

__array_stringcon_005__:	.asciiz " "

__var_intcon_035__:	.word 1

__array_stringcon_006__:	.asciiz "\n"

__array_stringcon_007__:	.asciiz "\nDONE\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_036__' is 4
# stack offset after '__var_lt_result_034__' is 5
# stack offset after '__var_add_result_031__' is 12
# stack offset after '__var_lt_result_029__' is 13
# stack offset after '__var_or_result_026__' is 14
# stack offset after '__var_lt_result_025__' is 15
# stack offset after '__var_or_result_024__' is 16
# stack offset after '__var_eq_result_023__' is 17
# stack offset after '__var_eq_result_020__' is 18
# stack offset after '__var_and_result_017__' is 19
# stack offset after '__var_eq_result_016__' is 20
# stack offset after '__var_func_return_014__' is 24
# stack offset after '__var_eq_result_013__' is 25
# stack offset after '__var_negate_012__' is 26
# stack offset after '__var_ne_result_011__' is 27
# stack offset after '__var_or_result_009__' is 28
# stack offset after '__var_eq_result_008__' is 29
# stack offset after '__var_eq_result_006__' is 30
# stack offset after 'd' is 36
# stack offset after 'c' is 40
# stack offset after 'b' is 44
# stack offset after 'a' is 48
# stack offset after final alignment is 48
    la $sp, -48($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | __g
    lw $t0, __var_intcon_002__
    sw $t0, __g
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ASSIGN | __var_intcon_003__ | No src2 | a
    lw $t0, __var_intcon_003__
    sw $t0, 44($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_004__
# OP_ASSIGN | __var_charcon_004__ | No src2 | b
    lb $t0, __var_charcon_004__
    sw $t0, 40($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ASSIGN | __var_intcon_005__ | No src2 | c
    lw $t0, __var_intcon_005__
    sw $t0, 36($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | b
# OP_EQ | a | b | __var_eq_result_006__
    lw $t0, 44($sp)
    lw $t1, 40($sp)
    seq $t2, $t0, $t1
    sb $t2, 29($sp)

# OP_ASSIGN | __var_eq_result_006__ | No src2 | __var_or_result_009__
    lb $t0, 29($sp)
    sb $t0, 27($sp)

# OP_FALSE_COND_BRANCH | __var_eq_result_006__ | __label_or_circuit_002__ | No dest
    lb $t2, 29($sp)
    bnez $t2, __label_or_circuit_002__

    nop
# OP_DUMMY | No src1 | No src2 | b
# OP_DUMMY | No src1 | No src2 | __var_charcon_007__
# OP_EQ | b | __var_charcon_007__ | __var_eq_result_008__
    lw $t0, 40($sp)
    lb $t1, __var_charcon_007__
    seq $t2, $t0, $t1
    sb $t2, 28($sp)

# OP_OR | __var_eq_result_006__ | __var_eq_result_008__ | __var_or_result_009__
    lb $t0, 29($sp)
    lb $t1, 28($sp)
    or $t2, $t0, $t1
    sb $t2, 27($sp)

# OP_LABEL | __label_or_circuit_002__ | No src2 | No dest
__label_or_circuit_002__:
# OP_COND_BRANCH | __var_or_result_009__ | __label_else_000__ | No dest
    lb $t2, 27($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_000__ | No dest
    la $t2, __array_stringcon_000__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_GOTO | __label_post_else_001__ | No src2 | No dest
    j __label_post_else_001__

    nop
# OP_LABEL | __label_else_000__ | No src2 | No dest
__label_else_000__:
# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | __var_charcon_010__
# OP_NE | a | __var_charcon_010__ | __var_ne_result_011__
    lw $t0, 44($sp)
    lb $t1, __var_charcon_010__
    sne $t2, $t0, $t1
    sb $t2, 26($sp)

# OP_NOT | __var_ne_result_011__ | No src2 | __var_negate_012__
    lb $t0, 26($sp)
    li $t1, 1
    sub $t2, $t1, $t0
    sb $t2, 25($sp)

# OP_COND_BRANCH | __var_negate_012__ | __label_else_003__ | No dest
    lb $t2, 25($sp)
    beqz $t2, __label_else_003__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_001__
# OP_CALL_FUNCTION | print_string | __function___temp_function_001__ | No dest
    la $t2, __array_stringcon_001__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_LABEL | __label_else_003__ | No src2 | No dest
__label_else_003__:
# OP_LABEL | __label_post_else_001__ | No src2 | No dest
__label_post_else_001__:
# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | b
# OP_EQ | a | b | __var_eq_result_013__
    lw $t0, 44($sp)
    lw $t1, 40($sp)
    seq $t2, $t0, $t1
    sb $t2, 24($sp)

# OP_ASSIGN | __var_eq_result_013__ | No src2 | __var_and_result_017__
    lb $t0, 24($sp)
    sb $t0, 18($sp)

# OP_COND_BRANCH | __var_eq_result_013__ | __label_and_circuit_007__ | No dest
    lb $t2, 24($sp)
    beqz $t2, __label_and_circuit_007__

    nop
# OP_CALL_FUNCTION | __increment | __function___temp_function_002__ | __var_func_return_014__

    jal __increment
    nop
    la $sp, 0($sp)

    sw $v0, 20($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_014__
# OP_DUMMY | No src1 | No src2 | __var_intcon_015__
# OP_EQ | __var_func_return_014__ | __var_intcon_015__ | __var_eq_result_016__
    lw $t0, 20($sp)
    lw $t1, __var_intcon_015__
    seq $t2, $t0, $t1
    sb $t2, 19($sp)

# OP_AND | __var_eq_result_013__ | __var_eq_result_016__ | __var_and_result_017__
    lb $t0, 24($sp)
    lb $t1, 19($sp)
    and $t2, $t0, $t1
    sb $t2, 18($sp)

# OP_LABEL | __label_and_circuit_007__ | No src2 | No dest
__label_and_circuit_007__:
# OP_COND_BRANCH | __var_and_result_017__ | __label_else_005__ | No dest
    lb $t2, 18($sp)
    beqz $t2, __label_else_005__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_002__
# OP_CALL_FUNCTION | print_string | __function___temp_function_003__ | No dest
    la $t2, __array_stringcon_002__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_GOTO | __label_post_else_006__ | No src2 | No dest
    j __label_post_else_006__

    nop
# OP_LABEL | __label_else_005__ | No src2 | No dest
__label_else_005__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_DUMMY | No src1 | No src2 | __var_intcon_019__
# OP_EQ | __var_intcon_018__ | __var_intcon_019__ | __var_eq_result_020__
    lw $t0, __var_intcon_018__
    lw $t1, __var_intcon_019__
    seq $t2, $t0, $t1
    sb $t2, 17($sp)

# OP_ASSIGN | __var_eq_result_020__ | No src2 | __var_or_result_024__
    lb $t0, 17($sp)
    sb $t0, 15($sp)

# OP_FALSE_COND_BRANCH | __var_eq_result_020__ | __label_or_circuit_010__ | No dest
    lb $t2, 17($sp)
    bnez $t2, __label_or_circuit_010__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_021__
# OP_DUMMY | No src1 | No src2 | __var_intcon_022__
# OP_EQ | __var_intcon_021__ | __var_intcon_022__ | __var_eq_result_023__
    lw $t0, __var_intcon_021__
    lw $t1, __var_intcon_022__
    seq $t2, $t0, $t1
    sb $t2, 16($sp)

# OP_OR | __var_eq_result_020__ | __var_eq_result_023__ | __var_or_result_024__
    lb $t0, 17($sp)
    lb $t1, 16($sp)
    or $t2, $t0, $t1
    sb $t2, 15($sp)

# OP_LABEL | __label_or_circuit_010__ | No src2 | No dest
__label_or_circuit_010__:
# OP_ASSIGN | __var_or_result_024__ | No src2 | __var_or_result_026__
    lb $t0, 15($sp)
    sb $t0, 13($sp)

# OP_FALSE_COND_BRANCH | __var_or_result_024__ | __label_or_circuit_011__ | No dest
    lb $t2, 15($sp)
    bnez $t2, __label_or_circuit_011__

    nop
# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | c
# OP_LT | a | c | __var_lt_result_025__
    lw $t0, 44($sp)
    lw $t1, 36($sp)
    slt $t2, $t0, $t1
    sb $t2, 14($sp)

# OP_OR | __var_or_result_024__ | __var_lt_result_025__ | __var_or_result_026__
    lb $t0, 15($sp)
    lb $t1, 14($sp)
    or $t2, $t0, $t1
    sb $t2, 13($sp)

# OP_LABEL | __label_or_circuit_011__ | No src2 | No dest
__label_or_circuit_011__:
# OP_COND_BRANCH | __var_or_result_026__ | __label_else_008__ | No dest
    lb $t2, 13($sp)
    beqz $t2, __label_else_008__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_003__
# OP_CALL_FUNCTION | print_string | __function___temp_function_004__ | No dest
    la $t2, __array_stringcon_003__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_LABEL | __label_else_008__ | No src2 | No dest
__label_else_008__:
# OP_LABEL | __label_post_else_006__ | No src2 | No dest
__label_post_else_006__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_027__
# OP_ASSIGN | __var_intcon_027__ | No src2 | a
    lw $t0, __var_intcon_027__
    sw $t0, 44($sp)

# OP_GOTO | __label_for_bot_013__ | No src2 | No dest
    j __label_for_bot_013__

    nop
# OP_LABEL | __label_for_top_012__ | No src2 | No dest
__label_for_top_012__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_032__
# OP_ASSIGN | __var_intcon_032__ | No src2 | b
    lw $t0, __var_intcon_032__
    sw $t0, 40($sp)

# OP_DUMMY | No src1 | No src2 | __array_stringcon_004__
# OP_CALL_FUNCTION | print_string | __function___temp_function_005__ | No dest
    la $t2, __array_stringcon_004__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_GOTO | __label_bot_of_while_015__ | No src2 | No dest
    j __label_bot_of_while_015__

    nop
# OP_LABEL | __label_top_of_while_014__ | No src2 | No dest
__label_top_of_while_014__:
# OP_DUMMY | No src1 | No src2 | b
# OP_CALL_FUNCTION | print_int | __function___temp_function_006__ | No dest
    lw $t2, 40($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_005__
# OP_CALL_FUNCTION | print_string | __function___temp_function_007__ | No dest
    la $t2, __array_stringcon_005__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | b
# OP_DUMMY | No src1 | No src2 | __var_intcon_035__
# OP_ADD | b | __var_intcon_035__ | __var_add_result_036__
    lw $t0, 40($sp)
    lw $t1, __var_intcon_035__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_036__ | No src2 | b
    lw $t0, 0($sp)
    sw $t0, 40($sp)

# OP_LABEL | __label_bot_of_while_015__ | No src2 | No dest
__label_bot_of_while_015__:
# OP_DUMMY | No src1 | No src2 | b
# OP_DUMMY | No src1 | No src2 | __var_intcon_033__
# OP_LT | b | __var_intcon_033__ | __var_lt_result_034__
    lw $t0, 40($sp)
    lw $t1, __var_intcon_033__
    slt $t2, $t0, $t1
    sb $t2, 4($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_034__ | __label_top_of_while_014__ | No dest
    lb $t2, 4($sp)
    bnez $t2, __label_top_of_while_014__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_006__
# OP_CALL_FUNCTION | print_string | __function___temp_function_008__ | No dest
    la $t2, __array_stringcon_006__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | __var_intcon_030__
# OP_ADD | a | __var_intcon_030__ | __var_add_result_031__
    lw $t0, 44($sp)
    lw $t1, __var_intcon_030__
    add $t2, $t0, $t1
    sw $t2, 8($sp)

# OP_ASSIGN | __var_add_result_031__ | No src2 | a
    lw $t0, 8($sp)
    sw $t0, 44($sp)

# OP_LABEL | __label_for_bot_013__ | No src2 | No dest
__label_for_bot_013__:
# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | __var_intcon_028__
# OP_LT | a | __var_intcon_028__ | __var_lt_result_029__
    lw $t0, 44($sp)
    lw $t1, __var_intcon_028__
    slt $t2, $t0, $t1
    sb $t2, 12($sp)

# OP_FALSE_COND_BRANCH | __var_lt_result_029__ | __label_for_top_012__ | No dest
    lb $t2, 12($sp)
    bnez $t2, __label_for_top_012__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_007__
# OP_CALL_FUNCTION | print_string | __function___temp_function_009__ | No dest
    la $t2, __array_stringcon_007__
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
