class PrintedLine
  attr_reader :printed

  def initialize(line, parent)
    @printed = line
    @parent = parent
    @braille_lines = split_at_max_char
  end

  def split_at_max_char
    working_line = @printed.dup
    new_array = []
    until working_line.strip == ""
      line = select_words(working_line).strip
      new_array << line
      working_line.slice!(line)
    end
    new_array
  end

  def select_words(working_line)
    working_line.split.reduce("") do |new_line, word|
      new_line.concat(word, " ") if (new_line.length + word.length) <= 40
      new_line
    end
  end
end
