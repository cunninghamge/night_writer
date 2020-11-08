class BrailleLine
  attr_reader :printed
  attr_accessor :braille

  def initialize(line)
    @printed = line
    @braille = []
  end
end
