class PrintParser
  def initialize(incoming)
    @incoming = incoming
  end

  def separate_print_lines
    @incoming.flat_map do |line|
      split_at_max_char(insert_special_chars(line))
    end
  end

  def split_at_max_char(text)
    lines = []
    until text.strip == ""
      line = select_words(text).rstrip
      lines << line
      text.slice!(line)
    end
    lines
  end

  def insert_special_chars(text)
    text.chars.reduce("") do |string, char|
      if upcase?(char)
        string.concat("S#{char.downcase}")
      elsif number?(char)
        string.concat("##{char}")
      else
        string.concat(char)
      end
    end
  end

  def upcase?(char)
    [*"A".."Z"].include?(char)
  end

  def number?(char)
    [*"0".."9"].include?(char)
  end

  def select_words(text)
    split_with_spaces(text).reduce("") do |selected, word|
      if word.length > 40
        return reduce_to_40(word)
      elsif check_length(selected, word)
        selected.concat(word)
      else
        return selected
      end
    end
  end

  def split_with_spaces(text)
    text.split(/(?= )/)
  end

  def reduce_to_40(word)
    until word.length <= 40
      word = word[0..-2]
    end
    word
  end

  def check_length(selected, word)
    (selected.length + word.length) <= 40
  end
end
