require './lib/line'

class Translator
  attr_reader :incoming

  def initialize(incoming)
    @incoming = incoming
  end

  def parse_lines
    incoming.each_with_object([]) do |line, all_lines|
      all_lines << Line.new(line, self)
    end
  end
end
