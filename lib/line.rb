class Line
  attr_reader :incoming

  def initialize(line, parent)
    @incoming = line
    @parent = parent
  end

  def split_at_max_characters
    split_line = @incoming
    new_array = []
    until split_line == " \n"
      line = split_line.split.reduce("") do |new_line, word|
        new_line.concat(word, " ") if (new_line.length + word.length) <= 40
        new_line
      end
      new_array << line
      split_line.slice!(line.strip)
    end
    new_array
  end
end
