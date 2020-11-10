require './lib/translator'

class PrintedLine
  include Translator

  attr_reader :braille, :printed

  def initialize(braille)
    @braille = braille
    braille_chars = create_characters
    @printed = compile_line(braille_chars)
  end

  def compile_line(chars)
    translate_line(chars, :to_print).join.concat("\n")
  end

  def create_characters
    split_strings = @braille.map do |string|
      string.scan(/../)
    end
    row0 = split_strings[0]
    row1 = split_strings[1]
    row2 = split_strings[2]
    row0.zip(row1, row2)
  end
end
