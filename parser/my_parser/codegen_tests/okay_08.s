Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e7f0	void __beta
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e928	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e928	int __var_intcon_000__
src2 == 00000000	Nada
dest  == 0x809e8e8	data | name 'x' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e990	data | name '__array_stringcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e7f0	void __beta
src2 == 0x809ea00	void __function___temp_function_000__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea50	data | name '__array_stringcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e7f0	void __beta
src2 == 0x809eac0	void __function___temp_function_001__
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809eb10	data | name '__var_intcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809eb10	int __var_intcon_001__
src2 == 00000000	Nada
dest  == 0x809e908	data | name 'y' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e7f0	void __beta
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__a:	.space 4

__b:	.space 11

	.align 2

__c:	.space 60

__var_intcon_000__:	.word 2

__array_stringcon_000__:	.asciiz "What?"

__array_stringcon_001__:	.asciiz "What?"

__var_intcon_001__:	.word 42

	.text

# OP_ENTER_FUNCTION | __beta | No src2 | No dest
__beta:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'y' is 4
# stack offset after 'x' is 8
# stack offset after final alignment is 8
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | x
    lw $t0, __var_intcon_000__
    sw $t0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | __beta | __function___temp_function_000__ | No dest
    la $t2, __array_stringcon_000__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __beta
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_001__
# OP_CALL_FUNCTION | __beta | __function___temp_function_001__ | No dest
    la $t2, __array_stringcon_001__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __beta
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | y
    lw $t0, __var_intcon_001__
    sw $t0, 0($sp)

# OP_LEAVE_FUNCTION | __beta | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809eeb0	void __alpha
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8e8	data | name '__array_stringcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_CALL_FUNCTION
src1 == 0x809e7f0	void __beta
src2 == 0x809ea80	void __function___temp_function_002__
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809eeb0	void __alpha
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__array_stringcon_002__:	.asciiz "hiya"

	.text

# OP_ENTER_FUNCTION | __alpha | No src2 | No dest
__alpha:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'cool' is 4
# stack offset after 'monkey' is 8
# stack offset after 'wow' is 12
# stack offset after 'foo' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | __array_stringcon_002__
# OP_CALL_FUNCTION | __beta | __function___temp_function_002__ | No dest
    la $t2, __array_stringcon_002__
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal __beta
    nop
    la $sp, 4($sp)
# OP_LEAVE_FUNCTION | __alpha | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e4d8	int __charlie
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ea50	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809ea50	int __var_intcon_002__
src2 == 00000000	Nada
dest  == 0x809e8e8	data | name 'bob' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8e8	data | name 'bob' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e4d8	int __charlie
src2 == 00000000	Nada
dest  == 0x809e8e8	data | name 'bob' | not const | local | place == -100000


	.data

__var_intcon_002__:	.word 1

	.text

# OP_ENTER_FUNCTION | __charlie | No src2 | No dest
__charlie:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'bob' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | bob
    lw $t0, __var_intcon_002__
    sw $t0, 0($sp)

# OP_DUMMY | No src1 | No src2 | bob
# OP_LEAVE_FUNCTION | __charlie | No src2 | bob
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
