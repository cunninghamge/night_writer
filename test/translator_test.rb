require_relative './test_helper'
require './lib/translator'

class TranslatorTest < Minitest::Test
  include Translator

  def test_translate_char_to_braille
    assert_equal ["0.", "..", ".."], to_braille("a")
    assert_equal ["0.", "00", "0."], to_braille("r")
    assert_equal ["00", "00", ".."], to_braille("g")
  end

  def test_translate_line_to_braille
    line1 = ["a"]
    assert_equal [["0.", "..", ".."]], translate_line(line1, :to_braille)

    line2 = ["a","b"]
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], translate_line(line2, :to_braille)
  end

  def test_translate_char_to_print
    assert_equal "a", to_print(["0.", "..", ".."])
    assert_equal "r", to_print(["0.", "00", "0."])
    assert_equal "g", to_print(["00", "00", ".."])
  end

  def test_translate_line_to_print
    line1 = [["0.", "..", ".."]]
    assert_equal ["a"], translate_line(line1, :to_print)

    line2 = [["0.", "..", ".."], ["0.", "0.", ".."]]
    assert_equal ["a","b"], translate_line(line2, :to_print)
  end
end
