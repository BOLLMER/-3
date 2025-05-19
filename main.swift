import Foundation

func countTrailingZeros(_ n: Int) -> Int {
    var count = 0
    var i = 5
    while n / i > 0 {
        count += n / i
        i *= 5
    }
    return count
}

print("Введите число N: ", terminator: "")
if let input = readLine(), let n = Int(input) {
    print("Количество конечных нулей в N!: \(countTrailingZeros(n))")
}