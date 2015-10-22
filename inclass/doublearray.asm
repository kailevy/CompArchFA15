# Load addressing, method 1
#   Load array[1] into t5
addi 	$t1, $zero, 4		# Offset stored in register t1
addi 	$t4 $zero, 12		# when our loop should stop
lw 	$t5, array1($t1)	# Array base address from label plus offset in register


# Load addressing, method 2
#   Load array[2] into t4
la 	$t2, array1		# Store array 1 address in register (pseudoinstruction)

add 	$t3, $zero, $zero

LOOP:
	beq	$t3, $t4, DONE
	add 	$t2, $t2, $t1	# load proper address for element
	lw 	$t0, ($t2)	# load it up
	sll	$t0, $t0, 1	# shift left 1 to multiply by 2
	sw	$t0,($t2)	# save it down
	add	$t3, $t3, $t1	# iterate by 4
	j	LOOP
DONE:

# Pre-populate array data in memory using .data section
.data 
array1:
0x12345678	      #element0
0x23456789	      #element1
0x98765432	      #element2