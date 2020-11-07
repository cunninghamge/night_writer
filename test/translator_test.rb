require "minitest/autorun"
require "minitest/pride"
require 'mocha/minitest'
require './lib/translator'
require './lib/line'

class TranslatorTest < Minitest::Test
  def setup
    incoming = File.readlines('./data/sentence.txt')
    @translator = Translator.new(incoming)
  end

  def test_it_exists
    assert_instance_of Translator, @translator
  end

  def test_attributes
    expected = ["this sentence has more than forty characters.\n", "this one does not!\n"]
    assert_equal expected, @translator.incoming
  end

  def test_it_makes_lines
    actual = @translator.parse_lines
    assert_instance_of Array, actual
    all_lines = actual.all? do |line|
      line.class == Line
    end
    assert_equal true, all_lines
  end

  def test_translate_character
    @translator.dictionary.stubs(:look_up).returns(["0.", "..", ".."])
    assert_equal ["0.", "..", ".."], @translator.translate_character("a")
  end

  def test_it_makes_a_dictionary
    assert_instance_of Dictionary, @translator.dictionary
  end
end
