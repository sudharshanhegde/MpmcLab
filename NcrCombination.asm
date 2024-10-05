.MODEL SMALL
.DATA
 N DW 6
 R DW 2
 NCR DW 0
.CODE
 MOV AX, @DATA
 MOV DS, AX
 MOV AX, N
 MOV BX, R
 CALL NCR_PROC
 MOV AH, 4CH
 INT 21H
ncr_proc proc
 CMP AX, BX ; Compare r and n
 JZ N1 ; If equAL ADD 1 to result
 CMP BX, 0 ; If no, check if r = 0
 JZ N1 ; If yes, ADD 1 to result
 CMP BX, 1 ; If no, check if r = 1
 JZ N2 ; If yes, ADD n to result
 MOV CX, AX
 DEC CX
 CMP CX,BX ; If no, check if r = n-1
 JZ N2 ; If yes, ADD n to result
 PUSH AX ; Save n
 PUSH BX ; Save r
DEC AX ; Compute n-1
 CALL ncr_proc ; CALL ncr_proc
 POP BX ; Restore r
 POP AX ; Restore n
 DEC AX ; Compute n-1
 DEC BX ; Compute r-1
 CALL ncr_proc ; CALL ncr_proc
 JMP LAST
n1:ADD ncr, 1 ; ADD 1 to result
 RET
 n2:ADD ncr, AX ; ADD n to result
last: RET
ncr_proc ENDp
END
