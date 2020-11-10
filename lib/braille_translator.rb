require './lib/file_io'
require './lib/print_parser'
require './lib/line'

class BrailleTranslator
  attr_reader :file_io, :parser, :lines

  def initialize(args)
    @file_io = FileIO.new(args)
    @parser = PrintParser.new(@file_io.read)
    @lines = create_line_objects
    translate_lines
    writeable_lines = compile_lines
    @file_io.write_to_file(writeable_lines)
  end

  def create_line_objects
    separate_print_lines.map do |line|
      Line.new(line)
    end
  end

  def separate_print_lines
    @parser.separate_print_lines
  end

  def translate_lines
    @lines.each do |line|
      line.translate_to_braille
    end
  end

  def compile_lines
    compiled = @lines.reduce("") do |string, line|
      string.concat(line.printable_braille, "\n")
    end
    compiled
  end
end
