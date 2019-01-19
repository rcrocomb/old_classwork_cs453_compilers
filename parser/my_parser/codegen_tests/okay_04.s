Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e468	void __bravo
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void __alpha
src2 == 0x809e7f0	void __function___temp_function_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e468	void __bravo
src2 == 00000000	Nada
dest  == 00000000	Nada

# OP_ENTER_FUNCTION | __bravo | No src2 | No dest
__bravo:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_CALL_FUNCTION | __alpha | __function___temp_function_000__ | No dest

    jal __alpha
    nop
    la $sp, 0($sp)
# OP_LEAVE_FUNCTION | __bravo | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e8a0	void __delta
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e958	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e858	void __charlie
src2 == 0x809e988	void __function___temp_function_001__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9d8	data | name '__var_charcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e858	void __charlie
src2 == 0x809ea68	void __function___temp_function_002__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8d8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e858	void __charlie
src2 == 0x809ead0	void __function___temp_function_003__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8f8	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e858	void __charlie
src2 == 0x809eb48	void __function___temp_function_004__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb98	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebf8	data | name '__var_array_entry_003__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809e918	int c
src2 == 0x809eb98	int __var_intcon_002__
dest  == 0x809ebf8	data | name '__var_array_entry_003__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebf8	data | name '__var_array_entry_003__' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e858	void __charlie
src2 == 0x809ec60	void __function___temp_function_005__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ecb0	data | name '__var_intcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ed10	data | name '__var_array_entry_005__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809e938	int d
src2 == 0x809ecb0	int __var_intcon_004__
dest  == 0x809ed10	data | name '__var_array_entry_005__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ed10	data | name '__var_array_entry_005__' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e858	void __charlie
src2 == 0x809ed78	void __function___temp_function_006__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e8a0	void __delta
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_000__:	.word 2

__var_charcon_001__:	.byte '2'

	.align 2

__var_intcon_002__:	.word 0

__var_intcon_004__:	.word 2

	.text

# OP_ENTER_FUNCTION | __delta | No src2 | No dest
__delta:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_005__' is 4
# stack offset after '__var_array_entry_003__' is 8
# stack offset after 'd' is 24
# stack offset after 'c' is 40
# stack offset after 'b' is 41
# stack offset after 'a' is 48
# stack offset after final alignment is 48
    la $sp, -48($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_CALL_FUNCTION | __charlie | __function___temp_function_001__ | No dest
    lw $t2, __var_intcon_000__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __charlie
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __var_charcon_001__
# OP_CALL_FUNCTION | __charlie | __function___temp_function_002__ | No dest
    lb $t2, __var_charcon_001__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __charlie
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | a
# OP_CALL_FUNCTION | __charlie | __function___temp_function_003__ | No dest
    lw $t2, 44($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __charlie
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | b
# OP_CALL_FUNCTION | __charlie | __function___temp_function_004__ | No dest
    lb $t2, 40($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __charlie
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_003__
# OP_ASSIGN_FROM_ARRAY | c | __var_intcon_002__ | __var_array_entry_003__
    la $t0, 24($sp)
    lw $t1, __var_intcon_002__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_003__
# OP_CALL_FUNCTION | __charlie | __function___temp_function_005__ | No dest
    lw $t2, 4($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __charlie
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_005__
# OP_ASSIGN_FROM_ARRAY | d | __var_intcon_004__ | __var_array_entry_005__
    la $t0, 8($sp)
    lw $t1, __var_intcon_004__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_005__
# OP_CALL_FUNCTION | __charlie | __function___temp_function_006__ | No dest
    lw $t2, 0($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __charlie
    nop
    la $sp, 4($sp)
# OP_LEAVE_FUNCTION | __delta | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x80a0880	void __echo
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x80a0880	void __echo
src2 == 00000000	Nada
dest  == 00000000	Nada

# OP_ENTER_FUNCTION | __echo | No src2 | No dest
__echo:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_LEAVE_FUNCTION | __echo | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809ea90	void __foxtrot
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9d8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e958	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb98	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ecb0	data | name 'd' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x80a0880	void __echo
src2 == 0x809e9f8	void __function___temp_function_007__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ed10	data | name '__var_intcon_006__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e958	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb98	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ecb0	data | name 'd' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x80a0880	void __echo
src2 == 0x809ebf8	void __function___temp_function_008__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ec30	data | name '__var_intcon_007__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a08d8	data | name '__var_charcon_008__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb98	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ecb0	data | name 'd' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x80a0880	void __echo
src2 == 0x80a0958	void __function___temp_function_009__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809edb0	data | name '__var_intcon_009__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ee10	data | name '__var_charcon_010__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb98	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ee78	data | name '__array_stringcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x80a0880	void __echo
src2 == 0x80a0668	void __function___temp_function_010__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809ea90	void __foxtrot
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_006__:	.word 1

__var_intcon_007__:	.word 1

__var_charcon_008__:	.byte 'b'

	.align 2

__var_intcon_009__:	.word 1

__var_charcon_010__:	.byte 'b'

__array_stringcon_000__:	.asciiz "hey"

	.text

# OP_ENTER_FUNCTION | __foxtrot | No src2 | No dest
__foxtrot:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'd' is 4
# stack offset after 'c' is 20
# stack offset after 'b' is 21
# stack offset after 'a' is 28
# stack offset after final alignment is 28
    la $sp, -28($sp)

# OP_DUMMY | No src1 | No src2 | a
# OP_DUMMY | No src1 | No src2 | b
# OP_DUMMY | No src1 | No src2 | c
# OP_DUMMY | No src1 | No src2 | d
# OP_CALL_FUNCTION | __echo | __function___temp_function_007__ | No dest
    la $t2, 0($sp)
    sw $t2, -4($sp)
    la $t2, 4($sp)
    sw $t2, -8($sp)
    lb $t2, 20($sp)
    sw $t2, -12($sp)
    lw $t2, 24($sp)
    sw $t2, -16($sp)
    la $sp, -16($sp)

    jal __echo
    nop
    la $sp, 16($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_DUMMY | No src1 | No src2 | b
# OP_DUMMY | No src1 | No src2 | c
# OP_DUMMY | No src1 | No src2 | d
# OP_CALL_FUNCTION | __echo | __function___temp_function_008__ | No dest
    la $t2, 0($sp)
    sw $t2, -4($sp)
    la $t2, 4($sp)
    sw $t2, -8($sp)
    lb $t2, 20($sp)
    sw $t2, -12($sp)
    lw $t2, __var_intcon_006__
    sw $t2, -16($sp)
    la $sp, -16($sp)

    jal __echo
    nop
    la $sp, 16($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_DUMMY | No src1 | No src2 | __var_charcon_008__
# OP_DUMMY | No src1 | No src2 | c
# OP_DUMMY | No src1 | No src2 | d
# OP_CALL_FUNCTION | __echo | __function___temp_function_009__ | No dest
    la $t2, 0($sp)
    sw $t2, -4($sp)
    la $t2, 4($sp)
    sw $t2, -8($sp)
    lb $t2, __var_charcon_008__
    sw $t2, -12($sp)
    lw $t2, __var_intcon_007__
    sw $t2, -16($sp)
    la $sp, -16($sp)

    jal __echo
    nop
    la $sp, 16($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_DUMMY | No src1 | No src2 | __var_charcon_010__
# OP_DUMMY | No src1 | No src2 | c
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | __echo | __function___temp_function_010__ | No dest
    la $t2, __array_stringcon_000__
    sw $t2, -4($sp)
    la $t2, 4($sp)
    sw $t2, -8($sp)
    lb $t2, __var_charcon_010__
    sw $t2, -12($sp)
    lw $t2, __var_intcon_009__
    sw $t2, -16($sp)
    la $sp, -16($sp)

    jal __echo
    nop
    la $sp, 16($sp)
# OP_LEAVE_FUNCTION | __foxtrot | No src2 | No dest

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
