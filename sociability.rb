if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

current_path = "./" + File.dirname(__FILE__)

require_relative "test_sociability"
require_relative "result_print.rb"

printer = ResultPrint.new
test_sociability = TestSociability.new

test_sociability.question(current_path)

printer.print_status(test_sociability, current_path)