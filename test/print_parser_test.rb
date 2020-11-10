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
    expected = ["this sentence has more than forty", " characters", "this one does not"]
    assert_equal expected, @parser.separate_print_lines
  end

  def test_split_at_max_characters
    text = "this sentence has more than forty characters.\n"

    expected = ["this sentence has more than forty", " characters."]
    assert_equal expected, @parser.split_at_max_char(text)
  end

  def test_select_words
    text = "this sentence has more than forty characters.\n"
    assert_equal "this sentence has more than forty", @parser.select_words(text)

    text = text = " !',-.?abcdefghijklmnopqrstuvwxyzSaSbScSdSeSfSgShSiSjSkSlSmSnSoSpSqSrSsStSuSvSwSxSySz"
    assert_equal " !',-.?abcdefghijklmnopqrstuvwxyzSaSbScS", @parser.select_words(text)
  end

  def test_split_with_spaces
    text = " !',-.? abcd"
    assert_equal [" !',-.?", " abcd"], @parser.split_with_spaces(text)
  end

  def test_reduce_to_40
    text = " !',-.?abcdefghijklmnopqrstuvwxyzSaSbScSdSeSfSgShSiSjSkSlSmSnSoSpSqSrSsStSuSvSwSxSySz"
    assert_equal " !',-.?abcdefghijklmnopqrstuvwxyzSaSbScS", @parser.reduce_to_40(text)
  end

  def test_insert_special_chars
    assert_equal "w#0Srd", @parser.insert_special_chars("w0Rd")
  end

  def test_upcase
    assert_equal true, @parser.upcase?("K")
    assert_equal false, @parser.upcase?("k")
  end

  def test_number
    assert_equal true, @parser.number?("7")
    assert_equal false, @parser.number?("b")
    assert_equal false, @parser.number?("B")
  end

  def test_check_length
    selected = "#4#1 characters if we count "
    word = "numbers"
    assert_equal true, @parser.check_length(selected, word)

    selected = "#4#1 characters if we count numbers "
    word = "twice"
    assert_equal false, @parser.check_length(selected, word)
  end
end
