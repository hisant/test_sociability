class TestSociability
  attr_reader :name

  attr_accessor :version, :score

  def initialize
    @score = 0
  end

  def start
    puts @version
    puts
    puts "Доброго времени суток!"
    puts "Представьтесь, пожалуйста"

    @name = STDIN.gets.chomp
    @name = "Таинственная персона" if @name == ""

    puts
    puts "Доброго времени суток, #{@name}! Ответьте, пожалуйста, на вопросы."
  end

  def question(current_path)
    f1 = File.new(current_path + '/data/questions.txt', 'r:UTF-8')
    questions = f1.readlines
    f1.close

      for item in questions do
        puts
        puts item
        user_input = nil

        while (user_input != 1 and user_input != 2 and user_input != 3)
          puts "Введите \"1\" если Ваш ответ \"нет\", \"2\" если Ваш ответ \"иногда\"" \
               " или \"3\" если Ваш ответ \"да\" и нажмите \"Ввод\"."
          user_input = STDIN.gets.to_i
        end

        self.score += (user_input - 1)
      end
  end
end