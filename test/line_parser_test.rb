require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
require './lib/line_parser'
require './lib/printed_line'
require './lib/braille_line'

class LineParserTest < Minitest::Test
  def setup
    printed = File.readlines('./data/sentence.txt')
    @parser = LineParser.new(printed)
  end

  def test_it_exists
    assert_instance_of LineParser, @parser
  end

  def test_attributes
    expected = ["this sentence has more than forty characters.\n", "this one does not!\n"]
    assert_equal expected, @parser.printed_lines
  end

  def test_it_makes_lines
    actual = @parser.parse_lines
    assert_instance_of Array, actual
    all_lines = actual.all? do |line|
      line.class == PrintedLine
    end
    assert_equal true, all_lines
  end
end
