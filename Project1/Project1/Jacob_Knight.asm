; FILE NAME: Jacob_Knight.asm
; Author: Jacob Knight
; Auburn ID: jdk0058
; Resources: https://redirect.cs.umbc.edu/courses/undergraduate/CMSC313/fall04/burt_katz/lectures/Lect09/arrays.html#:~:text=EDI%20is%20used%20to%20hold,them%20as%20general%20indexing%20registers. 
; This website showed me ESI is the source or input index and EDI is the destination or output index
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
    shift dword 2
    input byte 1,2,3,4,5,6,7,8
    output byte lengthof input dup(?)
.code
    main proc
 MOV EAX, 0        ;Zeroing the registars
 MOV EBX, 0
 MOV ECX, 0
 MOV EDX, 0

 MOV ESI, OFFSET input                 ;put 1st element of input inside ESI
 MOV EDI, OFFSET output                ;put 1st element of output inside EDI
 ADD EDI, shift                        ;make sure first element is now in a shifted position

 MOV EBX, LENGTHOF input               ;move in the total amount of loops we need
 SUB EBX, shift                        ;minus numbers we've shifted
 MOV ECX, EBX                          ;copy into ECX
         
    l1:

 MOV AL, ESI         ;Move the value from input into al
 MOV EDI, AL         ;Move the value from al into output
 ADD ESI, 1            ;Increment the input index
 ADD EDI, 1            ;Increment the output index

    loop l1

 MOV EDI, 0 ; Reset EDI
 MOV EDI, OFFSET output ; make sure EDI stores 1st unshifted element of output
 MOV ECX, shift ; use number of shifts we had as a counter in ECX for l2

    l2:

 MOV AL, ESI           ;Move the value from input into al
 MOV EDI, AL          ;Move the value from al into output
 ADD ESI, 1           ;Increment the input index
 ADD EDI, 1           ;Increment the output index

    loop l2
INVOKE ExitProcess,0
main ENDP
END main