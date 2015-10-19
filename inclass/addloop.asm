addi	$a0,$zero,8  #set N
add 	$t0,$zero,$zero #set t0
add	$t1,$zero,$zero #set t1

IF:
bne 	$a0,$t0, ELSEIF
	j ENDIF
ELSEIF:
	addi	$t0, $t0, 1 #increment 1
	add	$t1, $t1, $t0 #add to temp value
	j IF
ENDIF:
add	$v0, $t1, $zero #assign result