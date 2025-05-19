import java.util.*;

public class Main {
    public static int romanToInt(String s) {
        Map<Character, Integer> map = Map.of(
            'I', 1, 'V', 5, 'X', 10,
            'L', 50, 'C', 100, 'D', 500, 'M', 1000
        );
        int total = 0, prev = 0;
        for (int i = s.length() - 1; i >= 0; i--) {
            int val = map.get(s.charAt(i));
            total += (val < prev) ? -val : val;
            prev = val;
        }
        return total;
    }

    public static void main(String[] args) {
        System.out.println(romanToInt("XIV")); // 14
    }
}