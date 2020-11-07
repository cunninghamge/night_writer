class NightWriter
  attr_reader :incoming_text

  def initialize
    @incoming_text = File.read(ARGV[0])
  end

  def inspect
    "Created '#{ARGV[1]}' containing #{@incoming_text.size} characters"
  end
end


night_writer = NightWriter.new

puts night_writer.inspect
