Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e430	void __alpha
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e508	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e508	int __var_intcon_000__
src2 == 00000000	Nada
dest  == 0x809e4e8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e430	void __alpha
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_000__:	.word 1

	.text

# OP_ENTER_FUNCTION | __alpha | No src2 | No dest
__alpha:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'a' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | a
    lw $t0, __var_intcon_000__
    sw $t0, 0($sp)

# OP_LEAVE_FUNCTION | __alpha | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e508	void __bravo
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e870	data | name '__var_intcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e870	int __var_intcon_001__
src2 == 00000000	Nada
dest  == 0x809e4e8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e508	void __bravo
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_001__:	.word 1

	.text

# OP_ENTER_FUNCTION | __bravo | No src2 | No dest
__bravo:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'a' is 1
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | a
    lw $t0, __var_intcon_001__
    sb $t0, 0($sp)

# OP_LEAVE_FUNCTION | __bravo | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e8d0	void __charlie
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e870	data | name '__var_intcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e7f0	data | name '__var_intcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN_TO_ARRAY
src1 == 0x809e4e8	int a
src2 == 0x809e870	int __var_intcon_002__
dest  == 0x809e7f0	data | name '__var_intcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e8d0	void __charlie
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_002__:	.word 0

__var_intcon_003__:	.word 1

	.text

# OP_ENTER_FUNCTION | __charlie | No src2 | No dest
__charlie:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'a' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ASSIGN_TO_ARRAY | a | __var_intcon_002__ | __var_intcon_003__
    la  $t0, 0($sp)
    lw $t1, __var_intcon_003__
    lw $t3, __var_intcon_002__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_LEAVE_FUNCTION | __charlie | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e978	void __delta
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e7f0	data | name '__var_intcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e910	data | name '__var_intcon_005__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN_TO_ARRAY
src1 == 0x809e4e8	char a
src2 == 0x809e7f0	int __var_intcon_004__
dest  == 0x809e910	data | name '__var_intcon_005__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e978	void __delta
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_004__:	.word 0

__var_intcon_005__:	.word 1

	.text

# OP_ENTER_FUNCTION | __delta | No src2 | No dest
__delta:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'a' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ASSIGN_TO_ARRAY | a | __var_intcon_004__ | __var_intcon_005__
    la  $t0, 0($sp)
    lb $t1, __var_intcon_005__
    lw $t3, __var_intcon_004__
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_LEAVE_FUNCTION | __delta | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e868	void __echo
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e910	data | name '__var_charcon_006__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e910	char __var_charcon_006__
src2 == 00000000	Nada
dest  == 0x809e4e8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e868	void __echo
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_charcon_006__:	.byte 'a'

	.text

# OP_ENTER_FUNCTION | __echo | No src2 | No dest
__echo:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'a' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_006__
# OP_ASSIGN | __var_charcon_006__ | No src2 | a
    lb $t0, __var_charcon_006__
    sw $t0, 0($sp)

# OP_LEAVE_FUNCTION | __echo | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e9d0	void __foxtrot
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e910	data | name '__var_charcon_007__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e910	char __var_charcon_007__
src2 == 00000000	Nada
dest  == 0x809e4e8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e9d0	void __foxtrot
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_charcon_007__:	.byte 'a'

	.text

# OP_ENTER_FUNCTION | __foxtrot | No src2 | No dest
__foxtrot:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'a' is 1
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_007__
# OP_ASSIGN | __var_charcon_007__ | No src2 | a
    lb $t0, __var_charcon_007__
    sb $t0, 0($sp)

# OP_LEAVE_FUNCTION | __foxtrot | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e800	void __golf
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e910	data | name '__var_intcon_008__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e828	data | name '__var_charcon_009__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN_TO_ARRAY
src1 == 0x809e4e8	int a
src2 == 0x809e910	int __var_intcon_008__
dest  == 0x809e828	data | name '__var_charcon_009__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e800	void __golf
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_008__:	.word 0

__var_charcon_009__:	.byte 'a'

	.text

# OP_ENTER_FUNCTION | __golf | No src2 | No dest
__golf:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'a' is 16
# stack offset after final alignment is 16
    la $sp, -16($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_DUMMY | No src1 | No src2 | __var_charcon_009__
# OP_ASSIGN_TO_ARRAY | a | __var_intcon_008__ | __var_charcon_009__
    la  $t0, 0($sp)
    lw $t1, __var_charcon_009__
    lw $t3, __var_intcon_008__
    sll $t4, $t3, 2
    add $t2, $t0, $t4
    sw $t1, 0($t2)
# OP_LEAVE_FUNCTION | __golf | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809ea28	void __hotel
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e910	data | name '__var_intcon_010__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e9a0	data | name '__var_charcon_011__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN_TO_ARRAY
src1 == 0x809e4e8	char a
src2 == 0x809e910	int __var_intcon_010__
dest  == 0x809e9a0	data | name '__var_charcon_011__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809ea28	void __hotel
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_intcon_010__:	.word 0

__var_charcon_011__:	.byte 'a'

	.text

# OP_ENTER_FUNCTION | __hotel | No src2 | No dest
__hotel:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'a' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_DUMMY | No src1 | No src2 | __var_charcon_011__
# OP_ASSIGN_TO_ARRAY | a | __var_intcon_010__ | __var_charcon_011__
    la  $t0, 0($sp)
    lb $t1, __var_charcon_011__
    lw $t3, __var_intcon_010__
    sll $t4, $t3, 0
    add $t2, $t0, $t4
    sb $t1, 0($t2)
# OP_LEAVE_FUNCTION | __hotel | No src2 | No dest

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
