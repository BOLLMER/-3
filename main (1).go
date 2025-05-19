package main

import (
	"fmt"
)

func romanToInt(s string) int {
	roman := map[byte]int{
		'I': 1, 'V': 5, 'X': 10,
		'L': 50, 'C': 100, 'D': 500, 'M': 1000,
	}
	total, prev := 0, 0
	for i := len(s) - 1; i >= 0; i-- {
		val := roman[s[i]]
		if val < prev {
			total -= val
		} else {
			total += val
		}
		prev = val
	}
	return total
}

func main() {
	fmt.Println(romanToInt("XIV")) // 14
}