using System;

class Program
{
    static int CountTrailingZeros(int n)
    {
        int count = 0;
        for (int i = 5; n / i > 0; i *= 5)
        {
            count += n / i;
        }
        return count;
    }

    static void Main()
    {
        Console.Write("Введите число N: ");
        int n = int.Parse(Console.ReadLine());
        Console.WriteLine("Количество конечных нулей в N!: " + CountTrailingZeros(n));
    }
}