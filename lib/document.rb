require './lib/braille_line'

class Document
  attr_reader :braille_lines, :translator

  def initialize(lines)
    @braille_lines = lines
    @translator = Translator.new
  end

  def translate_lines
    @braille_lines.each do |line|
      line.braille = @translator.translate_line(line.printed)
    end
  end
end
