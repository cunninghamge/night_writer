require './lib/printed_line'
require './lib/braille_line'

class BrailleParser
  # attr_reader :printed_lines, :braille_lines
  #
  def initialize(braille)
    @braille_lines = create_braille_lines(braille)
    # @printed_lines = create_print_lines(printed)
  end

  def create_braille_lines(braille)
    separate_lines(braille).map do |line|
      PrintedLine.new(line)
    end
  end

  def separate_lines(braille)
    braille.each_slice(3).to_a
  end
end
