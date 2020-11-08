require_relative './test_helper'
require './lib/braille_parser'
require './lib/printed_line'
require './lib/braille_line'

class BrailleParserTest < Minitest::Test
  def setup
    @braille = File.readlines('./data/short_braille.txt')
    @parser = BrailleParser.new(@braille)
  end

  def test_it_exists
    assert_instance_of BrailleParser, @parser
  end

  def test_it_makes_braille_lines
    actual = @parser.create_braille_lines(@braille)
    all_braille = actual.all? do |line|
      line.class == PrintedLine
    end

    assert_instance_of Array, actual
    assert_equal true, all_braille
  end

  def test_separate_lines
    expected = [[".0..0.00..0.0.0.0.\n", "0.........00.000.0\n", "......0.......0...\n"]]
    assert_equal expected, @parser.separate_lines(@braille)
  end
end
