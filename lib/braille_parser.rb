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
    split = split_strings(line)
    split[0].zip(split[1], split[2])
  end

  def split_strings(line)
    line.map do |string|
      string.scan(/../)
    end
  end
end
