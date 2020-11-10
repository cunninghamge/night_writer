require_relative './test_helper'
require './lib/printed_line'

class PrintedLineTest < Minitest::Test
  def setup
    braille = ["0.0.\n","..0.\n","...."]
    @line = PrintedLine.new(braille)
  end

  def test_it_exists
    assert_instance_of PrintedLine, @line
  end

  def test_braille
    expected = ["0.0.\n","..0.\n","...."]
    assert_equal expected, @line.braille
  end

  def test_create_braille_chars
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], @line.create_characters
  end

  def test_translate_line
    braille_chars = [["0.", "..", ".."], ["0.", "0.", ".."]]
    assert_equal ["a","b"], @line.translate_line(braille_chars, :to_print)
  end

  def test_compile_line
    braille_chars = [["0.", "..", ".."], ["0.", "0.", ".."]]
    assert_equal "ab\n", @line.compile_line(braille_chars)
  end

  def test_printed
    assert_equal "ab\n", @line.printed
  end

  def test_longer_line
    braille = [".00..0.0...00.00.00.00000...0.0..0..000.0.0....00.0.00..000.0..000\n",
               "00000.0...0..0.000.0.0...0..00..0......000.0..0000...0..0..00000.0\n",
               "0.....0...0...0.0...0...........0...0.0.0.....0.....0.....0.0.0.00\n"]
    line =  PrintedLine.new(braille)
    assert_equal "this sentence has more than forty\n", line.printed
  end
end
