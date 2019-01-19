Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e430	void __a_func
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e430	void __a_func
src2 == 00000000	Nada
dest  == 00000000	Nada

# OP_ENTER_FUNCTION | __a_func | No src2 | No dest
__a_func:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_LEAVE_FUNCTION | __a_func | No src2 | No dest

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e828	void __func_2
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e828	void __func_2
src2 == 00000000	Nada
dest  == 00000000	Nada

# OP_ENTER_FUNCTION | __func_2 | No src2 | No dest
__func_2:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)

# OP_LEAVE_FUNCTION | __func_2 | No src2 | No dest

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
