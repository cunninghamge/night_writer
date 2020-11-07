require "minitest/autorun"
require "minitest/pride"
require './lib/line'

class LineTest < Minitest::Test
  def setup
    line = "this sentence has more than forty characters.\n"
    parent = mock("Translator")
    @line = Line.new(line, parent)
  end

  def test_it_exists
    assert_instance_of Line, @line
  end

  def test_attributes
    assert_equal "this sentence has more than forty characters.\n", @line.incoming
  end

  def test_split_at_max_characters
    expected = ["this sentence has more than forty ", "characters. "]
    assert_equal expected, @line.split_at_max_characters
  end
end
