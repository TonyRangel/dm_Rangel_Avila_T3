# Author Antonio Rangel
# Feb 19, 2023
# Description:

.data
       vector_1: .word  1, 2,  3, 4,  5, 6,  7,  8,  9 
       vector_2: .word  -1, 2,  -3, 4,  5, 6,  -7,  8,  -9
	  
.text
main:
           #la s0 vector_1 # vector_1 address
	   #la s1 vector_2 # vector_2 address
	   
	   auipc s0, 0x0000fc10
           addi s0, s0, 0
           auipc s1, 0x0000fc10
           addi s1, s1, 28
	   
           addi s2, zero, 0 #i 
	   addi s3, s3, 0x09 #k
	   addi a0, zero, 0 #resultado
	   addi a1, zero, 0 #temp resultado
	   addi t1, zero, 0 #Temp register
	   addi t2, zero, 0 #Temp register
	  
while:
           slli t1, s2, 2 #shift left i 
           slli t2, s2, 2 #shift left i 
	   add t1, t1, s0 #Adding an offset to the vector_1 base address
	   add t2, t2, s1 #Adding an offset to the vector_2 base address
	   
	   lw t0, 0(t1) #Loading data from memory
	   lw t3, 0(t2) #Loading data from memory
	   
	   slt  t4, t0, s3 # if i < 9
	   beq t4, zero, exit
	   sw ra, 4(sp) # Storing n
	   jal ProductFunction
	   add a0, a0, a1
	   addi s2, s2, 1 # incrementing i 
	   jal while
	   
ProductFunction:
       mul a1, t0, t3 #Multiplying check
	   #jr ra # Return to the caller
	   jalr ra, ra, 0

exit:
      nop
      nop