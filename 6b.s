AREA PROG2, CODE, READONLY
ENTRY
START
LDR R1,=0X00000006
LDR R2,=0X00000001
ADD R5,R1,R2
SUB R6,R1,R2
MUL R7,R1,R2
STOP B STOP
END
