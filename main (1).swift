func romanToInt(_ s: String) -> Int {
    let map: [Character: Int] = [
        "I": 1, "V": 5, "X": 10,
        "L": 50, "C": 100, "D": 500, "M": 1000
    ]
    var total = 0
    var prev = 0
    for ch in s.reversed() {
        let val = map[ch] ?? 0
        total += val < prev ? -val : val
        prev = val
    }
    return total
}

print(romanToInt("XIV")) // 14