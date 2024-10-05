.MODEL SMALL
.DATA
ARR DW 0005H,0004H,0003H,0002H,0001H
LEN DB ($-ARR)/2
.CODE
MOV AX,@DATA
MOV DS,AX
MOV CL,LEN
DEC CL
LOOP2:MOV SI, OFFSET ARR
 MOV BL,CL
LOOP1:MOV AX,[SI] ; move first element to AX
 ADD SI,2 ; use SI as pointer to second element
 CMP AX,[SI] ; compare first element and second element
 JB NEXT ; if first element < second element jump to next
 MOV DX,[SI] ; SWAP Logic mov second element to DX
 MOV [SI],AX ; mov first element to second position
 MOV [SI-2],DX ; mov second element to first position
NEXT: DEC BL ; decrement no of comparisons
 JNZ LOOP1
DEC CL ; decrement no of passes
JNZ LOOP2
INT 3
END
