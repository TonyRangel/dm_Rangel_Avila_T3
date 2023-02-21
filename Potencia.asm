# Author Antonio Rangel
# Feb 12, 2023
# Description:

.text
main:
		
		addi s0, s0, 6 # Loading constant to n 
		addi s1, s1, 6 # Loading constant to m
		addi s2, s2, 1 # Loading constant to potencia
		jal Potencia # Calling procedure
		j exit #Jump to exit
		
Potencia:
		slti  t0, s0, 1 # if n < 1
		beq t0, zero, else #Branch to loop
		addi a0, zero, 1 #Loading 1
		#jr ra # Return to the caller
		jalr ra, ra, 0
else:
        addi sp, sp, -8 # Decreasing the stack pointer
		sw ra, 4(sp) # Storing n
		sw s0, 0(sp) # Storing the return address
		mul s2, s2, s1 #Multiplying check
		addi s0, s0, -1 #Decreasing n 
		jal Potencia # recursive function
		#lw s2, 8(sp) # Loading values from stack
		addi sp, sp, 8 # Increasing stack pointer
		addi sp, sp, 8 # Increasing stack pointer
		addi sp, sp, 4 # Increasing stack pointer
		lw ra, (sp) # Loading values from stack
		#jr ra # Return to the caller
		jalr ra, ra, 0
exit:
nop