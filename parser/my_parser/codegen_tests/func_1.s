Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e500	void __a_func
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
dest  == 0x809ead0	data | name 'c' | not const | param | place == 16


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
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eda8	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809edf8	data | name '__var_intcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN_TO_ARRAY
src1 == 0x809ea90	char z
src2 == 0x809eda8	int __var_intcon_000__
dest  == 0x809edf8	data | name '__var_intcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e500	void __a_func
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__array_stringcon_000__:	.asciiz "\nLast parameter == "

__array_stringcon_001__:	.asciiz "\n"

__var_intcon_000__:	.word 1

__var_intcon_001__:	.word 42

	.text

# OP_ENTER_FUNCTION | __a_func | No src2 | No dest
__a_func:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'i' is 1
# stack offset after 'h' is 2
# stack offset after 'g' is 3
# stack offset after 'f' is 8
# stack offset after 'e' is 12
# stack offset after 'd' is 16
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
# OP_DUMMY | No src1 | No src2 | c
# OP_CALL_FUNCTION | print_int | __function___temp_function_001__ | No dest
    lb $t2, 16($fp)
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
# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN_TO_ARRAY | z | __var_intcon_000__ | __var_intcon_001__
    lw  $t0, 8($fp)
    lb $t1, __var_intcon_001__
    lw $t3, __var_intcon_000__
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_LEAVE_FUNCTION | __a_func | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e8b0	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea70	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea50	data | name '__var_intcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN_TO_ARRAY
src1 == 0x809ece8	char p3
src2 == 0x809ea70	int __var_intcon_002__
dest  == 0x809ea50	data | name '__var_intcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebd0	data | name '__var_intcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ed98	data | name '__var_intcon_005__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN_TO_ARRAY
src1 == 0x809ece8	char p3
src2 == 0x809ebd0	int __var_intcon_004__
dest  == 0x809ed98	data | name '__var_intcon_005__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea90	data | name 'p1' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eab0	data | name 'p2' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ece8	data | name 'p3' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebb0	data | name 'p4' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ee88	data | name '__var_charcon_006__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e500	void __a_func
src2 == 0x809ead0	void __function___temp_function_003__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb10	data | name '__array_stringcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x809eb80	void __function___temp_function_004__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0550	data | name '__var_intcon_007__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a05b0	data | name '__var_array_entry_008__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809ece8	char p3
src2 == 0x80a0550	int __var_intcon_007__
dest  == 0x80a05b0	data | name '__var_array_entry_008__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a05b0	data | name '__var_array_entry_008__' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80a0618	void __function___temp_function_005__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0668	data | name '__array_stringcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a06d8	void __function___temp_function_006__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0728	data | name '__var_intcon_009__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0788	data | name '__var_array_entry_010__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809ece8	char p3
src2 == 0x80a0728	int __var_intcon_009__
dest  == 0x80a0788	data | name '__var_array_entry_010__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0788	data | name '__var_array_entry_010__' | not const | local | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e430	void print_int
src2 == 0x80a07f0	void __function___temp_function_007__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x80a0840	data | name '__array_stringcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e498	void print_string
src2 == 0x80a08b0	void __function___temp_function_008__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e8b0	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_002__:	.word 0

__var_intcon_003__:	.word 0

__var_intcon_004__:	.word 1

__var_intcon_005__:	.word 0

__var_charcon_006__:	.byte ' '

__array_stringcon_002__:	.asciiz "p[0] == "

__var_intcon_007__:	.word 0

__array_stringcon_003__:	.asciiz "\np[1] == "

	.align 2

__var_intcon_009__:	.word 1

__array_stringcon_004__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_010__' is 1
# stack offset after '__var_array_entry_008__' is 2
# stack offset after 'p4' is 44
# stack offset after 'p3' is 46
# stack offset after 'p2' is 52
# stack offset after 'p1' is 56
# stack offset after final alignment is 56
    la $sp, -56($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ASSIGN_TO_ARRAY | p3 | __var_intcon_002__ | __var_intcon_003__
    la  $t0, 44($sp)
    lb $t1, __var_intcon_003__
    lw $t3, __var_intcon_002__
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ASSIGN_TO_ARRAY | p3 | __var_intcon_004__ | __var_intcon_005__
    la  $t0, 44($sp)
    lb $t1, __var_intcon_005__
    lw $t3, __var_intcon_004__
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_DUMMY | No src1 | No src2 | p1
# OP_DUMMY | No src1 | No src2 | p2
# OP_DUMMY | No src1 | No src2 | p3
# OP_DUMMY | No src1 | No src2 | p4
# OP_DUMMY | No src1 | No src2 | __var_charcon_006__
# OP_CALL_FUNCTION | __a_func | __function___temp_function_003__ | No dest
    lb $t2, __var_charcon_006__
    sw $t2, -4($sp)
    la $t2, 4($sp)
    sw $t2, -8($sp)
    la $t2, 44($sp)
    sw $t2, -12($sp)
    lw $t2, 48($sp)
    sw $t2, -16($sp)
    lw $t2, 52($sp)
    sw $t2, -20($sp)
    la $sp, -20($sp)

    jal __a_func
    nop
    la $sp, 20($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_002__
# OP_CALL_FUNCTION | print_string | __function___temp_function_004__ | No dest
    la $t2, __array_stringcon_002__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_string
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_008__
# OP_ASSIGN_FROM_ARRAY | p3 | __var_intcon_007__ | __var_array_entry_008__
    la $t0, 44($sp)
    lw $t1, __var_intcon_007__
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 1($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_008__
# OP_CALL_FUNCTION | print_int | __function___temp_function_005__ | No dest
    lb $t2, 1($sp)
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
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_010__
# OP_ASSIGN_FROM_ARRAY | p3 | __var_intcon_009__ | __var_array_entry_010__
    la $t0, 44($sp)
    lw $t1, __var_intcon_009__
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_010__
# OP_CALL_FUNCTION | print_int | __function___temp_function_007__ | No dest
    lb $t2, 0($sp)
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_004__
# OP_CALL_FUNCTION | print_string | __function___temp_function_008__ | No dest
    la $t2, __array_stringcon_004__
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
