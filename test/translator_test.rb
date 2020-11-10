require_relative './test_helper'
require './lib/translator'

class TranslatorTest < Minitest::Test
  include Translator

  def test_translate_char
    assert_equal ["0.", "..", ".."], translate_char("a")
    assert_equal ["0.", "00", "0."], translate_char("r")
    assert_equal ["00", "00", ".."], translate_char("g")
  end

  def test_translate_line
    line1 = "a"
    assert_equal [["0.", "..", ".."]], translate_line(line1)

    line2 = "ab"
    assert_equal [["0.", "..", ".."], ["0.", "0.", ".."]], translate_line(line2)
  end
end
