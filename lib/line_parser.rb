require './lib/printed_line'
require './lib/braille_line'
require './lib/document'

class LineParser
  attr_reader :printed_lines, :braille_lines

  def initialize(printed)
    @printed_lines = create_print_lines(printed)
    @braille_lines = create_braille_lines
  end

  def create_print_lines(printed)
    printed.each_with_object([]) do |line, all_lines|
      all_lines << PrintedLine.new(line)
    end
  end

  def create_braille_lines
    @printed_lines.flat_map do |line|
      split_at_max_char(line.text.dup).map do |string|
        BrailleLine.new(string)
      end
    end
  end

  def split_at_max_char(text)
    new_array = []
    until text.strip == ""
      line = select_words(text).strip
      new_array << line
      text.slice!(line)
    end
    new_array
  end

  def select_words(text)
    text.split.reduce("") do |new_line, word|
      new_line.concat(word, " ") if (new_line.length + word.length) <= 40
      new_line
    end
  end

  def compile_braille
    compiled = @braille_lines.reduce("") do |string, line|
      string.concat(line.printable_braille, "\n")
    end
    compiled
  end
end
