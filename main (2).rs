use std::io;

fn reverse_number(num: i32) -> i32 {
    let mut reversed = 0;
    let mut n = num;
    while n > 0 {
        reversed = reversed * 10 + n % 10;
        n /= 10;
    }
    reversed
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    let n: usize = input.trim().parse().expect("Not a number");

    let mut prev: i32 = read_number();
    let mut result = Vec::new();

    for _ in 1..n {
        let current = read_number();
        if current < prev {
            result.insert(0, reverse_number(prev)); // Добавляем в начало
        }
        prev = current;
    }

    result.insert(0, reverse_number(prev)); // Добавляем последнее число

    for num in result.iter().rev() {
        print!("{} ", num);
    }
}

fn read_number() -> i32 {
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Failed to read line");
    input.trim().parse().expect("Not a number")
}
