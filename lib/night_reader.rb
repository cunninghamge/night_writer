require './lib/print_translator'

class NightReader
  def initialize
    PrintTranslator.new(ARGV)
  end

  def message
    "Created '#{ARGV[1]}' containing #{File.read(ARGV[1]).size} characters"
  end
end

NightReader.new
