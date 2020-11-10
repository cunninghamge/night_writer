require_relative './test_helper'
require './lib/printed_line'

class PrintedLineTest < Minitest::Test
  def setup
    text = "this sentence has more than forty characters.\n"
    @line = PrintedLine.new(text)
  end

  def test_it_exists
    assert_instance_of PrintedLine, @line
  end

  def test_attributes
    assert_equal "this sentence has more than forty characters.\n", @line.text
  end
end
