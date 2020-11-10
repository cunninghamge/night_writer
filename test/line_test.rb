require_relative './test_helper'
require './lib/line'

class LineTest < Minitest::Test
  def setup
    @line1 = Line.new("a")
    @line2 = Line.new("ab")
    @line3 = Line.new([["0.", "..", ".."]])
    @line4 = Line.new([["0.", "..", ".."], ["0.", "0.", ".."]])
  end

  def test_it_exists
    assert_instance_of Line, @line1
    assert_instance_of Line, @line3
  end

  def test_attributes
    assert_equal "a", @line1.incoming_text
    assert_equal "ab", @line2.incoming_text
    assert_equal [["0.", "..", ".."]], @line3.incoming_text
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], @line4.incoming_text
  end

  def test_translate_to_braille
    @line1.translate_to_braille
    @line2.translate_to_braille

    assert_equal [["0.", "..", ".."]], @line1.translated_text
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], @line2.translated_text
  end

  def test_translate_to_print
    @line3.translate_to_print
    @line4.translate_to_print

    assert_equal ["a"], @line3.translated_text
    assert_equal ["a","b"], @line4.translated_text
  end

  def test_printable
    @line1.translate_to_braille
    @line2.translate_to_braille

    assert_equal [["0.\n..\n.."]], @line1.printable_braille
    assert_equal ["0.0.\n..0.\n...."], @line2.printable_braille
  end

  def test_printable_text
    @line3.translate_to_print
    @line4.translate_to_print

    assert_equal "a\n", @line3.printable_text
    assert_equal "ab\n", @line4.printable_text
  end
end
