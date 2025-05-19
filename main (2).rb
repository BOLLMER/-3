def reverse_number(num)
  num.to_s.reverse.to_i
end

n = gets.to_i
prev = gets.to_i
result = []

(n-1).times do
  current = gets.to_i
  if current < prev
    result.unshift(reverse_number(prev)) # Добавляем в начало
  end
  prev = current
end

result.unshift(reverse_number(prev)) # Добавляем последнее число

# Переворачиваем и выводим
puts result.reverse.join(" ")
