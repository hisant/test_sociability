if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = "./#{File.dirname(__FILE__)}"

require "#{current_path}/lib/test_sociability.rb"
require "#{current_path}/lib/result_print.rb"

VERSION = "Тест \"Оценка уровня общительности\", версия 3."

test_sociability = TestSociability.new
test_sociability.version = VERSION
test_sociability.start
test_sociability.question(current_path)
printer = ResultPrint.new
printer.print_status(test_sociability, current_path)