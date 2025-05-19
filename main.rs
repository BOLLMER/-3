use std::io;

fn count_trailing_zeros(n: u32) -> u32 {
    let mut count = 0;
    let mut i = 5;
    while n / i > 0 {
        count += n / i;
        i *= 5;
    }
    count
}

fn main() {
    println!("Введите число N:");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Ошибка ввода");
    let n: u32 = input.trim().parse().expect("Введите число");
    println!("Количество конечных нулей в N!: {}", count_trailing_zeros(n));
}