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
    mov ECX, lengthof input             ;This loop will iterate length - shift times. 
    sub ECX, shift                      ;(this loop will place the 'non-wraped' values)
    mov EBX, 0                          ;Start reading at 0
    mov EDX, shift                      ;Start writing from input at shift
    l1:
    mov AL, [input+EBX]                 ;Move the value from input into al
    mov [output+EDX], AL                ;Move the value from al into output
    inc EBX                             ;Increment the input index
    inc EDX                             ;Increment the output index
     loop l1
    mov ECX, shift                      ;This loop will iterate shift times
    mov EBX, lengthof input             ;Start reading at index length - shift
    sub EBX, shift                      ;Start writing at index 0.  
    mov EDX, 0                          ;(this loop will place the 'wrapped' values)
    l2:
    mov AL, [input+EBX]                 ;Move the value from input into al
    mov [output+EDX], AL                ;Move the value from al into output
    inc EBX                             ;Increment the input index
    inc EDX                             ;Increment the output index
loop l2
INVOKE ExitProcess,0
main ENDP
END main