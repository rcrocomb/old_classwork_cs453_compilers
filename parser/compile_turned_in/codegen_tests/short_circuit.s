Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e808	int __increment
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809e8c0	int __i
src2 == 0x809e8f8	int __var_intcon_000__
dest  == 0x809e948	data | name '__var_add_result_001__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e948	int __var_add_result_001__
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e998	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e808	int __increment
src2 == 00000000	Nada
dest  == 0x809e998	data | name '__i' | not const | global | place == -100000


	.data

__i:	.space 4

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

# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ADD | __i | __var_intcon_000__ | __var_add_result_001__
    lw $t0, __i
    lw $t1, __var_intcon_000__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_ASSIGN | __var_add_result_001__ | No src2 | __i
    lw $t0, 0($sp)
    sw $t0, __i
# OP_DUMMY | No src1 | No src2 | __i
# OP_LEAVE_FUNCTION | __increment | No src2 | __i
    lw $t2, __i
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
dest  == 0x809e8f8	data | name '__array_stringcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809e8c0	void __function___temp_function_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e948	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e948	int __var_intcon_002__
src2 == 00000000	Nada
dest  == 0x809e500	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ed30	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ed68	data | name '__var_intcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x809ed30	int __i
src2 == 0x809ed68	int __var_intcon_003__
dest  == 0x809edb8	data | name '__var_eq_result_004__' | not const | local | place == -100000


Three code: 
Operation is OP_COND_BRANCH
src1 == 0x809edb8	bool __var_eq_result_004__
src2 == 0x809edf0	ERROR TYPE __label_and_circuit_002__
dest  == 00000000	Nada

Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e808	int __increment
src2 == 0x809ee20	void __function___temp_function_001__
dest  == 0x809ee58	data | name '__var_func_return_005__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ee58	data | name '__var_func_return_005__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eeb8	data | name '__var_intcon_006__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x809ee58	int __var_func_return_005__
src2 == 0x809eeb8	int __var_intcon_006__
dest  == 0x809e9e8	data | name '__var_eq_result_007__' | not const | local | place == -100000


Three code: 
Operation is OP_AND
src1 == 0x809edb8	bool __var_eq_result_004__
src2 == 0x809e9e8	bool __var_eq_result_007__
dest  == 0x809ea20	data | name '__var_and_result_008__' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x809edf0	ERROR TYPE __label_and_circuit_002__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_COND_BRANCH
src1 == 0x809ea20	bool __var_and_result_008__
src2 == 0x809ed00	ERROR TYPE __label_else_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eaa0	data | name '__array_stringcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809eb10	void __function___temp_function_002__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb60	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80a0b68	void __function___temp_function_003__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0bc8	data | name '__array_stringcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809eb98	void __function___temp_function_004__
dest  == 00000000	Nada

Three code: 
Operation is OP_GOTO
src1 == 0x809ed18	ERROR TYPE __label_post_else_001__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809ed00	ERROR TYPE __label_else_000__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0c90	data | name '__array_stringcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a0d00	void __function___temp_function_005__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0d50	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80a0d98	void __function___temp_function_006__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0de8	data | name '__array_stringcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a0e58	void __function___temp_function_007__
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x809ed18	ERROR TYPE __label_post_else_001__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0ec0	data | name '__var_intcon_009__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a0ec0	int __var_intcon_009__
src2 == 00000000	Nada
dest  == 0x809ed30	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0f58	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0f90	data | name '__var_intcon_010__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80a0f58	int __i
src2 == 0x80a0f90	int __var_intcon_010__
dest  == 0x80a0fe0	data | name '__var_eq_result_011__' | not const | local | place == -100000


Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x80a0fe0	bool __var_eq_result_011__
src2 == 0x80a1018	ERROR TYPE __label_or_circuit_005__
dest  == 00000000	Nada

Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e808	int __increment
src2 == 0x80a1048	void __function___temp_function_008__
dest  == 0x80a1080	data | name '__var_func_return_012__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1080	data | name '__var_func_return_012__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a10e0	data | name '__var_intcon_013__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80a1080	int __var_func_return_012__
src2 == 0x80a10e0	int __var_intcon_013__
dest  == 0x80a1130	data | name '__var_eq_result_014__' | not const | local | place == -100000


Three code: 
Operation is OP_OR
src1 == 0x80a0fe0	bool __var_eq_result_011__
src2 == 0x80a1130	bool __var_eq_result_014__
dest  == 0x80a1168	data | name '__var_or_result_015__' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x80a1018	ERROR TYPE __label_or_circuit_005__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_COND_BRANCH
src1 == 0x80a1168	bool __var_or_result_015__
src2 == 0x80a0f28	ERROR TYPE __label_else_003__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a11e8	data | name '__array_stringcon_005__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a1258	void __function___temp_function_009__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a12a8	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80a12f0	void __function___temp_function_010__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1340	data | name '__array_stringcon_006__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a13b0	void __function___temp_function_011__
dest  == 00000000	Nada

Three code: 
Operation is OP_GOTO
src1 == 0x80a0f40	ERROR TYPE __label_post_else_004__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a0f28	ERROR TYPE __label_else_003__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1430	data | name '__array_stringcon_007__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a14a0	void __function___temp_function_012__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a14f0	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80a1538	void __function___temp_function_013__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1588	data | name '__array_stringcon_008__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a15f8	void __function___temp_function_014__
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a0f40	ERROR TYPE __label_post_else_004__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1660	data | name '__var_intcon_016__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a1660	int __var_intcon_016__
src2 == 00000000	Nada
dest  == 0x809ed30	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a16f8	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1730	data | name '__var_intcon_017__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80a16f8	int __i
src2 == 0x80a1730	int __var_intcon_017__
dest  == 0x80a1780	data | name '__var_eq_result_018__' | not const | local | place == -100000


Three code: 
Operation is OP_COND_BRANCH
src1 == 0x80a1780	bool __var_eq_result_018__
src2 == 0x80a17b8	ERROR TYPE __label_and_circuit_008__
dest  == 00000000	Nada

Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e808	int __increment
src2 == 0x80a17e8	void __function___temp_function_015__
dest  == 0x80a1820	data | name '__var_func_return_019__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1820	data | name '__var_func_return_019__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1880	data | name '__var_intcon_020__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80a1820	int __var_func_return_019__
src2 == 0x80a1880	int __var_intcon_020__
dest  == 0x80a18d0	data | name '__var_eq_result_021__' | not const | local | place == -100000


Three code: 
Operation is OP_AND
src1 == 0x80a1780	bool __var_eq_result_018__
src2 == 0x80a18d0	bool __var_eq_result_021__
dest  == 0x80a1908	data | name '__var_and_result_022__' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x80a17b8	ERROR TYPE __label_and_circuit_008__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_COND_BRANCH
src1 == 0x80a1908	bool __var_and_result_022__
src2 == 0x80a16c8	ERROR TYPE __label_else_006__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1988	data | name '__array_stringcon_009__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a19f8	void __function___temp_function_016__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1a48	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80a1a90	void __function___temp_function_017__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a1ae0	data | name '__array_stringcon_010__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a1b50	void __function___temp_function_018__
dest  == 00000000	Nada

Three code: 
Operation is OP_GOTO
src1 == 0x80a16e0	ERROR TYPE __label_post_else_007__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a16c8	ERROR TYPE __label_else_006__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a9c08	data | name '__array_stringcon_011__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a9c78	void __function___temp_function_019__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a9cc8	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80a9d10	void __function___temp_function_020__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a9d60	data | name '__array_stringcon_012__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a9dd0	void __function___temp_function_021__
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a16e0	ERROR TYPE __label_post_else_007__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a9e38	data | name '__var_intcon_023__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80a9e38	int __var_intcon_023__
src2 == 00000000	Nada
dest  == 0x809ed30	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a9ed0	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a9f08	data | name '__var_intcon_024__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80a9ed0	int __i
src2 == 0x80a9f08	int __var_intcon_024__
dest  == 0x80a9f58	data | name '__var_eq_result_025__' | not const | local | place == -100000


Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x80a9f58	bool __var_eq_result_025__
src2 == 0x80a9f90	ERROR TYPE __label_or_circuit_011__
dest  == 00000000	Nada

Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e808	int __increment
src2 == 0x80aa0c8	void __function___temp_function_022__
dest  == 0x80aa100	data | name '__var_func_return_026__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80aa100	data | name '__var_func_return_026__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80aa160	data | name '__var_intcon_027__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80aa100	int __var_func_return_026__
src2 == 0x80aa160	int __var_intcon_027__
dest  == 0x80aa1b0	data | name '__var_eq_result_028__' | not const | local | place == -100000


Three code: 
Operation is OP_COND_BRANCH
src1 == 0x80aa1b0	bool __var_eq_result_028__
src2 == 0x80aa1e8	ERROR TYPE __label_and_circuit_012__
dest  == 00000000	Nada

Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e808	int __increment
src2 == 0x80aa218	void __function___temp_function_023__
dest  == 0x80aa250	data | name '__var_func_return_029__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80aa250	data | name '__var_func_return_029__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80aa2b0	data | name '__var_intcon_030__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80aa250	int __var_func_return_029__
src2 == 0x80aa2b0	int __var_intcon_030__
dest  == 0x80aa300	data | name '__var_eq_result_031__' | not const | local | place == -100000


Three code: 
Operation is OP_AND
src1 == 0x80aa1b0	bool __var_eq_result_028__
src2 == 0x80aa300	bool __var_eq_result_031__
dest  == 0x80aa338	data | name '__var_and_result_032__' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x80aa1e8	ERROR TYPE __label_and_circuit_012__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_AND
src1 == 0x80aa1b0	bool __var_eq_result_028__
src2 == 0x80aa300	bool __var_eq_result_031__
dest  == 0x80aa338	data | name '__var_and_result_032__' | not const | local | place == -100000


Three code: 
Operation is OP_OR
src1 == 0x80a9f58	bool __var_eq_result_025__
src2 == 0x80aa338	bool __var_and_result_032__
dest  == 0x80ab2c0	data | name '__var_or_result_033__' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x80a9f90	ERROR TYPE __label_or_circuit_011__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_COND_BRANCH
src1 == 0x80ab2c0	bool __var_or_result_033__
src2 == 0x80a9ea0	ERROR TYPE __label_else_009__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ab340	data | name '__array_stringcon_013__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80ab3b0	void __function___temp_function_024__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ab400	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80ab448	void __function___temp_function_025__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ab498	data | name '__array_stringcon_014__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80ab508	void __function___temp_function_026__
dest  == 00000000	Nada

Three code: 
Operation is OP_GOTO
src1 == 0x80a9eb8	ERROR TYPE __label_post_else_010__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a9ea0	ERROR TYPE __label_else_009__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ab588	data | name '__array_stringcon_015__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80ab5f8	void __function___temp_function_027__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ab648	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80ab690	void __function___temp_function_028__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ab6e0	data | name '__array_stringcon_016__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80ab750	void __function___temp_function_029__
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80a9eb8	ERROR TYPE __label_post_else_010__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ab7b8	data | name '__var_intcon_034__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x80ab7b8	int __var_intcon_034__
src2 == 00000000	Nada
dest  == 0x809ed30	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ab850	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ab888	data | name '__var_intcon_035__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80ab850	int __i
src2 == 0x80ab888	int __var_intcon_035__
dest  == 0x80ab8d8	data | name '__var_eq_result_036__' | not const | local | place == -100000


Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x80ab8d8	bool __var_eq_result_036__
src2 == 0x80ab910	ERROR TYPE __label_or_circuit_015__
dest  == 00000000	Nada

Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e808	int __increment
src2 == 0x80ab940	void __function___temp_function_030__
dest  == 0x80ab978	data | name '__var_func_return_037__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ab978	data | name '__var_func_return_037__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ab9d8	data | name '__var_intcon_038__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80ab978	int __var_func_return_037__
src2 == 0x80ab9d8	int __var_intcon_038__
dest  == 0x80aba28	data | name '__var_eq_result_039__' | not const | local | place == -100000


Three code: 
Operation is OP_FALSE_COND_BRANCH
src1 == 0x80aba28	bool __var_eq_result_039__
src2 == 0x80aba60	ERROR TYPE __label_or_circuit_016__
dest  == 00000000	Nada

Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e808	int __increment
src2 == 0x80aba90	void __function___temp_function_031__
dest  == 0x80abac8	data | name '__var_func_return_040__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80abac8	data | name '__var_func_return_040__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80abb28	data | name '__var_intcon_041__' | const | param | place == -100000


Three code: 
Operation is OP_EQ
src1 == 0x80abac8	int __var_func_return_040__
src2 == 0x80abb28	int __var_intcon_041__
dest  == 0x80abb78	data | name '__var_eq_result_042__' | not const | local | place == -100000


Three code: 
Operation is OP_OR
src1 == 0x80aba28	bool __var_eq_result_039__
src2 == 0x80abb78	bool __var_eq_result_042__
dest  == 0x80abbb0	data | name '__var_or_result_043__' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x80aba60	ERROR TYPE __label_or_circuit_016__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_OR
src1 == 0x80aba28	bool __var_eq_result_039__
src2 == 0x80abb78	bool __var_eq_result_042__
dest  == 0x80abbb0	data | name '__var_or_result_043__' | not const | local | place == -100000


Three code: 
Operation is OP_OR
src1 == 0x80ab8d8	bool __var_eq_result_036__
src2 == 0x80abbb0	bool __var_or_result_043__
dest  == 0x80abc18	data | name '__var_or_result_044__' | not const | local | place == -100000


Three code: 
Operation is OP_LABEL
src1 == 0x80ab910	ERROR TYPE __label_or_circuit_015__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_COND_BRANCH
src1 == 0x80abc18	bool __var_or_result_044__
src2 == 0x80ab820	ERROR TYPE __label_else_013__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80abc98	data | name '__array_stringcon_017__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80abd08	void __function___temp_function_032__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80abd58	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80abda0	void __function___temp_function_033__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80abdf0	data | name '__array_stringcon_018__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80abe60	void __function___temp_function_034__
dest  == 00000000	Nada

Three code: 
Operation is OP_GOTO
src1 == 0x80ab838	ERROR TYPE __label_post_else_014__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80ab820	ERROR TYPE __label_else_013__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80abee0	data | name '__array_stringcon_019__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80abf50	void __function___temp_function_035__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80abfa0	data | name '__i' | not const | global | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80abfe8	void __function___temp_function_036__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ac038	data | name '__array_stringcon_020__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80ac0a8	void __function___temp_function_037__
dest  == 00000000	Nada

Three code: 
Operation is OP_LABEL
src1 == 0x80ab838	ERROR TYPE __label_post_else_014__
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80ac110	data | name '__array_stringcon_021__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80ac250	void __function___temp_function_038__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809ebc0	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__array_stringcon_000__:	.asciiz "\n--------------------BEIGN--------------------\n"

__var_intcon_002__:	.word 0

__var_intcon_003__:	.word 0

__var_intcon_006__:	.word 1

__array_stringcon_001__:	.asciiz "\nEntered IF\ni == "

__array_stringcon_002__:	.asciiz "\n"

__array_stringcon_003__:	.asciiz "\nEntered ELSE\ni == "

__array_stringcon_004__:	.asciiz "\n"

__var_intcon_009__:	.word 0

__var_intcon_010__:	.word 0

__var_intcon_013__:	.word 1

__array_stringcon_005__:	.asciiz "\nEntered IF\ni == "

__array_stringcon_006__:	.asciiz "\n"

__array_stringcon_007__:	.asciiz "\nEntered ELSE\ni == "

__array_stringcon_008__:	.asciiz "\n"

__var_intcon_016__:	.word 0

__var_intcon_017__:	.word 1

__var_intcon_020__:	.word 1

__array_stringcon_009__:	.asciiz "\nEntered IF\ni == "

__array_stringcon_010__:	.asciiz "\n"

__array_stringcon_011__:	.asciiz "\nEntered ELSE\ni == "

__array_stringcon_012__:	.asciiz "\n"

__var_intcon_023__:	.word 0

__var_intcon_024__:	.word 1

__var_intcon_027__:	.word 1

__var_intcon_030__:	.word 2

__array_stringcon_013__:	.asciiz "\nEntered IF\ni == "

__array_stringcon_014__:	.asciiz "\n"

__array_stringcon_015__:	.asciiz "\nEntered ELSE\ni == "

__array_stringcon_016__:	.asciiz "\n"

__var_intcon_034__:	.word 0

__var_intcon_035__:	.word 1

__var_intcon_038__:	.word 1

__var_intcon_041__:	.word 2

__array_stringcon_017__:	.asciiz "\nEntered IF\ni == "

__array_stringcon_018__:	.asciiz "\n"

__array_stringcon_019__:	.asciiz "\nEntered ELSE\ni == "

__array_stringcon_020__:	.asciiz "\n"

__array_stringcon_021__:	.asciiz "\n--------------------DONE--------------------\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_or_result_044__' is 1
# stack offset after '__var_or_result_043__' is 2
# stack offset after '__var_eq_result_042__' is 3
# stack offset after '__var_func_return_040__' is 8
# stack offset after '__var_eq_result_039__' is 9
# stack offset after '__var_func_return_037__' is 16
# stack offset after '__var_eq_result_036__' is 17
# stack offset after '__var_or_result_033__' is 18
# stack offset after '__var_and_result_032__' is 19
# stack offset after '__var_eq_result_031__' is 20
# stack offset after '__var_func_return_029__' is 24
# stack offset after '__var_eq_result_028__' is 25
# stack offset after '__var_func_return_026__' is 32
# stack offset after '__var_eq_result_025__' is 33
# stack offset after '__var_and_result_022__' is 34
# stack offset after '__var_eq_result_021__' is 35
# stack offset after '__var_func_return_019__' is 40
# stack offset after '__var_eq_result_018__' is 41
# stack offset after '__var_or_result_015__' is 42
# stack offset after '__var_eq_result_014__' is 43
# stack offset after '__var_func_return_012__' is 48
# stack offset after '__var_eq_result_011__' is 49
# stack offset after '__var_and_result_008__' is 50
# stack offset after '__var_eq_result_007__' is 51
# stack offset after '__var_func_return_005__' is 56
# stack offset after '__var_eq_result_004__' is 57
# stack offset after final alignment is 60
    la $sp, -60($sp)

# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_000__ | No dest
    la $t2, __array_stringcon_000__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | __i
    lw $t0, __var_intcon_002__
    sw $t0, __i
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_EQ | __i | __var_intcon_003__ | __var_eq_result_004__
    lw $t0, __i
    lw $t1, __var_intcon_003__
    seq $t2, $t0, $t1
    sb $t2, 56($sp)

# OP_ASSIGN | __var_eq_result_004__ | No src2 | __var_and_result_008__
    lb $t0, 56($sp)
    sb $t0, 49($sp)

# OP_COND_BRANCH | __var_eq_result_004__ | __label_and_circuit_002__ | No dest
    lb $t2, 56($sp)
    beqz $t2, __label_and_circuit_002__

    nop
# OP_CALL_FUNCTION | __increment | __function___temp_function_001__ | __var_func_return_005__

    jal __increment
    nop
    la $sp, 0($sp)

    sw $v0, 52($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_005__
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_EQ | __var_func_return_005__ | __var_intcon_006__ | __var_eq_result_007__
    lw $t0, 52($sp)
    lw $t1, __var_intcon_006__
    seq $t2, $t0, $t1
    sb $t2, 50($sp)

# OP_AND | __var_eq_result_004__ | __var_eq_result_007__ | __var_and_result_008__
    lb $t0, 56($sp)
    lb $t1, 50($sp)
    and $t2, $t0, $t1
    sb $t2, 49($sp)

# OP_LABEL | __label_and_circuit_002__ | No src2 | No dest
__label_and_circuit_002__:
# OP_COND_BRANCH | __var_and_result_008__ | __label_else_000__ | No dest
    lb $t2, 49($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_001__
# OP_CALL_FUNCTION | print_string | __function___temp_function_002__ | No dest
    la $t2, __array_stringcon_001__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __i
# OP_CALL_FUNCTION | print_int | __function___temp_function_003__ | No dest
    lw $t2, __i
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
# OP_GOTO | __label_post_else_001__ | No src2 | No dest
    j __label_post_else_001__

    nop
# OP_LABEL | __label_else_000__ | No src2 | No dest
__label_else_000__:
# OP_DUMMY | No src1 | No src2 | __array_stringcon_003__
# OP_CALL_FUNCTION | print_string | __function___temp_function_005__ | No dest
    la $t2, __array_stringcon_003__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __i
# OP_CALL_FUNCTION | print_int | __function___temp_function_006__ | No dest
    lw $t2, __i
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_004__
# OP_CALL_FUNCTION | print_string | __function___temp_function_007__ | No dest
    la $t2, __array_stringcon_004__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_LABEL | __label_post_else_001__ | No src2 | No dest
__label_post_else_001__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_ASSIGN | __var_intcon_009__ | No src2 | __i
    lw $t0, __var_intcon_009__
    sw $t0, __i
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_EQ | __i | __var_intcon_010__ | __var_eq_result_011__
    lw $t0, __i
    lw $t1, __var_intcon_010__
    seq $t2, $t0, $t1
    sb $t2, 48($sp)

# OP_ASSIGN | __var_eq_result_011__ | No src2 | __var_or_result_015__
    lb $t0, 48($sp)
    sb $t0, 41($sp)

# OP_FALSE_COND_BRANCH | __var_eq_result_011__ | __label_or_circuit_005__ | No dest
    lb $t2, 48($sp)
    bnez $t2, __label_or_circuit_005__

    nop
# OP_CALL_FUNCTION | __increment | __function___temp_function_008__ | __var_func_return_012__

    jal __increment
    nop
    la $sp, 0($sp)

    sw $v0, 44($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_012__
# OP_DUMMY | No src1 | No src2 | __var_intcon_013__
# OP_EQ | __var_func_return_012__ | __var_intcon_013__ | __var_eq_result_014__
    lw $t0, 44($sp)
    lw $t1, __var_intcon_013__
    seq $t2, $t0, $t1
    sb $t2, 42($sp)

# OP_OR | __var_eq_result_011__ | __var_eq_result_014__ | __var_or_result_015__
    lb $t0, 48($sp)
    lb $t1, 42($sp)
    or $t2, $t0, $t1
    sb $t2, 41($sp)

# OP_LABEL | __label_or_circuit_005__ | No src2 | No dest
__label_or_circuit_005__:
# OP_COND_BRANCH | __var_or_result_015__ | __label_else_003__ | No dest
    lb $t2, 41($sp)
    beqz $t2, __label_else_003__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_005__
# OP_CALL_FUNCTION | print_string | __function___temp_function_009__ | No dest
    la $t2, __array_stringcon_005__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __i
# OP_CALL_FUNCTION | print_int | __function___temp_function_010__ | No dest
    lw $t2, __i
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_006__
# OP_CALL_FUNCTION | print_string | __function___temp_function_011__ | No dest
    la $t2, __array_stringcon_006__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_GOTO | __label_post_else_004__ | No src2 | No dest
    j __label_post_else_004__

    nop
# OP_LABEL | __label_else_003__ | No src2 | No dest
__label_else_003__:
# OP_DUMMY | No src1 | No src2 | __array_stringcon_007__
# OP_CALL_FUNCTION | print_string | __function___temp_function_012__ | No dest
    la $t2, __array_stringcon_007__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __i
# OP_CALL_FUNCTION | print_int | __function___temp_function_013__ | No dest
    lw $t2, __i
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_008__
# OP_CALL_FUNCTION | print_string | __function___temp_function_014__ | No dest
    la $t2, __array_stringcon_008__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_LABEL | __label_post_else_004__ | No src2 | No dest
__label_post_else_004__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_016__
# OP_ASSIGN | __var_intcon_016__ | No src2 | __i
    lw $t0, __var_intcon_016__
    sw $t0, __i
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_017__
# OP_EQ | __i | __var_intcon_017__ | __var_eq_result_018__
    lw $t0, __i
    lw $t1, __var_intcon_017__
    seq $t2, $t0, $t1
    sb $t2, 40($sp)

# OP_ASSIGN | __var_eq_result_018__ | No src2 | __var_and_result_022__
    lb $t0, 40($sp)
    sb $t0, 33($sp)

# OP_COND_BRANCH | __var_eq_result_018__ | __label_and_circuit_008__ | No dest
    lb $t2, 40($sp)
    beqz $t2, __label_and_circuit_008__

    nop
# OP_CALL_FUNCTION | __increment | __function___temp_function_015__ | __var_func_return_019__

    jal __increment
    nop
    la $sp, 0($sp)

    sw $v0, 36($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_019__
# OP_DUMMY | No src1 | No src2 | __var_intcon_020__
# OP_EQ | __var_func_return_019__ | __var_intcon_020__ | __var_eq_result_021__
    lw $t0, 36($sp)
    lw $t1, __var_intcon_020__
    seq $t2, $t0, $t1
    sb $t2, 34($sp)

# OP_AND | __var_eq_result_018__ | __var_eq_result_021__ | __var_and_result_022__
    lb $t0, 40($sp)
    lb $t1, 34($sp)
    and $t2, $t0, $t1
    sb $t2, 33($sp)

# OP_LABEL | __label_and_circuit_008__ | No src2 | No dest
__label_and_circuit_008__:
# OP_COND_BRANCH | __var_and_result_022__ | __label_else_006__ | No dest
    lb $t2, 33($sp)
    beqz $t2, __label_else_006__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_009__
# OP_CALL_FUNCTION | print_string | __function___temp_function_016__ | No dest
    la $t2, __array_stringcon_009__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __i
# OP_CALL_FUNCTION | print_int | __function___temp_function_017__ | No dest
    lw $t2, __i
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_010__
# OP_CALL_FUNCTION | print_string | __function___temp_function_018__ | No dest
    la $t2, __array_stringcon_010__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_GOTO | __label_post_else_007__ | No src2 | No dest
    j __label_post_else_007__

    nop
# OP_LABEL | __label_else_006__ | No src2 | No dest
__label_else_006__:
# OP_DUMMY | No src1 | No src2 | __array_stringcon_011__
# OP_CALL_FUNCTION | print_string | __function___temp_function_019__ | No dest
    la $t2, __array_stringcon_011__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __i
# OP_CALL_FUNCTION | print_int | __function___temp_function_020__ | No dest
    lw $t2, __i
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_012__
# OP_CALL_FUNCTION | print_string | __function___temp_function_021__ | No dest
    la $t2, __array_stringcon_012__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_LABEL | __label_post_else_007__ | No src2 | No dest
__label_post_else_007__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_023__
# OP_ASSIGN | __var_intcon_023__ | No src2 | __i
    lw $t0, __var_intcon_023__
    sw $t0, __i
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_024__
# OP_EQ | __i | __var_intcon_024__ | __var_eq_result_025__
    lw $t0, __i
    lw $t1, __var_intcon_024__
    seq $t2, $t0, $t1
    sb $t2, 32($sp)

# OP_ASSIGN | __var_eq_result_025__ | No src2 | __var_or_result_033__
    lb $t0, 32($sp)
    sb $t0, 17($sp)

# OP_FALSE_COND_BRANCH | __var_eq_result_025__ | __label_or_circuit_011__ | No dest
    lb $t2, 32($sp)
    bnez $t2, __label_or_circuit_011__

    nop
# OP_CALL_FUNCTION | __increment | __function___temp_function_022__ | __var_func_return_026__

    jal __increment
    nop
    la $sp, 0($sp)

    sw $v0, 28($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_026__
# OP_DUMMY | No src1 | No src2 | __var_intcon_027__
# OP_EQ | __var_func_return_026__ | __var_intcon_027__ | __var_eq_result_028__
    lw $t0, 28($sp)
    lw $t1, __var_intcon_027__
    seq $t2, $t0, $t1
    sb $t2, 24($sp)

# OP_ASSIGN | __var_eq_result_028__ | No src2 | __var_and_result_032__
    lb $t0, 24($sp)
    sb $t0, 18($sp)

# OP_COND_BRANCH | __var_eq_result_028__ | __label_and_circuit_012__ | No dest
    lb $t2, 24($sp)
    beqz $t2, __label_and_circuit_012__

    nop
# OP_CALL_FUNCTION | __increment | __function___temp_function_023__ | __var_func_return_029__

    jal __increment
    nop
    la $sp, 0($sp)

    sw $v0, 20($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_029__
# OP_DUMMY | No src1 | No src2 | __var_intcon_030__
# OP_EQ | __var_func_return_029__ | __var_intcon_030__ | __var_eq_result_031__
    lw $t0, 20($sp)
    lw $t1, __var_intcon_030__
    seq $t2, $t0, $t1
    sb $t2, 19($sp)

# OP_AND | __var_eq_result_028__ | __var_eq_result_031__ | __var_and_result_032__
    lb $t0, 24($sp)
    lb $t1, 19($sp)
    and $t2, $t0, $t1
    sb $t2, 18($sp)

# OP_LABEL | __label_and_circuit_012__ | No src2 | No dest
__label_and_circuit_012__:
# OP_AND | __var_eq_result_028__ | __var_eq_result_031__ | __var_and_result_032__
    lb $t0, 24($sp)
    lb $t1, 19($sp)
    and $t2, $t0, $t1
    sb $t2, 18($sp)

# OP_OR | __var_eq_result_025__ | __var_and_result_032__ | __var_or_result_033__
    lb $t0, 32($sp)
    lb $t1, 18($sp)
    or $t2, $t0, $t1
    sb $t2, 17($sp)

# OP_LABEL | __label_or_circuit_011__ | No src2 | No dest
__label_or_circuit_011__:
# OP_COND_BRANCH | __var_or_result_033__ | __label_else_009__ | No dest
    lb $t2, 17($sp)
    beqz $t2, __label_else_009__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_013__
# OP_CALL_FUNCTION | print_string | __function___temp_function_024__ | No dest
    la $t2, __array_stringcon_013__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __i
# OP_CALL_FUNCTION | print_int | __function___temp_function_025__ | No dest
    lw $t2, __i
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_014__
# OP_CALL_FUNCTION | print_string | __function___temp_function_026__ | No dest
    la $t2, __array_stringcon_014__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_GOTO | __label_post_else_010__ | No src2 | No dest
    j __label_post_else_010__

    nop
# OP_LABEL | __label_else_009__ | No src2 | No dest
__label_else_009__:
# OP_DUMMY | No src1 | No src2 | __array_stringcon_015__
# OP_CALL_FUNCTION | print_string | __function___temp_function_027__ | No dest
    la $t2, __array_stringcon_015__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __i
# OP_CALL_FUNCTION | print_int | __function___temp_function_028__ | No dest
    lw $t2, __i
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_016__
# OP_CALL_FUNCTION | print_string | __function___temp_function_029__ | No dest
    la $t2, __array_stringcon_016__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_LABEL | __label_post_else_010__ | No src2 | No dest
__label_post_else_010__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_034__
# OP_ASSIGN | __var_intcon_034__ | No src2 | __i
    lw $t0, __var_intcon_034__
    sw $t0, __i
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_035__
# OP_EQ | __i | __var_intcon_035__ | __var_eq_result_036__
    lw $t0, __i
    lw $t1, __var_intcon_035__
    seq $t2, $t0, $t1
    sb $t2, 16($sp)

# OP_ASSIGN | __var_eq_result_036__ | No src2 | __var_or_result_044__
    lb $t0, 16($sp)
    sb $t0, 0($sp)

# OP_FALSE_COND_BRANCH | __var_eq_result_036__ | __label_or_circuit_015__ | No dest
    lb $t2, 16($sp)
    bnez $t2, __label_or_circuit_015__

    nop
# OP_CALL_FUNCTION | __increment | __function___temp_function_030__ | __var_func_return_037__

    jal __increment
    nop
    la $sp, 0($sp)

    sw $v0, 12($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_037__
# OP_DUMMY | No src1 | No src2 | __var_intcon_038__
# OP_EQ | __var_func_return_037__ | __var_intcon_038__ | __var_eq_result_039__
    lw $t0, 12($sp)
    lw $t1, __var_intcon_038__
    seq $t2, $t0, $t1
    sb $t2, 8($sp)

# OP_ASSIGN | __var_eq_result_039__ | No src2 | __var_or_result_043__
    lb $t0, 8($sp)
    sb $t0, 1($sp)

# OP_FALSE_COND_BRANCH | __var_eq_result_039__ | __label_or_circuit_016__ | No dest
    lb $t2, 8($sp)
    bnez $t2, __label_or_circuit_016__

    nop
# OP_CALL_FUNCTION | __increment | __function___temp_function_031__ | __var_func_return_040__

    jal __increment
    nop
    la $sp, 0($sp)

    sw $v0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_func_return_040__
# OP_DUMMY | No src1 | No src2 | __var_intcon_041__
# OP_EQ | __var_func_return_040__ | __var_intcon_041__ | __var_eq_result_042__
    lw $t0, 4($sp)
    lw $t1, __var_intcon_041__
    seq $t2, $t0, $t1
    sb $t2, 2($sp)

# OP_OR | __var_eq_result_039__ | __var_eq_result_042__ | __var_or_result_043__
    lb $t0, 8($sp)
    lb $t1, 2($sp)
    or $t2, $t0, $t1
    sb $t2, 1($sp)

# OP_LABEL | __label_or_circuit_016__ | No src2 | No dest
__label_or_circuit_016__:
# OP_OR | __var_eq_result_039__ | __var_eq_result_042__ | __var_or_result_043__
    lb $t0, 8($sp)
    lb $t1, 2($sp)
    or $t2, $t0, $t1
    sb $t2, 1($sp)

# OP_OR | __var_eq_result_036__ | __var_or_result_043__ | __var_or_result_044__
    lb $t0, 16($sp)
    lb $t1, 1($sp)
    or $t2, $t0, $t1
    sb $t2, 0($sp)

# OP_LABEL | __label_or_circuit_015__ | No src2 | No dest
__label_or_circuit_015__:
# OP_COND_BRANCH | __var_or_result_044__ | __label_else_013__ | No dest
    lb $t2, 0($sp)
    beqz $t2, __label_else_013__

    nop
# OP_DUMMY | No src1 | No src2 | __array_stringcon_017__
# OP_CALL_FUNCTION | print_string | __function___temp_function_032__ | No dest
    la $t2, __array_stringcon_017__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __i
# OP_CALL_FUNCTION | print_int | __function___temp_function_033__ | No dest
    lw $t2, __i
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_018__
# OP_CALL_FUNCTION | print_string | __function___temp_function_034__ | No dest
    la $t2, __array_stringcon_018__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_GOTO | __label_post_else_014__ | No src2 | No dest
    j __label_post_else_014__

    nop
# OP_LABEL | __label_else_013__ | No src2 | No dest
__label_else_013__:
# OP_DUMMY | No src1 | No src2 | __array_stringcon_019__
# OP_CALL_FUNCTION | print_string | __function___temp_function_035__ | No dest
    la $t2, __array_stringcon_019__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __i
# OP_CALL_FUNCTION | print_int | __function___temp_function_036__ | No dest
    lw $t2, __i
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_020__
# OP_CALL_FUNCTION | print_string | __function___temp_function_037__ | No dest
    la $t2, __array_stringcon_020__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_LABEL | __label_post_else_014__ | No src2 | No dest
__label_post_else_014__:
# OP_DUMMY | No src1 | No src2 | __array_stringcon_021__
# OP_CALL_FUNCTION | print_string | __function___temp_function_038__ | No dest
    la $t2, __array_stringcon_021__
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
