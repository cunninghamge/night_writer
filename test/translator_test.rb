require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
require './lib/translator'
require './lib/printed_line'

class TranslatorTest < Minitest::Test
  def setup
    # printed = File.readlines('./data/sentence.txt')
    @translator = Translator.new
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_it_makes_a_dictionary
    assert_instance_of Dictionary, @translator.dictionary
  end

  def test_translate_character
    @translator.dictionary.stubs(:look_up).returns(["0.", "..", ".."])
    assert_equal ["0.", "..", ".."], @translator.translate_character("a")
  end
end
