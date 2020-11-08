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

  # def translate_line
  #   split_at_max_characters.map do |string|
  #     string.chars.map do |char|
  #       translate_character(char)
  #     end
  #   end
  # end
end
