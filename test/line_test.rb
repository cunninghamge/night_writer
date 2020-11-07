require "minitest/autorun"
require "minitest/pride"
require './lib/line'

class LineTest < Minitest::Test
  def setup
    line = "this sentence has more than forty characters\n"
    @line = Line.new(line)
  end

  def test_it_exists
    assert_instance_of Line, @line
  end

  def test_attributes
    assert_equal "this sentence has more than forty characters\n", @line.incoming
  end
end
