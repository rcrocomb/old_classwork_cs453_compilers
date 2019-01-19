Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e430	void __alpha
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e430	void __alpha
src2 == 00000000	Nada
dest  == 00000000	Nada

# OP_ENTER_FUNCTION | __alpha | No src2 | No dest
__alpha:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_LEAVE_FUNCTION | __alpha | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e500	int __bravo
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e800	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e500	int __bravo
src2 == 00000000	Nada
dest  == 0x809e800	data | name '__var_intcon_000__' | const | param | place == -100000


	.data

__var_intcon_000__:	.word 1

	.text

# OP_ENTER_FUNCTION | __bravo | No src2 | No dest
__bravo:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_LEAVE_FUNCTION | __bravo | No src2 | __var_intcon_000__
    lw $t2, __var_intcon_000__
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e890	int __charlie
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e800	data | name '__var_charcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e890	int __charlie
src2 == 00000000	Nada
dest  == 0x809e800	data | name '__var_charcon_001__' | const | param | place == -100000


	.data

__var_charcon_001__:	.byte '1'

	.text

# OP_ENTER_FUNCTION | __charlie | No src2 | No dest
__charlie:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_001__
# OP_LEAVE_FUNCTION | __charlie | No src2 | __var_charcon_001__
    lb $t2, __var_charcon_001__
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e8f8	int __delta
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e920	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8b8	data | name '__var_array_entry_003__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809e800	int echo
src2 == 0x809e920	int __var_intcon_002__
dest  == 0x809e8b8	data | name '__var_array_entry_003__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8b8	data | name '__var_array_entry_003__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e8f8	int __delta
src2 == 00000000	Nada
dest  == 0x809e8b8	data | name '__var_array_entry_003__' | not const | local | place == -100000


	.data

__var_intcon_002__:	.word 0

	.text

# OP_ENTER_FUNCTION | __delta | No src2 | No dest
__delta:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_003__' is 4
# stack offset after 'echo' is 20
# stack offset after final alignment is 20
    la $sp, -20($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_003__
# OP_ASSIGN_FROM_ARRAY | echo | __var_intcon_002__ | __var_array_entry_003__
    la $t0, 4($sp)
    lw $t1, __var_intcon_002__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_003__
# OP_LEAVE_FUNCTION | __delta | No src2 | __var_array_entry_003__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809ea00	int __foxtrot
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e920	data | name '__var_intcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea28	data | name '__var_array_entry_005__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809e800	char hotel
src2 == 0x809e920	int __var_intcon_004__
dest  == 0x809ea28	data | name '__var_array_entry_005__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea28	data | name '__var_array_entry_005__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809ea00	int __foxtrot
src2 == 00000000	Nada
dest  == 0x809ea28	data | name '__var_array_entry_005__' | not const | local | place == -100000


	.data

__var_intcon_004__:	.word 0

	.text

# OP_ENTER_FUNCTION | __foxtrot | No src2 | No dest
__foxtrot:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_005__' is 1
# stack offset after 'hotel' is 5
# stack offset after final alignment is 8
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_005__
# OP_ASSIGN_FROM_ARRAY | hotel | __var_intcon_004__ | __var_array_entry_005__
    la $t0, 1($sp)
    lw $t1, __var_intcon_004__
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_005__
# OP_LEAVE_FUNCTION | __foxtrot | No src2 | __var_array_entry_005__
    lb $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809eea0	char __india
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e800	data | name '__var_intcon_006__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809eea0	char __india
src2 == 00000000	Nada
dest  == 0x809e800	data | name '__var_intcon_006__' | const | param | place == -100000


	.data

__var_intcon_006__:	.word 1

	.text

# OP_ENTER_FUNCTION | __india | No src2 | No dest
__india:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_LEAVE_FUNCTION | __india | No src2 | __var_intcon_006__
    lw $t2, __var_intcon_006__
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e920	char __juliet
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e800	data | name '__var_charcon_007__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e920	char __juliet
src2 == 00000000	Nada
dest  == 0x809e800	data | name '__var_charcon_007__' | const | param | place == -100000


	.data

__var_charcon_007__:	.byte '1'

	.text

# OP_ENTER_FUNCTION | __juliet | No src2 | No dest
__juliet:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_007__
# OP_LEAVE_FUNCTION | __juliet | No src2 | __var_charcon_007__
    lb $t2, __var_charcon_007__
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e948	char __kilo
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e830	data | name '__var_intcon_008__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8b8	data | name '__var_array_entry_009__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809e800	char lima
src2 == 0x809e830	int __var_intcon_008__
dest  == 0x809e8b8	data | name '__var_array_entry_009__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8b8	data | name '__var_array_entry_009__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e948	char __kilo
src2 == 00000000	Nada
dest  == 0x809e8b8	data | name '__var_array_entry_009__' | not const | local | place == -100000


	.data

__var_intcon_008__:	.word 0

	.text

# OP_ENTER_FUNCTION | __kilo | No src2 | No dest
__kilo:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_009__' is 1
# stack offset after 'lima' is 5
# stack offset after final alignment is 8
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_009__
# OP_ASSIGN_FROM_ARRAY | lima | __var_intcon_008__ | __var_array_entry_009__
    la $t0, 1($sp)
    lw $t1, __var_intcon_008__
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_009__
# OP_LEAVE_FUNCTION | __kilo | No src2 | __var_array_entry_009__
    lb $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809ee28	char __mike
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e830	data | name '__var_intcon_010__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8b8	data | name '__var_array_entry_011__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809e800	int november
src2 == 0x809e830	int __var_intcon_010__
dest  == 0x809e8b8	data | name '__var_array_entry_011__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8b8	data | name '__var_array_entry_011__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809ee28	char __mike
src2 == 00000000	Nada
dest  == 0x809e8b8	data | name '__var_array_entry_011__' | not const | local | place == -100000


	.data

__var_intcon_010__:	.word 4

	.text

# OP_ENTER_FUNCTION | __mike | No src2 | No dest
__mike:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_011__' is 4
# stack offset after 'november' is 20
# stack offset after final alignment is 20
    la $sp, -20($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_011__
# OP_ASSIGN_FROM_ARRAY | november | __var_intcon_010__ | __var_array_entry_011__
    la $t0, 4($sp)
    lw $t1, __var_intcon_010__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_011__
# OP_LEAVE_FUNCTION | __mike | No src2 | __var_array_entry_011__
    lw $t2, 0($sp)
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
