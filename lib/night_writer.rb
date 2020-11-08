class NightWriter
  attr_reader :parser, :printed

  def initialize
    @printed = read_printed
    @braille = translate_to_braille
    @parser = LineParser.new(@printed)
  end

  def read_printed
    File.readlines(ARGV[0])
  end

  def translate_to_braille
    @printed.join
  end

  def write_to_file
    writer = File.open(ARGV[1], "w")
    writer.write(@braille)
    writer.close
  end

  def ARGV.inspect
    "Created '#{ARGV[1]}' containing #{File.read(ARGV[0]).size} characters"
  end
end

NightWriter.new

puts ARGV.inspect
