def roman_to_int(s)
  map = {
    'I' => 1, 'V' => 5, 'X' => 10,
    'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000
  }
  total = 0
  prev = 0
  s.reverse.each_char do |ch|
    val = map[ch]
    total += val < prev ? -val : val
    prev = val
  end
  total
end

puts roman_to_int("XIV") # 14