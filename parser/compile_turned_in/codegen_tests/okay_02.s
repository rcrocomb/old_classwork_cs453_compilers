Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e430	int __alpha
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e4f8	data | name '__var_intcon_000__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e808	data | name '__var_intcon_001__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809e4f8	int __var_intcon_000__
src2 == 0x809e808	int __var_intcon_001__
dest  == 0x809e858	data | name '__var_add_result_002__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e430	int __alpha
src2 == 00000000	Nada
dest  == 0x809e858	data | name '__var_add_result_002__' | not const | local | place == -100000


	.data

__var_intcon_000__:	.word 2

__var_intcon_001__:	.word 2

	.text

# OP_ENTER_FUNCTION | __alpha | No src2 | No dest
__alpha:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_002__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ADD | __var_intcon_000__ | __var_intcon_001__ | __var_add_result_002__
    lw $t0, __var_intcon_000__
    lw $t1, __var_intcon_001__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __alpha | No src2 | __var_add_result_002__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809eb98	int __bravo
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e808	data | name '__var_intcon_003__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e4f8	data | name '__var_intcon_004__' | const | param | place == -100000


Three code: 
Operation is OP_SUB
src1 == 0x809e808	int __var_intcon_003__
src2 == 0x809e4f8	int __var_intcon_004__
dest  == 0x809ebd8	data | name '__var_sub_result_005__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809eb98	int __bravo
src2 == 00000000	Nada
dest  == 0x809ebd8	data | name '__var_sub_result_005__' | not const | local | place == -100000


	.data

__var_intcon_003__:	.word 2

__var_intcon_004__:	.word 2

	.text

# OP_ENTER_FUNCTION | __bravo | No src2 | No dest
__bravo:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_sub_result_005__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_SUB | __var_intcon_003__ | __var_intcon_004__ | __var_sub_result_005__
    lw $t0, __var_intcon_003__
    lw $t1, __var_intcon_004__
    sub $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __bravo | No src2 | __var_sub_result_005__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809eb48	int __charlie
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809ebd8	data | name '__var_intcon_006__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e4f8	data | name '__var_intcon_007__' | const | param | place == -100000


Three code: 
Operation is OP_MULT
src1 == 0x809ebd8	int __var_intcon_006__
src2 == 0x809e4f8	int __var_intcon_007__
dest  == 0x809e820	data | name '__var_mult_result_008__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809eb48	int __charlie
src2 == 00000000	Nada
dest  == 0x809e820	data | name '__var_mult_result_008__' | not const | local | place == -100000


	.data

__var_intcon_006__:	.word 2

__var_intcon_007__:	.word 2

	.text

# OP_ENTER_FUNCTION | __charlie | No src2 | No dest
__charlie:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_mult_result_008__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_MULT | __var_intcon_006__ | __var_intcon_007__ | __var_mult_result_008__
    lw $t0, __var_intcon_006__
    lw $t1, __var_intcon_007__
    mul $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __charlie | No src2 | __var_mult_result_008__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e8e0	int __delta
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e820	data | name '__var_intcon_009__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e4d0	data | name '__var_intcon_010__' | const | param | place == -100000


Three code: 
Operation is OP_DIV
src1 == 0x809e820	int __var_intcon_009__
src2 == 0x809e4d0	int __var_intcon_010__
dest  == 0x809ee78	data | name '__var_div_result_011__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e8e0	int __delta
src2 == 00000000	Nada
dest  == 0x809ee78	data | name '__var_div_result_011__' | not const | local | place == -100000


	.data

__var_intcon_009__:	.word 2

__var_intcon_010__:	.word 2

	.text

# OP_ENTER_FUNCTION | __delta | No src2 | No dest
__delta:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_div_result_011__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_DUMMY | No src1 | No src2 | __var_intcon_010__
# OP_DIV | __var_intcon_009__ | __var_intcon_010__ | __var_div_result_011__
    lw $t0, __var_intcon_009__
    lw $t1, __var_intcon_010__
    div $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __delta | No src2 | __var_div_result_011__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e870	int __echo
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e4d0	data | name '__var_intcon_012__' | const | param | place == -100000


Three code: 
Operation is OP_NEGATIVE
src1 == 0x809e4d0	int __var_intcon_012__
src2 == 00000000	Nada
dest  == 0x809e898	data | name '__var_unary_MINUS_result_013__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e870	int __echo
src2 == 00000000	Nada
dest  == 0x809e898	data | name '__var_unary_MINUS_result_013__' | not const | local | place == -100000


	.data

__var_intcon_012__:	.word 2

	.text

# OP_ENTER_FUNCTION | __echo | No src2 | No dest
__echo:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_unary_MINUS_result_013__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_012__
# OP_NEGATIVE | __var_intcon_012__ | No src2 | __var_unary_MINUS_result_013__
    lw $t0, __var_intcon_012__
    neg $t2, $t0
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __echo | No src2 | __var_unary_MINUS_result_013__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809eea8	char __foxtrot
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e898	data | name '__var_intcon_014__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e908	data | name '__var_intcon_015__' | const | param | place == -100000


Three code: 
Operation is OP_ADD
src1 == 0x809e898	int __var_intcon_014__
src2 == 0x809e908	int __var_intcon_015__
dest  == 0x809e500	data | name '__var_add_result_016__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809eea8	char __foxtrot
src2 == 00000000	Nada
dest  == 0x809e500	data | name '__var_add_result_016__' | not const | local | place == -100000


	.data

__var_intcon_014__:	.word 2

__var_intcon_015__:	.word 2

	.text

# OP_ENTER_FUNCTION | __foxtrot | No src2 | No dest
__foxtrot:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_add_result_016__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_014__
# OP_DUMMY | No src1 | No src2 | __var_intcon_015__
# OP_ADD | __var_intcon_014__ | __var_intcon_015__ | __var_add_result_016__
    lw $t0, __var_intcon_014__
    lw $t1, __var_intcon_015__
    add $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __foxtrot | No src2 | __var_add_result_016__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e958	char __golf
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e908	data | name '__var_intcon_017__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e898	data | name '__var_intcon_018__' | const | param | place == -100000


Three code: 
Operation is OP_SUB
src1 == 0x809e908	int __var_intcon_017__
src2 == 0x809e898	int __var_intcon_018__
dest  == 0x809e500	data | name '__var_sub_result_019__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e958	char __golf
src2 == 00000000	Nada
dest  == 0x809e500	data | name '__var_sub_result_019__' | not const | local | place == -100000


	.data

__var_intcon_017__:	.word 2

__var_intcon_018__:	.word 2

	.text

# OP_ENTER_FUNCTION | __golf | No src2 | No dest
__golf:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_sub_result_019__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_017__
# OP_DUMMY | No src1 | No src2 | __var_intcon_018__
# OP_SUB | __var_intcon_017__ | __var_intcon_018__ | __var_sub_result_019__
    lw $t0, __var_intcon_017__
    lw $t1, __var_intcon_018__
    sub $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __golf | No src2 | __var_sub_result_019__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e9a0	char __hotel
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e500	data | name '__var_intcon_020__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e898	data | name '__var_intcon_021__' | const | param | place == -100000


Three code: 
Operation is OP_MULT
src1 == 0x809e500	int __var_intcon_020__
src2 == 0x809e898	int __var_intcon_021__
dest  == 0x809e908	data | name '__var_mult_result_022__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e9a0	char __hotel
src2 == 00000000	Nada
dest  == 0x809e908	data | name '__var_mult_result_022__' | not const | local | place == -100000


	.data

__var_intcon_020__:	.word 2

__var_intcon_021__:	.word 2

	.text

# OP_ENTER_FUNCTION | __hotel | No src2 | No dest
__hotel:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_mult_result_022__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_020__
# OP_DUMMY | No src1 | No src2 | __var_intcon_021__
# OP_MULT | __var_intcon_020__ | __var_intcon_021__ | __var_mult_result_022__
    lw $t0, __var_intcon_020__
    lw $t1, __var_intcon_021__
    mul $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __hotel | No src2 | __var_mult_result_022__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809e9e8	char __juliet
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e908	data | name '__var_intcon_023__' | const | param | place == -100000


Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e898	data | name '__var_intcon_024__' | const | param | place == -100000


Three code: 
Operation is OP_DIV
src1 == 0x809e908	int __var_intcon_023__
src2 == 0x809e898	int __var_intcon_024__
dest  == 0x809e500	data | name '__var_div_result_025__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809e9e8	char __juliet
src2 == 00000000	Nada
dest  == 0x809e500	data | name '__var_div_result_025__' | not const | local | place == -100000


	.data

__var_intcon_023__:	.word 2

__var_intcon_024__:	.word 2

	.text

# OP_ENTER_FUNCTION | __juliet | No src2 | No dest
__juliet:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_div_result_025__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_023__
# OP_DUMMY | No src1 | No src2 | __var_intcon_024__
# OP_DIV | __var_intcon_023__ | __var_intcon_024__ | __var_div_result_025__
    lw $t0, __var_intcon_023__
    lw $t1, __var_intcon_024__
    div $t2, $t0, $t1
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __juliet | No src2 | __var_div_result_025__
    lw $t2, 0($sp)
    move $v0, $t2

    la $sp, 0($fp)
    lw $ra, -8($sp)
    lw $fp, -4($sp)
    jr $ra
    nop
     
Three code: 
Operation is OP_ENTER_FUNCTION
src1 == 0x809ea30	char __kilo
src2 == 00000000	Nada
dest  == 00000000	Nada

Three code: 
Operation is OP_DUMMY
src1 == 00000000	Nada
src2 == 00000000	Nada
dest  == 0x809e898	data | name '__var_intcon_026__' | const | param | place == -100000


Three code: 
Operation is OP_NEGATIVE
src1 == 0x809e898	int __var_intcon_026__
src2 == 00000000	Nada
dest  == 0x809e908	data | name '__var_unary_MINUS_result_027__' | not const | local | place == -100000


Three code: 
Operation is OP_LEAVE_FUNCTION
src1 == 0x809ea30	char __kilo
src2 == 00000000	Nada
dest  == 0x809e908	data | name '__var_unary_MINUS_result_027__' | not const | local | place == -100000


	.data

__var_intcon_026__:	.word 2

	.text

# OP_ENTER_FUNCTION | __kilo | No src2 | No dest
__kilo:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_unary_MINUS_result_027__' is 4
# stack offset after final alignment is 4
    la $sp, -4($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_026__
# OP_NEGATIVE | __var_intcon_026__ | No src2 | __var_unary_MINUS_result_027__
    lw $t0, __var_intcon_026__
    neg $t2, $t0
    sw $t2, 0($sp)

# OP_LEAVE_FUNCTION | __kilo | No src2 | __var_unary_MINUS_result_027__
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
