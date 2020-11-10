require './lib/file_io'
require './lib/braille_parser'
require './lib/line'

class PrintTranslator
  attr_reader :file_io, :parser, :lines

  def initialize(args)
    @file_io = FileIO.new(args)
    @parser = BrailleParser.new(@file_io.read)
    @lines = create_line_objects
    translate_lines
    writeable_lines = compile_lines
    @file_io.write_to_file(writeable_lines)
  end

  def create_line_objects
    separate_braille_lines.map do |line|
      Line.new(line)
    end
  end

  def separate_braille_lines
    @parser.separate_braille_lines
  end

  def translate_lines
    @lines.each do |line|
      line.translate_to_print
    end
  end

  def compile_lines
    compiled = @lines.reduce("") do |string, line|
      string.concat(line.printable_text, "\n")
    end
    remove_special_characters(compiled)
  end

  def remove_special_characters(compiled)
    last = ""
    compiled.chars.reduce("") do |string, char|
      if char != "S" && char != "#" && last != "S" && last != "#"
        string.concat(char)
      elsif last == "S"
        string.concat(char.upcase)
      elsif last == "#"
        string.concat(convert_to_number(char))
      end
      last = char unless char == "\n"
      string
    end
  end

  def convert_to_number(char)
    numbers[char]
  end

  def numbers
    {"a"=>"1","b"=>"2","c"=>"3","d"=>"4","e"=>"5",
      "f"=>"6","g"=>"7","h"=>"8","i"=>"9","j"=>"0"}
  end
end
