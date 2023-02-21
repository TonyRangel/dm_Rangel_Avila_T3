# Author Antonio Rangel
# Feb 20, 2023
# Description:
.data 
vector: .word  1  2  3  4  
row_0:  .word  1  2  3  4  
row_1:  .word  5  6  7  8 
row_2:  .word  9 10 11 12 
row_3:  .word 13 14 15 16
result: .word  0     
.text
main:
                addi s5, zero, 0  #i 
		addi a3, zero, 0  #index
	        addi s11, s11, 0x04 #k
		
        
		
		#la s0, row_0  #Loading an address
		auipc s0, 0x0000fc10
                addi s0, s0, 4
		#la s1, row_1  #Loading an address
		auipc s1, 0x0000fc10
                addi s1, s1, 12
		#la s2, row_2  #Loading an address
		auipc s2, 0x0000fc10
                addi s2, s2, 20
		#la s3, row_3  #Loading an address
		auipc s3, 0x0000fc10
                addi s3, s3, 28
		#la s4, vector #Loading an address
		auipc s4, 0x0000fc10
                addi s4, s4, 0xffffffd4
		#la a1, result #Loading an address
		auipc a1, 0x0000fc10
                addi a1, a1, 28
		
		addi t0, zero, 0 #Temp register
		addi t1, zero, 0 #Temp register
		addi t2, zero, 0 #Temp register
		addi t3, zero, 0 #Temp register
		addi t4, zero, 0 #Temp register
		addi a0, zero, 0 #Temp register
		addi a2, zero, 0 #Temp register
		addi a4, zero, 0 #Temp register
		jal while # Calling procedure
		
while:

                slli t0, s5, 2 #shift left i 
                slli t1, s5, 2 #shift left i
		slli t2, s5, 2 #shift left i
		slli t3, s5, 2 #shift left i
		slli t4, s5, 2 #shift left i
		slli a2, s5, 2 #shift left i
		
	        add t0, t0, s0 #Adding an offset to the row_0 base address
	        add t1, t1, s1 #Adding an offset to the row_1 base address
		add t2, t2, s2 #Adding an offset to the row_1 base address
		add t3, t3, s3 #Adding an offset to the row_1 base address
		add t4, t4, s4 #Adding an offset to the vector base address
		add a2, a2, a1 #Adding an offset to the vector base address
		
		lw s6, 0(t0)  #Loading data from Mem
		lw s7, 0(t1)  #Loading data from Mem
		lw s8, 0(t2)  #Loading data from Mem
		lw s9, 0(t3)  #Loading data from Mem
		lw s10, 0(t4)  #Loading data from Mem
		
		
	loop:	add a5, a5, s6
		add a6, a6, s7
		add a7, a7, s8
		add t5, t5, s9
		
		#slt  a0, s10, s11 # if i < 4
	        #beq  a0, zero, exit
	        
		addi a3, a3, 1 # incrementing index
		slt   a4 , a3, s10
		bne   a4  , zero, loop
		
		slt  a0, s10, s11 # if i < 4
		beq  a0, zero, exit
		
		
		
		addi s5, s5, 1 # incrementing i
		addi a3, zero, 0 # clean index
		
		jal while
exit:

               sw a5 0(a1)
               sw a6 4(a1)
               sw a7 8(a1)
               sw t5 12(a1)
               nop
               nop
