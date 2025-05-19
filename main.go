package main

import (
    "fmt"
)

func countTrailingZeros(n int) int {
    count := 0
    for i := 5; n/i > 0; i *= 5 {
        count += n / i
    }
    return count
}

func main() {
    var n int
    fmt.Print("Введите число N: ")
    fmt.Scan(&n)
    fmt.Println("Количество конечных нулей в N!:", countTrailingZeros(n))
}