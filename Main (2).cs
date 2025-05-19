using System;

class Program {
    static int ReverseNumber(int num) {
        int reversed = 0;
        while (num > 0) {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }
        return reversed;
    }

    static void Main() {
        int n = int.Parse(Console.ReadLine());
        int prev = int.Parse(Console.ReadLine());
        var result = new System.Collections.Generic.List<int>();

        for (int i = 1; i < n; i++) {
            int current = int.Parse(Console.ReadLine());
            if (current < prev) {
                result.Insert(0, ReverseNumber(prev)); // Добавляем в начало
            }
            prev = current;
        }

        result.Insert(0, ReverseNumber(prev)); // Добавляем последнее число

        result.Reverse(); // Переворачиваем

        Console.WriteLine(string.Join(" ", result)); // Выводим
    }
}
