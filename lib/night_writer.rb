require './lib/file_io'
require './lib/line_parser'

class NightWriter
  attr_reader :file, :parser, :printed, :braille

  def initialize
    @file = FileIO.new(ARGV)
    @printed = @file.read
    @parser = LineParser.new(@printed)
    @braille = @parser.compile_braille
    @file.write_to_file(@braille)
    puts message
  end

  def message
    "Created '#{ARGV[1]}' containing #{File.read(ARGV[0]).size} characters"
  end
end

NightWriter.new
