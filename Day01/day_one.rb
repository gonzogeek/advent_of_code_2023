NUMBERS = {
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9,
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9
}

total = 0

IO.foreach("input_day_1.txt") do |line|
  line_total = 0
  line_edit = []
  line.each_char do |char|
    if char.match(/[0-9]/)
      line_edit << NUMBERS[char]
    end
  end
  line.include?()
  line_total = "#{line_edit.first}" + "#{line_edit.last}"
  line_total = line_total.to_i
  puts line_total
  total += line_total
end

puts total