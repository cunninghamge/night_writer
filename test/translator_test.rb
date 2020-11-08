require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
require './lib/translator'
require './lib/printed_line'

class TranslatorTest < Minitest::Test
  def setup
    @translator = Translator.new
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_translate_char
    assert_equal ["0.", "..", ".."], @translator.translate_char("a")
    assert_equal ["0.", "00", "0."], @translator.translate_char("r")
    assert_equal ["00", "00", ".."], @translator.translate_char("g")
  end
end
