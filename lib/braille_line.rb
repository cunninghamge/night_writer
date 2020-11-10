require './lib/translator'

class BrailleLine
  include Translator

  attr_reader :printed, :braille

  def initialize(printed)
    @printed = printed
    @braille = translate_line(printed.chars, :to_braille)
  end

  def printable_braille
    row0 = ""
    row1 = ""
    row2 = ""
    @braille.each do |char|
      row0.concat(char[0])
      row1.concat(char[1])
      row2.concat(char[2])
    end
    row0 + "\n" + row1 + "\n" + row2
  end
end
