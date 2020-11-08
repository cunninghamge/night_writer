class PrintedLine
  attr_reader :braille

  def initialize(braille)
    @braille = braille
    # @braille_chars = unzip_characters
  end

  def create_characters
    split_strings = @braille.map do |string|
      string.scan(/../)
    end
    row0 = split_strings[0]
    row1 = split_strings[1]
    row2 = split_strings[2]
    row0.zip(row1, row2)
  end
end
