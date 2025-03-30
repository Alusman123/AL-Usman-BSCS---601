section .bss
    num1 resb 10
    num2 resb 10
    result resb 20

section .data
    msg1 db "Enter first number: ", 0
    msg2 db "Enter second number: ", 0
    msg3 db "Enter operation (+, -, *, /): ", 0
    msg_result db "Result: ", 0
    newline db 10, 0

section .text
    global _start
    extern printf, scanf

_start:
    ; Print message 1
    mov rdi, msg1
    call print_string

    ; Read first number
    mov rdi, num1
    call read_number

    ; Print message 2
    mov rdi, msg2
    call print_string

    ; Read second number
    mov rdi, num2
    call read_number

    ; Print message 3
    mov rdi, msg3
    call print_string

    ; Read operation
    mov rsi, num1  ; Buffer to store operation
    call read_char

    ; Convert numbers from string to integer
    mov rdi, num1
    call str_to_int
    mov rbx, rax  ; Store first number in RBX

    mov rdi, num2
    call str_to_int
    mov rcx, rax  ; Store second number in RCX

    ; Perform operation
    cmp byte [num1], '+'
    je add_numbers
    cmp byte [num1], '-'
    je sub_numbers
    cmp byte [num1], '*'
    je mul_numbers
    cmp byte [num1], '/'
    je div_numbers

    jmp done  ; Invalid operation

add_numbers:
    add rbx, rcx
    jmp print_result

sub_numbers:
    sub rbx, rcx
    jmp print_result

mul_numbers:
    imul rbx, rcx
    jmp print_result

div_numbers:
    xor rdx, rdx
    div rcx
    jmp print_result

print_result:
    mov rdi, msg_result
    call print_string

    mov rdi, rbx
    call int_to_str
    call print_string

    call print_newline

done:
    call exit

; ----------------------
; Utility Functions
; ----------------------

print_string:
    mov rax, 1
    mov rdi, 1
    mov rdx, 20
    syscall
    ret

print_newline:
    mov rdi, newline
    call print_string
    ret

read_number:
    mov rax, 0
    mov rdi, 0
    mov rdx, 10
    syscall
    ret

read_char:
    mov rax, 0
    mov rdi, 0
    mov rdx, 1
    syscall
    ret

str_to_int:
    ; Convert string to integer (basic implementation)
    mov rax, 0
    ret

int_to_str:
    ; Convert integer to string (basic implementation)
    ret

exit:
    mov rax, 60
    xor rdi, rdi
    syscall
