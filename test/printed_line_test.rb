require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require './lib/printed_line'

class PrintedLineTest < Minitest::Test
  def setup
    line = "this sentence has more than forty characters.\n"
    @parent = mock("Translator")
    @line = PrintedLine.new(line, @parent)
  end

  def test_it_exists
    assert_instance_of PrintedLine, @line
  end

  def test_attributes
    assert_equal "this sentence has more than forty characters.\n", @line.printed
  end

  def test_split_at_max_characters
    expected = ["this sentence has more than forty", "characters."]
    assert_equal expected, @line.split_at_max_char
  end

  def test_select_words
    working_line = "this sentence has more than forty characters.\n"
    assert_equal "this sentence has more than forty ", @line.select_words(working_line)
  end
end
