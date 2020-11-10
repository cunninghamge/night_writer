require './lib/dictionary'

class Line
  include Dictionary

  attr_reader :incoming_text, :translated_text

  def initialize(incoming)
    @incoming_text = incoming
    @translated_text = []
  end

  def translate_to_braille
    @translated_text = translate_line(@incoming_text.chars, :to_braille)
  end

  def translate_to_print
    @translated_text = translate_line(@incoming_text, :to_print)
  end

  def printable_braille
    zip_lines.reduce("") do |string_obj, line|
      string_obj.concat(line, "\n")
    end
  end

  def zip_lines
    @translated_text.each_with_object(["","",""]) do |char, obj|
      obj[0].concat(char[0])
      obj[1].concat(char[1])
      obj[2].concat(char[2])
    end
  end

  def printable_text
    @translated_text.join
  end
end
