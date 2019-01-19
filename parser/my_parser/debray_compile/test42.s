	.data

__a:	.space 4

__b:	.space 4

__c:	.space 4

__d:	.space 4

__e:	.space 4

__f:	.space 4

__g:	.space 4

__h:	.space 4

__i:	.space 4

__j:	.space 4

__res:	.space 4

__var_intcon_000__:	.word 1

__var_intcon_001__:	.word 2

__var_intcon_002__:	.word 3

__var_intcon_003__:	.word 4

__var_intcon_004__:	.word 5

__var_intcon_005__:	.word 6

__var_intcon_006__:	.word 7

__var_intcon_007__:	.word 8

__var_intcon_008__:	.word 9

__var_intcon_009__:	.word 10

__var_intcon_030__:	.word 1111

__var_intcon_031__:	.word 2222

__array_stringcon_000__:	.asciiz "\n"

	.text

# OP_ENTER_FUNCTION | __main | No src2 | No dest
    .globl main
main:
    sw $fp, -4($sp)
    sw $ra, -8($sp)
    la $fp, 0($sp)
    la $sp, -8($sp)
# stack offset after '__var_and_result_029__' is 1
# stack offset after '__var_negate_028__' is 2
# stack offset after '__var_negate_027__' is 3
# stack offset after '__var_negate_026__' is 4
# stack offset after '__var_or_result_025__' is 5
# stack offset after '__var_gt_result_024__' is 6
# stack offset after '__var_or_result_023__' is 7
# stack offset after '__var_gt_result_022__' is 8
# stack offset after '__var_or_result_021__' is 9
# stack offset after '__var_gt_result_020__' is 10
# stack offset after '__var_or_result_019__' is 11
# stack offset after '__var_gt_result_018__' is 12
# stack offset after '__var_gt_result_017__' is 13
# stack offset after '__var_and_result_016__' is 14
# stack offset after '__var_lte_result_015__' is 15
# stack offset after '__var_and_result_014__' is 16
# stack offset after '__var_lte_result_013__' is 17
# stack offset after '__var_and_result_012__' is 18
# stack offset after '__var_lte_result_011__' is 19
# stack offset after '__var_lte_result_010__' is 20
# stack offset after final alignment is 20
    la $sp, -20($sp)

# OP_DUMMY | No src1 | No src2 | __var_intcon_000__
# OP_ASSIGN | __var_intcon_000__ | No src2 | __a
    lw $t0, __var_intcon_000__
    sw $t0, __a
# OP_DUMMY | No src1 | No src2 | __var_intcon_001__
# OP_ASSIGN | __var_intcon_001__ | No src2 | __b
    lw $t0, __var_intcon_001__
    sw $t0, __b
# OP_DUMMY | No src1 | No src2 | __var_intcon_002__
# OP_ASSIGN | __var_intcon_002__ | No src2 | __c
    lw $t0, __var_intcon_002__
    sw $t0, __c
# OP_DUMMY | No src1 | No src2 | __var_intcon_003__
# OP_ASSIGN | __var_intcon_003__ | No src2 | __d
    lw $t0, __var_intcon_003__
    sw $t0, __d
# OP_DUMMY | No src1 | No src2 | __var_intcon_004__
# OP_ASSIGN | __var_intcon_004__ | No src2 | __e
    lw $t0, __var_intcon_004__
    sw $t0, __e
# OP_DUMMY | No src1 | No src2 | __var_intcon_005__
# OP_ASSIGN | __var_intcon_005__ | No src2 | __f
    lw $t0, __var_intcon_005__
    sw $t0, __f
# OP_DUMMY | No src1 | No src2 | __var_intcon_006__
# OP_ASSIGN | __var_intcon_006__ | No src2 | __g
    lw $t0, __var_intcon_006__
    sw $t0, __g
# OP_DUMMY | No src1 | No src2 | __var_intcon_007__
# OP_ASSIGN | __var_intcon_007__ | No src2 | __h
    lw $t0, __var_intcon_007__
    sw $t0, __h
# OP_DUMMY | No src1 | No src2 | __var_intcon_008__
# OP_ASSIGN | __var_intcon_008__ | No src2 | __i
    lw $t0, __var_intcon_008__
    sw $t0, __i
# OP_DUMMY | No src1 | No src2 | __var_intcon_009__
# OP_ASSIGN | __var_intcon_009__ | No src2 | __j
    lw $t0, __var_intcon_009__
    sw $t0, __j
# OP_DUMMY | No src1 | No src2 | __a
# OP_DUMMY | No src1 | No src2 | __b
# OP_LTE | __a | __b | __var_lte_result_010__
    lw $t0, __a
    lw $t1, __b
    sle $t2, $t0, $t1
    sb $t2, 19($sp)

# OP_ASSIGN | __var_lte_result_010__ | No src2 | __var_and_result_012__
    lb $t0, 19($sp)
    sb $t0, 17($sp)

# OP_COND_BRANCH | __var_lte_result_010__ | __label_and_circuit_002__ | No dest
    lb $t2, 19($sp)
    beqz $t2, __label_and_circuit_002__

    nop
# OP_DUMMY | No src1 | No src2 | __b
# OP_DUMMY | No src1 | No src2 | __c
# OP_LTE | __b | __c | __var_lte_result_011__
    lw $t0, __b
    lw $t1, __c
    sle $t2, $t0, $t1
    sb $t2, 18($sp)

# OP_AND | __var_lte_result_010__ | __var_lte_result_011__ | __var_and_result_012__
    lb $t0, 19($sp)
    lb $t1, 18($sp)
    and $t2, $t0, $t1
    sb $t2, 17($sp)

# OP_LABEL | __label_and_circuit_002__ | No src2 | No dest
__label_and_circuit_002__:
# OP_ASSIGN | __var_and_result_012__ | No src2 | __var_and_result_014__
    lb $t0, 17($sp)
    sb $t0, 15($sp)

# OP_COND_BRANCH | __var_and_result_012__ | __label_and_circuit_003__ | No dest
    lb $t2, 17($sp)
    beqz $t2, __label_and_circuit_003__

    nop
# OP_DUMMY | No src1 | No src2 | __c
# OP_DUMMY | No src1 | No src2 | __d
# OP_LTE | __c | __d | __var_lte_result_013__
    lw $t0, __c
    lw $t1, __d
    sle $t2, $t0, $t1
    sb $t2, 16($sp)

# OP_AND | __var_and_result_012__ | __var_lte_result_013__ | __var_and_result_014__
    lb $t0, 17($sp)
    lb $t1, 16($sp)
    and $t2, $t0, $t1
    sb $t2, 15($sp)

# OP_LABEL | __label_and_circuit_003__ | No src2 | No dest
__label_and_circuit_003__:
# OP_ASSIGN | __var_and_result_014__ | No src2 | __var_and_result_016__
    lb $t0, 15($sp)
    sb $t0, 13($sp)

# OP_COND_BRANCH | __var_and_result_014__ | __label_and_circuit_004__ | No dest
    lb $t2, 15($sp)
    beqz $t2, __label_and_circuit_004__

    nop
# OP_DUMMY | No src1 | No src2 | __d
# OP_DUMMY | No src1 | No src2 | __e
# OP_LTE | __d | __e | __var_lte_result_015__
    lw $t0, __d
    lw $t1, __e
    sle $t2, $t0, $t1
    sb $t2, 14($sp)

# OP_AND | __var_and_result_014__ | __var_lte_result_015__ | __var_and_result_016__
    lb $t0, 15($sp)
    lb $t1, 14($sp)
    and $t2, $t0, $t1
    sb $t2, 13($sp)

# OP_LABEL | __label_and_circuit_004__ | No src2 | No dest
__label_and_circuit_004__:
# OP_ASSIGN | __var_and_result_016__ | No src2 | __var_and_result_029__
    lb $t0, 13($sp)
    sb $t0, 0($sp)

# OP_COND_BRANCH | __var_and_result_016__ | __label_and_circuit_005__ | No dest
    lb $t2, 13($sp)
    beqz $t2, __label_and_circuit_005__

    nop
# OP_DUMMY | No src1 | No src2 | __e
# OP_DUMMY | No src1 | No src2 | __f
# OP_GT | __e | __f | __var_gt_result_017__
    lw $t0, __e
    lw $t1, __f
    sgt $t2, $t0, $t1
    sb $t2, 12($sp)

# OP_ASSIGN | __var_gt_result_017__ | No src2 | __var_or_result_019__
    lb $t0, 12($sp)
    sb $t0, 10($sp)

# OP_FALSE_COND_BRANCH | __var_gt_result_017__ | __label_or_circuit_006__ | No dest
    lb $t2, 12($sp)
    bnez $t2, __label_or_circuit_006__

    nop
# OP_DUMMY | No src1 | No src2 | __f
# OP_DUMMY | No src1 | No src2 | __g
# OP_GT | __f | __g | __var_gt_result_018__
    lw $t0, __f
    lw $t1, __g
    sgt $t2, $t0, $t1
    sb $t2, 11($sp)

# OP_OR | __var_gt_result_017__ | __var_gt_result_018__ | __var_or_result_019__
    lb $t0, 12($sp)
    lb $t1, 11($sp)
    or $t2, $t0, $t1
    sb $t2, 10($sp)

# OP_LABEL | __label_or_circuit_006__ | No src2 | No dest
__label_or_circuit_006__:
# OP_ASSIGN | __var_or_result_019__ | No src2 | __var_or_result_021__
    lb $t0, 10($sp)
    sb $t0, 8($sp)

# OP_FALSE_COND_BRANCH | __var_or_result_019__ | __label_or_circuit_007__ | No dest
    lb $t2, 10($sp)
    bnez $t2, __label_or_circuit_007__

    nop
# OP_DUMMY | No src1 | No src2 | __g
# OP_DUMMY | No src1 | No src2 | __h
# OP_GT | __g | __h | __var_gt_result_020__
    lw $t0, __g
    lw $t1, __h
    sgt $t2, $t0, $t1
    sb $t2, 9($sp)

# OP_OR | __var_or_result_019__ | __var_gt_result_020__ | __var_or_result_021__
    lb $t0, 10($sp)
    lb $t1, 9($sp)
    or $t2, $t0, $t1
    sb $t2, 8($sp)

# OP_LABEL | __label_or_circuit_007__ | No src2 | No dest
__label_or_circuit_007__:
# OP_ASSIGN | __var_or_result_021__ | No src2 | __var_or_result_023__
    lb $t0, 8($sp)
    sb $t0, 6($sp)

# OP_FALSE_COND_BRANCH | __var_or_result_021__ | __label_or_circuit_008__ | No dest
    lb $t2, 8($sp)
    bnez $t2, __label_or_circuit_008__

    nop
# OP_DUMMY | No src1 | No src2 | __h
# OP_DUMMY | No src1 | No src2 | __i
# OP_GT | __h | __i | __var_gt_result_022__
    lw $t0, __h
    lw $t1, __i
    sgt $t2, $t0, $t1
    sb $t2, 7($sp)

# OP_OR | __var_or_result_021__ | __var_gt_result_022__ | __var_or_result_023__
    lb $t0, 8($sp)
    lb $t1, 7($sp)
    or $t2, $t0, $t1
    sb $t2, 6($sp)

# OP_LABEL | __label_or_circuit_008__ | No src2 | No dest
__label_or_circuit_008__:
# OP_ASSIGN | __var_or_result_023__ | No src2 | __var_or_result_025__
    lb $t0, 6($sp)
    sb $t0, 4($sp)

# OP_FALSE_COND_BRANCH | __var_or_result_023__ | __label_or_circuit_009__ | No dest
    lb $t2, 6($sp)
    bnez $t2, __label_or_circuit_009__

    nop
# OP_DUMMY | No src1 | No src2 | __i
# OP_DUMMY | No src1 | No src2 | __j
# OP_GT | __i | __j | __var_gt_result_024__
    lw $t0, __i
    lw $t1, __j
    sgt $t2, $t0, $t1
    sb $t2, 5($sp)

# OP_OR | __var_or_result_023__ | __var_gt_result_024__ | __var_or_result_025__
    lb $t0, 6($sp)
    lb $t1, 5($sp)
    or $t2, $t0, $t1
    sb $t2, 4($sp)

# OP_LABEL | __label_or_circuit_009__ | No src2 | No dest
__label_or_circuit_009__:
# OP_OR | __var_or_result_023__ | __var_gt_result_024__ | __var_or_result_025__
    lb $t0, 6($sp)
    lb $t1, 5($sp)
    or $t2, $t0, $t1
    sb $t2, 4($sp)

# OP_NOT | __var_or_result_025__ | No src2 | __var_negate_026__
    lb $t0, 4($sp)
    li $t1, 1
    sub $t2, $t1, $t0
    sb $t2, 3($sp)

# OP_NOT | __var_negate_026__ | No src2 | __var_negate_027__
    lb $t0, 3($sp)
    li $t1, 1
    sub $t2, $t1, $t0
    sb $t2, 2($sp)

# OP_NOT | __var_negate_027__ | No src2 | __var_negate_028__
    lb $t0, 2($sp)
    li $t1, 1
    sub $t2, $t1, $t0
    sb $t2, 1($sp)

# OP_AND | __var_and_result_016__ | __var_negate_028__ | __var_and_result_029__
    lb $t0, 13($sp)
    lb $t1, 1($sp)
    and $t2, $t0, $t1
    sb $t2, 0($sp)

# OP_LABEL | __label_and_circuit_005__ | No src2 | No dest
__label_and_circuit_005__:
# OP_COND_BRANCH | __var_and_result_029__ | __label_else_000__ | No dest
    lb $t2, 0($sp)
    beqz $t2, __label_else_000__

    nop
# OP_DUMMY | No src1 | No src2 | __var_intcon_030__
# OP_ASSIGN | __var_intcon_030__ | No src2 | __res
    lw $t0, __var_intcon_030__
    sw $t0, __res
# OP_GOTO | __label_post_else_001__ | No src2 | No dest
    j __label_post_else_001__

    nop
# OP_LABEL | __label_else_000__ | No src2 | No dest
__label_else_000__:
# OP_DUMMY | No src1 | No src2 | __var_intcon_031__
# OP_ASSIGN | __var_intcon_031__ | No src2 | __res
    lw $t0, __var_intcon_031__
    sw $t0, __res
# OP_LABEL | __label_post_else_001__ | No src2 | No dest
__label_post_else_001__:
# OP_DUMMY | No src1 | No src2 | __res
# OP_CALL_FUNCTION | print_int | __function___temp_function_000__ | No dest
    lw $t2, __res
    sw $t2, -4($sp)
    la $sp, -4($sp)

    jal print_int
    nop
    la $sp, 4($sp)
# OP_DUMMY | No src1 | No src2 | __array_stringcon_000__
# OP_CALL_FUNCTION | print_string | __function___temp_function_001__ | No dest
    la $t2, __array_stringcon_000__
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
