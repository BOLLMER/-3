package main

import "fmt"

func reverseNumber(num int) int {
    reversed := 0
    for num > 0 {
        reversed = reversed*10 + num%10
        num /= 10
    }
    return reversed
}

func main() {
    var n, prev, current int
    fmt.Scan(&n)
    fmt.Scan(&prev)

    var result []int

    for i := 1; i < n; i++ {
        fmt.Scan(&current)
        if current < prev {
            result = append([]int{reverseNumber(prev)}, result...) // Добавляем в начало
        }
        prev = current
    }

    result = append([]int{reverseNumber(prev)}, result...) // Добавляем последнее число

    for i := len(result) - 1; i >= 0; i-- { // Переворачиваем и выводим
        fmt.Print(result[i], " ")
    }
}