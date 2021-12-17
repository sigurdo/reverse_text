.global _start

.section .text
_start:
	ldr r8, =input    // input base address
	mov r5, #0        // counter
	mov r6, #0        // string terminator
	mov r7, #1        // increment
    sub r5, r5, r1    // start counter at -1
    mov r1, #54
    bl print_char
    bl print_char
    bl print_char
    mov r1, #55
    bl print_char

reverse_loop:
    add r5, r5, r7    // increment counter
    ldrb r1, [r8, r5] // load character
    cmp r1, #0        // compare character to string terminator
    bne reverse_loop  // repeat reverse_loop if character != string terminator

print_loop:
    sub r5, r5, r7    // decrement counter
    ldrb r1, [r8, r5] // load character
    bl print_char     // print character
    cmp r5, #0        // compare counter to 0
    bne print_loop    // repeat print_loop if counter != 0

end:
    b exit            // exit program

// Function that accepts a character at r1 and prints it to the UART
print_char:
    push {r4, lr}       // push r4 and LR to stack
	ldr r4, =0xff201000 // load UART base address
	str r1, [r4]        // write character to UART
    pop {r4, pc}

exit:
	// Branch here for exit
	b exit
	

.section .data
.align
    // Text input to reverse:
	input: .asciz "<sett inn tekst her>"

.end


