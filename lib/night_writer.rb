class NightWriter
  def inspect
    "Created '#{ARGV[1]}' containing 256 characters"
  end
end


night_writer = NightWriter.new

night_writer.inspect
