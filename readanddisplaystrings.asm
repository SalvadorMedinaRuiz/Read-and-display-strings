;;Read and display strings

		.ORIG		x3000				;Starts the program at x3000

		LD		R2, enter			;R2 has the value of enter, so -10
		LEA		R1, state			;R1 has the adress of state and puts it into R1
		LEA		R0, prompt1			;loads the adress of our prompt1 into R0
		PUTS						;display the prompt

again		GETC						;wait to enter 1 single character and puts it into R0
		ADD		R3, R0, R2			;check if the enter key was pressed R3= current char - 10
		BRZ		outLoop				;if r3 is 0, then enter key was pressed! so go to OUT_LOOP
		OUT						;Will display the character in R0
		
		;Loads the letter into state
		STR		R0, R1, #0			;stores r0 in r1 (so stores current char into our reserved addresses for state)
		ADD		R1, R1, #1			;increments R1 (out adress for state) by 1 so we when we store another char later, it will be a different memory slot
		BR		again
		
outLoop		LEA		R0, newLine			;stores our new line in R0
		PUTS						;displasy the new line
		LEA		R0, state			;loads our address for state slots of characters into R0 ( the beginning of it)
		PUTS						;Displays out state
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Month and i
		GETC
		LD		R0, I				;R0 has the value of I
		ADD		R0, R0, #-1			;R0=-1
		ADD		R0, R0, R0			;R0=-2 (R0= -1 + -1)
		ADD		R0, R0, R0			;R0=-4 (R0= -2 + -2) (the -4 is to go back 4 characters)
		LEA		R1, month			;loads of address of month into R1
		ADD		R0, R0, R1			;adds adress of month and -4 and stores it into R0
		PUTS						;displays current month


		HALT						;end of the instructions
month		.STRINGZ	"JAN"				;array of month
		.STRINGZ	"FEB"				;
		.STRINGZ	"MAR"				;

I		.BLKW		1				;reserves one memory slot for I
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;								
prompt1		.STRINGZ	"Enter a state: "		;Stores string of our prompt in prompt1 (x30xx)
state		.BLKW		20				;reserves 20 slots in memeory and gives the starting adress into state
enter		.FILL		#-10				;has the nagitive ascii of the enter key for subtracting
newLine		.STRINGZ	"\n"				;stores a new line
		.END						;end of the entire program