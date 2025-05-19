import java.util.Scanner;

public class Main {
    public static int reverseNumber(int num) {
        int reversed = 0;
        while (num > 0) {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }
        return reversed;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt(); // Вводим количество чисел
        int prev = sc.nextInt(); // Вводим первое число

        StringBuilder result = new StringBuilder();

        for (int i = 1; i < n; i++) {
            int current = sc.nextInt(); // Вводим следующее число
            if (current < prev) {
                result.insert(0, reverseNumber(prev) + " ");
            }
            prev = current;
        }

        result.insert(0, reverseNumber(prev) + " "); // Добавляем последнее число
        System.out.println(result.toString().trim()); // Переворачиваем и выводим результат
    }
}