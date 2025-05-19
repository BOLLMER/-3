def count_trailing_zeros(n):
    count = 0
    i = 5
    while n // i != 0:
        count += n // i
        i *= 5
    return count

n = int(input("Введите число N: "))
print("Количество конечных нулей в N!:", count_trailing_zeros(n))
