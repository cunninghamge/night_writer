class Line
  attr_reader :incoming

  def initialize(line, parent)
    @incoming = line
    @parent = parent
  end

  def split_at_max_characters
    split_line = @incoming.dup
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

  def translate_line
    split_at_max_characters.flat_map do |string|
      string.chars.flat_map do |char|
        translate_character(char)
      end
    end
  end
end
