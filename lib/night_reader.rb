require './lib/braille_parser'

class NightReader
  attr_reader :parser, :printed

  ARGV

  def initialize
    @braille = read_braille
    @parser = BrailleParser.new(@braille)
    @printed = @parser.compile_print
    write_to_file
  end

  def read_braille
    File.readlines(ARGV[0])
  end

  def write_to_file
    writer = File.open(ARGV[1], "w")
    writer.write(@printed)
    writer.close
  end

  def ARGV.inspect
    "Created '#{ARGV[1]}' containing #{File.read(ARGV[1]).size} characters"
  end
end

# NightReader.new
#
# puts ARGV.inspect
