class PrintedLine
  attr_reader :printed

  def initialize(line, parent)
    @printed = line
    @parent = parent
    @braille_lines = create_braille_lines
  end

  def split_at_max_characters
    split_line = @printed.dup
    new_array = []
    until split_line.strip == ""
      line = split_line.split.reduce("") do |new_line, word|
        new_line.concat(word, " ") if (new_line.length + word.length) <= 40
        new_line
      end.strip
      new_array << line
      split_line.slice!(line)
    end
    new_array
  end

  def translate_character(character)
    @parent.translate_character(character)
  end

  def create_braille_lines
    split_at_max_characters.map do |string|
      BrailleLine.new(string)
    end
  end

  def translate_line
    split_at_max_characters.map do |string|
      string.chars.map do |char|
        translate_character(char)
      end
    end
  end
end
