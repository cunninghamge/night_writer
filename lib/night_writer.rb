class NightWriter
  attr_reader :incoming_text

  def initialize
    @incoming_text = File.read(ARGV[0])
  end

  def write_to_file
    writer = File.open(ARGV[1], "w")
    writer.write(@incoming_text)
    writer.close
  end

  def ARGV.inspect
    "Created '#{ARGV[1]}' containing #{File.read(ARGV[0]).size} characters"
  end
end

NightWriter.new

puts ARGV.inspect
