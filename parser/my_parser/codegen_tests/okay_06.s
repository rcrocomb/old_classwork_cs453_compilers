Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e430	int __a
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e4e8	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e430	int __a
src2 == 00000000	Nada
dest  == 0x809e4e8	data | name '__var_intcon_000__' | const | param | place == -100000


	.data

__var_intcon_000__:	.word 42

	.text

# OP_ENTER_FUNCTION | __a | No src2 | No dest
__a:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_LEAVE_FUNCTION | __a | No src2 | __var_intcon_000__
    lw $t2, __var_intcon_000__
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e840	int __b
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e4e8	data | name '__var_charcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e840	int __b
src2 == 00000000	Nada
dest  == 0x809e4e8	data | name '__var_charcon_001__' | const | param | place == -100000


	.data

__var_charcon_001__:	.byte 'x'

	.text

# OP_ENTER_FUNCTION | __b | No src2 | No dest
__b:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_001__
# OP_LEAVE_FUNCTION | __b | No src2 | __var_charcon_001__
    lb $t2, __var_charcon_001__
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e980	int __c
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9a8	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e808	data | name '__var_array_entry_003__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809e4e8	int d
src2 == 0x809e9a8	int __var_intcon_002__
dest  == 0x809e808	data | name '__var_array_entry_003__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e808	data | name '__var_array_entry_003__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e980	int __c
src2 == 00000000	Nada
dest  == 0x809e808	data | name '__var_array_entry_003__' | not const | local | place == -100000


	.data

__var_intcon_002__:	.word 0

	.text

# OP_ENTER_FUNCTION | __c | No src2 | No dest
__c:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_003__' is 4
# stack offset after 'd' is 20
# stack offset after final alignment is 20
    la $sp, -20($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_003__
# OP_ASSIGN_FROM_ARRAY | d | __var_intcon_002__ | __var_array_entry_003__
    la $t0, 4($sp)
    lw $t1, __var_intcon_002__
    sll $t3, $t1, 2
    add $t4, $t3, $t0
    lw $t6, 0($t4)
    sw $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_003__
# OP_LEAVE_FUNCTION | __c | No src2 | __var_array_entry_003__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809ebf8	int __d
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9a8	data | name '__var_intcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e808	data | name '__var_array_entry_005__' | not const | local | place == -100000


Three code: 
Operation is OP_ASSIGN_FROM_ARRAY
src1 == 0x809e4e8	char e
src2 == 0x809e9a8	int __var_intcon_004__
dest  == 0x809e808	data | name '__var_array_entry_005__' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e808	data | name '__var_array_entry_005__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809ebf8	int __d
src2 == 00000000	Nada
dest  == 0x809e808	data | name '__var_array_entry_005__' | not const | local | place == -100000


	.data

__var_intcon_004__:	.word 1

	.text

# OP_ENTER_FUNCTION | __d | No src2 | No dest
__d:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_array_entry_005__' is 1
# stack offset after 'e' is 5
# stack offset after final alignment is 8
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_DUMMY | No src1 | No src2 | __var_array_entry_005__
# OP_ASSIGN_FROM_ARRAY | e | __var_intcon_004__ | __var_array_entry_005__
    la $t0, 1($sp)
    lw $t1, __var_intcon_004__
    sll $t3, $t1, 0
    add $t4, $t3, $t0
    lb $t6, 0($t4)
    sb $t6, 0($sp)

# OP_DUMMY | No src1 | No src2 | __var_array_entry_005__
# OP_LEAVE_FUNCTION | __d | No src2 | __var_array_entry_005__
    lb $t2, 0($sp)
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
