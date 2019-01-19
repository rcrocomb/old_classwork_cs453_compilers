Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e430	int __x
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e430	int __x
src2 == 00000000	Nada
dest  == 0x809e8c0	data | name '__var_intcon_000__' | const | param | place == -100000


	.data

__var_intcon_000__:	.word 2

	.text

# OP_ENTER_FUNCTION | __x | No src2 | No dest
__x:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_LEAVE_FUNCTION | __x | No src2 | __var_intcon_000__
    lw $t2, __var_intcon_000__
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
