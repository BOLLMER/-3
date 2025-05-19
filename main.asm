section .data
    prompt db "Enter N: "      ; Приглашение для ввода
    input_buffer times 32 db 0 ; Буфер для ввода
    output_buffer times 32 db 0 ; Буфер для вывода
    newline db 10              ; Символ новой строки

section .text
    global _start

_start:
    ; Вывод приглашения
    mov rax, 1          ; Системный вызов write
    mov rdi, 1          ; Дескриптор stdout
    mov rsi, prompt     ; Указатель на строку приглашения
    mov rdx, 8          ; Длина приглашения
    syscall

    ; Чтение ввода пользователя
    mov rax, 0          ; Системный вызов read
    mov rdi, 0          ; Дескриптор stdin
    mov rsi, input_buffer ; Буфер для ввода
    mov rdx, 32         ; Максимальная длина ввода
    syscall

    ; Сохранение длины ввода
    mov r8, rax

    ; Преобразование строки в число
    mov rsi, input_buffer ; Указатель на ввод
    mov rdx, r8          ; Длина ввода
    call atoi           ; Вызов функции atoi
    mov rdi, rax        ; Сохранение числа в rdi

    ; Подсчет конечных нулей в N!
    xor rcx, rcx        ; Инициализация счетчика
    mov rax, rdi        ; Загрузка N в rax

count_loop:
    xor rdx, rdx        ; Обнуление rdx перед делением
    mov rbx, 5          ; Делитель
    div rbx             ; Деление rax на 5
    add rcx, rax        ; Добавление частного к счетчику
    test rax, rax       ; Проверка на ноль
    jnz count_loop      ; Повтор цикла, если не ноль

    ; Преобразование результата в строку
    mov rax, rcx        ; Результат в rax
    mov rdi, output_buffer ; Буфер для вывода
    call itoa           ; Вызов функции itoa

    ; Вывод результата
    mov rax, 1          ; Системный вызов write
    mov rdi, 1          ; Дескриптор stdout
    mov rsi, output_buffer ; Указатель на результат
    mov rdx, rbx        ; Длина строки результата
    syscall

    ; Вывод символа новой строки
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; Завершение программы
    mov rax, 60         ; Системный вызов exit
    xor rdi, rdi        ; Код возврата 0
    syscall

; Функция atoi: преобразование строки в число
atoi:
    xor rax, rax        ; Обнуление результата
    xor rcx, rcx        ; Индекс символа

.next_char:
    cmp rcx, rdx        ; Проверка конца строки
    jge .done
    movzx r9, byte [rsi + rcx] ; Текущий символ
    cmp r9, 0xa         ; Проверка на новую строку
    je .done
    cmp r9, '0'         ; Проверка на цифру
    jl .done
    cmp r9, '9'
    jg .done
    sub r9, '0'         ; Преобразование символа в число
    imul rax, 10
    add rax, r9
    inc rcx
    jmp .next_char

.done:
    ret

; Функция itoa: преобразование числа в строку
itoa:
    mov r8, rdi         ; Сохранение указателя на буфер
    mov r9, 10          ; Делитель
    xor rcx, rcx        ; Счетчик цифр

    test rax, rax       ; Проверка на ноль
    jnz .loop
    mov byte [rdi], '0' ; Обработка нуля
    mov rbx, 1
    ret

.loop:
    xor rdx, rdx
    div r9              ; Деление на 10
    add dl, '0'         ; Преобразование остатка в символ
    push rdx            ; Сохранение символа
    inc rcx             ; Увеличение счетчика
    test rax, rax       ; Проверка на ноль
    jnz .loop

    ; Извлечение символов из стека
    mov rdi, r8
.pop_loop:
    pop rdx
    mov [rdi], dl       ; Запись символа в буфер
    inc rdi
    dec rcx
    jnz .pop_loop

    ; Вычисление длины строки
    sub rdi, r8
    mov rbx, rdi
    ret