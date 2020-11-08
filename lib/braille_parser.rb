require './lib/printed_line'
require './lib/braille_line'

class BrailleParser
  attr_reader :braille_lines, :printed_lines
  #
  def initialize(braille)
    @braille_lines = braille
    @printed_lines = create_print_lines
  end

  def create_print_lines
    separate_lines.map do |line|
      PrintedLine.new(line)
    end
  end

  def separate_lines
    @braille_lines.each_slice(3).to_a
  end

end
