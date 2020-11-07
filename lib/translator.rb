require './lib/line'
require './lib/dictionary'

class Translator
  attr_reader :incoming, :dictionary

  def initialize(incoming)
    @incoming = incoming
    @dictionary = Dictionary.new(self)
  end

  def parse_lines
    incoming.each_with_object([]) do |line, all_lines|
      all_lines << Line.new(line, self)
    end
  end

  def translate_character(character)
    @dictionary.look_up(character)
  end
end
