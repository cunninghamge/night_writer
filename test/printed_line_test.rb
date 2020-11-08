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
end
