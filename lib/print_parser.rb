class PrintParser
  def initialize(incoming)
    @incoming = incoming
  end

  def separate_print_lines
    @incoming.flat_map do |line|
      split_at_max_char(line.dup)
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
      if (new_line.length + word.length) <= 40
        new_line.concat(word, " ")
      else
        return new_line
      end
    end
  end
end
