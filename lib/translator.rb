require './lib/line'
require './lib/dictionary'

class Translator
  attr_reader :printed, :dictionary

  def initialize(printed)
    @printed = printed
    @dictionary = Dictionary.new(self)
  end

  def parse_lines
    printed.each_with_object([]) do |line, all_lines|
      all_lines << Line.new(line, self)
    end
  end

  def translate_character(character)
    @dictionary.look_up(character)
  end
end
