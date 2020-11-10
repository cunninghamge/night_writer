class NightWriter

  def initialize
    @plain = read_incoming
    @braille = translate_to_braille
  end

  def read_incoming
    File.read(ARGV[0])
  end

  def translate_to_braille
    @plain
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
