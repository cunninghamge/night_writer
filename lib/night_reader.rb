require './lib/file_io'
require './lib/braille_parser'

class NightReader
  attr_reader :file, :parser, :printed, :braille

  def initialize
    @file = FileIO.new(ARGV)
    @braille = @file.read
    @parser = BrailleParser.new(@braille)
    @printed = @parser.compile_print
    @file.write_to_file(@printed)
    puts message
  end

  def message
    "Created '#{ARGV[1]}' containing #{File.read(ARGV[1]).size} characters"
  end
end

NightReader.new
