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

  def test_printable
    line1 = BrailleLine.new("a")
    line2 = BrailleLine.new("ab")
    line1.braille = [["0.", "..", ".."]]
    line2.braille = [["0.", "..", ".."], ["0.", "0.", ".."]]

    assert_equal "0.\n..\n..", line1.printable
    assert_equal "0.0.\n..0.\n....", line2.printable
  end
end
