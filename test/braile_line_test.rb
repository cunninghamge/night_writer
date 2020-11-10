require_relative './test_helper'
require './lib/braille_line'

class BrailleLineTest < Minitest::Test
  def setup
    @line1 = BrailleLine.new("a")
    @line2 = BrailleLine.new("ab")
  end

  def test_it_exists
    assert_instance_of BrailleLine, @line1
  end

  def test_attributes
    assert_equal "a", @line1.printed
    assert_equal "ab", @line2.printed
    assert_equal [["0.", "..", ".."]], @line1.braille
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], @line2.braille
  end

  def test_printable
    assert_equal "0.\n..\n..", @line1.printable_braille
    assert_equal "0.0.\n..0.\n....", @line2.printable_braille
  end
end
