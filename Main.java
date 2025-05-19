import java.util.Scanner;

public class Main {
    public static int countTrailingZeros(int n) {
        int count = 0;
        for (int i = 5; n / i > 0; i *= 5) {
            count += n / i;
        }
        return count;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите число N: ");
        int n = scanner.nextInt();
        System.out.println("Количество конечных нулей в N!: " + countTrailingZeros(n));
    }
}