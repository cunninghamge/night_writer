require_relative './test_helper'
require './lib/print_parser'

class PrintParserTest < Minitest::Test
  def setup
    incoming = File.readlines('./data/sentence.txt')
    @parser = PrintParser.new(incoming)
  end

  def test_it_exists
    assert_instance_of PrintParser, @parser
  end

  def test_separate_print_lines
    expected = ["this sentence has more than forty", "characters", "this one does not"]
    assert_equal expected, @parser.separate_print_lines
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
end
