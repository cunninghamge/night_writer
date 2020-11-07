class Translator
  attr_reader :incoming

  def initialize(incoming)
    @incoming = incoming
  end

  def parse_lines
    incoming.each_with_object([]) do |line, all_lines|
      all_lines << Line.new(line)
    end
  end

  #take the array ["this sentence has more than forty characters\n"] and break it into words that can be added to a line - can use a hash of the word and the character count +1, that can then be adapted for capital letters and contractions later





end
