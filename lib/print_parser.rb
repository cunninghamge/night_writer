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
    lines = []
    until text.strip == ""
      line = select_words(text).rstrip
      lines << line
      text.slice!(line)
    end
    lines
  end

  def select_words(text)
    split_with_spaces(text).reduce("") do |selected, word|
      if word_length(word) > 40
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
    until word_length(word) <= 40
      word = word[0..-2]
    end
    word
  end

  def check_length(selected, word)
    (word_length(selected) + word_length(word)) <= 40
  end

  def word_length(phrase)
    split_with_spaces(phrase).reduce(0) do |count, word|
      count + word.length + word.count(*"A-Z") + word.count(*"0-9")
    end
  end
end
