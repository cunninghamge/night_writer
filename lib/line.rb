require './lib/dictionary'

class Line
  include Dictionary

  attr_reader :incoming_text
  attr_accessor :translated_text

  def initialize(incoming)
    @incoming_text = incoming
    @translated_text = []
  end

  def translate(method)
    @translated_text = translate_line(@incoming_text.chars, method)
  end

  def printable_braille
    row0 = ""
    row1 = ""
    row2 = ""
    @translated_text.each do |char|
      row0.concat(char[0])
      row1.concat(char[1])
      row2.concat(char[2])
    end
    row0 + "\n" + row1 + "\n" + row2
  end
end
