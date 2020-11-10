require_relative './test_helper'
require './lib/braille_parser'

class BrailleParserTest < Minitest::Test
  def setup
    @incoming = File.readlines('./data/three_braille.txt')
    @parser = BrailleParser.new(@incoming)
  end

  def test_it_exists
    assert_instance_of BrailleParser, @parser
  end

  def test_separate_lines
    expected = [["0...0...00\n", "....0.....\n", "..........\n"]]
    assert_equal expected, @parser.separate_lines
  end

  def test_separate_braille_lines
    expected = [[["0.", "..", ".."], ["..", "..", ".."], ["0.", "0.", ".."], ["..", "..", ".."], ["00", "..", ".."]]]
    assert_equal expected, @parser.separate_braille_lines
  end

  def test_separate_braille_chars
    line = ["0...0...00\n", "....0.....\n", "..........\n"]
    expected = [["0.", "..", ".."], ["..", "..", ".."], ["0.", "0.", ".."], ["..", "..", ".."], ["00", "..", ".."]]
    assert_equal expected, @parser.separate_characters(line)
  end

  def test_split_strings
    line = ["0...0...00\n", "....0.....\n", "..........\n"]
    expected = [["0.", "..", "0.", "..", "00"], ["..", "..", "0.", "..", ".."], ["..", "..", "..", "..", ".."]]
    assert_equal expected, @parser.split_strings(line)
  end
end
