require './lib/braille_line'

class Document
  attr_reader :braille_lines

  def initialize(lines)
    @braille_lines = lines
  end
end
