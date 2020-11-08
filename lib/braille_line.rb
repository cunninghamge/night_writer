class BrailleLine
  attr_reader :printed
  attr_accessor :braille

  def initialize(line)
    @printed = line
    @braille = []
  end

  def printable
    row0 = ""
    row1 = ""
    row2 = ""
    @braille.each do |char|
      row0.concat(char[0])
      row1.concat(char[1])
      row2.concat(char[2])
    end
    row0 + "\n" + row1 + "\n" + row2
  end
end
