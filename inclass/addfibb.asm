addi	$a0,$zero,0  #set N (loop num)
add 	$t0,$zero,$zero #set t0 (increment)
addi	$t1,$zero,0 #set t1 (current)
addi	$t2 $zero,1 #set t2 (last)
add	$t3,$zero,$zero  #set t3 (temp)

IF:
bne 	$a0,$t0, ELSEIF
	j ENDIF
ELSEIF:
	addi	$t0, $t0, 1 #increment 1
	add 	$t3, $t1, $zero #set temp
	add	$t1, $t2, $t1 #add to value
	add	$t2, $t3, $zero #set last value
	j IF
ENDIF:
add	$v0, $t1, $zero #assign result