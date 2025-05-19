import Foundation

func reverseNumber(_ num: Int) -> Int {
    return Int(String(String(num).reversed()))!
}

let n = Int(readLine()!)!
var prev = Int(readLine()!)!
var result: [Int] = []

for _ in 1..<n {
    let current = Int(readLine()!)!
    if current < prev {
        result.insert(reverseNumber(prev), at: 0) // Добавляем в начало
    }
    prev = current
}

result.insert(reverseNumber(prev), at: 0) // Добавляем последнее число

// Переворачиваем и выводим
print(result.reversed().map { String($0) }.joined(separator: " "))
