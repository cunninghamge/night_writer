class BrailleParser
  def initialize(incoming)
    @incoming = incoming
  end

  def separate_lines
    @incoming.each_slice(3).to_a
  end

  def separate_braille_lines
    separate_lines.map do |line|
      separate_characters(line)
    end
  end

  def separate_characters(line)
    split_strings = line.map do |string|
      string.scan(/../)
    end
    row0 = split_strings[0]
    row1 = split_strings[1]
    row2 = split_strings[2]
    row0.zip(row1, row2)
  end
end
