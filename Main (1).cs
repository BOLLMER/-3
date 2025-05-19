using System;
using System.Collections.Generic;

class RomanToInt {
    static int Convert(string s) {
        var map = new Dictionary<char, int> {
            {'I', 1}, {'V', 5}, {'X', 10},
            {'L', 50}, {'C', 100}, {'D', 500}, {'M', 1000}
        };
        int total = 0, prev = 0;
        for (int i = s.Length - 1; i >= 0; i--) {
            int val = map[s[i]];
            total += val < prev ? -val : val;
            prev = val;
        }
        return total;
    }

    static void Main() {
        Console.WriteLine(Convert("XIV")); // 14
    }
}