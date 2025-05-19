#include <iostream>
using namespace std;

long count_trailing_zeros(long n) {
    long count = 0;
    
    while (n >= 5) {
        n /= 5;
        count += n;
    }
    
    return count;
}

int main() {
    long N;
    
    cout << "Enter a number: ";
    cin >> N;
    
    long result = count_trailing_zeros(N);
    
    cout << "Number of trailing zeros in " << N << "! is: " << result << endl;
    
    return 0;
}
