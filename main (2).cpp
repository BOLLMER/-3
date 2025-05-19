#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int reverseNumber(int num) {
    int reversed = 0;
    while (num > 0) {
        reversed = reversed * 10 + num % 10;
        num /= 10;
    }
    return reversed;
}

int main() {
    int n;
    cin >> n;

    int prev;
    cin >> prev;
    vector<int> result;

    for (int i = 1; i < n; i++) {
        int current;
        cin >> current;
        if (current < prev) {
            result.insert(result.begin(), reverseNumber(prev)); // Добавляем в начало
        }
        prev = current;
    }

    result.insert(result.begin(), reverseNumber(prev)); // Добавляем последнее число

    for (auto it = result.rbegin(); it != result.rend(); ++it) {
        cout << *it << " ";
    }
    cout << endl;
}
