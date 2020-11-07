require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require './lib/braille_line'

class BrailleLineTest < Minitest::Test
  def setup
    printed = "this sentence has more than forty"
    @line = BrailleLine.new(printed)
  end

  def test_it_exists
    assert_instance_of BrailleLine, @line
  end
end
