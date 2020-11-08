require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
require './lib/line_parser'
require './lib/printed_line'
require './lib/braille_line'

class LineParserTest < Minitest::Test
  def setup
    @printed = File.readlines('./data/sentence.txt')
    @parser = LineParser.new(@printed)
  end

  def test_it_exists
    assert_instance_of LineParser, @parser
  end

  def test_it_makes_lines
    actual = @parser.create_print_lines(@printed)
    assert_instance_of Array, actual
    all_lines = actual.all? do |line|
      line.class == PrintedLine
    end
    assert_equal true, all_lines
  end

  def test_split_at_max_characters
    text = "this sentence has more than forty characters.\n"

    expected = ["this sentence has more than forty", "characters."]
    assert_equal expected, @parser.split_at_max_char(text)
  end

  def test_select_words
    text = "this sentence has more than forty characters.\n"
    assert_equal "this sentence has more than forty ", @parser.select_words(text)
  end

  def test_it_makes_braille_lines
    actual = @parser.create_braille_lines
    assert_instance_of Array, actual
    all_braille = actual.all? do |line|
      line.class == BrailleLine
    end
    assert_equal true, all_braille
  end
end
