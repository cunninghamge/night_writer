class NightWriter
  # reader = ARGV[0]

  def inspect
    "Created 'braille.txt' containing 256 characters"
  end
end


night_writer = NightWriter.new

puts night_writer.inspect
