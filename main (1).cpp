#include <iostream>
#include <unordered_map>
#include <string>

using namespace std;

// Функция преобразования римского числа в натуральное
int romanToInt(const string& s) {
    unordered_map<char, int> roman = {
        {'I', 1}, {'V', 5}, {'X', 10},
        {'L', 50}, {'C', 100}, {'D', 500}, {'M', 1000}
    };

    int result = 0;
    int prev_value = 0;

    for (int i = s.length() - 1; i >= 0; --i) {
        int value = roman[s[i]];

        if (value < prev_value) {
            result -= value;
        } else {
            result += value;
        }

        prev_value = value;
    }

    return result;
}

int main() {
    string romanNumber;
    cout << "Введите римское число: ";
    cin >> romanNumber;

    int result = romanToInt(romanNumber);
    cout << "Натуральное число: " << result << endl;

    return 0;
}