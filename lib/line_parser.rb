require './lib/printed_line'
require './lib/braille_line'

class LineParser
  attr_reader :printed_lines

  def initialize(printed)
    @printed_lines = printed
  end

  def parse_lines
    @printed_lines.each_with_object([]) do |line, all_lines|
      all_lines << PrintedLine.new(line, self)
    end
  end
end
