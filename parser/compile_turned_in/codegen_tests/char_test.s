Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e430	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e850	data | name '__var_charcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e850	char __var_charcon_000__
src2 == 00000000	Nada
dest  == 0x809e4e8	data | name 'a' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8b8	data | name '__var_charcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e8b8	char __var_charcon_001__
src2 == 00000000	Nada
dest  == 0x809e508	data | name 'b' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e920	data | name '__var_charcon_002__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e920	char __var_charcon_002__
src2 == 00000000	Nada
dest  == 0x809e7f0	data | name 'c' | not const | local | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e988	data | name '__var_charcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_ASSIGN
src1 == 0x809e988	char __var_charcon_003__
src2 == 00000000	Nada
dest  == 0x809e810	data | name 'd' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e430	void __main
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__var_charcon_000__:	.byte 'a'

__var_charcon_001__:	.byte 'b'

__var_charcon_002__:	.byte '
'

__var_charcon_003__:	.byte ' '

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'e' is 1
# stack offset after 'd' is 2
# stack offset after 'c' is 3
# stack offset after 'b' is 4
# stack offset after 'a' is 5
# stack offset after final alignment is 8
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_000__
# OP_ASSIGN | __var_charcon_000__ | No src2 | a
    lb $t0, __var_charcon_000__
    sb $t0, 4($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_001__
# OP_ASSIGN | __var_charcon_001__ | No src2 | b
    lb $t0, __var_charcon_001__
    sb $t0, 3($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_002__
# OP_ASSIGN | __var_charcon_002__ | No src2 | c
    lb $t0, __var_charcon_002__
    sb $t0, 2($sp)

# OP_DUMMY | No src1 | No src2 | __var_charcon_003__
# OP_ASSIGN | __var_charcon_003__ | No src2 | d
    lb $t0, __var_charcon_003__
    sb $t0, 1($sp)

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
