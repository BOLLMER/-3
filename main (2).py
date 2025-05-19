def reverse_number(num):
    return int(str(num)[::-1])

n = int(input())  # Вводим количество чисел
prev = int(input())  # Вводим первое число
result = []

for i in range(1, n):
    current = int(input())  # Вводим следующее число
    if current < prev:  # Если текущее меньше предыдущего, то сохраняем
        result.append(reverse_number(prev))  # Переворачиваем число
    prev = current  # Обновляем предыдущее число

result.append(reverse_number(prev))  # Переворачиваем последнее число

# Переворачиваем список чисел в ответе
for num in result[::-1]:
    print(num, end=' ')