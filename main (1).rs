use std::collections::HashMap;

fn roman_to_int(s: &str) -> i32 {
    let map: HashMap<char, i32> = [
        ('I', 1), ('V', 5), ('X', 10),
        ('L', 50), ('C', 100), ('D', 500), ('M', 1000)
    ].iter().cloned().collect();

    let mut total = 0;
    let mut prev = 0;

    for ch in s.chars().rev() {
        let val = *map.get(&ch).unwrap();
        if val < prev {
            total -= val;
        } else {
            total += val;
        }
        prev = val;
    }

    total
}

fn main() {
    println!("{}", roman_to_int("XIV")); // 14
}