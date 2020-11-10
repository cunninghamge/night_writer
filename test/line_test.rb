require_relative './test_helper'
require './lib/line'

class LineTest < Minitest::Test
  def setup
    @line1 = Line.new("a")
    @line2 = Line.new("ab")
  end

  def test_it_exists
    assert_instance_of Line, @line1
  end

  def test_attributes
    assert_equal "a", @line1.incoming_text
    assert_equal "ab", @line2.incoming_text
  end

  def test_translate
    @line1.translate(:to_braille)
    @line2.translate(:to_braille)

    assert_equal [["0.", "..", ".."]], @line1.translated_text
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], @line2.translated_text
  end

  def test_printable
    @line1.translate(:to_braille)
    @line2.translate(:to_braille)

    assert_equal "0.\n..\n..", @line1.printable_braille
    assert_equal "0.0.\n..0.\n....", @line2.printable_braille
  end
end
