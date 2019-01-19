Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e468	void __b
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e468	void __b
src2 == 00000000	Nada
dest  == 00000000	Nada

# OP_ENTER_FUNCTION | __b | No src2 | No dest
__b:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'a' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_LEAVE_FUNCTION | __b | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e828	void __e
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e828	void __e
src2 == 00000000	Nada
dest  == 00000000	Nada

	.data

__d:	.space 4

	.text

# OP_ENTER_FUNCTION | __e | No src2 | No dest
__e:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after 'd' is 1
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_LEAVE_FUNCTION | __e | No src2 | No dest

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
