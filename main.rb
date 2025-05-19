def count_trailing_zeros(n)
  count = 0
  i = 5
  while n / i > 0
    count += n / i
    i *= 5
  end
  count
end

print "Введите число N: "
n = gets.to_i
puts "Количество конечных нулей в N!: #{count_trailing_zeros(n)}"