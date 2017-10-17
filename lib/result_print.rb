class ResultPrint
  def print_status(test_sociability, current_path)
    f2 = File.new(current_path + '/data/results.txt', 'r:UTF-8')
    results = f2.readlines
    f2.close

    STDOUT.puts "\n #{test_sociability.name},"
    puts "\nВаш результат теста:"

    case test_sociability.score
      when 0..3
        puts results[6]
      when 4..8
        puts results[5]
      when 9..13
        puts results[4]
      when 14..18
        puts results[3]
      when 19..24
        puts results[2]
      when 25..29
        puts results[1]
      else
        puts results[0]
    end
  end
end