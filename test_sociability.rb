if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = "./" + File.dirname(__FILE__)

f1 = File.new(current_path + '/data/questions.txt', 'r:UTF-8')
questions = f1.readlines
f1.close

f2 = File.new(current_path + '/data/results.txt', 'r:UTF-8')
results = f2.readlines
f2.close

puts "Доброго времени суток!"
puts "Представьтесь, пожалуйста"

name = STDIN.gets.chomp

if name == ""
  name = "Таинственная персона"
end

puts
STDOUT.puts "Доброго времени суток, #{name}! Ответьте, пожалуйста, на вопросы."

score = 0

for item in questions do
  puts
  puts item
  puts "Введите
  1. да
  2. нет
  3. иногда"
  user_input = nil
  while (user_input != 1 and user_input != 2 and user_input != 3)
    puts "Введите \"1\", \"2\" или \"3\" и нажмите \"Ввод\"."
    user_input = STDIN.gets.to_i
  end
  if (user_input == 1)
    score += 2
  elsif (user_input == 3)
    score += 1
  else
    score += 0
  end
end

STDOUT.puts "\n #{name}"
puts "\nВаш результат теста:"

case score
  when 0..3
    puts results[6]
  when 25..29
    puts results[1]
  when 19..24
    puts results[2]
  when 14..18
    puts results[3]
  when 9..13
    puts results[4]
  when 4..8
    puts results[5]
  else
    puts results[0]
end