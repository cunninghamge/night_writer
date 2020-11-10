require './lib/braille_translator'

class NightWriter
  def initialize
    BrailleTranslator.new(ARGV)
  end

  def message
    "Created '#{ARGV[1]}' containing #{File.read(ARGV[0]).size} characters"
  end
end

night_writer = NightWriter.new

puts night_writer.message
