require './lib/braille_line'

class Document
  attr_reader :braille_lines, :translator

  def initialize(lines)
    @braille_lines = lines
    @translator = Translator.new
  end
end
