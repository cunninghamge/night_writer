require './lib/printed_line'
require './lib/dictionary'

class Translator
  attr_reader :dictionary

  def initialize
    @dictionary = Dictionary.new(self)
  end

  def translate_character(character)
    @dictionary.look_up(character)
  end
end
